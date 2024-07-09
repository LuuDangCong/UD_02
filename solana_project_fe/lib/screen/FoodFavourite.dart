import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solana_project_fe/model/FoodModel.dart';
import 'package:solana_project_fe/screen/PurchaseMoreScreen.dart';
import 'package:solana_project_fe/utils/AppWidget.dart';
import 'package:solana_project_fe/utils/FoodColors.dart';
import 'package:solana_project_fe/utils/FoodDataGenerator.dart';
import 'package:solana_project_fe/utils/FoodString.dart';

class FoodFavourite extends StatefulWidget {
  static String tag = '/FoodFavourite';

  const FoodFavourite({super.key});

  @override
  FoodFavouriteState createState() => FoodFavouriteState();
}

class FoodFavouriteState extends State<FoodFavourite> {
  late List<FoodDish> mList1;

  @override
  void initState() {
    super.initState();
    mList1 = addFoodDishData();
  }

  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);
    return Scaffold(
      backgroundColor: food_app_background,
      appBar: appBar(context, food_lbl_favourite),
      body: PurchaseMoreScreen(false),
    );
  }
}
