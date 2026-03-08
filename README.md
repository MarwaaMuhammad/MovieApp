# 🎬 MovieApp

A cross-platform Flutter application for browsing and discovering movies. Built with Dart and Flutter, the app runs on Android, iOS, Web, Windows, Linux, and macOS.

---

## 📱 Screenshots
![lightMode](https://github.com/user-attachments/assets/8f46b62a-81c3-4ca7-9ae9-572de1c5769b)
![movieDetails](https://github.com/user-attachments/assets/76c78123-383a-40a8-a123-8f2c80e5a1cf)
![favScreen](https://github.com/user-attachments/assets/41256507-4188-4756-88db-9b63f2eb68cf)
![emptyFavScreen](https://github.com/user-attachments/assets/b7e157f1-4456-44f2-83e2-a09955db8a05)
![home](https://github.com/user-attachments/assets/c25d1359-6d09-4c47-9f63-8a1e972459a3)


---

## ✨ Features

- Browse popular and trending movies
- View detailed movie information (title, overview, ratings, release date)
- Search for movies by title
- Clean and responsive UI across all platforms

---

## 🛠️ Tech Stack

| Technology | Purpose |
|------------|---------|
| [Flutter](https://flutter.dev/) | Cross-platform UI framework |
| [Dart](https://dart.dev/) | Programming language |
| REST API | Movie data fetching (e.g. TMDB) |

---

## 🚀 Getting Started

### Prerequisites

Make sure you have the following installed:

- [Flutter SDK](https://docs.flutter.dev/get-started/install) (>= 3.0.0)
- [Dart SDK](https://dart.dev/get-dart) (comes with Flutter)
- Android Studio / Xcode (for mobile targets)
- A code editor like [VS Code](https://code.visualstudio.com/) or [Android Studio](https://developer.android.com/studio)

### Installation

1. **Clone the repository**

   ```bash
   git clone https://github.com/MarwaaMuhammad/MovieApp.git
   cd MovieApp
   ```

2. **Install dependencies**

   ```bash
   flutter pub get
   ```

3. **Run the app**

   ```bash
   # Android / iOS
   flutter run

   # Web
   flutter run -d chrome

   # Windows
   flutter run -d windows

   # Linux
   flutter run -d linux

   # macOS
   flutter run -d macos
   ```

---

## 📁 Project Structure

```
MovieApp/
├── android/          # Android-specific files
├── ios/              # iOS-specific files
├── lib/              # Main Dart source code
│   └── main.dart     # App entry point
├── linux/            # Linux desktop files
├── macos/            # macOS desktop files
├── web/              # Web-specific files
├── windows/          # Windows desktop files
├── test/             # Unit and widget tests
├── pubspec.yaml      # Project dependencies and metadata
└── README.md
```

---

## 🧪 Running Tests

```bash
flutter test
```

---

## 📦 Build

```bash
# Android APK
flutter build apk

# iOS
flutter build ios

# Web
flutter build web

# Windows
flutter build windows
```

---

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the project
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request


## 🙏 Acknowledgements

- [Flutter Documentation](https://docs.flutter.dev/)
- [The Movie Database (TMDB) API](https://www.themoviedb.org/documentation/api)
