import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/deals.dart';
import 'package:task/customs/offers.dart';
import 'package:task/customs/two_addresses.dart';
import 'package:task/models/Category.dart';

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
        ),
        FutureBuilder(
          future: get_x.get_Data('categories')
            ,builder: (context,data)
        {
          if(data.connectionState==ConnectionState.waiting || !data.hasData) {
            return Container();
          } else if(data.hasError) {
            return const Center(child: Text('Something went error'));}
          List<dynamic> category=data.data as  List<dynamic>;
          return SizedBox(
            height:(MediaQuery.of(context).size.height/15)+70,
              child: ListView(
                  scrollDirection: Axis.horizontal, children: category.map((e) {
                Category a = Category.fromMap(e);
                return   Padding(padding: const EdgeInsets.all(10),child:
           GestureDetector(
               onTap:(){
                 current_index.value=4;
                 category_type.value=a.name;
               } ,
               child: Column(
              children: [Container(
              decoration: BoxDecoration(color: HexColor('#${a.color}'),
                  borderRadius:BorderRadius.circular(15) ),
              height: (MediaQuery.of(context).size.height/15)+30,
              width:MediaQuery.of(context).size.width/5
          ),Text(a.name)  ]  )  ));
          }).toList()
            ));
        }
        ),
        const ListTile(title:Text('Deals of The Day',style: TextStyle(fontWeight: FontWeight.bold))),
        deals(),
        offers(),
        const Divider(height: 50,color: Colors.transparent)
      ]
      ))
    ); });
  }
}