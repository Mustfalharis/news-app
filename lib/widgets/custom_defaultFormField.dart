

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Widget defaultFromField({
  required TextEditingController controller,
  required TextInputType type,
  ValueChanged? onSubmit,
  ValueChanged? onChanged,
  GestureTapCallback? onTap,
  required FormFieldValidator validate,
  required String label,
  required IconData perfix,
  bool isPassword=false,
  IconButton? suffix,
  String? hintText,
  bool isClickable=true,

})=>TextFormField(
    controller: controller,
    keyboardType:type,
    obscureText : isPassword,
    onTap: onTap,
    enabled: isClickable,
    onFieldSubmitted:onSubmit ,
    onChanged: onChanged,
    validator: validate,

    decoration: InputDecoration(
      labelText: label,
      prefix: Icon(
        perfix,
      ),
      suffix: suffix,
      border: OutlineInputBorder(
      ),



    ),

  );