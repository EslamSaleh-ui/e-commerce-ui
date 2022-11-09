// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Product
{
  int id;
  String  name ,category,color,quantity;
  int price;
  Product(dynamic obj)
  {id=obj['id'];
  category=obj['category'];
  name=obj['name'];
  price=obj['price'];
  quantity=obj['quantity'];
  color=obj['color'];
  }
  Product.fromMap(Map<String,dynamic> data)
  {
    id=data['id'];
    category=data['category'];
    name=data['name'];
    price=data['price'];
    quantity=data['quantity'];
    color=data['color'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'name':name,'price':price,'category':category,'quantity':quantity,'color':color};
}