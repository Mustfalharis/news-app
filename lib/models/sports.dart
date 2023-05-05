
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:news_app/newtork/dio_helper.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custom_button.dart';

import '../cubit/states.dart';
class SportsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit,AppStates>(
      listener:(context , state){},
      builder: (context, state){
        List<dynamic>list=AppCubit.get(context).sports;
        print(list.length);
        return articleBuilder(list,context);
      },
    );
  }
}