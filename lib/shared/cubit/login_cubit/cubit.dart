// ignore_for_file: avoid_print

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:la_vie/layout/homeLayout/homeLayoutScreen.dart';
import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signup_model.dart';
import 'package:la_vie/shared/components/components.dart';
import 'package:la_vie/shared/cubit/login_cubit/states.dart';
import 'package:la_vie/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:la_vie/shared/network/remote/dio_Helper/dio_Helper.dart';
import 'package:la_vie/shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates> {
  LoginCubit() : super(LoginInitialState());
  static LoginCubit get(context) => BlocProvider.of(context);

  //vars
  IconData suffix = Icons.visibility_outlined;
  bool isPasswordShow = true;

  void changeSuffixIcon() {
    isPasswordShow = !isPasswordShow;
    suffix = isPasswordShow
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(PasswordShow());
  }

  IconData suffix2 = Icons.visibility_outlined;
  bool isPasswordShow2 = true;

  void changeSuffixIcon2() {
    isPasswordShow2 = !isPasswordShow2;
    suffix2 = isPasswordShow2
        ? Icons.visibility_outlined
        : Icons.visibility_off_outlined;
    emit(PasswordShow2());
  }

  LoginModel? loginModel;

  // void signUpp({
  //   required String firstName,
  //   required String lastName,
  //   required String email,
  //   required String password,
  // }) async {
  //   try {
  //     var response = await Dio()
  //         .post('https://lavie.orangedigitalcenteregypt.com/$SIGNUP', data: {
  //       "firstName": firstName,
  //       "lastName": lastName,
  //       "email": email,
  //       "password": password
  //     });
  //     print(response);
  //   } on DioError catch (e) {
  //     print(e.response);
  //   }
  // }

  void signUp({
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) async {
    emit(SignUpLoadingState());
    DioHelper.postsData(url: SIGNUP, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password
    }).then((value) {
      print(value.data);
      emit(SignUpSuccessState(signupModel!));
    }).catchError((error) {
      emit(SignUpErrorState(error));
    });
  }

  void logIn(context, {required String email, required String password}) {
    emit(LoginLoadingState());
    DioHelper.postsData(
        url: LOGIN, data: {'email': email, 'password': password}).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      navigateTo(context, const HomeLayoutScreen());

      CacheHelper.saveData(key: "token", value: loginModel?.data!.accessToken);
      // CacheHelper.saveData(
      //     key: "First Name", value: loginModel?.data!.userData?.firstName);
      // CacheHelper.saveData(
      //     key: "Last Name", value: loginModel?.data!.userData?.lastName);
      // CacheHelper.saveData(
      //     key: "Email", value: loginModel?.data!.userData?.email);
      // CacheHelper.saveData(
      //     key: "Image Url", value: loginModel?.data!.userData?.imageUrl);
      // CacheHelper.saveData(key: "User Data", value: [""]);

//       print(loginModel?.data!.userData!.firstName);
      // print(loginModel?.data!.userData!.imageUrl);
      // print(loginModel!.type);
      // print(loginModel!.data!.accessToken);
      Fluttertoast.showToast(
          msg: loginModel?.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: HexColor("#1ABC00"),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(LoginSuccessState(loginModel!));
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(LoginErrorState(error.toString()));
    });
  }

  SignUpModel? signupModel;
  void signUP(
    context, {
    required String firstName,
    required String lastName,
    required String email,
    required String password,
  }) {
    emit(SignUpLoadingState());
    DioHelper.postsData(url: SIGNUP, data: {
      "firstName": firstName,
      "lastName": lastName,
      "email": email,
      "password": password,
    }).then((value) {
      // print(value.data);
      signupModel = SignUpModel.fromJson(value.data);
      navigateTo(context, const HomeLayoutScreen());

      CacheHelper.saveData(key: "token", value: signupModel?.data!.accessToken);
//eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VySWQiOiJlN2QxZTY2MS1hZjlkLTQ4NTUtYjMyZS1kYWMxYjMwYzMxZjEiLCJpYXQiOjE2NjEyOTk1ODIsImV4cCI6MTY2MTQ3MjM4Mn0.57oIiWBb-1mYXjoh4ehNRhKzlKb5tGAgg8nbOcr-5r0
      // print(loginModel?.data!.userData!.firstMame);
      // print(loginModel!.type);
      // print(loginModel!.data!.accessToken);
      Fluttertoast.showToast(
          msg: signupModel?.message,
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 2,
          backgroundColor: HexColor("#1ABC00"),
          textColor: Colors.white,
          fontSize: 16.0);
      emit(SignUpSuccessState(signupModel!));
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(SignUpErrorState(error.toString()));
    });
  }

  final GoogleSignIn googleSignIn = GoogleSignIn(
    scopes: [
      'email',
    ],
  );
  Future<void> signUpWithGoogle() async {
    try {
      GoogleSignInAccount? googleSignInAccount = await googleSignIn.signIn();
      userRegisterByGoogle(
        firstName: googleSignInAccount?.displayName,
        lastName: googleSignInAccount?.displayName,
        email: googleSignInAccount!.email,
        id: googleSignInAccount.id,
      );
    } catch (error) {
      print(error.toString());
    }
  }

  void userRegisterByGoogle({
    required String email,
    required String id,
    String? firstName,
    String? lastName,
    String picture =
        'https://res.cloudinary.com/lms07/image/upload/v1645954589/avatar/6214b94ad832b0549b436264_avatar1645954588291.png',
  }) {
    emit(RegisterByGoogleLoadingState());

    DioHelper.postData(url: REGISTER_GOOGLE, data: {
      'email': email,
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'picture': picture,
    }).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(RegisterByGoogleSuccessState(loginModel!));
    }).catchError((error) {
      if (error is DioError) {
        showToast(
            state: ToastStates.ERROR,
            text: error.response!.data!['message'].toString());
      }

      if (kDebugMode) {
        print(error.toString());
      }
      emit(RegisterByGoogleErrorState(error.toString()));
    });
  }
}
