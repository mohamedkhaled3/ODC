// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/models/allproduct_Model.dart';
import 'package:la_vie/models/plants_model.dart';
import 'package:la_vie/models/post_model.dart';
import 'package:la_vie/models/seed_model.dart';
import 'package:la_vie/models/tools_model.dart';
import 'package:la_vie/models/user_model.dart';
import 'package:la_vie/modules/blogs/blogs.dart';
import 'package:la_vie/modules/home/homescreen.dart';
import 'package:la_vie/modules/notification/notificationScreen.dart';
import 'package:la_vie/modules/profile/profilescreen.dart';
import 'package:la_vie/modules/qr/qrScreen.dart';
import 'package:la_vie/shared/components/constant.dart';
import 'package:la_vie/shared/cubit/appCubit/states.dart';
import 'package:la_vie/shared/network/local/sharedpreference/sharedpreference.dart';
import 'package:la_vie/shared/network/remote/dio_Helper/dio_Helper.dart';
import 'package:la_vie/shared/network/remote/end_points.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);

//part of BottomNavigation Bar
  int currentIndex = 2;
  var navigation = GlobalKey<CurvedNavigationBarState>();

  List<Widget> screens = [
    BlogsScreen(),
    QrScreen(),
    HomeScreen(),
    NotificationScreen(),
    ProfileScreen()
  ];

  void bottomNav(int index) {
    currentIndex = index;
    emit(AppBottomNavBarState());
  }

  // String token = CacheHelper.get(key: "token");

  CurrentUserModel? userCurrentModel;

  void getUserData() {
    emit(UserGetDataLoading());
    DioHelper.getData(
      url: CRRENTUSER,
      token: token,
    ).then((value) {
      userCurrentModel = CurrentUserModel.fromJson(value.data);
      CacheHelper.saveData(
          key: "userId", value: userCurrentModel?.data!.userId);
      CacheHelper.saveData(
          key: "firstName", value: userCurrentModel?.data!.firstName);
      CacheHelper.saveData(
          key: "lastName", value: userCurrentModel?.data!.lastName);
      CacheHelper.saveData(key: "email", value: userCurrentModel?.data!.email);
      CacheHelper.saveData(
          key: "imageUrl", value: userCurrentModel?.data!.imageUrl);
      CacheHelper.saveData(key: "role", value: userCurrentModel?.data!.role);

      emit(UserGetDataSuccess());
    }).catchError((error) {
      emit(UserGetDataError(error.toString()));
    });
  }

  void updateUserData({required String key, required dynamic value}) {
    emit(UpdateUserDataLoading());
    DioHelper.patchData(url: UPDATEUSER, data: {key: value}, token: token!)
        .then((value) {
      emit(UpdateUserDataSuccess());
    }).catchError((error) {
      emit(UpdateUserDataError(error));
    });
  }

  SeedModel? seedModel;
  void getDataSeeds() {
    emit(SeedsGetDataLoading());

    DioHelper.getData(
      url: SEEDS,
      token: token,
    ).then((value) {
      seedModel = SeedModel.fromJson(value.data);

      emit(SeedsGetDataSuccess());
    }).catchError((error) {
      emit(UpdateUserDataError(error));
    });
  }

  PlantsModel? plantModel;
  void getDataPlants() {
    emit(PlantsGetDataLoading());

    DioHelper.getData(
      url: PLANTS,
      token: token,
    ).then((value) {
      plantModel = PlantsModel.fromJson(value.data);
      emit(PlantsGetDataSuccess());
    }).catchError((error) {
      emit(PlantsGetDataError(error));
    });
  }

  ToolsModel? toolsModel;
  void getDataTools() {
    emit(ToolsGetDataLoading());

    DioHelper.getData(
      url: TOOLS,
      token: token,
    ).then((value) {
      toolsModel = ToolsModel.fromJson(value.data);
      emit(ToolsGetDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ToolsGetDataError(error));
    });
  }

  MyPostsModel? myPostsModel;
  void getMyPosts(String token) {
    emit(LoadingGetMyPostsState());
    DioHelper.getData(
      url: MY_POSTS,
      token: token,
    ).then((value) {
      myPostsModel = MyPostsModel.fromJson(value.data);
      emit(SuccessGetMyPostsState());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(ErrorGetMyPostsState(error.toString()));
    });
  }

  AllProducts? allProducts;
  void getDataAllProducts() {
    emit(AllProductsGetDataLoading());

    DioHelper.getData(
      url: ALLPRODUCTS,
      token: token,
    ).then((value) {
      if (kDebugMode) {
        print(value.data);
      }
      // seedModel = SeedModel.fromJson(value.data);
      allProducts = AllProducts.fromJson(value.data);
      emit(AllProductsGetDataSuccess());
    }).catchError((error) {
      if (kDebugMode) {
        print(error.toString());
      }
      emit(AllProductsGetDataError(error));
    });
  }
}
