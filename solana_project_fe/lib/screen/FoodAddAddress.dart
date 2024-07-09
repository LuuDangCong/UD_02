
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solana_project_fe/screen/PurchaseMoreScreen.dart';
import 'package:solana_project_fe/utils/FoodColors.dart';
import 'package:solana_project_fe/utils/FoodString.dart';
import 'package:solana_project_fe/utils/AppWidget.dart';

class FoodAddAddress extends StatefulWidget {
  static String tag = '/FoodAddAddress';

  const FoodAddAddress({super.key});

  @override
  FoodAddAddressState createState() => FoodAddAddressState();
}

class FoodAddAddressState extends State<FoodAddAddress> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_add_address),
      body: const PurchaseMoreScreen(false),
    );
  }
}