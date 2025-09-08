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

As a movie enthusiast, I've always been curious about how recommendation and search systems work under the hood. I noticed that many streaming apps, while great for browsing, often lack the deep, specific filtering I was looking for—like finding films from a particular production company or combining niche genres.

This project started as a way to explore that problem. I wanted to build a movie discovery tool that was more granular and powerful, and also use it as a practical exercise to take an app from concept to production on the Google Play Store. It's been a fantastic learning experience in building a full-stack mobile application, and this repository serves as a log of that journey and the architectural choices made along the way.

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

| Logo | Technology | Purpose in This Project |
| :--- | :--- | :--- |
| <img src="https://img.shields.io/badge/Flutter-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter"> | **Flutter & Dart** | Used to build the entire cross-platform application for Android and iOS from a single codebase. Flutter's expressive UI toolkit and high performance were essential for creating a smooth, visually appealing user experience. |
| <img src="https://img.shields.io/badge/Bloc-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Bloc"> | **Flutter Bloc** | Used to manage the state of the application's UI. It is most prominently used in the multi-faceted search screen to handle the complex state of various filters, loading states, and search results, ensuring a predictable data flow. |
| <img src="https://img.shields.io/badge/GetIt-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="GetIt"> | **GetIt & Injectable** | Used to implement dependency injection. This decouples the Presentation, Domain, and Data layers by providing dependencies like Repositories and Use Cases wherever they are needed, which is crucial for a clean architecture and makes testing significantly easier. |
| <img src="https://img.shields.io/badge/Dio-1F1D2B?style=for-the-badge" alt="Dio"> | **Dio** | Used for all network communication with the TMDB API. Its interceptor feature was specifically used to automatically inject the API key into every request and to handle logging and error responses consistently across the app. |
| <img src="https://img.shields.io/badge/Drift-1F1D2B?style=for-the-badge" alt="Drift"> | **Drift (Moor)** | Used for creating and managing the local database that stores the user's personal watchlist. It was chosen for its type-safe SQL generation and reactive API, which allows the UI to listen to a stream of database changes and update automatically. |
| <img src="https://img.shields.io/badge/GoRouter-1F1D2B?style=for-the-badge" alt="GoRouter"> | **GoRouter** | Used to manage all navigation within the app. It defines a clear routing structure, handling navigation from the movie lists to detail pages, and managing the app's overall screen flow in a robust, URL-based manner. |
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
-   **📈 Advanced Analytics:** Implement detailed event tracking to gain deeper insights into user behavior, such as which search filters are most popular and how users discover new content.
-   **🤖 AI-Powered Movie Analysis:** Integrate a generative AI model to provide unique, AI-driven summaries or analyses of movies.

---

## 📄 License

Distributed under the MIT License. See `LICENSE` for more information.
