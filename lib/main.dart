import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:hexcolor/hexcolor.dart';
import 'package:task/constant/constants.dart';
import 'package:task/customs/address.dart';
import 'package:toast/toast.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(GetMaterialApp(
      theme: ThemeData.light(),
      debugShowCheckedModeBanner: false,home:  MyApp()));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    ToastContext().init(context);
    return Scaffold(
      body:Column(children:[
        Divider(height: MediaQuery.of(context).size.height/20,color: Colors.transparent),
         ListTile(
          leading:address() ,
           trailing: const Icon(Icons.circle_outlined,color: Colors.black87,size: 30)),
    Expanded(child:  Obx(() => list[current_index.value]))   ]),
        floatingActionButton:  FloatingActionButton(
          backgroundColor:HexColor('#d93e11') ,
          onPressed: ()async{
            await manager.removeByKey('key');
            get_x.total.value=0;
            Toast.show('Order Saved and InProgress',gravity: Toast.bottom,duration: Toast.lengthLong);
            current_index.value = 0;
          },

          child:Column(mainAxisAlignment: MainAxisAlignment.center,
              children: [Row(mainAxisAlignment: MainAxisAlignment.center,
                children: [const Icon(FontAwesomeIcons.dollarSign,color: Colors.white,size: 10),Obx(() => Text(get_x.total.toString()))],) ,
             Transform(alignment: Alignment.center,
                 transform:Matrix4.rotationY(math.pi),child:
            const Icon(Icons.shopping_cart_outlined))  ])  ,
        ),
        floatingActionButtonLocation:FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: AnimatedBottomNavigationBar.builder(
          backgroundColor:HexColor('#f4f9fa') ,
          activeIndex: current_index.value<4?current_index.value:0,
          gapLocation: GapLocation.center,
          notchSmoothness: NotchSmoothness.softEdge,
          onTap: (index) { current_index.value = index;}, itemCount:icons.length,
          tabBuilder: (int index, bool isActive) {
            return Obx(() =>Column(children: [ Icon(icons[index],color: current_index.value==index?HexColor('#d93e11'):Colors.grey.shade400), Text(text[index],style:TextStyle(color: current_index.value==index?HexColor('#d93e11'):Colors.grey.shade400  ))]  ));
          },
          //other params
        )
    );
  }
}

