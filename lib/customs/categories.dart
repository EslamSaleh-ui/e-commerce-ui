import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Category.dart';

class category extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
return
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
  );
  }

}