import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_webrtc_app/data/repository/image_repository.dart';
import 'package:flutter_webrtc_app/ui/detail/detail_screen.dart';
import 'package:flutter_webrtc_app/ui/main/components/image_item.dart';
import 'package:flutter_webrtc_app/ui/main/main_view_model.dart';
import 'package:provider/provider.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  // final viewModel = MainViewModel(ImageRepository());
  final queryTextController = TextEditingController();

  Widget build(BuildContext context) {
    final viewModel = context.watch<MainViewModel>();

    return Scaffold(
      appBar: AppBar(
        title: Text('이미지 검색'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              controller: queryTextController,
              decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () async {
                      log('start loading..');

                      await viewModel.fetchImages(queryTextController.text);

                      log('end loading..');
                    },
                    icon: Icon(Icons.search),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  filled: true,
                  hintStyle: TextStyle(color: Colors.grey[800]),
                  hintText: 'Search',
                  fillColor: Colors.white70),
            ),
          ),
          _buildList(viewModel),
        ],
      ),
    );
  }

  Widget _buildList(MainViewModel viewModel) {
    return Expanded(
        child: viewModel.isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : GridView.count(
                crossAxisCount: 2,
                // children:
                //     viewModel.items.map((e) => ImageItem(url: e)).toList(),
                children: viewModel.items.map((e) {
                  return GestureDetector(
                    onTap: () {
                      // 화면 이동
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailScreen(url: e)),
                      );
                    },
                    // child: ImageItem(url: e),
                    child: Hero(
                      tag: e,
                      child: ImageItem(url: e),
                    ),
                  );
                }).toList(),
              ));
  }
}
