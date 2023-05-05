
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/models/web_view.dart';

import '../cubit/cubit.dart';
import '../cubit/states.dart';
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


class CustomButton extends StatelessWidget {
   CustomButton({ required this.text,this.onTap});

  String? text;
  VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return  GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            text!,
            style: TextStyle(
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
Widget buildArticleItem(article,context)
{
return InkWell(
  onTap:()
  {
    print({article['url']});
    Navigator.push(context, MaterialPageRoute(builder: (BuildContext) {
      return WebScreen(article['url']);
    }
    )
    );
  },
  child:   Padding(

    padding: const EdgeInsets.all(20.0),

    child: Row(

        children:

        [

          Container(

            width: 120,

            height: 120,

            decoration: BoxDecoration(

              borderRadius: BorderRadius.circular(10),

              image: DecorationImage(

                image: NetworkImage('${article['urlToImage']}'),

                fit: BoxFit.cover,

              ),

            ),

          ),

          SizedBox(width: 20,),

          Expanded(

            child: Container(

              height: 120,

              child: Column(

                crossAxisAlignment:CrossAxisAlignment.start,

                mainAxisAlignment: MainAxisAlignment.start,

                children: [

                  Expanded(

                    child: Text(

                      '${article['title']}',

                      overflow: TextOverflow.ellipsis,

                      maxLines: 4,

                      style:Theme.of(context).textTheme.bodyText1,

                    ),

                  ),

                  Text(

                    '${article['publishedAt']}',

                    style: TextStyle(

                        color: Colors.grey

                    ),

                  ),



                ],

              ),

            ),

          ),

        ]

    ),

  ),
);
}


Widget articleBuilder(list,context)=>list.length>0? ListView.separated(
  physics: BouncingScrollPhysics(),
  itemBuilder: (context,index)=>buildArticleItem(list[index],context),
  separatorBuilder:(context, index)=> myDivider(),
  itemCount: list.length,
):Center(child: CircularProgressIndicator());


Widget myDivider()=>Padding(
  padding: const EdgeInsetsDirectional.only(start: 20),
  child: Container(
    width: double.infinity,
    height: 1.0,
    color: Colors.white,
  ),
);



