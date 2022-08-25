import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/cubit/appCubit/cubit.dart';
import 'package:la_vie/shared/cubit/appCubit/states.dart';

class HomeLayoutScreen extends StatefulWidget {
  const HomeLayoutScreen({Key? key}) : super(key: key);

  @override
  State<HomeLayoutScreen> createState() => _HomeLayoutScreenState();
}

class _HomeLayoutScreenState extends State<HomeLayoutScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AppCubit()
          ..getDataSeeds()
          ..getUserData()
          ..getDataPlants()
          ..getDataTools(),
        child: BlocConsumer<AppCubit, AppStates>(
          listener: (BuildContext context, state) {},
          builder: (BuildContext context, Object? state) {
            AppCubit cubit = AppCubit.get(context);

            return Scaffold(
              body: cubit.screens[cubit.currentIndex],
              bottomNavigationBar: Container(
                decoration: BoxDecoration(boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 100,
                    offset: const Offset(0, 3), // changes position of shadow
                  ),
                ]),
                child: CurvedNavigationBar(
                  key: cubit.navigation,
                  index: AppCubit.get(context).currentIndex,
                  onTap: (index) {
                    cubit.bottomNav(index);
                    // setState(() {
                    //   _index=index;
                    // });
                  },
                  backgroundColor: Colors.transparent,
                  buttonBackgroundColor: HexColor('#1ABC00'),
                  color: HexColor("#FFFFFF"),
                  height: 50.0,
                  items: [
                    SvgPicture.asset(
                      "assets/icons/leave 1 .svg",
                      color:
                          cubit.currentIndex == 0 ? Colors.white : Colors.black,
                    ),
                    SvgPicture.asset(
                      "assets/icons/qr-code-scan .svg",
                      color:
                          cubit.currentIndex == 1 ? Colors.white : Colors.black,
                    ),
                    SvgPicture.asset(
                      "assets/icons/home.svg",
                      color:
                          cubit.currentIndex == 2 ? Colors.white : Colors.black,
                    ),
                    SvgPicture.asset(
                      "assets/icons/notifications.svg",
                      color:
                          cubit.currentIndex == 3 ? Colors.white : Colors.black,
                    ),
                    SvgPicture.asset(
                      "assets/icons/profile.svg",
                      color:
                          cubit.currentIndex == 4 ? Colors.white : Colors.black,
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
