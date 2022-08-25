import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/components.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            Container(
              height: 230,
              width: 180,
              padding: EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: const [
                    BoxShadow(
                        blurRadius: 5,
                        blurStyle: BlurStyle.outer,
                        spreadRadius: 10,
                        color: Colors.grey),
                  ]),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),
                  const Text(
                    "GARDENIA PLANT",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const Text("70 EGP"),
                  startButton(text: "Add To Cart", ontap: () {}, radius: 20)
                ],
              ),
            ),
            Positioned(
              top: -40,
              left: 10,
              child: Image.asset("assets/plant.png"),
            ),
            Positioned(
              top: 40,
              left: 90,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.remove,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  const Text(
                    "1",
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                        fontSize: 16),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      color: Colors.grey[200],
                      child: const Icon(
                        Icons.add,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
