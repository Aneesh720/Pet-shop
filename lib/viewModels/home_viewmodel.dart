import 'dart:async';
import 'dart:convert';
import 'package:flutter_template/services.dart';
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
    if(loadTheValue) {
      historyList=[];
      cartList=[];
      try {

        historyList=await getFromHistoryLocalStorage();
        Logger logger=Logger();
        logger.e("Error1 ");

        cartList=await getFromCartLocalStorage();
      } on Exception catch (e) {
        // TODO
        Logger logger=Logger();
        logger.e("Error1 ${e}");
      }

      final response = await http
          .get(Uri.parse(AppConstants().getBaseUrl));

      if (response.statusCode == 200) {
        // If the server did return a 200 OK response,
        // then parse the JSON.
        Logger logger = Logger();
        logger.i(DogDetails.fromJson(jsonDecode(response.body)));

        /// Adding the Image to List of History

        dogImage.value = DogDetails
            .fromJson(jsonDecode(response.body))
            .imageUrl;
        historyList.add(DogDetails.fromJson(jsonDecode(response.body)).imageUrl);
        ///Upload the Value to SharedPreference
        saveHistoryToLocalStorage();
        loadTheValue = false;
        return 1;
      } else {
        // If the server did not return a 200 OK response,
        // then throw an exception.
        throw Exception('Failed to load the Image for Dos');
      }
    }
    return 1;
  }

}