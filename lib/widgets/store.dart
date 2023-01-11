// ignore_for_file: use_key_in_widget_constructors, camel_case_types

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/deals.dart';
import 'package:task/customs/offers.dart';
import 'package:task/customs/two_addresses.dart';
import 'package:task/customs/categories.dart';

class store extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return  ResponsiveSizer(
        builder: (context, orientation, screenType) {
      return Scaffold(
      body: SingleChildScrollView(child: Column(children:[
          Padding(padding: const EdgeInsets.all(15),child:TextFormField(
              keyboardType: TextInputType.text,
              style:const TextStyle(fontSize: 25,color: Colors.black) ,
              onFieldSubmitted: (text){},
              decoration: InputDecoration(hintText :'  Search in thousands of products',
                  filled: true,
                  fillColor: Colors.grey.shade300,
                  contentPadding: const EdgeInsets.all(9),
                  hintStyle:const TextStyle(fontSize: 15,color: Colors.black) ,
                  prefixIcon: IconButton(icon:const Icon(Icons.search,color: Colors.black),onPressed:(){}),
                  enabledBorder:OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.transparent),borderRadius: BorderRadius.circular(15)),
                  focusedBorder: OutlineInputBorder(borderSide:const BorderSide(width: 1,color: Colors.transparent),borderRadius: BorderRadius.circular(15)))
          )),two_addresses(),
        ListTile(title: const Text('Explored by Category',style:TextStyle(fontWeight: FontWeight.bold)),
            trailing:FutureBuilder(builder:
            (BuildContext context, AsyncSnapshot<dynamic> data) {
              if(data.connectionState==ConnectionState.waiting || !data.hasData || data.hasError) {
              return const Text('');
            } List<dynamic> product=data.data as  List<dynamic>;
              return TextButton(onPressed:(){current_index.value=4;
                          category_type.value='All';
                }, child: Text('See All (${product.length})',style: TextStyle(color: Colors.grey.shade500)));  },
        future:get_x.get_Data('products') )
        ),category(),
        const ListTile(title:Text('Deals of The Day',style: TextStyle(fontWeight: FontWeight.bold))),
        deals(),
         offers(),
        const Divider(height: 50,color: Colors.transparent)
      ]
      ))
    ); });
  }
}