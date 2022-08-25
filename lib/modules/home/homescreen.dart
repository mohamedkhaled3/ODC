import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/modules/homeScreens/allProductsScreen.dart';
import 'package:la_vie/modules/shoppingcart/shoppingcart.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/components/constant.dart';

import '../homeScreens/plantsscreen.dart';
import '../homeScreens/seedsscreen.dart';
import '../homeScreens/toolsscreens.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarHeight: 100,
          title: Padding(
            padding: const EdgeInsetsDirectional.only(top: 60),
            child: SizedBox(
                height: 40,
                width: 102,
                child: SvgPicture.asset("assets/la_via logo.svg")),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsetsDirectional.only(start: 20, end: 20, top: 15),
              child: Row(
                children: [
                  Expanded(
                    child: searchShap(context),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  InkWell(
                    onTap: () {
                      navigateAndFinish(context, const ShoppingCart());
                    },
                    child: Container(
                        height: 50,
                        width: 50,
                        clipBehavior: Clip.antiAlias,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: HexColor("#1ABC00"),
                            borderRadius: BorderRadius.circular(10)),
                        child: SvgPicture.asset("assets/icons/Cart.svg")),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            TabBar(
              physics: physics,
              labelColor: HexColor("#1ABC00"),
              unselectedLabelColor: Colors.grey,
              isScrollable: true,
              labelPadding:
                  const EdgeInsets.symmetric(horizontal: 5, vertical: 2),
              indicatorColor: HexColor("#1ABC00"),
              indicator: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(
                    color: HexColor("#1ABC00"),
                    width: 2,
                    style: BorderStyle.solid),
              ),
              tabs: [
                Container(
                  width: 65,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "All",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 100,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "Plants",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 65,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "Seeds",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 65,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius:
                          const BorderRadius.all(Radius.circular(10))),
                  child: const Center(
                    child: Text(
                      "Tools",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Expanded(
              child: TabBarView(physics: BouncingScrollPhysics(), children: [
                AllProductsScreen(),
                PlantsScreen(),
                SeedsScreen(),
                ToolsScreen(),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
