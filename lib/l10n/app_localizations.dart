import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localizations_en.dart';
import 'app_localizations_es.dart';
import 'app_localizations_pt.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localizations.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate = _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('es'),
    Locale('pt')
  ];

  /// No description provided for @helloWorld.
  ///
  /// In en, this message translates to:
  /// **'Hello World!'**
  String get helloWorld;

  /// No description provided for @chooseYourMovie.
  ///
  /// In en, this message translates to:
  /// **'Choose your movie'**
  String get chooseYourMovie;

  /// No description provided for @discoverYourNext.
  ///
  /// In en, this message translates to:
  /// **'Discover your next'**
  String get discoverYourNext;

  /// No description provided for @experience.
  ///
  /// In en, this message translates to:
  /// **'experience'**
  String get experience;

  /// No description provided for @cinematic.
  ///
  /// In en, this message translates to:
  /// **'cinematic'**
  String get cinematic;

  /// No description provided for @findRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Find movie and series recommendations based on your tastes.'**
  String get findRecommendations;

  /// No description provided for @home.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get home;

  /// No description provided for @movies.
  ///
  /// In en, this message translates to:
  /// **'movies'**
  String get movies;

  /// No description provided for @movie.
  ///
  /// In en, this message translates to:
  /// **'movie'**
  String get movie;

  /// No description provided for @series.
  ///
  /// In en, this message translates to:
  /// **'series'**
  String get series;

  /// No description provided for @serie.
  ///
  /// In en, this message translates to:
  /// **'serie'**
  String get serie;

  /// No description provided for @popular.
  ///
  /// In en, this message translates to:
  /// **'Popular'**
  String get popular;

  /// No description provided for @mostPopular.
  ///
  /// In en, this message translates to:
  /// **'Most Popular'**
  String get mostPopular;

  /// No description provided for @upcoming.
  ///
  /// In en, this message translates to:
  /// **'Upcoming'**
  String get upcoming;

  /// No description provided for @selectAMovie.
  ///
  /// In en, this message translates to:
  /// **'Select a {searchType} you enjoyed and our AI will find similar gems based on your taste.'**
  String selectAMovie(String searchType);

  /// No description provided for @searchForAMovie.
  ///
  /// In en, this message translates to:
  /// **'Search for a {searchType} you enjoyed!'**
  String searchForAMovie(String searchType);

  /// No description provided for @searchResults.
  ///
  /// In en, this message translates to:
  /// **'Search results for \"{query}\"'**
  String searchResults(String query);

  /// No description provided for @loadingRecommendations.
  ///
  /// In en, this message translates to:
  /// **'Loading recommendations'**
  String get loadingRecommendations;

  /// No description provided for @yourChoice.
  ///
  /// In en, this message translates to:
  /// **'Your choice'**
  String get yourChoice;

  /// No description provided for @themes.
  ///
  /// In en, this message translates to:
  /// **'Themes: '**
  String get themes;

  /// No description provided for @whyWatch.
  ///
  /// In en, this message translates to:
  /// **'Why Watch: '**
  String get whyWatch;

  /// No description provided for @whereToWatch.
  ///
  /// In en, this message translates to:
  /// **'Where to watch: '**
  String get whereToWatch;

  /// No description provided for @settings.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settings;

  /// No description provided for @about.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get about;

  /// No description provided for @termsOfService.
  ///
  /// In en, this message translates to:
  /// **'Terms of Service'**
  String get termsOfService;

  /// No description provided for @privacyPolicy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get privacyPolicy;

  /// No description provided for @openSourceLicenses.
  ///
  /// In en, this message translates to:
  /// **'Open Source Licenses'**
  String get openSourceLicenses;

  /// No description provided for @credits.
  ///
  /// In en, this message translates to:
  /// **'Credits'**
  String get credits;

  /// No description provided for @adsDisclosure.
  ///
  /// In en, this message translates to:
  /// **'Ads Disclosure'**
  String get adsDisclosure;

  /// No description provided for @version.
  ///
  /// In en, this message translates to:
  /// **'Version'**
  String get version;

  /// No description provided for @appInfo.
  ///
  /// In en, this message translates to:
  /// **'App Information'**
  String get appInfo;

  /// No description provided for @legalPolicies.
  ///
  /// In en, this message translates to:
  /// **'Legal & Policies'**
  String get legalPolicies;

  /// No description provided for @tmdbAttribution.
  ///
  /// In en, this message translates to:
  /// **'This product uses the TMDB API but is not endorsed or certified by TMDB.'**
  String get tmdbAttribution;

  /// No description provided for @close.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get close;

  /// No description provided for @errorLaunchingUrl.
  ///
  /// In en, this message translates to:
  /// **'Failed to open the link. Please try again later.'**
  String get errorLaunchingUrl;

  /// No description provided for @back.
  ///
  /// In en, this message translates to:
  /// **'Back'**
  String get back;

  /// No description provided for @favorite.
  ///
  /// In en, this message translates to:
  /// **'Favorite'**
  String get favorite;

  /// No description provided for @unfavorite.
  ///
  /// In en, this message translates to:
  /// **'Unfavorite'**
  String get unfavorite;

  /// No description provided for @overview.
  ///
  /// In en, this message translates to:
  /// **'Overview'**
  String get overview;

  /// No description provided for @castAndCrew.
  ///
  /// In en, this message translates to:
  /// **'Cast & Crew'**
  String get castAndCrew;

  /// No description provided for @recommendations.
  ///
  /// In en, this message translates to:
  /// **'Recommendations'**
  String get recommendations;

  /// No description provided for @gallery.
  ///
  /// In en, this message translates to:
  /// **'Gallery'**
  String get gallery;

  /// No description provided for @play.
  ///
  /// In en, this message translates to:
  /// **'Play'**
  String get play;

  /// No description provided for @download.
  ///
  /// In en, this message translates to:
  /// **'Download'**
  String get download;

  /// No description provided for @externalLink.
  ///
  /// In en, this message translates to:
  /// **'External Link'**
  String get externalLink;

  /// No description provided for @minutes.
  ///
  /// In en, this message translates to:
  /// **'minutes'**
  String get minutes;

  /// No description provided for @unknownGenre.
  ///
  /// In en, this message translates to:
  /// **'Unknown Genre'**
  String get unknownGenre;

  /// No description provided for @loading.
  ///
  /// In en, this message translates to:
  /// **'Loading...'**
  String get loading;

  /// No description provided for @errorLoadingImage.
  ///
  /// In en, this message translates to:
  /// **'Error loading image'**
  String get errorLoadingImage;

  /// No description provided for @noOverviewAvailable.
  ///
  /// In en, this message translates to:
  /// **'No overview available.'**
  String get noOverviewAvailable;

  /// No description provided for @noCastMembersAvailable.
  ///
  /// In en, this message translates to:
  /// **'No cast members available.'**
  String get noCastMembersAvailable;

  /// No description provided for @noRecommendationsAvailable.
  ///
  /// In en, this message translates to:
  /// **'No recommendations available.'**
  String get noRecommendationsAvailable;

  /// No description provided for @appDescription.
  ///
  /// In en, this message translates to:
  /// **'Welcome to Movie Alike! This app was created to help you discover movies similar to your favorites. We use advanced algorithms to suggest personalized recommendations based on the selected movie. Browse a vast collection of movies and series, find new favorites, and share your discoveries with friends. Enjoy your cinematic experience!'**
  String get appDescription;

  /// No description provided for @adsDisclosureDescription.
  ///
  /// In en, this message translates to:
  /// **'This app displays advertisements to support its development. By using this app, you agree to the display of ads.'**
  String get adsDisclosureDescription;

  /// No description provided for @seeMore.
  ///
  /// In en, this message translates to:
  /// **'See more'**
  String get seeMore;

  /// No description provided for @searchHint.
  ///
  /// In en, this message translates to:
  /// **'Search a title...'**
  String get searchHint;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get search;

  /// No description provided for @errorMessage.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong. Please try again later.'**
  String get errorMessage;

  /// No description provided for @tryAgain.
  ///
  /// In en, this message translates to:
  /// **'Try again'**
  String get tryAgain;

  /// No description provided for @noResults.
  ///
  /// In en, this message translates to:
  /// **'No results found.'**
  String get noResults;

  /// No description provided for @noResultsDescription.
  ///
  /// In en, this message translates to:
  /// **'We couldn\'t find any results for your search. Please try again with a different keyword.'**
  String get noResultsDescription;

  /// No description provided for @availableOn.
  ///
  /// In en, this message translates to:
  /// **'Available on'**
  String get availableOn;

  /// No description provided for @genres.
  ///
  /// In en, this message translates to:
  /// **'Genres'**
  String get genres;

  /// No description provided for @productionCountries.
  ///
  /// In en, this message translates to:
  /// **'Production Countries'**
  String get productionCountries;

  /// No description provided for @productionCompanies.
  ///
  /// In en, this message translates to:
  /// **'Production Companies'**
  String get productionCompanies;

  /// No description provided for @trailersAndVideos.
  ///
  /// In en, this message translates to:
  /// **'Trailers and Videos'**
  String get trailersAndVideos;

  /// No description provided for @watchlist.
  ///
  /// In en, this message translates to:
  /// **'Watchlist'**
  String get watchlist;

  /// No description provided for @searchMovies.
  ///
  /// In en, this message translates to:
  /// **'Search Movies'**
  String get searchMovies;

  /// No description provided for @addMovieToWatchlist.
  ///
  /// In en, this message translates to:
  /// **'Add movie to watchlist'**
  String get addMovieToWatchlist;

  /// No description provided for @yourWatchlistIsEmpty.
  ///
  /// In en, this message translates to:
  /// **'Your watchlist is empty.'**
  String get yourWatchlistIsEmpty;

  /// No description provided for @loginRequired.
  ///
  /// In en, this message translates to:
  /// **'Login Required'**
  String get loginRequired;

  /// No description provided for @loginRequiredMessage.
  ///
  /// In en, this message translates to:
  /// **'You need to login to access this feature.'**
  String get loginRequiredMessage;

  /// No description provided for @highlyRecommended.
  ///
  /// In en, this message translates to:
  /// **'Highly Recommended'**
  String get highlyRecommended;

  /// No description provided for @similar.
  ///
  /// In en, this message translates to:
  /// **'Similar'**
  String get similar;

  /// No description provided for @related.
  ///
  /// In en, this message translates to:
  /// **'Related'**
  String get related;

  /// No description provided for @trailer.
  ///
  /// In en, this message translates to:
  /// **'Trailer'**
  String get trailer;

  /// No description provided for @premium.
  ///
  /// In en, this message translates to:
  /// **'Premium'**
  String get premium;

  /// No description provided for @errorNoInternet.
  ///
  /// In en, this message translates to:
  /// **'No Internet Connection'**
  String get errorNoInternet;

  /// No description provided for @errorNoInternetMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your internet connection and try again.'**
  String get errorNoInternetMessage;

  /// No description provided for @errorTimeout.
  ///
  /// In en, this message translates to:
  /// **'Request Timeout'**
  String get errorTimeout;

  /// No description provided for @errorTimeoutMessage.
  ///
  /// In en, this message translates to:
  /// **'The request took too long. Please check your connection and try again.'**
  String get errorTimeoutMessage;

  /// No description provided for @errorServer.
  ///
  /// In en, this message translates to:
  /// **'Server Error'**
  String get errorServer;

  /// No description provided for @errorServerMessage.
  ///
  /// In en, this message translates to:
  /// **'Our servers are temporarily unavailable. Please try again later.'**
  String get errorServerMessage;

  /// No description provided for @errorNotFound.
  ///
  /// In en, this message translates to:
  /// **'Not Found'**
  String get errorNotFound;

  /// No description provided for @errorNotFoundMessage.
  ///
  /// In en, this message translates to:
  /// **'The requested content was not found.'**
  String get errorNotFoundMessage;

  /// No description provided for @errorAuthentication.
  ///
  /// In en, this message translates to:
  /// **'Authentication Error'**
  String get errorAuthentication;

  /// No description provided for @errorAuthenticationMessage.
  ///
  /// In en, this message translates to:
  /// **'Authentication failed. Please try again.'**
  String get errorAuthenticationMessage;

  /// No description provided for @errorAuthorization.
  ///
  /// In en, this message translates to:
  /// **'Access Denied'**
  String get errorAuthorization;

  /// No description provided for @errorAuthorizationMessage.
  ///
  /// In en, this message translates to:
  /// **'You don\'t have permission to access this resource.'**
  String get errorAuthorizationMessage;

  /// No description provided for @errorValidation.
  ///
  /// In en, this message translates to:
  /// **'Invalid Data'**
  String get errorValidation;

  /// No description provided for @errorValidationMessage.
  ///
  /// In en, this message translates to:
  /// **'Please check your input and try again.'**
  String get errorValidationMessage;

  /// No description provided for @errorUnknown.
  ///
  /// In en, this message translates to:
  /// **'Unexpected Error'**
  String get errorUnknown;

  /// No description provided for @errorUnknownMessage.
  ///
  /// In en, this message translates to:
  /// **'Something went wrong. Please try again.'**
  String get errorUnknownMessage;

  /// No description provided for @errorGenericTitle.
  ///
  /// In en, this message translates to:
  /// **'Oops! Something went wrong'**
  String get errorGenericTitle;

  /// No description provided for @errorGenericMessage.
  ///
  /// In en, this message translates to:
  /// **'An unexpected error occurred. Please try again later.'**
  String get errorGenericMessage;

  /// No description provided for @noDescriptionAvailable.
  ///
  /// In en, this message translates to:
  /// **'No description available for this company.'**
  String get noDescriptionAvailable;

  /// No description provided for @websiteAvailable.
  ///
  /// In en, this message translates to:
  /// **'Website available'**
  String get websiteAvailable;

  /// No description provided for @seeLess.
  ///
  /// In en, this message translates to:
  /// **'See less'**
  String get seeLess;

  /// No description provided for @biography.
  ///
  /// In en, this message translates to:
  /// **'Biography'**
  String get biography;

  /// No description provided for @moviesWithPerson.
  ///
  /// In en, this message translates to:
  /// **'Movies with {person}'**
  String moviesWithPerson(String person);

  /// No description provided for @moviesFromCompany.
  ///
  /// In en, this message translates to:
  /// **'Movies from {company}'**
  String moviesFromCompany(String company);

  /// No description provided for @thisPerson.
  ///
  /// In en, this message translates to:
  /// **'this person'**
  String get thisPerson;

  /// No description provided for @thisCompany.
  ///
  /// In en, this message translates to:
  /// **'this company'**
  String get thisCompany;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @noMoviesFound.
  ///
  /// In en, this message translates to:
  /// **'No movies found'**
  String get noMoviesFound;
}

class _AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'es', 'pt'].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return AppLocalizationsEn();
    case 'es': return AppLocalizationsEs();
    case 'pt': return AppLocalizationsPt();
  }

  throw FlutterError(
    'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
