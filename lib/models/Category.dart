// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Category
{
  int id;
  String  name , color;

  Category(dynamic obj)
  {id=obj['id'];
  name=obj['name'];
  color=obj['color'];
  }
  Category.fromMap(Map<String,dynamic> data)
  {
    id=data['id'];
    name=data['name'];
    color=data['color'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'name':name,'color':color};
}