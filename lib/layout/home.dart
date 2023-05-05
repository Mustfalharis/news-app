
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/newtork/dio_helper.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../models/serach.dart';
import '../widgets/custom_button.dart';

class HomeLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
        listener: (context , state)=>{},
        builder: (context , state)
        {
          var cubit=AppCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title:  Text(
              'News App',
            ),
            actions:
            [
            IconButton(onPressed:()
            {
              Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
                return SearchScreen();
              }
              )
              );

            },
            icon: Icon(Icons.search_rounded),

            ),
              IconButton(onPressed:()
              {
                 AppCubit.get(context).changeAppMode();
                 print(cubit.isDark);
              },
                icon: Icon(Icons.brightness_4_outlined),

              ),
            ],
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: cubit.current,
            onTap:(index)
            {
              cubit.changeIndex(index);
            },
            items:cubit.bottomItems,
          ),
          body: cubit.screens[cubit.current],
        );
        },
      );
  }
}
