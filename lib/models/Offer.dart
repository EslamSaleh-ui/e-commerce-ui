// ignore_for_file: file_names
// ignore_for_file: non_constant_identifier_names

class Offer
{
  int id;
  String  offer , end_date;
  double price,offer_price;
  Offer(dynamic obj)
  {id=obj['id'];
  offer=obj['offer'];
  price=obj['price'];
  offer_price=obj['offer_price'];
  end_date=obj['end_date'];
  }
  Offer.fromMap(Map<String,dynamic> data)
  {
    id=data['id'];
    offer=data['offer'];
    price=data['price'] ;
    offer_price=data['offer_price'];
    end_date=data['end_date'];
  }
  Map<String,dynamic> toMap()=>{'id':id,'offer':offer,'price':price,'offer_price':offer_price,'end_date':end_date};
}