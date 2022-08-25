abstract class AppStates {}

class AppInitialState extends AppStates {}

class AppBottomNavBarState extends AppStates {}

class AppBottomSheetState extends AppStates {}

class AppChangeThemeState extends AppStates {}

class ChangeFavState extends AppStates {}

//DataBase
class AppCreateDatabaseState extends AppStates {}

class AppInsertDatabaseState extends AppStates {}

class AppUpdateDatabaseState extends AppStates {}

class AppDeleteDatabaseState extends AppStates {}

//Api Articles
class AppGetArticlesState extends AppStates {}

class AppGetArticlesErrorState extends AppStates {
  final String error;

  AppGetArticlesErrorState(this.error);
}

class AppGetArticlesLoadingState extends AppStates {}

//Api Sports
class AppGetArticlesSportsState extends AppStates {}

class AppGetArticlesSportsLoadingState extends AppStates {}

class AppGetArticlesSportsErrorState extends AppStates {
  final String error;

  AppGetArticlesSportsErrorState(this.error);
}

//Api Business
class AppGetArticlesBusinessState extends AppStates {}

class AppGetArticlesBusinessLoadingState extends AppStates {}

class AppGetArticlesBusinessErrorState extends AppStates {
  final String error;

  AppGetArticlesBusinessErrorState(this.error);
}

//Api Business
class AppGetArticlesUSBusinessState extends AppStates {}

class AppGetArticlesUSBusinessLoadingState extends AppStates {}

class AppGetArticlesUSBusinessErrorState extends AppStates {
  final String error;

  AppGetArticlesUSBusinessErrorState(this.error);
}

//Api Science
class AppGetArticlesScienceState extends AppStates {}

class AppGetArticlesScienceLoadingState extends AppStates {}

class AppGetArticlesScienceErrorState extends AppStates {
  final String error;

  AppGetArticlesScienceErrorState(this.error);
}

//Api Search
class AppGetSearchState extends AppStates {}

class AppGetSearchLoadingState extends AppStates {}

class AppGetSearchErrorState extends AppStates {
  final String error;

  AppGetSearchErrorState(this.error);
}
