import 'package:flutter/material.dart';
import 'package:movieapp/View_Model/View_Model.dart';
import 'package:movieapp/screens/Fav_Screen.dart';
import 'package:movieapp/services/api_services.dart';
import 'package:movieapp/widgets/movie_card.dart';


class Homescreen extends StatefulWidget {
  const Homescreen({super.key});

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {

  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    //Fetch genres
    ApiService.fetchMovieGenres();
    ApiService.sendRequest(vm.currentPage);
    _scrollController.addListener(()async{
      // print("listview");
      print(_scrollController.position.pixels);
      if(_scrollController.position.pixels == _scrollController.position.maxScrollExtent){
        print("Reached end of the listview");
        vm.isFetching.value = true;
        await ApiService.sendRequest(vm.currentPage);
        vm.isFetching.value = false;
        //Send api request to fetch next page
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Popular Movies"),
          centerTitle: false,
          actions: [
            IconButton(onPressed: (){

              Navigator.push(
                  context,
                  MaterialPageRoute(builder:(context) => FavoritesScreen(),)
              );

            }, icon: Icon(Icons.favorite_outline)),
            IconButton(
                onPressed: ()async{

                  vm.toggleTheme();

                }, icon: Icon(
                vm.isDarkMode.value ? Icons.bedtime : Icons.sunny
            )),
          ],
        ),
        body:
        ValueListenableBuilder(
            valueListenable: vm.movies,
            builder:(context, value, child) {
              return vm.movies.value.isEmpty ? Center(
                child: CircularProgressIndicator(),
              )

                  :
              Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      padding: EdgeInsets.only(top: 30,right: 12,left: 12),
                      itemCount: vm.movies.value.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          model: vm.movies.value[index],
                        );
                      },
                    ),

                  ),

                  ValueListenableBuilder(
                    valueListenable: vm.isFetching,
                    builder:(context, value, child) {
                      return value ? CircularProgressIndicator() : Container();
                    },)
                ],
              );
            }
        )
    );
  }
}
