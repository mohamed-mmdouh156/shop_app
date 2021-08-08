class HomeModel {
  bool? status ;
  HomeModelData? data;

  HomeModel.formJson(Map json){
    status = json['status'];
    data = HomeModelData.fromJson(json['data']);
  }

}

class HomeModelData {
  List<BannersModel> banners = [];
  List<ProductsModel> products = [];

  HomeModelData.fromJson(Map json)
  {

    json['banners'].forEach((element){
      banners.add(element);
    });

    json['products'].forEach((element){
      products.add(element);
    });
  }

}

class BannersModel {

  int? id ;
  String? image;

  BannersModel.fromJson(Map json){
    id = json['id'];
    image = json['image'];
  }

}

class ProductsModel {

  int? id ;
  dynamic price;
  dynamic oldPrice;
  dynamic discount;
  String? image;
  String? name ;
  bool? inFavorites;
  bool? inCart;

  ProductsModel.fromJson(Map json){
    id = json['id'];
    price = json['price'];
    oldPrice = json['old_price'];
    discount = json['discount'];
    image = json['image'];
    name = json['name'];
    inFavorites = json['in_favorites'];
    inCart = json['in_cart'];
  }

}