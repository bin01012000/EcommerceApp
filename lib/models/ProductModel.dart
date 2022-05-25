class ProductModel {
  num? id;
  String? name;
  num? price;
  num? voucher;
  String? img;
  num? idCate;
  num? rating;
  String? detail;
  String? color;

  ProductModel(
      {this.id,
      this.name,
      this.price,
      this.voucher,
      this.img,
      this.idCate,
      this.rating,
      this.detail,
      this.color});

  ProductModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    voucher = json['voucher'];
    img = json['img'];
    idCate = json['idCate'];
    rating = json['rating'];
    detail = json['detail'];
    color = json['color'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = id;
    data['name'] = name;
    data['price'] = price;
    data['voucher'] = voucher;
    data['img'] = img;
    data['idCate'] = idCate;
    data['rating'] = rating;
    data['detail'] = detail;
    data['color'] = color;
    return data;
  }
}
