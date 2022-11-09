import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Address.dart';

class address extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return  Container(
      clipBehavior: Clip.none,
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height,
          minHeight: 40
        ),
        decoration:   BoxDecoration(
            color: HexColor('#ee6a61'),
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(100),topRight: Radius.circular(200),
              bottomLeft:Radius.circular(100),bottomRight: Radius.circular(50) )),
        width: 200,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:    [const Icon(Icons.location_on_outlined,color: Colors.white),
              FutureBuilder(builder:
                  (BuildContext context, AsyncSnapshot<dynamic> data) {
                if(data.connectionState==ConnectionState.waiting || !data.hasData || data.hasError) {
                  return const Text('');
                } List<dynamic> address=data.data as  List<dynamic>;
                for (var element in address) {
                  Address a = Address.fromMap(element);
                  if(a.id!=1) {
                    continue;
                  }
                  return Expanded(child: Text(a.home_address,maxLines: 1,
                    style: const TextStyle(fontSize: 20,color: Colors.white))); }
                return null;
                 },
                  future:get_x.get_Data('db') )
              ]  ),);
  }
}
