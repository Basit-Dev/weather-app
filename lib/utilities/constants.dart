import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const kTempTextStyle = TextStyle(
  fontFamily: 'Typold',
  fontWeight: FontWeight.bold,
  fontSize: 100.0,
);

const kMessageTextStyle = TextStyle(
  fontFamily: 'Typold Extended',
  fontSize: 52.0,
);

const kButtonTextStyle = TextStyle(
  fontSize: 30.0,
  fontFamily: 'Typold Extended',
);

const kConditionTextStyle = TextStyle(
  fontSize: 85.0,
);

const kInputDecoration = InputDecoration(
  contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 8.0),
  border: OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(6.0),
      ),
      borderSide: BorderSide.none),
  hintText: 'Enter City Name',
  hintStyle: TextStyle(color: Colors.grey, fontFamily: 'Typold Extended', fontSize: 20.0),
  filled: true,
  fillColor: Colors.white,
);
