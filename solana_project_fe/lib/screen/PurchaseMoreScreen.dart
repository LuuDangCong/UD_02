
import 'package:flutter/material.dart';
import 'package:nb_utils/nb_utils.dart';
import 'package:solana_project_fe/screen/PurchaseButton.dart';
import 'package:solana_project_fe/utils/FoodImages.dart';

class PurchaseMoreScreen extends StatefulWidget {
  final bool? enableAppbar;

  const PurchaseMoreScreen(this.enableAppbar, {super.key});

  @override
  _PurchaseMoreScreenState createState() => _PurchaseMoreScreenState();
}

class _PurchaseMoreScreenState extends State<PurchaseMoreScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    //
  }

  @override
  void setState(fn) {
    if (mounted) super.setState(fn);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const Icon(Icons.arrow_back,size: 24).paddingAll(16).onTap((){finish(context);}).visible(widget.enableAppbar!),
            SizedBox(
              width: context.width(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                      decoration: boxDecorationDefault(shape: BoxShape.circle),
                      child: Image.asset(
                        food_logo,
                        height: 180,
                      ).cornerRadiusWithClipRRect(90)),
                  22.height,
                  Text(
                    'This is the Lite Version of the Food App',
                    style: boldTextStyle(size: 22),
                    textAlign: TextAlign.center,
                  ),
                  16.height,
                  PurchaseButton(),
                ],
              ),
            ).paddingAll(16),
          ],
        ),
      ),
    );
  }
}
