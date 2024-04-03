class ApiUtils {
  static const baseUrl = "https://esimcard.com/api/developer/";
  static const fetchInitUrl = "https://esimcard.com/api/developer/check-token/";

  static String getPackagesUrl(String baseURL) {
    return "$baseURL/packages/";
  }

  static String getPricingUrl(String baseURL) {
    return "$baseURL/pricing/";
  }

  static String getCountriesUrl(String baseURL) {
    return "$baseURL/packages/country/";
  }

  static String getPackagesByCountryUrl(String baseURL, String id) {
    return "$baseURL/packages/country/$id/";
  }

  static String getContinentsUrl(String baseURL) {
    return "$baseURL/packages/continent/";
  }

  static String getPackagesByContinentUrl(String baseURL, String id) {
    return "$baseURL/packages/continent/$id/";
  }

  static String getGlobalPackagesUrl(String baseURL) {
    return "$baseURL/packages/global/";
  }

  static String purchaseDataOnlyUrl(String baseURL) {
    return "$baseURL/package/purchase/";
  }

  static String purchaseDataVoiceSmsUrl(String baseURL) {
    return "$baseURL/package/date_voice_sms/purchase/";
  }

  //----------------------------------------------------------------------------
  //------------------------------My BUNDLE URLS--------------------------------

  static String getMyBundlesUrl(String baseURL) {
    return "$baseURL/my-bundles/";
  }

  static String getMyBundleByIDUrl(String baseURL, String id) {
    return "$baseURL/bundles/$id/";
  }

  static String getMyEsimsUrl(String baseURL) {
    return "$baseURL/my-esims/";
  }

  static String getMyEsimByIDUrl(String baseURL, String id) {
    return "$baseURL/my-esims/$id/";
  }

  static String getMyEsimUsageByIDUrl(String baseURL, String id) {
    return "$baseURL/my-sim/$id/usage/";
  }

  static String getPackageDetailUrl(String baseURL, String id) {
    return "$baseURL/package/detail/$id/";
  }

  //----------------------------------------------------------------------------
  //--------------------------------OTHERS URLS---------------------------------

  static String getBalanceUrl(String baseURL) {
    return "$baseURL/balance/";
  }

  static String getNetworkCoverageUrl(String baseURL) {
    return "$baseURL/network-coverages/";
  }

  static String getRefillUrl(String baseURL) {
    return "$baseURL/refill/";
  }
}
