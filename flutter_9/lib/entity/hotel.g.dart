// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelPreview _$HotelPreviewFromJson(Map<String, dynamic> json) => HotelPreview(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      poster: json['poster'] as String?,
    );

Map<String, dynamic> _$HotelPreviewToJson(HotelPreview instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
    };

Hotel _$HotelFromJson(Map<String, dynamic> json) => Hotel(
      uuid: json['uuid'] as String?,
      name: json['name'] as String?,
      poster: json['poster'] as String?,
      address: json['address'] == null
          ? null
          : HotelAddress.fromJson(json['address'] as Map<String, dynamic>),
      price: (json['price'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      services: json['services'] == null
          ? null
          : HotelServices.fromJson(json['services'] as Map<String, dynamic>),
      photos:
          (json['photos'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelToJson(Hotel instance) => <String, dynamic>{
      'uuid': instance.uuid,
      'name': instance.name,
      'poster': instance.poster,
      'address': instance.address,
      'price': instance.price,
      'rating': instance.rating,
      'services': instance.services,
      'photos': instance.photos,
    };

HotelAddress _$HotelAddressFromJson(Map<String, dynamic> json) => HotelAddress(
      country: json['country'] as String?,
      street: json['street'] as String?,
      city: json['city'] as String?,
      zipCode: json['zip_code'] as int?,
      cords: json['cords'] == null
          ? null
          : Coordinates.fromJson(json['cords'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$HotelAddressToJson(HotelAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'street': instance.street,
      'city': instance.city,
      'zip_code': instance.zipCode,
      'cords': instance.cords,
    };

Coordinates _$CoordinatesFromJson(Map<String, dynamic> json) => Coordinates(
      lat: (json['lat'] as num?)?.toDouble(),
      lan: (json['lan'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CoordinatesToJson(Coordinates instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lan': instance.lan,
    };

HotelServices _$HotelServicesFromJson(Map<String, dynamic> json) =>
    HotelServices(
      free: (json['free'] as List<dynamic>?)?.map((e) => e as String).toList(),
      paid: (json['paid'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$HotelServicesToJson(HotelServices instance) =>
    <String, dynamic>{
      'free': instance.free,
      'paid': instance.paid,
    };
