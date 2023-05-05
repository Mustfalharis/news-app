
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/cubit.dart';
import '../cubit/states.dart';
import '../widgets/custom_button.dart';
import '../widgets/custom_defaultFormField.dart';

class SearchScreen extends StatelessWidget {
  var searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, state) {},
        builder: (context, state) {
           var list=AppCubit.get(context).search;
           print(list.toString());
          return Scaffold(
            appBar: AppBar(

            ),
            body: Column(
              children:
              [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: defaultFromField(
                    onSubmit: (value)
                    {
                     AppCubit.get(context).getSearch(value: value);
                     print(value);
                    },
                    controller: searchController,
                    type: TextInputType.text,
                    validate: (var value) {
                      if (value.isEmpty) {
                        return 'search must not be empty';
                      }
                      return null;
                    },
                    label: 'Search',
                    perfix: Icons.search_rounded,
                  ),
                ),
                Expanded(child: articleBuilder(list, context)),
              ],
            ),
          );
        }
    );
  }
}
