// ignore_for_file: unrelated_type_equality_checks
import 'package:countnumberbutton/countnumberbutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:task/models/Prouct.dart';

class cart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return    ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const Text('  cart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            Expanded(child:
            FutureBuilder(
              future: get_x.get_Data('products')
              , builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting || !data.hasData) {
              return Container();
            } else if (data.hasError) {
              return const Center(child: Text('Something went error'));
            }
            List<dynamic> product = data.data as List<dynamic>;
            return ListView(
                scrollDirection: Axis.vertical, children: product.map((e)  {
              Product d=Product.fromMap(e);
              final price=d.price.obs;
              final count_total=1.obs;
              return   FutureBuilder(future:get_x.found_favourite('key',d.id),
                  builder: (c,data){
                    if(data.connectionState==ConnectionState.waiting || data.data=='no' ) {
                      return  Container();  }
                    return Padding(padding: EdgeInsets.all(10),child: Row(crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween
                        ,children: [

                          Container(
                              decoration: BoxDecoration(color: HexColor('#${d.color}'),
                                  borderRadius: BorderRadius.circular(10)),
                              height: (MediaQuery.of(context).size.height / 15) + 50,
                              width: MediaQuery.of(context).size.width / 5
                          ),
                          Padding(padding: const EdgeInsets.all(5),child:
                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children:[ Text(d.name,style: const TextStyle(fontWeight: FontWeight.bold),),
                                Text(d.quantity),
                                Row(children: [const Icon(FontAwesomeIcons.dollarSign,size: 10,color:Colors.red),Obx(() => Text(price.value.toString(),style:const TextStyle(color:Colors.red)))
                                ])
                              ])
                          ),Container(width: (MediaQuery.of(context).size.width/4)-d.name.length),
                          Expanded(
                              child:CountNumberButton(
                                minValue: 1,maxValue: 100,
                                iconColor: Colors.blue.shade800,
                                icon_right: Icon(Icons.add,color: Colors.blue.shade800),
                                icon_left: const Icon(Icons.remove) ,
                                width: 100, height: 50, initValue: count_total.value, iconSize: 20, onChanged: (value) {
                                price.value=d.price*value;
                                get_x.total.value= (get_x.total.value-(d.price*count_total.value))+price.value;
                                count_total.value=value;
                              },
                                buttonColor:  Colors.blue.shade200, textsize: 20, textColor: Colors.black,))

                        ]));
                  }             );
            }).toList()
            )  ;
          }
          ))]);  });
  }}