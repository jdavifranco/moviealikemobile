<div align="center">
  <img src="assets/images/ic_launcher-playstore.png" alt="MovieAlike Logo" width="300"/>
  <h1>MovieAlike</h1>
  <p align="center">
    Find your next favorite movie!
  </p>

  <p align="center">
    <a href="https://play.google.com/store/apps/details?id=com.jozaforge.moviealike">
      <img src="https://img.shields.io/badge/Google_Play-414141?style=for-the-badge&logo=google-play&logoColor=white" alt="Get it on Google Play">
    </a>
    <br>
    <img src="https://img.shields.io/badge/Flutter-1F1D2B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
    <img src="https://img.shields.io/badge/Dart-1F1D2B?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
    <br>
  </p>

</div>


<p><br></br></p>


## 🚀 About This Project

As a movie enthusiast, I've always been curious about how recommendation and search systems work under the hood. I noticed that many streaming apps, that may be great for browsing, often lack the a deep, specific movie details exploration i was looking for—like seeing films from a particular production company or by director.

This project started as a way to explore that problem. I wanted to build a movie discovery tool that was more granular and powerful, and also use it as a practical exercise to take an app from concept to production on the [Google Play Store](https://play.google.com/store/apps/details?id=com.jozaforge.moviealike&hl=en). It's been a fantastic learning experience in building a full-stack mobile application, and this repository serves as a log of that journey and the architectural choices made along the way.

---
## ✨ Features Showcase

-   **Contextual Movie Exploration:** Start with a movie you already like and dive into a deep exploration path. From a movie's detail page, you can discover new movies by tapping on any actor, director, genre, or production company to see a filtered list of movies.
-   **Intelligent Recommendations:** Instead of a black box, the recommendation engine uses a **[Jaccard Similarity](https://en.wikipedia.org/wiki/Jaccard_index)** algorithm. This way we can provide a clear percentage-based "similarity score," showing how similar the recommended movie is to the one selected. Compared to modern recommendation systems that use machine learning models, this project's Jaccard Similarity system, which uses genres and keywords from the TMDB database, shows excellent results in providing similar and sometimes better recommendations. Additionally, it shows how similar a recommended movie is.
-   **Personal Watchlist & Details:** Keep track of movies you want to watch and dive deep into details with trailers, cast bios, and crew information, all stored locally for a smooth and responsive experience.
 <img width="300"  alt="screenshot1" src="https://github.com/user-attachments/assets/4e90474d-0b95-49bd-9d18-5b6b397a6d06" />
<img width="300"  alt="screenshot2" src="https://github.com/user-attachments/assets/6ac31724-2a31-4ecb-9116-79f7b873d8e3" />
<img width="300" alt="screenshot3" src="https://github.com/user-attachments/assets/4daee8fb-5299-4d96-b297-64ae2ebd0131" />

<img width="760" alt="screenshot4" src="https://github.com/user-attachments/assets/7ab5436e-e56d-4537-b613-dde430f6b548" />

<br>


<table>
  <tr>
    <td align="center"><strong>Contextual Exploration</strong></td>
    <td align="center"><strong>Intelligent Recommendations</strong></td>
    <td align="center"><strong>Personal Watchlist</strong></td>
  </tr>
  <tr>
    <td>
     <video src="https://github.com/user-attachments/assets/75752440-24d4-4aaf-ba7a-72784630c0fb" />
    </td>
    <td>
     <video src="https://github.com/user-attachments/assets/35d6850c-0645-4c65-acbd-a2cee9719ce8" />
    </td>
    <td>
     <video src="https://github.com/user-attachments/assets/e2f06835-90a4-4ef7-9523-d2d3c226ad1c" />
    </td>
  </tr>
</table>

---

## 🛠️ Architecture & Tech Stack

This app is built with a focus on creating a scalable, maintainable, and testable codebase. The foundation is <strong style="color:#FF4081;">Clean Architecture</strong>, which strictly separates the presentation, domain, and data layers.

**🎨 Presentation Layer** (`lib/presentation/`)
- **Screens & Widgets**: Flutter UI components (Home, Search, MovieDetails, Watchlist).
- **BLoCs**: State management using the BLoC pattern (HomeBloc, SearchBloc, etc.).
- **Navigation**: GoRouter for declarative routing.

**🧠 Domain Layer** (`lib/domain/`)
- **Use Cases**: Single-purpose business operations (`GetPopularMovies`, `GetMovieDetails`).
- **Repository Interfaces**: Abstract contracts (`MovieRepository`, `SearchRepository`).
- **Domain Models**: Pure business entities (`Movie`, `CastMember`, `MovieDetails`).

**💾 Data Layer** (`lib/data/`)
- **Repository Implementations**: Concrete implementations (`MovieRepositoryImpl`).
- **Data Sources**: API and database access (`MovieDataSource`, `WatchListDataSource`).
- **DTOs**: Data Transfer Objects for external communication.
<div align="center">
  <p> <br> Architecture Diagram </br> </p>
 <img width="872" height="1145" alt="image" src="https://github.com/user-attachments/assets/60aa4776-0dd0-4ff0-aeb8-9ed7c0f75ba3" />
</div>



### ⚙️ Tech Stack

- **[Bloc/Cubit](https://github.com/felangel/bloc/tree/master/packages/bloc)**: For State Management and reactive UI.
  
- **[GetIt & Injectable](https://pub.dev/packages/get_it)**: For Dependency Injection.
  
- **[Dio](https://pub.dev/packages/dio)**: Network & API. Handles HTTP requests with auth interceptors.
  
- **[Drift (Moor)](https://pub.dev/packages/drift)**: Local database for storing user watchlist with reactive data streams.
  
- **[GoRouter](https://pub.dev/packages/go_router)**: Declarative routing for managing app navigation and screen flow.

- **[Infinite scroll](https://pub.dev/packages/infinite_scroll_pagination)**: Used on the search screen to load more pages of a query when scrolling.

- **[Flutter native splash](https://pub.dev/packages/flutter_native_splash)**: Used to generate the splash screen.

- **[Result Type](https://pub.dev/packages/result_type)**: For handling success and failed requests.

- **[Intl](https://pub.dev/packages/intl)**: For internationalization; the app supports Portuguese, English, and Spanish.
  
- <img width="20" height="20" alt="image" src="https://github.com/user-attachments/assets/4b42a490-eeb5-4e23-9eb3-ba5a3b054ab2" /> **[RxDart](https://pub.dev/packages/rxdart)**: For reactive updates and stream manipulation.

- **[Firebase](https://firebase.google.com/)**: Analytics for user engagement insights and Crashlytics for production stability monitoring.


---

## 🏁 Getting Started

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed
-   An editor like VS Code or Android Studio

### Installation

1.  Clone the repo:
    ```sh
    git clone https://github.com/jdavifranco/moviealikemobile.git
    ```
2.  Install packages:
    ```sh
    flutter pub get
    ```
3.  Set up your API keys for [TMDB](https://www.themoviedb.org/documentation/api) and [YouTube](https://developers.google.com/youtube/v3).
    -   Copy `env_template` to a new file named `.env`.
    -   Add your API keys to the `.env` file.
4.  Generate the environment configuration:
    ```sh
    make build_runner
    ```
5.  Generate App localization:
    ```sh
    make intl_gen
    ```    
6.  Run the app:
    ```sh
    flutter run
    ```

---

## 🗺️ Future Enhancements

This project is actively developed. Future plans to expand its capabilities include:

- **Robust Automated Testing:** Implement a full suite of Unit, Widget, and Integration tests to ensure code quality and prevent regressions.
- **CI/CD Automation:** Set up a GitHub Actions workflow to automate testing and build processes.
- **User Authentication & Cloud Sync:** Integrate Firebase Authentication to allow users to sync their watchlists and preferences across devices.
- **Advanced Analytics:** Implement detailed event tracking to gain deeper insights into user behavior, such as which search filters are most popular and how users discover new content.
- **AI-Powered Movie Analysis:** Integrate a generative AI model to provide unique, AI-driven summaries or analyses of movies.

---

   Made with ❤️ by jdavifranco
