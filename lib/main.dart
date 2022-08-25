import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/layout/homeLayout/homeLayoutScreen.dart';
import 'package:la_vie/modules/splash_Screen/splashScreen.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/cubit/login_cubit/cubit.dart';
import 'package:la_vie/shared/cubit/login_cubit/states.dart';
import 'package:la_vie/shared/network/remote/dio_Helper/dio_Helper.dart';

import 'shared/network/local/sharedpreference/sharedpreference.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  token = CacheHelper.get(key: "token");

  // var rememberMe = CacheHelper.get(key: 'rememberMe');
  Widget widget;

  if (token != null) {
    widget = const HomeLayoutScreen();
  } else {
    widget = const SplashScreen();
  }
  runApp(MyApp(
    startWidget: widget,
  ));
}

class MyApp extends StatelessWidget {
  Widget startWidget;

  MyApp({Key? key, required this.startWidget}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (context, states) {},
        builder: (context, states) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: startWidget,
          );
        }
      ),
    );
  }
}
