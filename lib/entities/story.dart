import 'dart:convert';

Story storyFromJson(String str) => Story.fromJson(json.decode(str));

String storyToJson(Story data) => json.encode(data.toJson());

class Story {
  int day;
  int month;
  int rate;
  int category;
  int emotion;
  String id;
  String name;

  Story({
    this.day,
    this.month,
    this.rate,
    this.category,
    this.emotion,
    this.id,
    this.name,
  });

  factory Story.fromJson(Map<String, dynamic> json) => Story(
        day: json["day"] == null ? null : json["day"],
        month: json["month"] == null ? null : json["month"],
        rate: json["rate"] == null ? null : json["rate"],
        category: json["category"] == null ? null : json["category"],
        emotion: json["emotion"] == null ? null : json["emotion"],
        id: json["_id"] == null ? null : json["_id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "day": day == null ? null : day,
        "month": month == null ? null : month,
        "rate": rate == null ? null : rate,
        "category": category == null ? null : category,
        "emotion": emotion == null ? null : emotion,
        "_id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
