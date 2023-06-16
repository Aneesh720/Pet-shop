import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../data/models/dog_details.dart';

const String CART_DETAIL="Cart_Details";
const String HISTORY_DETAIL="History_Details";

const bottomNavigationTxt = [
  "Home",
  "Cart",
  "History",
];
const bottomNavUnSelectedImage = [
  "assets/svgs/home_unselected.svg",
  "assets/svgs/cart_selected.svg",
  "assets/svgs/history_unselected.svg",
];
const bottomNavSelectedImage = [
  "assets/svgs/home_selected.svg",
  "assets/svgs/cart_selected.svg",
  "assets/svgs/history_selected.svg",
];

bool loadTheValue=true;


List<DogDetails> cartList=[];
List<String> historyList=[];

RxString dogImage="".obs;


class PriceConverter {
  static convert(price) {
    return '₹ ${double.parse('$price').toStringAsFixed(2)}';
  }

  static convertRound(price) {
    return '₹ ${double.parse('$price').toInt()}';
  }

  static convertToNumberFormat(num price) {
    final format = NumberFormat("#,##,##,##0.00", "en_IN");
    return '₹ ${format.format(price)}';
  }
}


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