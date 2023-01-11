// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Deal.dart';

class deal extends StatelessWidget{
  final Deal deal_;
  final bool f_;
  const deal({Key key,this.deal_,this.f_}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return  Padding(padding: const EdgeInsets.all(10),child:
    Row(
        children:[
          Stack(children: [Container(
              decoration: BoxDecoration(color: HexColor('#${deal_.color}'),
                  borderRadius: BorderRadius.circular(15)),
              height: (MediaQuery.of(context).size.height / 15) + 70,
              width: MediaQuery.of(context).size.width / 5+30
          ),Align(alignment: Alignment.topLeft,child:
          FutureBuilder(future:get_x.found_favourite('1',deal_.id),
              builder: (c,data){
                final boolean=false.obs;
                if(data.connectionState==ConnectionState.waiting ) {
                  const Text('');  }
                if(data.data=='no') {
                  boolean.value=false;
                } else {
                  boolean.value=true;
                } return f_?IconButton(icon:
                Obx(() =>boolean.value==true? const Icon(Icons.favorite,color: Colors.red)
                    :const Icon(Icons.favorite,color: Colors.white)),
                    onPressed:(){
                      get_x.add_favourites('1',deal_.deal, deal_.id);
                      if(boolean.value==true) {
                        boolean.value=false;
                      } else {
                        boolean.value=true;
                      }
                    }):const Text('');
                // const Icon(Icons.favorite_border,color: Colors.black) ;
              }             )   )
          ]) ,Padding(padding: const EdgeInsets.all(5),child:
          Column(crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children:[Text(deal_.deal.split('/').first,style: const TextStyle(fontWeight: FontWeight.bold),),
                Text(deal_.deal.split('/').last),
                Row(children: [const Icon(Icons.location_on,color:Colors.grey),Text(deal_.distance,style:const TextStyle(color:Colors.grey))],)
                ,  Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Text('${deal_.deal_price.toString()}       ',style:const TextStyle(color:Colors.red)),Text(deal_.price.toString(),style:const TextStyle(color:Colors.grey,decoration: TextDecoration. lineThrough)),
                ])
              ])
          )]  ));

  }
}