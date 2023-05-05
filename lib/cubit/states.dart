abstract class AppStates{}

class NewsInitialState extends AppStates{}

class NewsBottomNavState extends AppStates{}


class NewsGetBusinessLoadingState extends AppStates{}
class NewsGetBusinessStateSuccessState extends AppStates {}

class NewsGetSBusinessStateErrorState extends AppStates
{
final String error;
NewsGetSBusinessStateErrorState(this.error);
}


class NewsGetSportsLoadingState extends AppStates{}
class NewsGetSportsStateSuccessState extends AppStates {}
class NewsGetSportsStateErrorState extends AppStates
{
  final String error;
  NewsGetSportsStateErrorState(this.error);
}

class NewsGetScienceLoadingState extends AppStates{}
class NewsGetScienceStateSuccessState extends AppStates {}
class NewsGetScienceStateErrorState extends AppStates
{
  final String error;
  NewsGetScienceStateErrorState(this.error);
}
class AppChangeModeState extends AppStates {}


class NewsGetSearchLoadingState extends AppStates{}
class NewsGetSearchStateSuccessState extends AppStates {}
class NewsGetSearchStateErrorState extends AppStates
{
  final String error;
  NewsGetSearchStateErrorState(this.error);
}



