import 'package:la_vie/models/login_model.dart';
import 'package:la_vie/models/signup_model.dart';

abstract class LoginStates {}

class LoginInitialState extends LoginStates {}

class LoginLoadingState extends LoginStates {}

class LoginSuccessState extends LoginStates {
  final LoginModel loginModel;

  LoginSuccessState(this.loginModel);
}

class LoginErrorState extends LoginStates {
  dynamic error;

  LoginErrorState(this.error);
}

class LoginGoogleLoadingState extends LoginStates {}

class LoginGoogleSuccessState extends LoginStates {}

class LoginGoogleErrorState extends LoginStates {
  dynamic error;

  LoginGoogleErrorState(this.error);
}

class RegisterByGoogleLoadingState extends LoginStates {}

class RegisterByGoogleSuccessState extends LoginStates {
  final LoginModel loginModel;
  RegisterByGoogleSuccessState(this.loginModel);
}

class RegisterByGoogleErrorState extends LoginStates {
  final dynamic error;

  RegisterByGoogleErrorState(this.error);
}

class SignUpLoadingState extends LoginStates {}

class SignUpSuccessState extends LoginStates {
  final SignUpModel signupModel;

  SignUpSuccessState(this.signupModel);
}

class SignUpErrorState extends LoginStates {
  final dynamic error;

  SignUpErrorState(this.error);
}

class PasswordShow extends LoginStates {}

class PasswordShow2 extends LoginStates {}

class SuffixColorChange extends LoginStates {}
