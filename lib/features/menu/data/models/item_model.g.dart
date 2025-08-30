// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Item _$ItemFromJson(Map<String, dynamic> json) => Item(
  itemID: (json['itemID'] as num).toInt(),
  itemName: json['itemName'] as String,
  itemDescription: json['itemDescription'] as String,
  itemPrice: (json['itemPrice'] as num).toInt(),
  restaurantName: json['restaurantName'] as String,
  restaurantID: (json['restaurantID'] as num).toInt(),
  imageUrl: json['imageUrl'] as String,
);

Map<String, dynamic> _$ItemToJson(Item instance) => <String, dynamic>{
  'itemID': instance.itemID,
  'itemName': instance.itemName,
  'itemDescription': instance.itemDescription,
  'itemPrice': instance.itemPrice,
  'restaurantName': instance.restaurantName,
  'restaurantID': instance.restaurantID,
  'imageUrl': instance.imageUrl,
};
