<div align="center">
  <img src="assets/images/ic_launcher-playstore.png" alt="MovieAlike Logo" width="200"/>
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

---

<img src="https://img.shields.io/badge/About%20This%20Project-252836?style=for-the-badge" alt="About This Project">

As a movie enthusiast, I've always been curious about how recommendation and search systems work under the hood. I noticed that many streaming apps, that may be great for browsing, often lack the a deep, specific movie details exploration i was looking for—like seeing films from a particular production company or by director.

This project started as a way to explore that problem. I wanted to build a movie discovery tool that was more granular and powerful, and also use it as a practical exercise to take an app from concept to production on the [Google Play Store](https://play.google.com/store/apps/details?id=com.jozaforge.moviealike&hl=en). It's been a fantastic learning experience in building a full-stack mobile application, and this repository serves as a log of that journey and the architectural choices made along the way.

---

<img src="https://img.shields.io/badge/Features%20Showcase-252836?style=for-the-badge" alt="Features Showcase">

-   **Contextual Movie Exploration:** Start with a movie you already like and dive into a deep exploration path. From a movie's detail page, you can discover new movies by tapping on any actor, director, genre, or production company to see a filtered list of filmes.
-   **Intelligent Recommendations:** Instead of a black box, the recommendation engine uses a **[Jaccard Similarity](https://en.wikipedia.org/wiki/Jaccard_index)** algorithm. This provides a clear, percentage-based "similarity score," giving a tangible reason why a movie is recommended, compared to many modern recommendations systems that use machine learn models, this project jaccard similatiry system using genres and keywords from tmdb database, has a really good result in showing similar recommendations and sometimes better ones, with the plus that it shows how much similar a recommended movie is to the one selected.
-   **Personal Watchlist & Details:** Keep track of movies you want to watch and dive deep into details with trailers, cast bios, and crew information, all stored locally for a smooth and responsive experience.
  <img width="322"  alt="Screenshot_1757367428" src="https://github.com/user-attachments/assets/bd553037-c1c3-49b5-8ee7-497982cc0c7b" />
<img width="322" alt="Screenshot_1757367440" src="https://github.com/user-attachments/assets/99d17ca3-ff39-427e-8a52-396852bc87c7" /> 
  <img width="322"  alt="Screenshot_1757369041" src="https://github.com/user-attachments/assets/b26edcdb-6cb9-4dda-a69c-deba3caa511e" />
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

<img src="https://img.shields.io/badge/Architecture%20&%20Tech%20Stack-252836?style=for-the-badge" alt="Architecture & Tech Stack">

This app is built with a focus on creating a scalable, maintainable, and testable codebase. The foundation is <strong style="color:#FF4081;">Clean Architecture</strong>, which strictly separates the project into three distinct layers: Presentation, Domain, and Data.

### Architecture Layers:


**🎨 Presentation Layer** (`lib/presentation/`)
- **Screens & Widgets**: Flutter UI components (Home, Search, MovieDetails, Watchlist)
- **BLoCs**: State management using BLoC pattern (HomeBloc, SearchBloc, etc.)
- **Navigation**: GoRouter for declarative routing

**🧠 Domain Layer** (`lib/domain/`)
- **Use Cases**: Single-purpose business operations (`GetPopularMovies`, `GetMovieDetails`)
- **Repository Interfaces**: Abstract contracts (`MovieRepository`, `SearchRepository`)
- **Domain Models**: Pure business entities (`Movie`, `CastMember`, `MovieDetails`)

**💾 Data Layer** (`lib/data/`)
- **Repository Implementations**: Concrete implementations (`MovieRepositoryImpl`)
- **Data Sources**: API and database access (`MovieDataSource`, `WatchListDataSource`)
- **DTOs**: Data Transfer Objects for external communication
<div align="center">
  <p> <br> Architecture Diagram </br> </p>
 <img width="872" height="1145" alt="image" src="https://github.com/user-attachments/assets/60aa4776-0dd0-4ff0-aeb8-9ed7c0f75ba3" />
</div>



### Tech Stack and Libraries

- **[Bloc/Cubit](https://github.com/felangel/bloc/tree/master/packages/bloc)** - For State Management and reactive UI.
  
- **[GetIt & Injectable](https://pub.dev/packages/get_it)** -For Dependency Injection.
  
- **[Dio](https://pub.dev/packages/dio)** -  Network & API. Handle HTTP requests with auth interceptors.
  
- **[Drift (Moor)](https://pub.dev/packages/drift)** - Local database for storing user watchlist with reactive data streams.
  
- **[GoRouter](https://pub.dev/packages/go_router)** - Declarative routing for managing app navigation and screen flow.

- **[Infinite scroll](https://pub.dev/packages/infinite_scroll_pagination)** - Used on the search screen to load more pages of a query when scrolling.

- **[Flutter native splash](https://pub.dev/packages/flutter_native_splash)** - Used to generate the splash screen.

- **[Result Type](https://pub.dev/packages/result_type)** - For handling success and failed requests

- **[Intl](https://pub.dev/packages/intl)** - For internacionalization, the app supports Portuguese, English and Spanish.
  
- <img width="20" height="20" alt="image" src="https://github.com/user-attachments/assets/4b42a490-eeb5-4e23-9eb3-ba5a3b054ab2" /> **[RxDart](https://pub.dev/packages/rxdart)** - For reactive updates in UI.


**Analytics & Monitoring**
- **[Firebase](https://firebase.google.com/)** - Analytics for user engagement insights and Crashlytics for production stability monitoring.


---

<img src="https://img.shields.io/badge/Getting%20Started-252836?style=for-the-badge" alt="Getting Started">

To get a local copy up and running, follow these simple steps.

### Prerequisites

-   Flutter SDK installed
-   An editor like VS Code or Android Studio

### Installation

1.  Clone the repo
    ```sh
    git clone https://github.com/jdavifranco/moviealikemobile.git
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
    make buil_runner
    ```
4.  Generate App localization:
    ```sh
    make intl_gen
    ```    
5.  Run the app:
    ```sh
    flutter run
    ```

---

<img src="https://img.shields.io/badge/Future%20Enhancements-252836?style=for-the-badge" alt="Future Enhancements">

This project is actively developed. Future plans to expand its capabilities include:

-   **✅ Robust Automated Testing:** Implement a full suite of Unit, Widget, and Integration tests to ensure code quality and prevent regressions.
-   **✅ CI/CD Automation:** Set up a GitHub Actions workflow to automate testing and build processes.
-   **✅ User Authentication & Cloud Sync:** Integrate Firebase Authentication to allow users to sync their watchlists and preferences across devices.
-   **📈 Advanced Analytics:** Implement detailed event tracking to gain deeper insights into user behavior, such as which search filters are most popular and how users discover new content.
-   **🤖 AI-Powered Movie Analysis:** Integrate a generative AI model to provide unique, AI-driven summaries or analyses of movies.

---

   Made with ❤️ by jdavifranco
