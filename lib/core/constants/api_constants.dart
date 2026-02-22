class ApiConstants {
  // Auth Endpoints
  static const String login = '/login';
  static const String register = '/register';
  static const String logout = '/logout';
  static const String refreshToken = '/refresh';

  // User Endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/profile';

  // Product Endpoints
  static const String products = '/products';
  static String productDetail(String id) => '/products/$id';
  static const String searchProducts = '/products/search';

  // Dashboard Endpoints
  static const String shops = '/shops';

  // Headers
  static const String authorization = 'Authorization';
  static const String contentType = 'Content-Type';
  static const String accept = 'Accept';

  // Values
  static const String applicationJson = 'application/json';
  static String bearer(String token) => 'Bearer $token';
}
