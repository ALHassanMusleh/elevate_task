class Rating {
  num? rate;
  int? count;

  Rating({this.rate, this.count});

  Rating.fromJson(dynamic json) {
    rate = json['rate'];
    count = json['count'];
  }
}
