class CategoryListObject {
  List data; //
  CategoryListObject({
    this.data
  });

  factory CategoryListObject.fromJson(dynamic json) {
    return CategoryListObject(
      data: json.map((i) => CategoryObject.fromJson(i)).toList()
    );
  }
}

class CategoryObject {
  String mallCategoryId; // 类别id
  String mallCategoryName; // 类别名称
  List bxMallSubDto; // 子类列表
  Null comments; //
  String image; // 类别图片

  CategoryObject({
    this.mallCategoryId,
    this.mallCategoryName,
    this.bxMallSubDto,
    this.comments,
    this.image
  });

  factory CategoryObject.fromJson(dynamic json) {
    return CategoryObject(
      mallCategoryId: json['mallCategoryId'],
      mallCategoryName: json['mallCategoryName'],
      bxMallSubDto: json['bxMallSubDto'].map((item) => SubCategoryObject.fromJson(item)).toList(),
      comments: json['comments'],
      image: json['image']
    );
  }
}

class SubCategoryObject {
  String mallSubId;
  String mallCategoryId;
  String mallSubName;
  String comments;

  SubCategoryObject({
    this.mallSubId,
    this.mallCategoryId,
    this.mallSubName,
    this.comments
  });

  SubCategoryObject.fromJson(Map<String, dynamic> json) {
    mallSubId = json['mallSubId'];
    mallCategoryId = json['mallCategoryId'];
    mallSubName = json['mallSubName'];
    comments = json['comments'];
  }
}
