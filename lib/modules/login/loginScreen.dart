import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/login_cubit/cubit.dart';
import 'package:la_vie/shared/cubit/login_cubit/states.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => LoginCubit(),
      child: BlocConsumer<LoginCubit, LoginStates>(
        listener: (BuildContext context, state) {},
        builder: (BuildContext context, Object? state) {
          var loginCubit = LoginCubit.get(context);
          var emailController = TextEditingController();
          var passwordController = TextEditingController();
          var formKey = GlobalKey<FormState>();

          return SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  itemLogin(
                    title: "Email",
                    controller: emailController,
                    typeInput: TextInputType.emailAddress,
                    validate: (String? value) {
                      if (value!.isEmpty) {
                        return 'email must be not empty';
                      } else if (!value.toString().contains('@') ||
                          !value.toString().contains('.com')) {
                        return 'ex: example@mail.com';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  itemLogin(
                      title: "Password",
                      controller: passwordController,
                      typeInput: TextInputType.visiblePassword,
                      passwordShow: loginCubit.isPasswordShow,
                      suffix: loginCubit.suffix,
                      // suffixColor: loginCubit.suffixColor,
                      suffixPressed: () {
                        loginCubit.changeSuffixIcon();
                      },
                      validate: (value) {
                        RegExp regEx = RegExp(r"(?=.*[a-z])(?=.*[A-Z])\w+");
                        if (value!.isEmpty) {
                          return "Password must not be empty";
                        } else if (value != passwordController.text) {
                          return "Password must be same";
                        } else if (value.length < 8) {
                          return 'Should be more than 8 Characters';
                        } else if (!value.toString().contains(regEx)) {
                          return 'Use Numbers and Capital and Small Characters at least 1';
                        } else {
                          return null;
                        }
                      },
                      onSubmit: (value) async {
                        if (formKey.currentState!.validate()) {
                          loginCubit.logIn(context,
                              email: emailController.text,
                              password: passwordController.text);
                        }
                      }),
                  const SizedBox(
                    height: 40,
                  ),
                  ConditionalBuilder(
                    condition: state is! LoginLoadingState,
                    builder: (BuildContext context) {
                      return startButton(
                          text: "Login",
                          ontap: () async {
                            if (formKey.currentState!.validate()) {
                              loginCubit.logIn(context,
                                  email: emailController.text,
                                  password: passwordController.text);
                            }
                          });
                    },
                    fallback: (BuildContext context) =>
                        CircularProgressIndicator(
                      color: HexColor("#1ABC00"),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5),
                    child: Row(
                      children: [
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: 10,
                            color: HexColor("#979797"),
                          ),
                        ),
                        const Text(
                          "Or continue with",
                          style: TextStyle(fontSize: 12),
                        ),
                        Expanded(
                          child: Divider(
                            thickness: 1,
                            endIndent: 10,
                            color: HexColor("#979797"),
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        onTap: () {
                          loginCubit.signUpWithGoogle();
                        },
                        child: SvgPicture.asset("assets/icons/Google.svg"),
                      ),
                      const SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {},
                        child: SvgPicture.asset("assets/icons/Facebook.svg"),
                      )
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
