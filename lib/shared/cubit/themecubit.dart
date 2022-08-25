// ignore_for_file: unnecessary_string_interpolations, prefer_const_constructors

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:la_vie/shared/cubit/themestates.dart';

import '../network/local/sharedpreference/sharedpreference.dart';

class ThemeCubit extends Cubit<ThemeStates> {
  ThemeCubit() : super(ThemeInitialState());

  static ThemeCubit get(context) => BlocProvider.of(context);

  //Theme Mode
  bool isDark = true;
  String? mode;
  void themeChange({
    bool? fromShared,
    String? mode,
  }) {
    if (fromShared != null) {
      isDark = fromShared;
      mode = "Light Mode";
      emit(ChangeThemeState());
      emit(ChangeTextThemeState());
    } else {
      isDark = !isDark;
      mode = "Dark Mode";
      CacheHelper.saveData(key: "isDark", value: isDark).then((value) {
        emit(ChangeThemeState());
        emit(ChangeTextThemeState());
      });
    }
  }
}
