import 'package:faker/faker.dart';
import 'package:moviealike/domain/search/models/company_details.dart';

CompanyDetails getFakeCompanyDetails({
  int? id,
  String? name,
  String? description,
  String? headquarters,
  String? homepage,
  String? logoPath,
  String? originCountry,
  int? parentCompany,
}) =>
    CompanyDetails(
      id: id ?? faker.randomGenerator.integer(1000000),
      name: name ?? faker.company.name(),
      description: description ?? faker.lorem.sentence(),
      headquarters: headquarters ?? faker.address.city(),
      homepage: homepage ?? faker.internet.httpUrl(),
      logoPath: logoPath ?? faker.image.loremPicsum(),
      originCountry: originCountry ?? faker.address.countryCode(),
      parentCompany: parentCompany,
    );
