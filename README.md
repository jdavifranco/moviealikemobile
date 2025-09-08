<div align="center">
  <img src="assets/images/splash.png" alt="MovieAlike Logo" width="200"/>
  <h1 align="center">MovieAlike</h1>
  <p align="center">
    An intelligent movie discovery app built by a developer, for movie lovers.
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
    <img src="https://img.shields.io/badge/Flutter-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
    <img src="https://img.shields.io/badge/Dart-1F1D2B?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
    <br>
    <img src="https://img.shields.io/github/stars/your-username/moviealikemobile.svg?style=social&label=Star&maxAge=2592000" alt="GitHub stars">
    <img src="https://img.shields.io/github/forks/your-username/moviealikemobile.svg?style=social&label=Fork&maxAge=2592000" alt="GitHub forks">
  </p>
</div>

---

## 🌟 About This Project

As a movie enthusiast, I've always found the search and recommendation features in mainstream streaming apps to be surprisingly limited. It felt like a solved problem, but finding a movie based on a specific director, production company, or even a nuanced combination of genres was often impossible.

`MovieAlike` is my answer to that problem. It started as a personal challenge: to build the movie discovery tool I always wanted and, in the process, to take a project from a simple idea all the way to a published app on the Google Play Store. This repository documents that journey and the engineering decisions behind it.

---

## ✨ Features Showcase

<table>
  <tr>
    <td width="70%">
      <h3>Advanced Multi-Faceted Search</h3>
      <p>The core of the app. Go beyond simple title searches and combine multiple filters to find exactly what you're looking for. Search by crew, cast members, director, production company, genre, and more.</p>
    </td>
    <td width="30%">
      <img src="https://via.placeholder.com/300x600.gif?text=Search+Feature+GIF" alt="Advanced Search GIF" width="250">
    </td>
  </tr>
  <tr>
    <td>
      <h3>Intelligent Recommendations</h3>
      <p>Instead of a black box, the recommendation engine uses a <strong>Jaccard Similarity</strong> algorithm. This provides a clear, percentage-based "similarity score," giving you a tangible reason why a movie is recommended.</p>
    </td>
    <td>
      <img src="https://via.placeholder.com/300x600.gif?text=Recommendations+GIF" alt="Recommendations GIF" width="250">
    </td>
  </tr>
  <tr>
    <td>
      <h3>Personal Watchlist & Details</h3>
      <p>Keep track of movies you want to watch and dive deep into details with trailers, cast bios, and crew information, all stored locally for a smooth and responsive experience.</p>
    </td>
    <td>
      <img src="https://via.placeholder.com/300x600.gif?text=Watchlist+GIF" alt="Watchlist GIF" width="250">
    </td>
  </tr>
</table>

---

## 🚀 Architecture & Tech Stack

This app is built with a focus on creating a scalable, maintainable, and testable codebase. The foundation is **Clean Architecture**, which strictly separates the project into three distinct layers: Presentation, Domain, and Data.

<div align="center">
  <img src="https://i.imgur.com/B1p6t0u.png" alt="Clean Architecture Diagram" width="600"/>
</div>

### Core Principles:
-   **Presentation Layer:** The UI, built entirely in Flutter. It uses the **Bloc** pattern to manage state and remains blissfully unaware of where the data comes from.
-   **Domain Layer:** The heart of the app. It contains the core business logic (use cases) and data models. It's pure Dart, making it framework-agnostic and highly testable.
-   **Data Layer:** The implementation layer. It's responsible for fetching data from the TMDB API and managing the local database, fulfilling the contracts (repositories) defined by the Domain layer.

### Technology Choices & Justifications

| Logo | Technology | Why It Was Chosen |
| :--- | :--- | :--- |
| <img src="https://img.shields.io/badge/Flutter-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"> | **Flutter & Dart** | Chosen for its cross-platform capabilities, expressive UI toolkit, and excellent performance, allowing for a single codebase for Android, iOS, and beyond. |
| <img src="https://img.shields.io/badge/Bloc-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Bloc"> | **Flutter Bloc** | Selected for its robust and predictable state management. It enforces a clear separation between UI and business logic, which was critical for managing the state of the complex, multi-filter search feature. |
| <img src="https://img.shields.io/badge/GetIt-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="GetIt"> | **GetIt & Injectable** | Used for service location and dependency injection. This decouples the layers of the application, making it easier to manage dependencies and swap out implementations for testing. |
| <img src="https://img.shields.io/badge/Dio-1F1D2B?style=for-the-badge" alt="Dio"> | **Dio** | A powerful HTTP client chosen for its rich feature set, including interceptors for easy API key injection, logging, and streamlined error handling when communicating with the TMDB API. |
| <img src="https://img.shields.io/badge/Drift-1F1D2B?style=for-the-badge" alt="Drift"> | **Drift (Moor)** | Selected for its powerful, type-safe, and reactive persistence layer. It allows the UI to automatically react to changes in the local database, creating a seamless experience for the user's watchlist. |
| <img src="https://img.shields.io/badge/GoRouter-1F1D2B?style=for-the-badge" alt="GoRouter"> | **GoRouter** | Implemented for its robust, URL-based navigation system. It simplifies complex navigation flows, handles deep linking, and provides a clear structure for the app's routing logic. |
| <img src="https://img.shields.io/badge/Firebase-1F1D2B?style=for-the-badge&logo=firebase&logoColor=white" alt="Firebase"> | **Firebase** | Integrated for analytics and crash reporting. `Firebase Analytics` provides insights into user engagement, while `Crashlytics` is essential for monitoring the app's stability in production. |

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
3.  Set up your API keys for [TMDB](https://www.themoviedb.org/documentation/api) and [YouTube](https://developers.google.com/youtube/v3).
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

This project is actively developed. Future plans to expand its capabilities include:

-   **✅ Robust Automated Testing:** Implement a full suite of Unit, Widget, and Integration tests to ensure code quality and prevent regressions.
-   **✅ CI/CD Automation:** Set up a GitHub Actions workflow to automate testing and build processes.
-   **✅ User Authentication & Cloud Sync:** Integrate Firebase Authentication to allow users to sync their watchlists and preferences across devices.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
