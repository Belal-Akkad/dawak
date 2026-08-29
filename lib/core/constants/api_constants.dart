class ApiConstants {
  static const String baseUrl = 'https://pharmacy.adelkharma.dev/api';

  static const String accessTokenKey = 'token';

  // ==================== Auth ====================

  static const String registerEndPoint = '/auth/register';
  static const String loginEndPoint = '/auth/login';
  static const String logoutEndPoint = '/auth/logout';
  static const String deleteAccountEnpPoint = '/auth/delete-account';

  // ==================== Profile ====================

  static const String profileEndPoint = '/profile';
  static const String updateProfileEndPoint = '/profile';

  // ==================== Categories ====================

  static const String categoriesEndPoint = '/categories';

  // ==================== Products ====================

  static const String bestSellersEndPoint = '/products/best-sellers';
  static const String prescriptionRequiredEndPoint =
      '/products/prescription-required';
  static const String newArrivalsEndPoint = '/products/new-arrivals';

  static String productsByCategoryEndPoint(int categoryId) {
    return '/products?category_id=$categoryId';
  }

  static const String searchProductsEndPoint = '/products/search';

  // ==================== Home ====================

  static const String homeEndPoint = '/home';
}
