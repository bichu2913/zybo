// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Bannerlistingres.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Bannerlistingres _$BannerlistingresFromJson(Map<String, dynamic> json) =>
    Bannerlistingres(
      id: (json['id'] as num?)?.toInt(),
      product: json['product'] == null
          ? null
          : Product.fromJson(json['product'] as Map<String, dynamic>),
      category: json['category'] == null
          ? null
          : Category.fromJson(json['category'] as Map<String, dynamic>),
      name: json['name'] as String?,
      image: json['image'] as String?,
      showingOrder: (json['showing_order'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
    );

Map<String, dynamic> _$BannerlistingresToJson(Bannerlistingres instance) =>
    <String, dynamic>{
      'id': instance.id,
      'product': instance.product,
      'category': instance.category,
      'name': instance.name,
      'image': instance.image,
      'showing_order': instance.showingOrder,
      'is_active': instance.isActive,
    };

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      image: json['image'] as String?,
      isActive: json['is_active'] as bool?,
      showingOrder: (json['showing_order'] as num?)?.toInt(),
      slug: json['slug'] as String?,
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => Product.fromJson(e as Map<String, dynamic>))
          .toList(),
      hexcode1: json['hexcode_1'],
      hexcode2: json['hexcode_2'],
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'image': instance.image,
      'is_active': instance.isActive,
      'showing_order': instance.showingOrder,
      'slug': instance.slug,
      'products': instance.products,
      'hexcode_1': instance.hexcode1,
      'hexcode_2': instance.hexcode2,
    };

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      id: (json['id'] as num?)?.toInt(),
      variations: (json['variations'] as List<dynamic>?)
          ?.map((e) => Variation.fromJson(e as Map<String, dynamic>))
          .toList(),
      inWishlist: json['in_wishlist'] as bool?,
      avgRating: (json['avg_rating'] as num?)?.toInt(),
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      variationExists: json['variation_exists'] as bool?,
      salePrice: (json['sale_price'] as num?)?.toInt(),
      addons: (json['addons'] as List<dynamic>?)
          ?.map((e) => Addon.fromJson(e as Map<String, dynamic>))
          .toList(),
      available: json['available'] as bool?,
      availableFrom: json['available_from'] as String?,
      availableTo: json['available_to'] as String?,
      name: json['name'] as String?,
      description: json['description'] as String?,
      caption: json['caption'] as String?,
      featuredImage: json['featured_image'] as String?,
      mrp: (json['mrp'] as num?)?.toInt(),
      stock: (json['stock'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      discount: json['discount'] as String?,
      createdDate: json['created_date'] as String?,
      productType: json['product_type'] as String?,
      showingOrder: json['showing_order'],
      variationName: json['variation_name'] as String?,
      category: (json['category'] as num?)?.toInt(),
      taxRate: (json['tax_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'variations': instance.variations,
      'in_wishlist': instance.inWishlist,
      'avg_rating': instance.avgRating,
      'images': instance.images,
      'variation_exists': instance.variationExists,
      'sale_price': instance.salePrice,
      'addons': instance.addons,
      'available': instance.available,
      'available_from': instance.availableFrom,
      'available_to': instance.availableTo,
      'name': instance.name,
      'description': instance.description,
      'caption': instance.caption,
      'featured_image': instance.featuredImage,
      'mrp': instance.mrp,
      'stock': instance.stock,
      'is_active': instance.isActive,
      'discount': instance.discount,
      'created_date': instance.createdDate,
      'product_type': instance.productType,
      'showing_order': instance.showingOrder,
      'variation_name': instance.variationName,
      'category': instance.category,
      'tax_rate': instance.taxRate,
    };

Addon _$AddonFromJson(Map<String, dynamic> json) => Addon(
      id: (json['id'] as num?)?.toInt(),
      price: (json['price'] as num?)?.toInt(),
      name: json['name'] as String?,
      description: json['description'] as String?,
      featuredImage: json['featured_image'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      isActive: json['is_active'] as bool?,
      taxRate: (json['tax_rate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$AddonToJson(Addon instance) => <String, dynamic>{
      'id': instance.id,
      'price': instance.price,
      'name': instance.name,
      'description': instance.description,
      'featured_image': instance.featuredImage,
      'stock': instance.stock,
      'is_active': instance.isActive,
      'tax_rate': instance.taxRate,
    };

Variation _$VariationFromJson(Map<String, dynamic> json) => Variation(
      id: (json['id'] as num?)?.toInt(),
      salePrice: (json['sale_price'] as num?)?.toInt(),
      variationName: json['variation_name'] as String?,
      featuredImage: json['featured_image'] as String?,
      stock: (json['stock'] as num?)?.toInt(),
      created: json['created'] as String?,
      showStatus: json['show_status'] as bool?,
      showingOrder: (json['showing_order'] as num?)?.toInt(),
      product: (json['product'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VariationToJson(Variation instance) => <String, dynamic>{
      'id': instance.id,
      'sale_price': instance.salePrice,
      'variation_name': instance.variationName,
      'featured_image': instance.featuredImage,
      'stock': instance.stock,
      'created': instance.created,
      'show_status': instance.showStatus,
      'showing_order': instance.showingOrder,
      'product': instance.product,
    };
