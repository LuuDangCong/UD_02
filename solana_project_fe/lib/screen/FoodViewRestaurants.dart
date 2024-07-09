import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:solana_project_fe/model/FoodModel.dart';
import 'package:solana_project_fe/screen/PurchaseMoreScreen.dart';
import 'package:solana_project_fe/utils/FlutterSlider.dart';
import 'package:solana_project_fe/utils/FoodColors.dart';
import 'package:solana_project_fe/utils/FoodDataGenerator.dart';
import 'package:solana_project_fe/utils/FoodString.dart';
import 'package:solana_project_fe/utils/FoodWidget.dart';
import  'package:solana_project_fe/utils/AppWidget.dart';


import 'FoodBookDetail.dart';
import 'FoodRestaurantsDescription.dart';

class FoodViewRestaurants extends StatefulWidget {
  static String tag = '/FoodViewRestaurants';

  const FoodViewRestaurants({super.key});

  @override
  FoodViewRestaurantsState createState() => FoodViewRestaurantsState();
}

class FoodViewRestaurantsState extends State<FoodViewRestaurants> {
  List<DataFilter> list = getAllData();
  List<DataFilter> list1 = getFilterData();

  List<ViewRestaurants> mList = [];
  List<images> mList1 = [];
  List<Filter> mList2 = [];
  List<String> mPeopleList = [];
  List<String> mCuisine = [];
  List<String> mFilterList = [];
  var mTime = 0;

  @override
  // ignore: must_call_super
  void initState() {
    mList = addViewRestaurantsData();
    mList1 = addViewImagesData();
    mPeopleList = ["1", "2", "3", "4", "5"];
    mFilterList = [
      "Pure Veg Places",
      "Express Delivery",
      "Great Offer",
    ];
    mCuisine = [
      "South Indian",
      "American",
      "BBQ",
      "Bakery",
      "Biryani",
      "Burger",
      "Cafe",
      "Charcoal Chicken",
      "Chiness",
      "Fast Food",
      "Juice",
      "Gujarati",
      "Salad",
    ];
  }


  @override
  Widget build(BuildContext context) {
    //changeStatusColor(food_app_background);



    return Scaffold(
      backgroundColor: food_app_background,
      appBar: appBarWidget(
        '',
        actions: [
          IconButton(
            icon: const Icon(Icons.filter_list,color: Colors.black),
            onPressed: () {
              PurchaseMoreScreen(true).launch(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(food_lbl_lunch_in_delhi_ncr, style: boldTextStyle(size: 20)),
                          const SizedBox(height: 4),
                          mAddress(context),
                          const SizedBox(height: 16),
                          search(context),
                        ],
                      ),
                    ),
                    ListView.builder(
                      scrollDirection: Axis.vertical,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: mList.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        return RestaurantsInfo(mList[index], mList1[index], index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RestaurantsInfo extends StatelessWidget {
  ViewRestaurants? model;
  images? model1;
  int? pos;

  RestaurantsInfo(this.model, this.model1, this.pos, {super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FoodRestaurantsDescription().launch(context);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(boxShadow: defaultBoxShadow(), color: white),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            CachedNetworkImage(
              placeholder: placeholderWidgetFn() as Widget Function(BuildContext, String)?,
              imageUrl: model1!.image,
              width: width,
              height: 250,
              fit: BoxFit.fill,
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(model!.name, style: primaryTextStyle(size: 18)),
                  const SizedBox(height: 4),
                  Row(children: <Widget>[
                    mRating(model!.rating),
                    const SizedBox(width: 4),
                    Text(model!.review, style: primaryTextStyle(color: food_textColorSecondary)),
                  ]),
                  const SizedBox(height: 4),
                  Row(
                    children: <Widget>[
                      Text(model!.rs, style: primaryTextStyle(color: food_textColorSecondary)),
                      const SizedBox(width: 4),
                      Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: food_view_color), width: 8, height: 8),
                      const SizedBox(width: 4),
                      Text(model!.sector, style: primaryTextStyle(color: food_textColorSecondary)),
                      const SizedBox(width: 4),
                      Container(decoration: const BoxDecoration(shape: BoxShape.circle, color: food_view_color), width: 8, height: 8),
                      const SizedBox(width: 4),
                      Text(model!.kms, style: primaryTextStyle(color: food_textColorSecondary)),
                    ],
                  ),
                  Container(margin: const EdgeInsets.only(top: 16), height: 0.5, color: food_view_color, width: width),
                ],
              ),
            ),
            mViewAll(context, food_lbl_book_a_table, onTap: () {
              FoodBookDetail().launch(context);
            }),
          ],
        ),
      ),
    );
  }
}
