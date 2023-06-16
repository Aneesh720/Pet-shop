import 'package:flutter/material.dart';
import 'package:flutter_template/data/models/dog_details.dart';
import 'package:flutter_template/utils/constant.dart';
import 'package:flutter_template/views/widgets/space.dart';

import '../../utils/color.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
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
          itemCount: cartList.length,
          itemBuilder:
              (BuildContext context, int index) {

            return cartElement(
              cartList,
              index,
            );
          }),

    );
  }

  Widget cartElement(List<DogDetails>cartList,int index){
    return Column(
      children: [
        Container(
          height: 350,
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(cartList[index].imageUrl),
            ),
          ),
          child:Padding(
            padding: const EdgeInsets.all(20.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
                  child: Container(

                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: quinary,
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                      child:Text(
                        PriceConverter.convertToNumberFormat(cartList[index].price as num),
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        addVerticalSpace(30),
      ],
    );
  }
}

