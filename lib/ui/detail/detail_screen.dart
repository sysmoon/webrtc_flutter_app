import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String url;

  const DetailScreen({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          // Image.network(url),
          Hero(
            tag: url,
            child: Image.network(
              url,
              width: double.infinity,
              height: 300,
              fit: BoxFit.cover,
            ),
          ),
          Text('부가정보'),
        ]));
  }
}
