import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:moviealike/data/network_client/request_error.dart';
import 'package:moviealike/domain/search/models/person_details.dart';
import 'package:moviealike/domain/search/models/company_details.dart';
import 'package:moviealike/domain/search/models/search_item.dart';
import 'package:moviealike/domain/search/models/search_filter.dart';

part 'movie_info_details_state.g.dart';

@CopyWith()
class MovieInfoDetailsState {
  final PersonDetails? personDetails;
  final CompanyDetails? companyDetails;
  final List<List<SearchItem>> pages;
  final List<int> keys;
  final SearchFilter? filterType;
  final int? filterId;
  final bool isLoading;
  final bool hasError;
  final RequestError? error;
  final bool hasNextPage;

  const MovieInfoDetailsState({
    this.personDetails,
    this.companyDetails,
    this.pages = const [],
    this.keys = const [],
    this.filterType,
    this.filterId,
    this.isLoading = false,
    this.hasError = false,
    this.error,
    this.hasNextPage = true,
  });

  bool get isPersonFilter =>
      filterType == SearchFilter.people ||
      filterType == SearchFilter.cast ||
      filterType == SearchFilter.crew;

  bool get isCompanyFilter => filterType == SearchFilter.companies;
}
