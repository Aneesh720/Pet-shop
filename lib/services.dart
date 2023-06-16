import 'package:flutter_template/data/models/dog_details.dart';
import 'package:flutter_template/utils/constant.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future saveCartToLocalStorage( )async{
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String list=DogDetails.encode(cartList);

    prefs.setString(CART_DETAIL,list);

  } on Exception catch (e) {
    Logger logger=new Logger();
    logger.e(e.toString());
    // TODO
  }
}



Future saveHistoryToLocalStorage( )async{
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();


    prefs.setStringList(HISTORY_DETAIL,historyList) ?? [];

  } on Exception catch (e) {
    Logger logger=new Logger();
    logger.e(e.toString());
    // TODO
  }
}


Future getFromCartLocalStorage()async{
  List<DogDetails> empty=[];

  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? value=prefs.getString(CART_DETAIL);
    bool v=prefs.containsKey(HISTORY_DETAIL);

    if(v) {
      return DogDetails.decode(value!) ;
    }else{
      return empty;
    }
  } on Exception catch (e) {
    // TODO

    Logger logger=Logger();
    logger.e("Error2 ${e}");
    return empty;
  }
}



Future getFromHistoryLocalStorage()async{
  List<String> empty=[];
  try {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool v=prefs.containsKey(HISTORY_DETAIL);

    if(v) {

      return prefs.getStringList(HISTORY_DETAIL) ;
    }else{

      return empty;
    }
  } on Exception catch (e) {
    // TODO

    Logger logger=Logger();
    logger.e("Error3 ${e}");
    return empty;
  }

}