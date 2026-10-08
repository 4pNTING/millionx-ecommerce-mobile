import 'dart:convert';
import '../../domain/product.dart';

class ProductModel extends Product {
  const ProductModel({
    required super.id,
    required super.name,
    required super.slug,
    super.description,
    super.brand,
    required super.variants,
    required super.images,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
    id: json['id'] as String,
    name: json['name'] as String,
    slug: json['slug'] as String,
    description: json['description'] as String?,
    brand: json['brand'] as String?,
    variants: (json['variants'] as List? ?? []).map((value) {
      final v = value as Map<String, dynamic>;
      final raw = v['attributesJson'] as String?;
      final attributes = raw == null || raw.isEmpty
          ? <String, dynamic>{}
          : jsonDecode(raw) as Map<String, dynamic>;
      return ProductVariant(
        id: v['id'] as String,
        sku: v['sku'] as String,
        name: v['name'] as String?,
        isActive: v['isActive'] == true,
        attributes: attributes.map(
          (key, value) => MapEntry(key, value.toString()),
        ),
        prices: (v['prices'] as List? ?? []).map((value) {
          final p = value as Map<String, dynamic>;
          return ProductPrice(
            id: p['id'] as String,
            currency: p['currency'] as String,
            amount: (p['amount'] as num).toDouble(),
            compareAtAmount: (p['compareAtAmount'] as num?)?.toDouble(),
            isActive: p['isActive'] == true,
          );
        }).toList(),
      );
    }).toList(),
    images: (json['images'] as List? ?? []).map((value) {
      final i = value as Map<String, dynamic>;
      return ProductImage(
        id: i['id'] as String,
        url: i['url'] as String,
        variantId: i['variantId'] as String?,
        altText: i['altText'] as String?,
      );
    }).toList(),
  );
}
