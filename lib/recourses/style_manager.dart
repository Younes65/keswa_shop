

import 'package:flutter/material.dart' ;
import 'package:keswa/recourses/font_manager.dart';

TextStyle getTextStyle1(double fontSize , FontWeight fontWeight , Color color){
  return TextStyle(
    fontSize: fontSize ,
    fontWeight: fontWeight ,
    fontFamily: FontNames.fontFamily1,
    color: color
  );
}
TextStyle getTextStyle2(double fontSize , FontWeight fontWeight , Color color){
  return TextStyle(
      fontSize: fontSize ,
      fontWeight: fontWeight ,
      fontFamily: FontNames.fontFamily2,
      color: color
  );
}
TextStyle getRegularStyle({double fontSize = FontSize.s12 , required Color color}){
return getTextStyle1(fontSize,FontWeightManager.regular, color);

}
TextStyle getBoldStyle({double fontSize = FontSize.s12 , required Color color}){
  return getTextStyle1(fontSize,FontWeightManager.bold, color);

}
TextStyle getSemiBoldStyle({double fontSize = FontSize.s12 , required Color color}){
  return getTextStyle1(fontSize,FontWeightManager.semiBold, color);

}
TextStyle getMediumStyle({double fontSize = FontSize.s16 , required Color color}){
  return getTextStyle1(fontSize,FontWeightManager.medium, color);

}
TextStyle getBoldStyle2({double fontSize = FontSize.s12 , required Color color}){
  return getTextStyle2(fontSize,FontWeightManager.bold, color);

}
