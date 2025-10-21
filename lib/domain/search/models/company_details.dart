class CompanyDetails {
  final String? description;
  final String? headquarters;
  final String? homepage;
  final int id;
  final String? logoPath;
  final String name;
  final String? originCountry;
  final int? parentCompany;

  CompanyDetails({
    this.description,
    this.headquarters,
    this.homepage,
    required this.id,
    this.logoPath,
    required this.name,
    this.originCountry,
    this.parentCompany,
  });
}
