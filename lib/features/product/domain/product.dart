class Product {
  const Product({
    required this.id,
    required this.name,
    required this.slug,
    this.description,
    this.brand,
    required this.variants,
    required this.images,
  });
  final String id;
  final String name;
  final String slug;
  final String? description;
  final String? brand;
  final List<ProductVariant> variants;
  final List<ProductImage> images;
  ProductPrice? get startingPrice {
    final prices =
        variants
            .where((v) => v.isActive)
            .expand((v) => v.prices)
            .where((p) => p.isActive)
            .toList()
          ..sort((a, b) => a.amount.compareTo(b.amount));
    return prices.isEmpty ? null : prices.first;
  }
}

class ProductVariant {
  const ProductVariant({
    required this.id,
    required this.sku,
    this.name,
    required this.isActive,
    required this.attributes,
    required this.prices,
  });
  final String id;
  final String sku;
  final String? name;
  final bool isActive;
  final Map<String, String> attributes;
  final List<ProductPrice> prices;
}

class ProductPrice {
  const ProductPrice({
    required this.id,
    required this.currency,
    required this.amount,
    this.compareAtAmount,
    required this.isActive,
  });
  final String id;
  final String currency;
  final double amount;
  final double? compareAtAmount;
  final bool isActive;
}

class ProductImage {
  const ProductImage({
    required this.id,
    required this.url,
    this.variantId,
    this.altText,
  });
  final String id;
  final String url;
  final String? variantId;
  final String? altText;
}

typedef ProductFilter = ({String keyword, String? categoryId, int page});
