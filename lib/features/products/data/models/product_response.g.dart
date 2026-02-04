// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ProductModelAdapter extends TypeAdapter<ProductModel> {
  @override
  final int typeId = 2;

  @override
  ProductModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ProductModel(
      id: fields[0] as String?,
      title: fields[1] as String?,
      slug: fields[2] as String?,
      description: fields[3] as String?,
      quantity: fields[4] as int?,
      price: fields[5] as int?,
      imageCover: fields[6] as String?,
      images: (fields[7] as List?)?.cast<String>(),
      category: fields[8] as CategoryModelInProduct?,
      subcategory: (fields[9] as List?)?.cast<SubcategoryModel>(),
      brand: fields[10] as BrandModelInProduct?,
      ratingsAverage: fields[11] as num?,
      ratingsQuantity: fields[12] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, ProductModel obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.title)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.description)
      ..writeByte(4)
      ..write(obj.quantity)
      ..writeByte(5)
      ..write(obj.price)
      ..writeByte(6)
      ..write(obj.imageCover)
      ..writeByte(7)
      ..write(obj.images)
      ..writeByte(8)
      ..write(obj.category)
      ..writeByte(9)
      ..write(obj.subcategory)
      ..writeByte(10)
      ..write(obj.brand)
      ..writeByte(11)
      ..write(obj.ratingsAverage)
      ..writeByte(12)
      ..write(obj.ratingsQuantity);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ProductModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubcategoryModelAdapter extends TypeAdapter<SubcategoryModel> {
  @override
  final int typeId = 4;

  @override
  SubcategoryModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubcategoryModel(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      category: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SubcategoryModel obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.category);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SubcategoryModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryModelInProductAdapter
    extends TypeAdapter<CategoryModelInProduct> {
  @override
  final int typeId = 5;

  @override
  CategoryModelInProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryModelInProduct(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryModelInProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CategoryModelInProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandModelInProductAdapter extends TypeAdapter<BrandModelInProduct> {
  @override
  final int typeId = 6;

  @override
  BrandModelInProduct read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandModelInProduct(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BrandModelInProduct obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.slug)
      ..writeByte(3)
      ..write(obj.image);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BrandModelInProductAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductResponse _$ProductResponseFromJson(Map<String, dynamic> json) =>
    ProductResponse(
      results: (json['results'] as num?)?.toInt(),
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ProductResponseToJson(ProductResponse instance) =>
    <String, dynamic>{
      'results': instance.results,
      'data': instance.data,
    };

SingleProductResponse _$SingleProductResponseFromJson(
        Map<String, dynamic> json) =>
    SingleProductResponse(
      data: json['data'] == null
          ? null
          : ProductModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingleProductResponseToJson(
        SingleProductResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String?,
      title: json['title'] as String?,
      slug: json['slug'] as String?,
      description: json['description'] as String?,
      quantity: (json['quantity'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      imageCover: json['imageCover'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      category: json['category'] == null
          ? null
          : CategoryModelInProduct.fromJson(
              json['category'] as Map<String, dynamic>),
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubcategoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      brand: json['brand'] == null
          ? null
          : BrandModelInProduct.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: json['ratingsAverage'] as num?,
      ratingsQuantity: (json['ratingsQuantity'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'slug': instance.slug,
      'description': instance.description,
      'quantity': instance.quantity,
      'price': instance.price,
      'imageCover': instance.imageCover,
      'images': instance.images,
      'category': instance.category,
      'subcategory': instance.subcategory,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
      'ratingsQuantity': instance.ratingsQuantity,
    };

SubcategoryModel _$SubcategoryModelFromJson(Map<String, dynamic> json) =>
    SubcategoryModel(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$SubcategoryModelToJson(SubcategoryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };

CategoryModelInProduct _$CategoryModelInProductFromJson(
        Map<String, dynamic> json) =>
    CategoryModelInProduct(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryModelInProductToJson(
        CategoryModelInProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };

BrandModelInProduct _$BrandModelInProductFromJson(Map<String, dynamic> json) =>
    BrandModelInProduct(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BrandModelInProductToJson(
        BrandModelInProduct instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
