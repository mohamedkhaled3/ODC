import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/modules/login/loginScreen.dart';
import 'package:la_vie/modules/login/signUpScreen.dart';
import 'package:la_vie/shared/cubit/login_cubit/cubit.dart';
import 'package:la_vie/shared/cubit/login_cubit/states.dart';

class MainLogin extends StatelessWidget {
  const MainLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => LoginCubit(),
        child: BlocConsumer<LoginCubit, LoginStates>(
          listener: (BuildContext context, state) {
            // if (state is LoginSuccessState) {
            //   if (state.loginModel.data != null) {
            //     print(state.loginModel.message);
            //   } else {
            //     print(state.loginModel.message);
            //     String? error = state.loginModel.message;
            //     Fluttertoast.showToast(
            //         msg: state.loginModel.message,
            //         toastLength: Toast.LENGTH_SHORT,
            //         gravity: ToastGravity.BOTTOM,
            //         timeInSecForIosWeb: 1,
            //         backgroundColor: Colors.red,
            //         textColor: Colors.white,
            //         fontSize: 16.0);
            //   }
            // }
          },
          builder: (BuildContext context, Object? state) {
            return DefaultTabController(
              initialIndex: 1,
              length: 2,
              child: Scaffold(
                body: Stack(
                  children: [
                    SafeArea(
                      child: SvgPicture.asset(
                        "assets/login_background.svg",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsetsDirectional.only(
                          top: 120, start: 40, end: 40, bottom: 50),
                      child: Form(
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: 100,
                                height: 25,
                                child:
                                    SvgPicture.asset("assets/la_via logo.svg")),
                            const SizedBox(
                              height: 35,
                            ),
                            TabBar(
                              unselectedLabelColor: HexColor("#8A8A8A"),
                              unselectedLabelStyle: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                              ),
                              labelColor: HexColor("#1ABC00"),
                              labelStyle: const TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 18),
                              indicatorColor: HexColor("#1ABC00"),
                              indicatorSize: TabBarIndicatorSize.label,
                              indicatorWeight: 1,
                              indicatorPadding:
                                  EdgeInsets.symmetric(horizontal: 10),
                              tabs: const [
                                Tab(
                                  text: "Sign Up",
                                ),
                                Tab(text: "Login")
                              ],
                            ),
                            const SizedBox(
                              height: 40,
                            ),
                            const Expanded(
                              child: TabBarView(
                                  children: [SignUpScreen(), LoginScreen()]),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ));
  }
}
