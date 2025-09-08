<div align="center">
  <img src="assets/images/moviealike_image.png" alt="MovieAlike Logo" width="200"/>
  <h1 align="center">MovieAlike</h1>
  <p align="center">
    Find your next favorite movie with intelligent recommendations.
    <br />
    <a href="https://github.com/your-username/moviealikemobile/issues">Report Bug</a>
    ·
    <a href="https://github.com/your-username/moviealikemobile/issues">Request Feature</a>
  </p>

  <p align="center">
    <a href="https://play.google.com/store/apps/details?id=com.jozaforge.moviealike">
      <img src="https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white" alt="Get it on Google Play">
    </a>
    <br>
    <img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
    <img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
    <br>
    <img src="https://img.shields.io/github/stars/your-username/moviealikemobile.svg?style=social&label=Star&maxAge=2592000" alt="GitHub stars">
    <img src="https://img.shields.io/github/forks/your-username/moviealikemobile.svg?style=social&label=Fork&maxAge=2592000" alt="GitHub forks">
  </p>
</div>

---

## 🌟 About The Project

MovieAlike was born from two key motivations: a personal passion for film and a professional goal to master the entire mobile application lifecycle.

As a developer, I had experience updating existing applications but wanted to build a project from scratch and navigate the full journey to production. As a movie enthusiast, I was frustrated with the simplistic search and recommendation features of major streaming platforms.

This project solves that problem by offering a powerful, multi-faceted search engine and an intelligent recommendation system, all while serving as a demonstration of my skills in building and publishing a production-ready Flutter application.

### 🖼️ Visual Showcase

*(Here you should add high-quality GIFs or screenshots of your app. For example:)*

| Smart Search                                       | Movie Details                                  | Recommendations                                |
| -------------------------------------------------- | ---------------------------------------------- | ---------------------------------------------- |
| <img src="https://via.placeholder.com/250x500.png?text=Search+Screen" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Details+Screen" width="250"> | <img src="https://via.placeholder.com/250x500.png?text=Recommendations" width="250"> |

---

## ✨ Core Features

-   **Advanced Multi-Faceted Search:** Go beyond simple title searches. Discover movies by:
    -   Crew & Cast Members
    -   Director or Actor
    -   Production Company or Country
    -   Genre and Language
-   **Intelligent Recommendations:** The recommendation engine uses a **Jaccard Similarity** algorithm to provide a clear, percentage-based similarity score between movies, helping you find truly related content.
-   **Comprehensive Details:** Get all the information you need, including trailers, cast, crew, and where to watch.
-   **Personal Watchlist:** Keep track of movies you want to watch.
-   **Multi-language Support:** Available in English, Spanish, and Portuguese.
-   **Now on Google Play:** The app has been successfully published and is available on the Google Play Store.

---

## 🛠️ Technical Architecture Deep Dive

This project is built using **Clean Architecture** principles to create a scalable, maintainable, and testable codebase. The code is strictly separated into three layers: Presentation, Domain, and Data.

![Clean Architecture Diagram](https://i.imgur.com/B1p6t0u.png)

-   **Presentation Layer:** Built with **Flutter** and the **Bloc** pattern for state management. It is responsible for the UI and user interaction, remaining completely unaware of the business logic's implementation details.
-   **Domain Layer:** This is the core of the application, containing the business logic, use cases, and entities. It is pure Dart and has no dependencies on the other layers, making it highly testable.
-   **Data Layer:** Handles all data operations. It implements the repositories defined in the Domain layer and is responsible for fetching data from remote sources (TMDB API via **Dio**) and local sources (**Drift** database).

### Key Technical Decisions:

-   **Dependency Injection:** Uses `get_it` and `injectable` to manage dependencies, promoting a loosely coupled architecture and simplifying the process of providing implementations for testing.
-   **Navigation:** `go_router` is used for a robust, URL-based navigation system that handles deep linking and complex navigation scenarios.
-   **Local Persistence:** The **Drift** library provides a reactive persistence layer, allowing the UI to automatically update when underlying data changes.
-   **API Key Security:** API keys are secured using `envied` to obfuscate them at compile-time, ensuring they are not exposed in the source code.

---

## 🚀 Tech Stack

-   **Framework:** [Flutter](https://flutter.dev/)
-   **Language:** [Dart](https://dart.dev/)
-   **Architecture:** Clean Architecture
-   **State Management:** [Flutter Bloc](https://bloclibrary.dev/)
-   **Dependency Injection:** [GetIt](https://pub.dev/packages/get_it) & [Injectable](https://pub.dev/packages/injectable)
-   **Networking:** [Dio](https://pub.dev/packages/dio)
-   **Routing:** [GoRouter](https://pub.dev/packages/go_router)
-   **Local Storage:** [Drift](https://drift.simonbinder.eu/)
-   **API Security:** [Envied](https://pub.dev/packages/envied)

---

## 🔧 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed
-   An editor like VS Code or Android Studio

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/your-username/moviealikemobile.git
    ```
2.  Install packages
    ```sh
    flutter pub get
    ```
3.  Set up your API keys. This project requires API keys for the [TMDB API](https://www.themoviedb.org/documentation/api) and [YouTube API](https://developers.google.com/youtube/v3).
    -   Copy `env_template` to a new file named `.env`
    -   Add your API keys to the `.env` file.
4.  Generate the environment configuration:
    ```sh
    flutter pub run build_runner build --delete-conflicting-outputs
    ```
5.  Run the app:
    ```sh
    flutter run
    ```

---

## 📈 Future Enhancements

To further showcase advanced development skills, the roadmap for this project includes:

-   **✅ Robust Automated Testing:**
    -   Implement comprehensive Unit and Widget tests for the Domain and Presentation layers.
    -   Add Integration tests for key user flows.
-   **✅ CI/CD Automation:**
    -   Set up a GitHub Actions workflow to run tests and linters on every push and pull request.
-   **✅ User Authentication & Cloud Sync:**
    -   Integrate Firebase Authentication and sync user data (like watchlists) with Firestore.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
