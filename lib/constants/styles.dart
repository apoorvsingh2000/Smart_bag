import 'package:flutter/material.dart';
import 'constants.dart';

//Styles
ButtonStyle kTextButtonStyle (BuildContext context) => TextButton.styleFrom(backgroundColor: Colors.blue, padding: EdgeInsets.all(kScreenWidth(context)*0.03),);

InputDecoration kTextFieldDecoration (String text) => InputDecoration(
  labelText: text,
  contentPadding: const EdgeInsets.all(8.0),
  errorBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  focusedBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
  enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(12.0),
  ),
);
