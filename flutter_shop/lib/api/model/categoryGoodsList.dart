class CategoryGoodsListObject {
  List<CategoryGoodsObject> data;

  CategoryGoodsListObject({this.data});

  CategoryGoodsListObject.fromJson(List json) {
    if (json != null) {
      data = new List<CategoryGoodsObject>();
      json.forEach((v) {
        data.add(new CategoryGoodsObject.fromJson(v));
      });
    }
  }
}

class CategoryGoodsObject {
  String image;
  double oriPrice;
  double presentPrice;
  String goodsName;
  String goodsId;

  CategoryGoodsObject(
      {this.image,
      this.oriPrice,
      this.presentPrice,
      this.goodsName,
      this.goodsId});

  CategoryGoodsObject.fromJson(Map<String, dynamic> json) {
    image = json['image'];
    oriPrice = json['oriPrice'];
    presentPrice = json['presentPrice'];
    goodsName = json['goodsName'];
    goodsId = json['goodsId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['image'] = this.image;
    data['oriPrice'] = this.oriPrice;
    data['presentPrice'] = this.presentPrice;
    data['goodsName'] = this.goodsName;
    data['goodsId'] = this.goodsId;
    return data;
  }
}
