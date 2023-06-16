import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/utils/color.dart';
import 'package:flutter_template/views/widgets/space.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CommanDialog {
  static showLoading({String title = "Loading..."}) {
    Get.dialog(
      Container(
        width: 40,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: 80,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: CircularProgressIndicator.adaptive(),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    title,
                    style: TextStyle(
                        color: dark, fontWeight: FontWeight.w500, fontSize: 13),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static hideLoading() {
    if (Get.isDialogOpen!) Get.back();
  }

  static showErrorDialog(
      {String title = "Oops Error",
      String description = "Something went wrong "}) {
    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10.0))),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: Get.textTheme.headline6,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                description,
                style: TextStyle(fontSize: 16),
              ),
              ElevatedButton(
                onPressed: () {
                  if (Get.isDialogOpen!) Get.back();
                },
                child: Text("Okay"),
              ),
            ],
          ),
        ),
      ),
      barrierDismissible: false,
    );
  }

  static getThePriceDialog(BuildContext context,TextEditingController controller,dynamic onPressed) {
    Size size = MediaQuery.of(context).size;
    Get.dialog(Dialog(
      insetPadding: EdgeInsets.symmetric(horizontal: 15),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),),
      child: Container(
        height: 250,
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 30,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Enter the Price",
                style: TextStyle(
                  color: dark,
                  fontWeight: FontWeight.w500,
                  fontSize: 16,
                ),
              ),
              addVerticalSpace(10),
              Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: TextField(
                  controller: controller,
                  keyboardType: TextInputType.number,
                  textAlign: TextAlign.left,
                  decoration: new InputDecoration(
                      floatingLabelBehavior: FloatingLabelBehavior.never,
                      labelStyle: TextStyle(
                          color: dark,
                          fontWeight: FontWeight.w400,
                          fontSize: 15),
                      labelText: "Enter the Price",
                      enabledBorder: OutlineInputBorder(
                        borderSide: new BorderSide(color: secondary, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      border: new OutlineInputBorder(
                        borderSide: new BorderSide(color: grey, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      focusedBorder: new OutlineInputBorder(
                        borderSide: new BorderSide(color: primary, width: 1),
                        borderRadius: BorderRadius.circular(5),
                      )),
                  cursorColor: dark,
                  style: TextStyle(
                      color: dark, fontWeight: FontWeight.w500, fontSize: 17),
                ),
              ),
              addVerticalSpace(10),
              InkWell(
                onTap: ()async{
                  await onPressed();
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primary,
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 40,vertical: 15),
                    child: Text(
                      "Add to Cart",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        color: quinary,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
