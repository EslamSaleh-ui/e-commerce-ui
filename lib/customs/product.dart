// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/models/Prouct.dart';

class product extends StatelessWidget{
  final Product d;
  final Function f;
  const product({Key key,this.d,this.f}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: f??(){},child:
    Padding(padding: const EdgeInsets.all(10),child:
    Row(children:[
      Container(
          decoration: BoxDecoration(color: HexColor('#${d.color}'),
              borderRadius: BorderRadius.circular(15)),
          height: (MediaQuery.of(context).size.height / 15) + 40,
          width: MediaQuery.of(context).size.width / 5
      )
      ,Padding(padding: const EdgeInsets.all(5),child:
      Column(crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children:[Text(d.name,style: const TextStyle(fontWeight: FontWeight.bold),maxLines: 1),
            Text(d.quantity,style:const TextStyle(color:Colors.grey,),maxLines: 1,)
            ,  Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Text(d.price.toString(),style:const TextStyle(color:Colors.red),maxLines: 1,)
            ])
          ])
      )]  ))       );
  }

}