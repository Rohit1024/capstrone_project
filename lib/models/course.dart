import 'dart:convert';

Course courseFromJson(dynamic data) => Course.fromJson(data);

String courseToJson(Course data) => json.encode(data.toJson());

class Course {
  Course(
      {required this.id,
      required this.title,
      required this.price,
      required this.description,
      required this.author,
      required this.image,
      required this.rating,
      required this.quantity});

  int id;
  String title;
  int price;
  String description;
  String author;
  String image;
  String rating;
  int? quantity;

  factory Course.fromJson(Map<String, dynamic> json) => Course(
      id: json["id"],
      title: json["title"],
      price: json["price"].toDouble(),
      description: json["description"],
      author: json["author"],
      image: json["image"],
      rating: json["rating"],
      quantity: json["quantity"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "author": author,
        "image": image,
        "rating": rating,
        "quantity": quantity
      };
}
