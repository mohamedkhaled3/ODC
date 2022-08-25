abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppBottomSheetState extends AppStates {}

class UserGetDataLoading extends AppStates {}

class UserGetDataSuccess extends AppStates {}

class UserGetDataError extends AppStates {
  final dynamic error;

  UserGetDataError(this.error);
}

class UpdateUserDataLoading extends AppStates {}

class UpdateUserDataSuccess extends AppStates {}

class UpdateUserDataError extends AppStates {
  final dynamic error;

  UpdateUserDataError(this.error);
}

class SeedsGetDataLoading extends AppStates {}

class SeedsGetDataSuccess extends AppStates {}

class SeedsGetDataError extends AppStates {
  final dynamic error;

  SeedsGetDataError(this.error);
}

class ToolsGetDataLoading extends AppStates {}

class ToolsGetDataSuccess extends AppStates {}

class ToolsGetDataError extends AppStates {
  final dynamic error;

  ToolsGetDataError(this.error);
}

class PlantsGetDataLoading extends AppStates {}

class PlantsGetDataSuccess extends AppStates {}

class PlantsGetDataError extends AppStates {
  final dynamic error;

  PlantsGetDataError(this.error);
}

class LoadingGetMyPostsState extends AppStates {}

class SuccessGetMyPostsState extends AppStates {}

class ErrorGetMyPostsState extends AppStates {
  String? error;

  ErrorGetMyPostsState(
    this.error,
  );
}

class AllProductsGetDataLoading extends AppStates {}

class AllProductsGetDataSuccess extends AppStates {}

class AllProductsGetDataError extends AppStates {
  final dynamic error;

  AllProductsGetDataError(this.error);
}
