import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/dog_details.dart';
import 'package:flutter_template/services.dart';
import 'package:flutter_template/utils/constant.dart';
import 'package:flutter_template/views/dialogs/comman_dialogs.dart';
class DashboardViewModel{
  final BuildContext context;
  DashboardViewModel({required this.context,});

  TextEditingController priceText=TextEditingController();

  Future onPriceAddPressed()async{

    if(priceText.text.toString().isNotEmpty){
      CommanDialog.hideLoading();
      ///Adding to The List
      DogDetails dogDetails=DogDetails(imageUrl: dogImage.value,price:double.parse(priceText.text.toString()));
      cartList.add(dogDetails);
      saveCartToLocalStorage();
      priceText.clear();
    }else{
      _showToast(context, "Enter the Price");
    }


  }


  void _showToast(BuildContext context,String text) {
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
      SnackBar(
        content: Text(text),
        action: SnackBarAction(label: 'UNDO', onPressed: scaffold.hideCurrentSnackBar),
      ),
    );
  }
}
