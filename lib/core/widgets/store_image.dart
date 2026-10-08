import 'package:flutter/material.dart';
import '../config/app_config.dart';

class StoreImage extends StatelessWidget {
  const StoreImage({
    super.key,
    this.url,
    this.altText,
    this.fit = BoxFit.contain,
  });
  final String? url;
  final String? altText;
  final BoxFit fit;
  @override
  Widget build(BuildContext context) {
    final placeholder = ColoredBox(
      color: const Color(0xFFF5F5F8),
      child: const Center(
        child: Icon(Icons.image_outlined, size: 48, color: Colors.grey),
      ),
    );
    if (url == null || url!.trim().isEmpty) return placeholder;
    return Image.network(
      AppConfig.imageUrl(url!),
      fit: fit,
      semanticLabel: altText,
      width: double.infinity,
      height: double.infinity,
      errorBuilder: (_, error, stack) => placeholder,
      loadingBuilder: (_, child, progress) => progress == null
          ? child
          : const Center(child: CircularProgressIndicator()),
    );
  }
}
