class ProductModel {
  int? _id;
  String? _productName;
  String? _productDescription;
  int? _productPrice;
  String? _image;

  ProductModel(
      {int? id,
        String? productName,
        String? productDescription,
        int? productPrice,
        String? image}) {
    if (id != null) {
      this._id = id;
    }
    if (productName != null) {
      this._productName = productName;
    }
    if (productDescription != null) {
      this._productDescription = productDescription;
    }
    if (productPrice != null) {
      this._productPrice = productPrice;
    }
    if (image != null) {
      this._image = image;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get productName => _productName;
  set productName(String? productName) => _productName = productName;
  String? get productDescription => _productDescription;
  set productDescription(String? productDescription) =>
      _productDescription = productDescription;
  int? get productPrice => _productPrice;
  set productPrice(int? productPrice) => _productPrice = productPrice;
  String? get image => _image;
  set image(String? image) => _image = image;

  ProductModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _productName = json['productName'];
    _productDescription = json['productDescription'];
    _productPrice = json['productPrice'];
    _image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['productName'] = this._productName;
    data['productDescription'] = this._productDescription;
    data['productPrice'] = this._productPrice;
    data['image'] = this._image;
    return data;
  }
}
