# MealsApp

MealsApp is a Flutter-based mobile application designed to deliver an engaging and visually appealing experience for browsing, discovering, and managing meals. The app is structured for scalability and maintainability, with a clear separation of core functionalities and feature modules.

---

## Table of Contents

- [Features](#features)
- [Project Structure](#project-structure)
- [Installation](#installation)
- [Running the App](#running-the-app)
- [Assets](#assets)
- [Dependencies](#dependencies)
- [Contributing](#contributing)
- [License](#license)

---

## Features

- **Splash Screen:** Elegant introductory splash to welcome users and initialize resources.
- **Onboarding:** Interactive onboarding flow to introduce app features and guide new users.
- **Home Screen:** Main interface displaying meals, categories, and related information.
- **Theming & Scaling:** Consistent UI/UX across devices using `flutter_screenutil`.
- **Image & Animation Support:** Rich asset and animation integration with `lottie`, `cached_network_image`, `flutter_svg`, and asset support.
- **Local Persistence:** Data storage with `sqflite` and `shared_preferences`.
- **Carousel & Pagination:** Meals and categories showcased interactively with carousel and dots indicators.

---

## Project Structure

The source code is located under the `lib/` directory, following a modular, feature-driven design:

```
lib/
  main.dart                # App entrypoint
  core/                    # Core functionalities and shared services
  features/
    home/
      data/                # Home screen data/models
      screen/              # Home views/UI
      widget/              # Reusable widgets for home
    onBoarding/
      screen/              # Onboarding screens/views
    splash/
      screen/              # Splash screen UI
```

- The `main.dart` initializes the app, setting up device scaling and rendering the splash screen by default.
- Each feature (Splash, Onboarding, Home) is organized into its own module.

---

## Installation

1. **Clone the repository:**
   ```bash
   git clone https://github.com/abdelrahmanHossam23/MealsApp.git
   cd MealsApp
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

---

## Running the App

- Ensure you have Flutter installed ([Flutter setup guide](https://docs.flutter.dev/get-started/install)).
- Run the app with:
  ```
  flutter run
  ```
- To run on iOS, open the project in Xcode (`ios/Runner.xcworkspace`) and set up your certificates and simulator.

---

## Assets

This app uses images, SVGs, and Lottie animations. Asset folders are configured in `pubspec.yaml`:

```yaml
assets:
  - assets/pngs/
  - assets/animations/
  - assets/svgs/
```

Add or replace any assets into the respective folders as needed.

---

## Dependencies

Key Dart/Flutter dependencies (see `pubspec.yaml` for full list):

- `flutter_screenutil` - Responsive UI scaling
- `carousel_slider` - Image carousels
- `dots_indicator` - Page indicators for carousels
- `lottie` - JSON-based animations
- `sqflite` - Local database support
- `shared_preferences` - Simple key-value storage
- `cached_network_image` - Optimized image loading/caching
- `flutter_svg` - SVG asset support

---

## Contributing

Contributions are welcome! Please open issues and submit pull requests to improve features, add new meals or categories, or enhance the onboarding experience.

---

## License

This project is licensed under the [MIT License](LICENSE).

---

## Acknowledgments

- [Flutter Documentation](https://docs.flutter.dev/)
- [Cupertino Icons](https://pub.dev/packages/cupertino_icons)
