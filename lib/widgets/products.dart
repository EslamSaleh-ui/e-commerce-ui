// ignore_for_file: unrelated_type_equality_checks
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/models/Prouct.dart';
import 'package:toast/toast.dart';

class products extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return    ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return FutureBuilder(
              future: get_x.get_Data('products')
              , builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting || !data.hasData) {
              return Container();
            } else if (data.hasError) {
              return const Center(child: Text('Something went error'));
            }
            List<dynamic> deal = data.data as List<dynamic>;
            return   ListView(
                    scrollDirection: Axis.vertical, children: deal.map((e)  {
                  Product d=Product.fromMap(e);
                  if(category_type.value !='All' && category_type.value !=d.category) {
                    return Container();
                  }else if((category_type.value ==d.category && category_type.value !='All' )|| category_type.value =='All') {
                    return  GestureDetector(onTap: () async {
                         String resultof_add=await  get_x.add_cart(d);
                           Toast.show(resultof_add,gravity: Toast.bottom,duration: Toast.lengthLong);
                      },child:
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
                              children:[Text(d.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                               Text(d.quantity,style:const TextStyle(color:Colors.grey))
                                ,  Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Text(d.price.toString(),style:const TextStyle(color:Colors.red))
                                ])
                              ])
                          )]  ))       );
                  }

                }).toList()
                );
          }
          );  });
  }}