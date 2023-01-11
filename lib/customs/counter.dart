// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:countnumberbutton/countnumberbutton.dart';
import 'package:flutter/material.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Prouct.dart';

class counter extends StatelessWidget{
  final p;
  final ct;
  final Product ds;
  final int rq;
  const counter({Key key,this.ct,this.p,this.ds,this.rq}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return   Expanded(
       child: CountNumberButton(
       minValue:1  ,maxValue: 100,
       iconColor: Colors.blue.shade800,
       icon_right: Icon(Icons.add,color: Colors.blue.shade800),
       icon_left: const Icon(Icons.remove) ,
       width: 100, height: 50, initValue:rq , iconSize: 20, onChanged: (value) async {
     p.value=ds.price*value;
     get_x.count_product(ds, value) ;
     get_x.total.value= (get_x.total.value-(ds.price*ct.value))+p.value;
     ct.value=value;
   },
       buttonColor:  Colors.blue.shade200, textsize: 20, textColor: Colors.black   ) );
  }
}