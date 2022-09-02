
import 'package:flutter/material.dart';
import 'package:stripe_utility/res/sizes.dart';
import 'package:stripe_utility/res/styles.dart';


import 'assets.dart';
import 'colors.dart';
import 'constants.dart';


Assets ?assets;
AppColors ?colors;
Constants ?constant;
AppSizes sizes = AppSizes();
Styles ?textStyles;

void initializeAppResources({@required context}) {
  sizes.initializeSize(context);
  assets = Assets();
  colors = AppColors();
  constant = Constants();
  textStyles = Styles();
}