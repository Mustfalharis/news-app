
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/models/settings.dart';
import '../models/business.dart';
import '../models/science.dart';
import '../models/serach.dart';
import '../models/sports.dart';
import '../newtork/dio_helper.dart';
import '../newtork/local/cache_helper.dart';
import '../widgets/custom_button.dart';
class AppCubit extends Cubit<AppStates>
{
  AppCubit() : super(NewsInitialState());
  static AppCubit get(contex)=> BlocProvider.of(contex);
  int current=0;
  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    // SettingsScreen(),
  ];
  List<BottomNavigationBarItem> bottomItems=
  [
    BottomNavigationBarItem(
      icon:Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon:Icon(Icons.science),
      label: 'Science',
    ),
    // BottomNavigationBarItem(
    //   icon:Icon(Icons.settings),
    //   label: 'Settings',
    // ),
  ];
  void changeIndex(int index)
  {
    current=index;
    if(index==1)
      getSports();
    if(index==2)
      getScience();
    emit(NewsBottomNavState());
  }

  List<dynamic>business=[];
  void getBusiness()
  {
    List<dynamic>business=[];
    emit(NewsGetBusinessLoadingState());
    DioHelper.getData(
      url: 'v2/top-headlines',
      query:{
        'country':'eg',
        'category':'business',
        'apiKey':'1aba3fac647d4ef6a15ad2ed0c755cbe',
      },
    ).then((value)
    {
      business=value.data['articles'];
      print(business.toString());
      emit(NewsGetBusinessStateSuccessState());
    }).catchError((error)
    {
      print('Error ${error.toString()}');
      emit(NewsGetSBusinessStateErrorState(error.toString()));
    });
  }

  List<dynamic>sports=[];
  void getSports()
  {
    emit(NewsGetSportsLoadingState());

    if(sports.length==0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'sports',
          'apiKey': '1aba3fac647d4ef6a15ad2ed0c755cbe',
        },
      ).then((value) {
        sports = value.data['articles'];
        print(sports.toString());
        emit(NewsGetSportsStateSuccessState());
      }).catchError((error) {
        print('Error ${error.toString()}');
        emit(NewsGetSportsStateErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetSportsStateSuccessState());
      }
  }

  List<dynamic>science=[];
  void getScience()
  {
    emit(NewsGetScienceLoadingState());
    if(science.length==0) {
      DioHelper.getData(
        url: 'v2/top-headlines',
        query: {
          'country': 'eg',
          'category': 'science',
          'apiKey': '1aba3fac647d4ef6a15ad2ed0c755cbe',
        },
      ).then((value) {
        science = value.data['articles'];
        print(science.toString());
        emit(NewsGetScienceStateSuccessState());
      }).catchError((error) {
        print('Error ${error.toString()}');
        emit(NewsGetScienceStateErrorState(error.toString()));
      });
    }
    else
      {
        emit(NewsGetScienceStateSuccessState());
      }
  }

  List<dynamic>search=[];
  void getSearch({String? value})
  {
    emit(NewsGetSearchLoadingState());
      DioHelper.getData(
          url: 'v2/everything',
          query: {
            'q': '$value',
            'apiKey': '1aba3fac647d4ef6a15ad2ed0c755cbe',
          }
      ).then((value) {
        search = value.data['articles'];
        print(search[0]['title']);
        emit(NewsGetSearchStateSuccessState());
      }).catchError((error) {
        print('Error ${error.toString()}');
        emit(NewsGetSearchStateErrorState(error.toString()));
      });
  }




  bool isDark=false;
  void changeAppMode({bool? fromSheer}) async
  {

      isDark = !isDark;
      await CacheHelper.putBoolean(value: isDark, key: 'isDark').then((value) {
        emit(AppChangeModeState());
      });



  }


}
