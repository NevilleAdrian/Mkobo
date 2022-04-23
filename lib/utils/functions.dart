import 'package:flutter/material.dart';
import 'package:mkobo/utils/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';


String returnImage(String type){
  if(type == 'Fund Account'){
    return Assets.fund;
  } else if(type == 'Buy Airtime'){
    return Assets.airtime;
  } else {
    return Assets.bills;
  }
}

Widget transactionImage(String? type){
  if(type == 'debit'){
    return SvgPicture.asset(Assets.debit);
  } else if(type == 'credit'){
    return SvgPicture.asset(Assets.credit);
  } else {
    return Image.asset(Assets.netflix);
  }
}