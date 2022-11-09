// ignore_for_file: non_constant_identifier_names

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:task/widgets/cart.dart';
import 'package:task/widgets/favourite.dart';
import 'package:task/widgets/news.dart';
import 'package:task/widgets/products.dart';
import 'package:data_cache_manager/data_cache_manager.dart';
import 'package:task/widgets/store.dart';
import 'package:task/getx/getx.dart';

final category_type=''.obs;
final current_index=0.obs;
final getx  get_x=Get.put(getx());
final DataCacheManager manager = DefaultDataCacheManager.instance;
List<Widget> list=[store(),news(),favourite(),cart(),products()];
List<String> text=['Grocery','News','Favourites','Cart'];
List<IconData> icons=[Icons.store,Icons.notifications_none,Icons.favorite_border,FontAwesomeIcons.wallet];
