class CartInfoModel {
  String goodsId;
  String goodsName;
  double price;
  String image;
  int count;
  bool isChecked;

  CartInfoModel(
    {this.goodsId, this.goodsName, this.price, this.image, this.count, this.isChecked});

  CartInfoModel.fromJson(Map<String, dynamic> json) {
    goodsId = json['goodsId'];
    goodsName = json['goodsName'];
    price = json['price'];
    image = json['image'];
    count = json['count'];
    isChecked = json['isChecked'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goodsId'] = this.goodsId;
    data['goodsName'] = this.goodsName;
    data['price'] = this.price;
    data['image'] = this.image;
    data['count'] = this.count;
    data['isChecked'] = this.isChecked;
    return data;
  }
}
