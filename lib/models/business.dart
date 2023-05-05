
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

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
   return BlocConsumer<AppCubit,AppStates>(
     listener:(context , state){},
     builder: (context, state){
       List<dynamic>list=AppCubit.get(context).business;
       print(list.toString());
       return  articleBuilder(list,context);
     },
   );
  }
}
