import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_template/viewModels/home_viewmodel.dart';
import 'package:flutter_template/views/screen/cart_screen.dart';
import 'package:flutter_template/views/screen/dashboard_screen.dart';
import 'package:flutter_template/views/screen/history_screen.dart';
import 'package:flutter_template/views/widgets/space.dart';
import 'package:get/get.dart';
import '../utils/color.dart';
import '../utils/constant.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late HomeViewModel _homeViewModel;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _homeViewModel=HomeViewModel();
  }

  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
      future: _homeViewModel.getTheValue(),
      builder: (context, snapshot) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: primary,
            title: Text(
              "Dog Collection",
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: quinary,
              ),
            ),
            actions: [
              InkWell(
                onTap: () async{
                  ///Refresh the Page
                  loadTheValue=true;
                  await _homeViewModel.getTheValue();
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: SvgPicture.asset(
                      "assets/svgs/retry.svg",
                      width: 26,
                      height: 26,
                      color: quinary,
                    ),
                  ),
                ),
              ),
              addHorizontalSpace(20),
            ],
          ),
          body:
          (snapshot.hasData)?
          Stack(children: [
            Obx(() => _homeViewModel.pages[_homeViewModel.currentPage.value]),
          ]):Container(
            color: quinary,
          ),
          bottomNavigationBar: bottomNav(),
        );
      },
    );


  }



  void onTap(int index) {
    _homeViewModel.currentPage.value = index;
    _homeViewModel.openedForFirstTime.value = false;
  }

  Widget bottomNav() {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => BottomNavigationBar(
        backgroundColor: primary,
        elevation: 0,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        currentIndex: _homeViewModel.currentPage.value,
        onTap: onTap,
        items: [
          //Home
          BottomNavigationBarItem(
            label: bottomNavigationTxt[0],
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[0],
                      color: dark,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[0],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: dark),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: quaternary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 8),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[0],
                      color: quinary,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[0],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: quinary),
                ),
              ],
            ),
          ),
          //Cart
          BottomNavigationBarItem(
            label: bottomNavigationTxt[1],
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[1],
                      color: dark,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[1],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: dark),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: quaternary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 8),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[1],
                      color: quinary,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[1],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: quinary),
                ),
              ],
            ),
          ),
          //History
          BottomNavigationBarItem(
            label: bottomNavigationTxt[2],
            icon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15.0, vertical: 5),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[2],
                      color: dark,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[2],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: dark),
                ),
              ],
            ),
            activeIcon: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: quaternary,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 8),
                    child: SvgPicture.asset(
                      bottomNavUnSelectedImage[2],
                      color: quinary,
                      width: 26,
                      height: 26,
                    ),
                  ),
                ),
                addVerticalSpace(0),
                Text(
                  bottomNavigationTxt[2],
                  style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 12, color: quinary),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
