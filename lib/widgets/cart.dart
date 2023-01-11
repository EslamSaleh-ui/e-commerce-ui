// ignore_for_file: unrelated_type_equality_checks, use_key_in_widget_constructors, camel_case_types
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/counter.dart';
import 'package:task/customs/product.dart';
import 'package:task/models/Prouct.dart';

class cart extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return    ResponsiveSizer(
        builder: (context, orientation, screenType) {
          return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            const Text('  Cart',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
            Expanded(child:
            FutureBuilder(
              future: get_x.get_Data('products')
              , builder: (context, data) {
            if (data.connectionState == ConnectionState.waiting || !data.hasData) {
              return const Center(child: CircularProgressIndicator());
            } else if (data.hasError) {
              return const Center(child: Text('Something went error'));
            }
            List<dynamic> products = data.data as List<dynamic>;
            return AnimationLimiter(child:ListView(
                scrollDirection: Axis.vertical, children: products.map((e)  {
              Product d=Product.fromMap(e);
              final price=d.price.obs;
              final viewed=true.obs;
              return   FutureBuilder(future:get_x.found_favourite('key',d.id),
                  builder: (c,da){
                    if(da.connectionState==ConnectionState.waiting || da.data=='no' ) {
                      return  Container();}
                    return   FutureBuilder(future:get_x.get_count_product(d),
    builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
    int registeredCounter=snapshot.data;
    final countTotal=registeredCounter.obs;
                  return    Dismissible(key: Key(e.toString()),onDismissed: (dir){
                      viewed.value=false;
                      get_x.remove_cart(d);
                      get_x.total.value= (get_x.total.value-(d.price*countTotal.value));
                    }, child: AnimationConfiguration.staggeredList(position: products.indexOf(e),
                        duration: const Duration(milliseconds: 500),
                        child: Obx(() => viewed.value? SlideAnimation(child:
                        FadeInAnimation(child:
                           Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              product(d: d),
                              SizedBox(width: 100-d.name.length.toDouble()),
                              counter(p: price,ct: countTotal,ds:d,rq: registeredCounter)
                            ] )       )) :Container())
    )         );
                    });
                  }             );
            }).toList()
            ) );
          }
          ))  ]);  });
  }}