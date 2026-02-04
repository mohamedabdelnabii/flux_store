// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_response.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CartProductItemAdapter extends TypeAdapter<CartProductItem> {
  @override
  final int typeId = 15;

  @override
  CartProductItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductItem(
      count: fields[0] as int?,
      id: fields[1] as String?,
      product: fields[2] as CartProductDetails?,
      price: fields[3] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductItem obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.count)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.product)
      ..writeByte(3)
      ..write(obj.price);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CartProductDetailsAdapter extends TypeAdapter<CartProductDetails> {
  @override
  final int typeId = 16;

  @override
  CartProductDetails read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CartProductDetails(
      subcategory: (fields[0] as List?)?.cast<SubCategoryInCart>(),
      id: fields[1] as String?,
      title: fields[2] as String?,
      imageCover: fields[3] as String?,
      category: fields[4] as CategoryInCart?,
      brand: fields[5] as BrandInCart?,
      ratingsAverage: fields[6] as num?,
    );
  }

  @override
  void write(BinaryWriter writer, CartProductDetails obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.subcategory)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.title)
      ..writeByte(3)
      ..write(obj.imageCover)
      ..writeByte(4)
      ..write(obj.category)
      ..writeByte(5)
      ..write(obj.brand)
      ..writeByte(6)
      ..write(obj.ratingsAverage);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CartProductDetailsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class SubCategoryInCartAdapter extends TypeAdapter<SubCategoryInCart> {
  @override
  final int typeId = 17;

  @override
  SubCategoryInCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SubCategoryInCart(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      category: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, SubCategoryInCart obj) {
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
      other is SubCategoryInCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class CategoryInCartAdapter extends TypeAdapter<CategoryInCart> {
  @override
  final int typeId = 18;

  @override
  CategoryInCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CategoryInCart(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, CategoryInCart obj) {
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
      other is CategoryInCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BrandInCartAdapter extends TypeAdapter<BrandInCart> {
  @override
  final int typeId = 19;

  @override
  BrandInCart read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BrandInCart(
      id: fields[0] as String?,
      name: fields[1] as String?,
      slug: fields[2] as String?,
      image: fields[3] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BrandInCart obj) {
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
      other is BrandInCartAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartResponse _$CartResponseFromJson(Map<String, dynamic> json) => CartResponse(
      status: json['status'] as String?,
      numOfCartItems: (json['numOfCartItems'] as num?)?.toInt(),
      cartId: json['cartId'] as String?,
      data: json['data'] == null
          ? null
          : CartData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CartResponseToJson(CartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'numOfCartItems': instance.numOfCartItems,
      'cartId': instance.cartId,
      'data': instance.data,
    };

CartData _$CartDataFromJson(Map<String, dynamic> json) => CartData(
      id: json['_id'] as String?,
      cartOwner: json['cartOwner'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CartProductItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
      updatedAt: json['updatedAt'] == null
          ? null
          : DateTime.parse(json['updatedAt'] as String),
      v: (json['v'] as num?)?.toInt(),
      totalCartPrice: json['totalCartPrice'] as num?,
    );

Map<String, dynamic> _$CartDataToJson(CartData instance) => <String, dynamic>{
      '_id': instance.id,
      'cartOwner': instance.cartOwner,
      'products': instance.products,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'v': instance.v,
      'totalCartPrice': instance.totalCartPrice,
    };

CartProductItem _$CartProductItemFromJson(Map<String, dynamic> json) =>
    CartProductItem(
      count: (json['count'] as num?)?.toInt(),
      id: json['_id'] as String?,
      product: json['product'] == null
          ? null
          : CartProductDetails.fromJson(
              json['product'] as Map<String, dynamic>),
      price: json['price'] as num?,
    );

Map<String, dynamic> _$CartProductItemToJson(CartProductItem instance) =>
    <String, dynamic>{
      'count': instance.count,
      '_id': instance.id,
      'product': instance.product,
      'price': instance.price,
    };

CartProductDetails _$CartProductDetailsFromJson(Map<String, dynamic> json) =>
    CartProductDetails(
      subcategory: (json['subcategory'] as List<dynamic>?)
          ?.map((e) => SubCategoryInCart.fromJson(e as Map<String, dynamic>))
          .toList(),
      id: json['_id'] as String?,
      title: json['title'] as String?,
      imageCover: json['imageCover'] as String?,
      category: json['category'] == null
          ? null
          : CategoryInCart.fromJson(json['category'] as Map<String, dynamic>),
      brand: json['brand'] == null
          ? null
          : BrandInCart.fromJson(json['brand'] as Map<String, dynamic>),
      ratingsAverage: json['ratingsAverage'] as num?,
    );

Map<String, dynamic> _$CartProductDetailsToJson(CartProductDetails instance) =>
    <String, dynamic>{
      'subcategory': instance.subcategory,
      '_id': instance.id,
      'title': instance.title,
      'imageCover': instance.imageCover,
      'category': instance.category,
      'brand': instance.brand,
      'ratingsAverage': instance.ratingsAverage,
    };

SubCategoryInCart _$SubCategoryInCartFromJson(Map<String, dynamic> json) =>
    SubCategoryInCart(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$SubCategoryInCartToJson(SubCategoryInCart instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'category': instance.category,
    };

CategoryInCart _$CategoryInCartFromJson(Map<String, dynamic> json) =>
    CategoryInCart(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$CategoryInCartToJson(CategoryInCart instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };

BrandInCart _$BrandInCartFromJson(Map<String, dynamic> json) => BrandInCart(
      id: json['_id'] as String?,
      name: json['name'] as String?,
      slug: json['slug'] as String?,
      image: json['image'] as String?,
    );

Map<String, dynamic> _$BrandInCartToJson(BrandInCart instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'image': instance.image,
    };
