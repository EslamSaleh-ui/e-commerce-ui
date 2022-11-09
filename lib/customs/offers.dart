// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constant/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/models/Offer.dart';

class offers extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: get_x.get_Data('offers')
        , builder: (context, data) {
      if (data.connectionState == ConnectionState.waiting || !data.hasData) {
        return Container();
      } else if (data.hasError) {
        return const Center(child: Text('Something went error'));
      }
      List<dynamic> deal = data.data as List<dynamic>;
      return  SingleChildScrollView(child:
          Column(
              children: deal.map((e)  {
            Offer d=Offer.fromMap(e);
            return Container(padding: const EdgeInsets.all(15),
                    height:MediaQuery.of(context).size.height/3,
                width:MediaQuery.of(context).size.width -30,
                decoration: BoxDecoration(color:HexColor('#fec8bd'),
                borderRadius: BorderRadius.circular(25)),
                child: Row(
                children:[
                 Container(
                      decoration: BoxDecoration(color: Colors.transparent,
                          borderRadius: BorderRadius.circular(15)),
                      height: (MediaQuery.of(context).size.height / 15) + 40,
                      width: MediaQuery.of(context).size.width / 5
                  ),Padding(padding: const EdgeInsets.all(5),child:
                  Column(crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:[
                        Column( crossAxisAlignment: CrossAxisAlignment.start,
                            children: [  Text(d.offer.toString().split(' ').first,style:  TextStyle(fontWeight: FontWeight.bold,color:Colors.red.shade800 )),
                          Text(d.offer.toString().split(' ').last,style:  TextStyle(fontWeight: FontWeight.bold,color:Colors.blue.shade900,fontSize:
                          MediaQuery.of(context).size.height<MediaQuery.of(context).size.width?  MediaQuery.of(context).size.height/15:MediaQuery.of(context).size.width/8
                          ))
                              ]),
                         Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Text('${d.offer_price.toString()}       ',style:const TextStyle(color:Colors.red)),Text(d.price.toString(),style:const TextStyle(color:Colors.white,decoration: TextDecoration. lineThrough)),
                          ]),  Text('. available until ${d.end_date.split('/').last}',style:const TextStyle(color: Colors.white))
                      ])
                  )]  )
                );
          }).toList()
          )    );
    }
    );
  }}