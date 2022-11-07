import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:flutter_webrtc_app/data/repository/image_repository.dart';

class MainViewModel extends ChangeNotifier {
  final ImageRepository repository;

  List<String> items = [];
  bool isLoading = false;

  MainViewModel(this.repository);

  Future<void> fetchImages(String query) async {
    isLoading = true;
    // rendering
    notifyListeners();

    items = await repository.fetchImages(query);

    isLoading = false;
    // rendering
    notifyListeners();
  }
}
