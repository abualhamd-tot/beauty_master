abstract class EndPoints {
  static const String baseUrl = "http://192.168.1.104:5252/api/";
  static const String login = "Auth/Login";
  static const String product = "Product";
  static const String searchProductsByText = "$product/search";
  static const String searchProductsByCategory =
      "$product/searchByProductCategory";
  static const String searchProductsByBrand = "$product/searchByProductBrand";
  static const String service = "Service";
  static const String searchServicesByText = "$service/search";
}
