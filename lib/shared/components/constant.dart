import 'package:flutter/material.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/network/local/sharedpreference/sharedpreference.dart';

void signOut(context, widget) {
  CacheHelper.removeData(key: 'token').then((value) {
    if (value!) {
      navigateAndFinish(context, widget);
      showToast(text: 'LogOut', state: ToastStates.WARNING);
    }
  });
}

String? token;
bool? rememberMe;

List<String> imageBlogs = [
  "assets/blogs/blog1.png",
  "assets/blogs/blog2.png",
  "assets/blogs/blog3.png",
  "assets/blogs/blog4.png",
];
BouncingScrollPhysics? physics = const BouncingScrollPhysics();
