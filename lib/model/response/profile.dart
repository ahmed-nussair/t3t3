import 'package:json_annotation/json_annotation.dart';
import 'location.dart';
import 'country.dart';

part 'profile.g.dart';

@JsonSerializable()
class Profile {
  int id;
  @JsonKey(
    name: 'first_name',
  )
  String firstName;
  @JsonKey(
    name: 'last_name',
  )
  String lastName;
  String username;
  String email;
  String phone;
  @JsonKey(
    name: 'image_url',
  )
  String imageUrl;
  Country country;
  Location location;
  String token;

  Profile(this.id, this.firstName, this.lastName, this.username, this.email,
      this.phone, this.country, this.location, this.token);

  factory Profile.fromJson(Map<String, dynamic> json) =>
      _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}
