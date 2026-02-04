// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class HomeResponseAdapter extends TypeAdapter<HomeResponse> {
  @override
  final int typeId = 9;

  @override
  HomeResponse read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return HomeResponse(
      categories: (fields[0] as List?)?.cast<CategoryModel>(),
      products: (fields[1] as List?)?.cast<ProductModel>(),
    );
  }

  @override
  void write(BinaryWriter writer, HomeResponse obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.categories)
      ..writeByte(1)
      ..write(obj.products);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is HomeResponseAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HomeResponse _$HomeResponseFromJson(Map<String, dynamic> json) => HomeResponse(
      categories: (json['categories'] as List<dynamic>?)
          ?.map((e) => CategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HomeResponseToJson(HomeResponse instance) =>
    <String, dynamic>{
      'categories': instance.categories,
      'products': instance.products,
    };
