class Fav {
  num? idFav;
  String? email;
  num? id;
  String? name;
  num? price;
  num? voucher;
  String? img;
  num? idCate;
  num? rating;
  String? detail;
  String? color;

  Fav(
      {this.idFav,
      this.email,
      this.id,
      this.name,
      this.price,
      this.voucher,
      this.img,
      this.idCate,
      this.rating,
      this.detail,
      this.color});

  Fav.fromJson(Map<String, dynamic> json) {
    idFav = json['idFav'];
    email = json['email'];
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
    data['idFav'] = idFav;
    data['email'] = email;
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
