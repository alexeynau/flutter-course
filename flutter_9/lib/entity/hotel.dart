import 'package:json_annotation/json_annotation.dart';

part 'hotel.g.dart';

@JsonSerializable()
class HotelPreview {
  String? uuid;
  String? name;
  String? poster;

  HotelPreview({
    this.uuid,
    this.name,
    this.poster,
  });

  factory HotelPreview.fromJson(Map<String, dynamic> json) =>
      _$HotelPreviewFromJson(json);
  Map<String, dynamic> toJson() => _$HotelPreviewToJson(this);
}

@JsonSerializable()
class Hotel {
  String? uuid;
  String? name;
  String? poster;
  HotelAddress? address;
  double? price;
  double? rating;
  HotelServices? services;
  List<String>? photos;
  Hotel({
    this.uuid,
    this.name,
    this.poster,
    this.address,
    this.price,
    this.rating,
    this.services,
    this.photos,
  });

  factory Hotel.fromJson(Map<String, dynamic> json) => _$HotelFromJson(json);
  Map<String, dynamic> toJson() => _$HotelToJson(this);
}

@JsonSerializable()
class HotelAddress {
  String? country;
  String? street;
  String? city;

  @JsonKey(name: 'zip_code')
  int? zipCode;

  Coordinates? cords;

  HotelAddress(
      {this.country, this.street, this.city, this.zipCode, this.cords});

  factory HotelAddress.fromJson(Map<String, dynamic> json) =>
      _$HotelAddressFromJson(json);
  Map<String, dynamic> toJson() => _$HotelAddressToJson(this);
}

@JsonSerializable()
class Coordinates {
  double? lat;
  double? lan;
  Coordinates({this.lat, this.lan});

  factory Coordinates.fromJson(Map<String, dynamic> json) =>
      _$CoordinatesFromJson(json);
  Map<String, dynamic> toJson() => _$CoordinatesToJson(this);
}

@JsonSerializable()
class HotelServices {
  List<String>? free;
  List<String>? paid;

  HotelServices({this.free, this.paid});

  factory HotelServices.fromJson(Map<String, dynamic> json) =>
      _$HotelServicesFromJson(json);
  Map<String, dynamic> toJson() => _$HotelServicesToJson(this);
}
