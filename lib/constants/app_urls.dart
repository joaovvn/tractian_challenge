class AppUrls {
  // API base URL
  static const String _baseUrl = 'https://fake-api.tractian.com';

  // returns all companies
  static const String getCompanies = '$_baseUrl/companies';

  // URL for a specific company
  static String _getCompanyUrl(String companyId) {
    return '$getCompanies/$companyId';
  }

  // returns all locations of a specific company
  static String getCompanyLocations(String companyId) {
    return '${_getCompanyUrl(companyId)}/locations';
  }

  // returns all assets of a specific company
  static String getCompanyAssets(String companyId) {
    return '${_getCompanyUrl(companyId)}/assets';
  }
}
