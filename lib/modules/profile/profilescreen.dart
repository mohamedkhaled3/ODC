import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/appCubit/cubit.dart';
import 'package:la_vie/shared/cubit/appCubit/states.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (BuildContext context, AppStates state) {},
        builder: (BuildContext context, AppStates state) {
          var model = AppCubit.get(context).userCurrentModel!.data;
          var cubit = AppCubit.get(context);
          var formKeyEmail = GlobalKey<FormState>();
          var formKeyName = GlobalKey<FormState>();
          var emailController = TextEditingController();
          var nameController = TextEditingController();

          return ConditionalBuilder(
            condition: cubit.userCurrentModel?.data != null,
            builder: (BuildContext context) => SafeArea(
              child: Scaffold(
                extendBodyBehindAppBar: true,
                appBar: AppBar(
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  leading: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                body: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          SizedBox(
                            width: double.infinity,
                            height: 300,
                            child: Image(
                              image: NetworkImage(
                                "${model!.imageUrl}",
                              ),
                              fit: BoxFit.cover,
                              filterQuality: FilterQuality.high,
                              colorBlendMode: BlendMode.darken,
                              color: Colors.black87,
                            ),
                          ),
                          Positioned(
                            top: 100,
                            left: 100,
                            child: Column(
                              children: [
                                CircleAvatar(
                                  radius: 70,
                                  backgroundImage:
                                      NetworkImage("${model.imageUrl}"),
                                ),
                                Text(
                                  "${model.firstName} ${model.lastName}",
                                  style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      fontSize: 29),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 14,
                            ),
                            Container(
                              height: 60,
                              width: double.infinity,
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              decoration: BoxDecoration(
                                color: Colors.green[100],
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset("assets/icons/points.svg"),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Text((model.userPoints == null)
                                      ? "You have 0 points"
                                      : "You have ${model.userPoints} points"),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            const Text(
                              "Editing Profile",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.black),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 20),
                              child: InkWell(
                                onTap: () {
                                  showDialog<void>(
                                    context: context,
                                    barrierDismissible: false,
                                    builder: (BuildContext context) {
                                      return AlertDialog(
                                        title: const Text("Change Your Name "),
                                        content: SingleChildScrollView(
                                            child: Form(
                                          key: formKeyName,
                                          child: Column(
                                            children: [
                                              tffLogin(
                                                controller: nameController,
                                                input: TextInputType.name,
                                                validate: (String? value) {
                                                  if (value!.isEmpty) {
                                                    return 'name must be not empty';
                                                  } else {
                                                    return null;
                                                  }
                                                },
                                              ),
                                            ],
                                          ),
                                        )),
                                        actions: <Widget>[
                                          TextButton(
                                            child: const Text('Save Changes'),
                                            onPressed: () {
                                              if (formKeyName.currentState!
                                                  .validate()) {
                                                cubit.updateUserData(
                                                    key: "firstName",
                                                    value: nameController.text);
                                                Navigator.pop(context);
                                              }
                                            },
                                          ),
                                        ],
                                      );
                                    },
                                  );
                                },
                                child: Container(
                                  height: 70,
                                  decoration: BoxDecoration(
                                      color: Colors.grey[400],
                                      borderRadius: BorderRadius.circular(20)),
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 15),
                                        child: SvgPicture.asset(
                                            "assets/icons/change.svg"),
                                      ),
                                      Text(
                                        "Change Name",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: 18,
                                          color: HexColor("#2F2E2E"),
                                        ),
                                      ),
                                      const Spacer(),
                                      const Icon(Icons.arrow_forward_ios),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                showDialog<void>(
                                  context: context,
                                  barrierDismissible: true,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      title: const Text("Change Your Email "),
                                      content: SingleChildScrollView(
                                          child: Form(
                                        key: formKeyEmail,
                                        child: Column(
                                          children: [
                                            tffLogin(
                                              controller: emailController,
                                              input: TextInputType.emailAddress,
                                              validate: (String? value) {
                                                if (value!.isEmpty) {
                                                  return 'email must be not empty';
                                                } else if (!value
                                                        .toString()
                                                        .contains('@') ||
                                                    !value
                                                        .toString()
                                                        .contains('.com')) {
                                                  return 'ex: example@mail.com';
                                                } else {
                                                  return null;
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      )),
                                      actions: <Widget>[
                                        TextButton(
                                          child: const Text('Save Changes'),
                                          onPressed: () {
                                            if (formKeyName.currentState!
                                                .validate()) {
                                              cubit.updateUserData(
                                                  key: "email",
                                                  value: emailController.text);
                                              Navigator.pop(context);
                                            }
                                          },
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: Container(
                                height: 70,
                                decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(20)),
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 20,
                                ),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 15),
                                      child: SvgPicture.asset(
                                          "assets/icons/change.svg"),
                                    ),
                                    Text(
                                      "Change Email",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 18,
                                        color: HexColor("#2F2E2E"),
                                      ),
                                    ),
                                    const Spacer(),
                                    const Icon(Icons.arrow_forward_ios),
                                  ],
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            fallback: (BuildContext context) =>
                const Center(child: CircularProgressIndicator()),
          );
        });
  }
}
