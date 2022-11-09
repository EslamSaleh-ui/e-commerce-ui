import 'package:flutter/material.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Address.dart';

class two_addresses extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(builder:
                (BuildContext context, AsyncSnapshot<dynamic> data) {
              if(data.connectionState==ConnectionState.waiting || !data.hasData || data.hasError) {
                return const Text('');
              } List<dynamic> address=data.data as  List<dynamic>;
              for (var element in address) {
                Address a = Address.fromMap(element);
                if(a.id!=1) {
                  continue;
                }
                return Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:     [
                Expanded(child:   ListTile(
                    leading: Container(
                              decoration: BoxDecoration(color:Colors.grey,
                                  borderRadius:BorderRadius.circular(10) ),
                              height: (MediaQuery.of(context).size.height/15),
                              width:MediaQuery.of(context).size.width/10
                          ),
                              title:const Text('Home Address'),subtitle:Text(a.home_address,maxLines: 2,) )

                ) ,  Expanded(child:   ListTile(
                          leading: Container(
                              decoration: BoxDecoration(color:Colors.grey,
                                  borderRadius:BorderRadius.circular(10) ),
                              height: (MediaQuery.of(context).size.height/15),
                              width:MediaQuery.of(context).size.width/10
                          ),
                          title:const Text('office Address'),subtitle:Text(a.office_address,maxLines: 2,) )

                      )  ]); }
              return null;
            },
                future:get_x.get_Data('db') );
  }
}
