// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Address
{
  int id;
  String  user_name , home_address,office_address;

  Address(dynamic obj)
  {id=obj['id'];
  user_name=obj['user_name'];
  home_address=obj['home_address'];
  office_address=obj['office_address'];
  }
  Address.fromMap(Map<String,dynamic> data)
  {
    id=data['id'];
    user_name=data['user_name'];
    home_address=data['home_address'];
    office_address=data['office_address'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'user_name':user_name,'home_address':home_address,'office_address':office_address};
}