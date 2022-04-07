import 'package:hive/hive.dart';

part 'model.g.dart';

@HiveType(typeId: 1)
class User {
  @HiveField(0)
  late String id;
  @HiveField(1)
  late String name;
  @HiveField(2)
  late String image;
  @HiveField(3)
  late String ssid;
  @HiveField(4)
  late String bssid;
  @HiveField(5)
  late String street;
  @HiveField(6)
  late String date;
  @HiveField(7)
  late double latitude;
  @HiveField(8)
  late double longitude;

  User(
      {this.id = "",
      this.name = "",
      this.image = "",
      this.ssid = "",
      this.bssid = "",
      this.street = "",
      this.date = "",
      this.latitude = 0.0,
      this.longitude = 0.0});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    ssid = json['ssid'];
    bssid = json['bssid'];
    street = json['street'];
    date = json['date'];
    latitude = json['latitude'];
    longitude = json['longitude'];
  }

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
      "image": image,
      "ssid": ssid,
      "bssid": bssid,
      "street": street,
      "date": date,
      "latitude": latitude,
      "longitude": longitude,
    };
  }

  bool isValid() {
    if (this is InvalidUserInfo) {
      return false;
    }
    return true;
  }
}

class InvalidUserInfo extends User {
  InvalidUserInfo() : super(id: "0");
}
