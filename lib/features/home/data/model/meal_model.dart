
class MealModel{
  int? id;
  String imageUrl;
  String name;
  String description;
  String time;
  double rate;

  MealModel({
     this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.time,
    required this.rate
  });

  factory MealModel.fromJson(Map<String, dynamic> json){
    return MealModel(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      time: json['time'], 
      rate: json['rate']
      );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'imageUrl': imageUrl,
      'name': name,
      'description': description,
      'time': time,
      'rate': rate
    };
  }
}