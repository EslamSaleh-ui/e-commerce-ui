// ignore_for_file: non_constant_identifier_names, camel_case_types
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:task/constant/constants.dart';
import 'package:task/models/Prouct.dart';

class getx extends GetxController{

  final total=0.obs;
  final carts=[].obs;
  Future<List<dynamic>> get_Data(String file) async {
    final response = await http.get(Uri.parse("https://raw.githubusercontent.com/eslamsalehtaha/mock/main/$file.json"));
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to fetch data');
    } }
  void add_favourites(String id,String value,int query)async
  {   final result=   await manager.get(id,queryParams:{'page':query});
  if(result==null) {
    await  manager.add(id,value,queryParams:{'page': query});
  }else {
    await  manager.remove(id,queryParams:{'page': query});
  }
  }
  Future<String> found_favourite(String id,int query)
  async {final result=   await manager.get(id,queryParams:{'page':query});
    if(result==null) {
    return 'no';
  } else {
    return 'yes';
  } }
  Future<String> add_cart(Product value)async
  {
    final result=   await manager.get('key',queryParams:{'page':value.id});
    if(result==null) {
      await  manager.add('key',{'id':value.id,'name':value.name,'price':value.price,'category':value.category,
        'color':value.color,'quantity':value.quantity},queryParams:{'page':value.id});
      total.value +=value.price;
      return 'Product added in cart';
    }
    return 'Product already in cart';
  }
  Future<void> remove_cart(Product value)async
  {
    await manager.remove('key',queryParams:{'page':value.id});

  }
  Future<void> count_product(Product value,int count)async
  {
      await  manager.add('count',{'count':count,'name':value.name},queryParams:{'page':value.id});
  }
  Future<int> get_count_product(Product value)async
  {
    final result=   await manager.get('count',queryParams:{'page':value.id});
      Map<String,dynamic> counter=result.value as Map<String,dynamic> ;
   return counter['count'];
  }
}