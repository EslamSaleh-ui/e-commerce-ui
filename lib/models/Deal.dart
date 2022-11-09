// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Deal
{
  int id;
  String  deal ,distance,color;
  int price,deal_price;
  Deal(dynamic obj)
  {id=obj['id'];
  deal=obj['deal'];
  price=obj['price'];
  deal_price=obj['deal_price'];
  distance=obj['distance'];
  color=obj['color'];

  }
  Deal.fromMap(Map<String,dynamic> data)
  {
    id=data['id'];
    deal=data['deal'];
    price=data['price'];
    deal_price=data['deal_price'];
    distance=data['distance'];
    color=data['color'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'deal':deal,'price':price,'deal_price':deal_price,'distance':distance,'color':color};
}