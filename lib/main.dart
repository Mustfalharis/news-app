
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_app/layout/home.dart';
import 'package:news_app/newtork/dio_helper.dart';
import 'package:bloc/bloc.dart';
import 'package:news_app/widgets/custom_text_field.dart';
import 'package:hexcolor/hexcolor.dart';
import '../cubit/cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/states.dart';
import 'newtork/local/cache_helper.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
   Bloc.observer = MyBlocObserver();
    DioHelper.init();
  await CacheHelper.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:
      [
        BlocProvider(create: (context)=> AppCubit()..getScience()..getSports()..getBusiness(),),
        BlocProvider(create: (BuildContext context) =>AppCubit()..changeAppMode(
      ),),
      ],
        child: BlocConsumer<AppCubit,AppStates>(
        listener: (context, state){},
        builder:(context, state){
          return MaterialApp(
            debugShowCheckedModeBanner:false,
            theme: ThemeData(
              primarySwatch:Colors.deepOrange,
              floatingActionButtonTheme:FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ) ,
              scaffoldBackgroundColor: Colors.white,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor: Colors.white,
                  statusBarIconBrightness: Brightness.dark,
                ),
                backgroundColor: Colors.white,
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.black,
                ),

              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
                unselectedItemColor: Colors.grey,
                backgroundColor:Colors.white,
              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),


            ),
            darkTheme: ThemeData(
              scaffoldBackgroundColor: HexColor('333739'),
              primarySwatch:Colors.deepOrange,
              floatingActionButtonTheme:FloatingActionButtonThemeData(
                backgroundColor: Colors.deepOrange,
              ) ,
              appBarTheme: AppBarTheme(
                titleSpacing: 20,
                backwardsCompatibility: false,
                systemOverlayStyle: SystemUiOverlayStyle(
                  statusBarColor:  HexColor('333739'),
                  statusBarIconBrightness: Brightness.light,
                ),
                backgroundColor:  HexColor('333739'),
                elevation: 0,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
                iconTheme: IconThemeData(
                  color: Colors.white,
                ),

              ),
              bottomNavigationBarTheme:BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: Colors.deepOrange,
                elevation: 20,
                unselectedItemColor: Colors.grey,
                backgroundColor: HexColor('333739'),


              ),
              textTheme: TextTheme(
                bodyText1: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
            themeMode: AppCubit.get(context).isDark?ThemeMode.dark:ThemeMode.light,
            home: HomeLayout(),
          );
        },
      ),
    );
  }
}
