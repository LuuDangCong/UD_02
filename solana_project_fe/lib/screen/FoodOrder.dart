import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:solana_project_fe/model/FoodModel.dart';
import 'package:solana_project_fe/screen/PurchaseMoreScreen.dart';
import 'package:solana_project_fe/utils/FoodDataGenerator.dart';
import 'package:solana_project_fe/utils/FoodString.dart';
import 'package:solana_project_fe/utils/AppWidget.dart';

import '../utils/FoodColors.dart';

class FoodOrder extends StatefulWidget {
  static String tag = '/FoodOrder';

  @override
  FoodOrderState createState() => FoodOrderState();
}

class FoodOrderState extends State<FoodOrder> {

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    changeStatusColor(food_white);

    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_orders),
      body: PurchaseMoreScreen(false)
    );
  }
}

