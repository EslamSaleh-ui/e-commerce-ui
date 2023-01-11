// ignore_for_file: unrelated_type_equality_checks, camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/product.dart';
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
            if (data.connectionState == ConnectionState.waiting ) {
              return const Center(child:CircularProgressIndicator());
            } else if (data.hasError) {
              return const Center(child: Text('Something went error'));
            }
            else if(!data.hasData) {
              return const Center(child: Text('No Data Found'));}
            List<dynamic> deal = data.data as List<dynamic>;
            return  AnimationLimiter(child:
            ListView(
                    scrollDirection: Axis.vertical,
                children: deal.map((e)  {
                  Product d=Product.fromMap(e);
                  if(category_type.value !='All' && category_type.value !=d.category) {
                    return Container();
                  }else if((category_type.value ==d.category && category_type.value !='All' )|| category_type.value =='All') {
                    return    AnimationConfiguration.staggeredList(position: deal.indexOf(e),
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(child: FadeInAnimation(child: product(d:d,f: () async {
                      String resultAdd = await get_x.add_cart(d);
                      get_x.count_product(d, 1);
                      Toast.show(resultAdd, gravity: Toast.bottom,
                          duration: Toast.lengthLong);
                    } ))
                        ) );
                  }
                }).toList()

            ));
          }
          );  });
  }}