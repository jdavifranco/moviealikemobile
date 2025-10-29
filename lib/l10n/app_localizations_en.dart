// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String get chooseYourMovie => 'Choose your movie';

  @override
  String get discoverYourNext => 'Discover your next';

  @override
  String get experience => 'experience';

  @override
  String get cinematic => 'cinematic';

  @override
  String get findRecommendations => 'Find movie and series recommendations based on your tastes.';

  @override
  String get home => 'Home';

  @override
  String get movies => 'movies';

  @override
  String get movie => 'movie';

  @override
  String get series => 'series';

  @override
  String get serie => 'serie';

  @override
  String get popular => 'Popular';

  @override
  String get mostPopular => 'Most Popular';

  @override
  String get upcoming => 'Upcoming';

  @override
  String selectAMovie(String searchType) {
    return 'Select a $searchType you enjoyed and our AI will find similar gems based on your taste.';
  }

  @override
  String searchForAMovie(String searchType) {
    return 'Search for a $searchType you enjoyed!';
  }

  @override
  String searchResults(String query) {
    return 'Search results for \"$query\"';
  }

  @override
  String get loadingRecommendations => 'Loading recommendations';

  @override
  String get yourChoice => 'Your choice';

  @override
  String get themes => 'Themes: ';

  @override
  String get whyWatch => 'Why Watch: ';

  @override
  String get whereToWatch => 'Where to watch: ';

  @override
  String get settings => 'Settings';

  @override
  String get about => 'About';

  @override
  String get termsOfService => 'Terms of Service';

  @override
  String get privacyPolicy => 'Privacy Policy';

  @override
  String get openSourceLicenses => 'Open Source Licenses';

  @override
  String get credits => 'Credits';

  @override
  String get adsDisclosure => 'Ads Disclosure';

  @override
  String get version => 'Version';

  @override
  String get appInfo => 'App Information';

  @override
  String get legalPolicies => 'Legal & Policies';

  @override
  String get tmdbAttribution => 'This product uses the TMDB API but is not endorsed or certified by TMDB.';

  @override
  String get close => 'Close';

  @override
  String get errorLaunchingUrl => 'Failed to open the link. Please try again later.';

  @override
  String get back => 'Back';

  @override
  String get favorite => 'Favorite';

  @override
  String get unfavorite => 'Unfavorite';

  @override
  String get overview => 'Overview';

  @override
  String get castAndCrew => 'Cast & Crew';

  @override
  String get recommendations => 'Recommendations';

  @override
  String get gallery => 'Gallery';

  @override
  String get play => 'Play';

  @override
  String get download => 'Download';

  @override
  String get externalLink => 'External Link';

  @override
  String get minutes => 'minutes';

  @override
  String get unknownGenre => 'Unknown Genre';

  @override
  String get loading => 'Loading...';

  @override
  String get errorLoadingImage => 'Error loading image';

  @override
  String get noOverviewAvailable => 'No overview available.';

  @override
  String get noCastMembersAvailable => 'No cast members available.';

  @override
  String get noRecommendationsAvailable => 'No recommendations available.';

  @override
  String get appDescription =>
      'Welcome to Movie Alike! This app was created to help you discover movies similar to your favorites. We use advanced algorithms to suggest personalized recommendations based on the selected movie. Browse a vast collection of movies and series, find new favorites, and share your discoveries with friends. Enjoy your cinematic experience!';

  @override
  String get adsDisclosureDescription =>
      'This app displays advertisements to support its development. By using this app, you agree to the display of ads.';

  @override
  String get seeMore => 'See more';

  @override
  String get searchHint => 'Search a title...';

  @override
  String get search => 'Search';

  @override
  String get errorMessage => 'Oops! Something went wrong. Please try again later.';

  @override
  String get tryAgain => 'Try again';

  @override
  String get noResults => 'No results found.';

  @override
  String get noResultsDescription =>
      'We couldn\'t find any results for your search. Please try again with a different keyword.';

  @override
  String get availableOn => 'Available on';

  @override
  String get genres => 'Genres';

  @override
  String get productionCountries => 'Production Countries';

  @override
  String get productionCompanies => 'Production Companies';

  @override
  String get trailersAndVideos => 'Trailers and Videos';

  @override
  String get watchlist => 'Watchlist';

  @override
  String get searchMovies => 'Search Movies';

  @override
  String get addMovieToWatchlist => 'Add movie to watchlist';

  @override
  String get yourWatchlistIsEmpty => 'Your watchlist is empty.';

  @override
  String get loginRequired => 'Login Required';

  @override
  String get loginRequiredMessage => 'You need to login to access this feature.';

  @override
  String get highlyRecommended => 'Highly Recommended';

  @override
  String get similar => 'Similar';

  @override
  String get related => 'Related';

  @override
  String get trailer => 'Trailer';

  @override
  String get premium => 'Premium';

  @override
  String get errorNoInternet => 'No Internet Connection';

  @override
  String get errorNoInternetMessage => 'Please check your internet connection and try again.';

  @override
  String get errorTimeout => 'Request Timeout';

  @override
  String get errorTimeoutMessage => 'The request took too long. Please check your connection and try again.';

  @override
  String get errorServer => 'Server Error';

  @override
  String get errorServerMessage => 'Our servers are temporarily unavailable. Please try again later.';

  @override
  String get errorNotFound => 'Not Found';

  @override
  String get errorNotFoundMessage => 'The requested content was not found.';

  @override
  String get errorAuthentication => 'Authentication Error';

  @override
  String get errorAuthenticationMessage => 'Authentication failed. Please try again.';

  @override
  String get errorAuthorization => 'Access Denied';

  @override
  String get errorAuthorizationMessage => 'You don\'t have permission to access this resource.';

  @override
  String get errorValidation => 'Invalid Data';

  @override
  String get errorValidationMessage => 'Please check your input and try again.';

  @override
  String get errorUnknown => 'Unexpected Error';

  @override
  String get errorUnknownMessage => 'Something went wrong. Please try again.';

  @override
  String get errorGenericTitle => 'Oops! Something went wrong';

  @override
  String get errorGenericMessage => 'An unexpected error occurred. Please try again later.';

  @override
  String get noDescriptionAvailable => 'No description available for this company.';

  @override
  String get websiteAvailable => 'Website available';

  @override
  String get seeLess => 'See less';

  @override
  String get biography => 'Biography';

  @override
  String moviesWithPerson(String person) {
    return 'Movies with $person';
  }

  @override
  String moviesFromCompany(String company) {
    return 'Movies from $company';
  }

  @override
  String moviesDirectedBy(String person) {
    return 'Movies directed by $person';
  }

  @override
  String moviesProducedBy(String company) {
    return 'Movies produced by $company';
  }

  @override
  String get thisPerson => 'this person';

  @override
  String get thisCompany => 'this company';

  @override
  String get details => 'Details';

  @override
  String get noMoviesFound => 'No movies found';
}
