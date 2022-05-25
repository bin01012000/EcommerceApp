class CategoryModel {
  late int? idCate;
  late String? nameCate;
  late int? amount;
  late String? image;

  CategoryModel(
      {required this.idCate,
      required this.nameCate,
      required this.amount,
      required this.image});

  CategoryModel.fromJson(Map<String, dynamic> json) {
    idCate = json['idCate'];
    nameCate = json['nameCate'];
    amount = json['amount'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCate'] = this.idCate;
    data['nameCate'] = this.nameCate;
    data['amount'] = this.amount;
    data['image'] = this.image;
    return data;
  }
}
