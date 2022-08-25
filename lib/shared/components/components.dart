// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/modules/search/searchscreen.dart';
import 'package:la_vie/shared/components/constant.dart';

//Login Screen components

Widget tffLogin({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType input,
  Widget? prefix,
  IconData? suffix,
  bool passwordShow = false,
  Function(String)? onchange,
  Function(String)? onSubmit,
  Function()? suffixPressed,
  Widget? suffixWidget,
}) =>
    TextFormField(
      obscureText: passwordShow,
      controller: controller,
      validator: validate,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w600,
        fontSize: 16,
      ),
      keyboardType: input,
      textCapitalization: TextCapitalization.words,
      onChanged: onchange,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        suffix: suffixWidget,
        fillColor: Colors.transparent,
        prefix: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: prefix,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            color: HexColor("#939393"),
          ),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(5),
          borderSide: BorderSide(
            width: 1,
            color: HexColor("#939393"),
          ),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
        filled: true,
        contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 2),
      ),
    );

Widget itemLogin({
  required String title,
  required TextEditingController controller,
  required TextInputType typeInput,
  String? Function(String?)? validate,
  Widget? prefix,
  IconData? suffix,
  bool passwordShow = false,
  Function(String)? onchange,
  Function(String)? onSubmit,
  Function()? suffixPressed,
}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: HexColor("#6F6F6F")),
        ),
        const SizedBox(
          height: 5,
        ),
        TextFormField(
          cursorColor: HexColor("#1ABC00"),
          obscureText: passwordShow,
          controller: controller,
          validator: validate,
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 16,
          ),
          keyboardType: typeInput,
          textCapitalization: TextCapitalization.words,
          onChanged: onchange,
          onFieldSubmitted: onSubmit,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              color: HexColor("#939393"),
              onPressed: suffixPressed,
              icon: Icon(suffix),
            ),
            fillColor: Colors.transparent,
            // prefix: Padding(
            //   padding: EdgeInsets.only(right: 10.0),
            //   child: prefix,
            // ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: HexColor("#939393"),
              ),
              gapPadding: 10,
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                width: 1,
                color: HexColor('#1ABC00'),
              ),
            ),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
            filled: true,
            contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 2),
          ),
        ),
      ],
    );

//Start Button
Widget startButton({
  @required String? text,
  @required Function()? ontap,
  double height = 50,
  double radius = 5,
}) =>
    InkWell(
      onTap: ontap,
      child: Container(
        height: height,
        decoration: BoxDecoration(
            color: HexColor("#1ABC00"),
            borderRadius: BorderRadius.circular(radius)),
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              fontWeight: FontWeight.w500,
              fontStyle: FontStyle.normal,
              fontSize: 16,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );

//App Items Shapes

Widget searchShap(context) => InkWell(
      onTap: () {
        navigateTo(context, SearchScreen());
      },
      child: Container(
        width: double.infinity,
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 30),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          shape: BoxShape.rectangle,
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(
              Icons.search,
              color: Colors.grey,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                "Search",
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey),
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
Widget search({
  String? Function(String?)? validate,
  required TextEditingController controller,
  required TextInputType typeInput,
  Widget? prefix,
  IconData? suffix,
  bool passwordShow = false,
  Function(String)? onchange,
  Function(String)? onSubmit,
  Function()? suffixPressed,
  Widget? suffixWidget,
}) =>
    TextFormField(
      cursorColor: Colors.black,
      controller: controller,
      validator: validate,
      style: TextStyle(
        color: Colors.black,
        fontWeight: FontWeight.w400,
        fontSize: 14,
      ),
      keyboardType: typeInput,
      onChanged: onchange,
      onFieldSubmitted: onSubmit,
      decoration: InputDecoration(
        fillColor: Colors.grey[200],
        contentPadding: EdgeInsets.zero,
        prefix: Padding(
          padding: EdgeInsets.only(right: 10.0),
          child: Icon(
            Icons.search,
            color: Colors.grey,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(color: HexColor("#F8F8F8")),
          gapPadding: 10,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: HexColor("#F8F8F8"),
            width: 1,
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide(
            color: HexColor("#F8F8F8"),
            width: 1,
          ),
        ),
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(color: HexColor("#F8F8F8"))),
        filled: true,
        // contentPadding: const EdgeInsetsDirectional.fromSTEB(20, 24, 20, 2),
      ),
    );

Widget categeoryItem(
  model,
) =>
    Stack(
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
              Text(
                "${model.name}",
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(
                height: 3,
              ),
              const Text("70 EGP"),
              const SizedBox(
                height: 10,
              ),
              startButton(text: "Add To Cart", ontap: () {}, radius: 20)
            ],
          ),
        ),
        Positioned(
          top: -20,

          left: -13,

          // bottom: -20,

          child: Container(
            width: 100,
            height: 150,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(
                image: DecorationImage(
                    filterQuality: FilterQuality.high,
                    fit: BoxFit.cover,
                    image: (model.imageUrl == null)
                        ? NetworkImage(
                            "https://lavie.orangedigitalcenteregypt.com/uploads/09be504b-99e3-481d-9653-9b6c791741dc.png")
                        : NetworkImage(
                            "https://lavie.orangedigitalcenteregypt.com${model.imageUrl}",
                          )),
                borderRadius: BorderRadius.circular(20)),
          ),
        ),
        Positioned(
          top: 70,
          left: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,

            // mainAxisSize: MainAxisSize.max,

            children: [
              InkWell(
                onTap: () {},
                child: Container(
                  color: Colors.grey.withOpacity(0.9),
                  child: Icon(
                    Icons.remove,
                    color: Colors.grey[600],
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
                  color: Colors.grey.withOpacity(0.9),
                  child: Icon(
                    Icons.add,
                    color: Colors.grey[600],
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );

Widget buildCategeoryList(model) => GridView.builder(
      physics: physics,
      padding: const EdgeInsetsDirectional.only(
          start: 20, top: 60, bottom: 30, end: 20),
      itemCount: model.data?.length,
      clipBehavior: Clip.antiAlias,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 1 / 1.04,
          mainAxisExtent: 250,
          mainAxisSpacing: 60,
          crossAxisSpacing: 40),
      itemBuilder: (context, index) => categeoryItem(
        model.data![index],
      ),
    );

Widget longDivider() => Padding(
      padding: const EdgeInsetsDirectional.only(
        start: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 1.0,
        color: Colors.grey[300],
      ),
    );
Widget fullDivider() => Container(
      width: double.infinity,
      height: 1.0,
      color: Colors.grey[300],
    );

//Methods

void navigateTo(context, widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

void navigateAndFinish(context, widget) {
  Navigator.pushAndRemoveUntil(context,
      MaterialPageRoute(builder: (context) => widget), (route) => false);
}

void showToast({
  String? text,
  required ToastStates state,
}) =>
    Fluttertoast.showToast(
      msg: text!,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 5,
      backgroundColor: chooseToastColor(state),
      textColor: Colors.white,
      fontSize: 16.0,
    );

enum ToastStates { ERROR, SUCCESS, WARNING }

Color chooseToastColor(ToastStates state) {
  Color color;
  switch (state) {
    case ToastStates.SUCCESS:
      color = Colors.green;
      break;
    case ToastStates.ERROR:
      color = Colors.red;
      break;
    case ToastStates.WARNING:
      color = Colors.amber;
      break;
  }
  return color;
}
