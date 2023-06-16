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
        if (snapshot.hasData) {
          return mainDashboard();
        } else {
          // By default, show a loading spinner.
          return const CircularProgressIndicator();
        }
      },
    );


  }

  Widget mainDashboard(){
    return Scaffold(
      appBar: AppBar(
        backgroundColor: primary,
        title: Text(
          "Dog Collection",
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.w400,
            color: quinary,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              ///Refresh the Page
            },
            child: SvgPicture.asset(
              "assets/svgs/refresh.svg",
              width: 16,
              height: 16,
              color: quinary,
            ),
          )
        ],
      ),
      body: Stack(children: [
        Obx(() => _homeViewModel.pages[_homeViewModel.currentPage.value]),
      ]),
      bottomNavigationBar: bottomNav(),
    );
  }

  void onTap(int index) {
    _homeViewModel.currentPage.value = index;
    _homeViewModel.openedForFirstTime.value = false;
  }

  Widget bottomNav() {
    Size size = MediaQuery.of(context).size;
    return Obx(
      () => Container(
        decoration: BoxDecoration(
          color: quinary,
          boxShadow: [
            BoxShadow(
              color: dark,
            ),
          ],
        ),
        child: BottomNavigationBar(
          backgroundColor: quinary,
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavUnSelectedImage[0],
                        color: dark,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavSelectedImage[0],
                        color: primary,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
                  Text(
                    bottomNavigationTxt[0],
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12, color: dark),
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavUnSelectedImage[1],
                        color: dark,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavSelectedImage[1],
                        color: primary,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
                  Text(
                    bottomNavigationTxt[1],
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12, color: dark),
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavUnSelectedImage[2],
                        color: dark,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
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
                          horizontal: 8.0, vertical: 2),
                      child: SvgPicture.asset(
                        bottomNavSelectedImage[2],
                        color: primary,
                      ),
                    ),
                  ),
                  addVerticalSpace(5),
                  Text(
                    bottomNavigationTxt[2],
                    style: TextStyle(
                        fontWeight: FontWeight.w500, fontSize: 12, color: dark),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
