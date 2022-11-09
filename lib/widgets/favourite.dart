// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/models/Deal.dart';

class favourite extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return    ResponsiveSizer(
        builder: (context, orientation, screenType) {
      return FutureBuilder(
        future: get_x.get_Data('deals')
        , builder: (context, data) {
      if (data.connectionState == ConnectionState.waiting || !data.hasData) {
        return Container();
      } else if (data.hasError) {
        return const Center(child: Text('Something went error'));
      }
      List<dynamic> deal = data.data as List<dynamic>;
      return   ListView(
              scrollDirection: Axis.vertical, children: deal.map((e)  {
            Deal d=Deal.fromMap(e);
            return   FutureBuilder(future:get_x.found_favourite('1',d.id),
                builder: (c,data){
                  if(data.connectionState==ConnectionState.waiting || data.data=='no' ) {
                   return  Container();  }
                 return   Padding(padding: const EdgeInsets.all(10),child:
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
                       children:[Text(d.deal.split('/').first,style: const TextStyle(fontWeight: FontWeight.bold),),
                         Text(d.deal.split('/').last),
                         Row(children: [const Icon(Icons.location_on,color:Colors.grey),Text(d.distance,style:const TextStyle(color:Colors.grey))],)
                         ,  Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Text('${d.deal_price.toString()}       ',style:const TextStyle(color:Colors.red)),Text(d.price.toString(),style:const TextStyle(color:Colors.grey,decoration: TextDecoration. lineThrough)),
                         ])
                       ])
                   )]  ));
                }             );
          }).toList()
          )  ;
    }
    );  });
  }}