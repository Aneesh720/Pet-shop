const bottomNavigationTxt = [
  "Home",
  "Cart",
  "History",
];
const bottomNavUnSelectedImage = [
  "assets/img/home_unselected.svg",
  "assets/img/matches_unselected.svg",
  "assets/img/music_unselected.svg",
];
const bottomNavSelectedImage = [
  "assets/img/home_selected.svg",
  "assets/img/matches_selected.svg",
  "assets/img/music_selected.svg",
];



class AppConstants {
  get getBaseUrl => baseUrl;
  set setBaseUrl(String url) => baseUrl = url;

  //TODO: Change Base Url
  static String baseUrl = 'https://dog.ceo/api/breeds/image/random';

  // Shared Key
  static const String token = 'user_app_token';
  static const String userId = 'user_app_id';
  static const String razorpayKey = 'razorpay_key';
  static const String recentOrders = 'recent_orders';
  static const String isUser = 'is_user';
}