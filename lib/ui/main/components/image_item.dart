import 'package:flutter/material.dart';

class ImageItem extends StatelessWidget {
  final String url;

  const ImageItem({Key? key, required this.url}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(16.0),
          child: Image.network(
            url,
            height: 200,
            fit: BoxFit.cover,
          ),
        ));
  }
}
