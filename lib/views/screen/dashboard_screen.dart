import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_template/data/models/dog_details.dart';
import 'package:flutter_template/utils/color.dart';
import 'package:flutter_template/utils/constant.dart';
import 'package:flutter_template/viewModels/dashboard_viewmodel.dart';
import 'package:flutter_template/views/dialogs/comman_dialogs.dart';
import 'package:get/get.dart';
import 'package:logger/logger.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late DashboardViewModel _dashboardViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _dashboardViewModel = DashboardViewModel(context: context);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 20,
        ),
        child: Obx(
          () => Container(
            height: 350,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(dogImage.value),
              ),
            ),
            child: (dogImage.value.isNotEmpty)
                ? Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.bottomRight,
                          child: InkWell(
                            onTap: () {
                              ///Appearing Dialog Box
                              Logger l = Logger();
                              l.i("message");
                              CommanDialog.getThePriceDialog(
                                context,
                                _dashboardViewModel.priceText,
                                _dashboardViewModel.onPriceAddPressed,
                              );
                            },
                            child: Container(
                              width: 45,
                              height: 45,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: quinary,
                              ),
                              child: Padding(
                                padding: EdgeInsets.all(10),
                                child: SvgPicture.asset(
                                    "assets/svgs/add_cart.svg"),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(),
          ),
        ),
      ),
    );
  }

  TextEditingController priceText = TextEditingController();

  Future onPriceAddPressed() async {
    CommanDialog.hideLoading();
    Navigator.pop(context);
    priceText.clear();
  }
}
