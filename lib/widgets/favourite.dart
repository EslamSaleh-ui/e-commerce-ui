// ignore_for_file: unrelated_type_equality_checks, camel_case_types, use_key_in_widget_constructors
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/deal.dart';
import 'package:task/models/Deal.dart';

class favourite extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return    ResponsiveSizer(
        builder: (context, orientation, screenType) {
      return FutureBuilder(
        future: get_x.get_Data('deals')
        , builder: (context, data) {
      if (data.connectionState == ConnectionState.waiting ) {
        return const Center(child: CircularProgressIndicator());
      } else if(!data.hasData) {
        return const Center(child: Text('No Favourites Found'));
      } else if (data.hasError) {
        return const Center(child: Text('Something went error'));
      }
      List<dynamic> dealed = data.data as List<dynamic>;
      return  AnimationLimiter(child:  ListView(
              scrollDirection: Axis.vertical,
          children: dealed.map((e)  {
            Deal d=Deal.fromMap(e);
            return  AnimationConfiguration.staggeredList(position: dealed.indexOf(e),
                duration: const Duration(milliseconds: 500),
                child: SlideAnimation(child:
                FutureBuilder(future:get_x.found_favourite('1',d.id),
                builder: (c,data){
                  if(data.connectionState==ConnectionState.waiting || data.data=='no' ) {
                   return  Container();  }
                 return FadeInAnimation(child:  deal(deal_: d,f_: false));
                }            ) ));
          }).toList()
          ) );
    }
    );  });
  }}