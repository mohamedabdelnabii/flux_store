class ApiConstants {
  static const String apiBaseUrl = "https://ecommerce.routemisr.com";

  // Auth & Users
  static const String signup = "/api/v1/auth/signup";
  static const String signin = "/api/v1/auth/signin";
  static const String forgotPassword = "/api/v1/auth/forgotPasswords";
  static const String verifyResetCode = "/api/v1/auth/verifyResetCode";
  static const String resetPassword = "/api/v1/auth/resetPassword";
  static const String updateMe = "/api/v1/users/updateMe";
  static const String changeMyPassword = "/api/v1/users/changeMyPassword";

  // Categories
  static const String categories = "/api/v1/categories";
  static const String subCategories = "/api/v1/subcategories";

  // Brands
  static const String brands = "/api/v1/brands";

  // Products
  static const String products = "/api/v1/products";

  // Home & Search
  static const String home =
      "/api/v1/categories"; // Placeholder if no direct /home
  static const String search = "/api/v1/products";

  // Cart
  static const String cart = "/api/v1/cart";

  // Wishlist
  static const String wishlist = "/api/v1/wishlist";

  // Addresses
  static const String addresses = "/api/v1/addresses";

  // Orders
  static const String orders = "/api/v1/orders";
  static const String cashOrder = "/api/v1/orders/"; // Needs cartId suffix
  static const String checkoutSession =
      "/api/v1/orders/checkout-session/"; // Needs cartId suffix

  // Profile
  static const String profile = "/api/v1/users/getMe";
}
