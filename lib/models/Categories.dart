class Categories {
  int? idCate;
  String? nameCate;
  int? amount;

  Categories({this.idCate, this.nameCate, this.amount});

  Categories.fromJson(Map<String, dynamic> json) {
    idCate = json['idCate'];
    nameCate = json['nameCate'];
    amount = json['amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['idCate'] = this.idCate;
    data['nameCate'] = this.nameCate;
    data['amount'] = this.amount;
    return data;
  }

  @override
  String toString() {
    return '{idCate: $idCate, nameCate: $nameCate}';
  }
}
