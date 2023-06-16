import 'package:flutter/material.dart';
import 'package:flutter_template/utils/constant.dart';

import '../widgets/space.dart';
class HistoryScreen extends StatefulWidget {
  const HistoryScreen({Key? key}) : super(key: key);

  @override
  State<HistoryScreen> createState() => _HistoryScreenState();
}

class _HistoryScreenState extends State<HistoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 20,
      ),
      child:  ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.vertical,
          itemCount: historyList.length,
          itemBuilder:
              (BuildContext context, int index) {

            return historyElement(
              historyList,
              index,
            );
          }),

    );
  }

  Widget historyElement(List<String>imageList,int index){
    return Column(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(imageList[index]),
            ),
          ),

        ),
        addVerticalSpace(30),
      ],
    );
  }
}