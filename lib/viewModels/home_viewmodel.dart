import 'dart:async';
import 'dart:convert';
import 'package:flutter_template/utils/constant.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';
import '../data/models/dog_details.dart';
import '../views/screen/cart_screen.dart';
import '../views/screen/dashboard_screen.dart';
import '../views/screen/history_screen.dart';



class HomeViewModel{

  RxInt currentPage = 0.obs;
  RxBool openedForFirstTime = true.obs;
  List pages = [
    DashboardScreen(),
    CartScreen(),
    HistoryScreen(),
  ];



  Future getTheValue()async{
    final response = await http
        .get(Uri.parse(AppConstants().getBaseUrl));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      Logger logger=Logger();
      logger.i(DogDetails.fromJson(jsonDecode(response.body)));
      return DogDetails.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load the Image for Dos');
    }
  }

}