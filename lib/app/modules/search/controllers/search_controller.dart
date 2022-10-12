import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/remote/base/status.dart';
import '../../../data/remote/dto/search/search_out_dto.dart';
import '../../../data/remote/repositories/search_repository.dart';
import '../../../di/locator.dart';

class SearchController extends GetxController {
  final _searchRepository = getIt.get<SearchRepository>();
  final searchController = TextEditingController();

  final Rx<Status<List<SearchOutDto>>> _rxResults =
      Rx<Status<List<SearchOutDto>>>(const Status.idle());

  Status<List<SearchOutDto>> get rxResults => _rxResults.value;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    searchController.dispose();
  }

  getSearchResult() async {
    if (!searchController.text.isBlank!) {
      final Status<List<SearchOutDto>> results =
          await _searchRepository.getAll(q: searchController.text.trim());
      _rxResults.value = results;
    }
  }

  clearSearch() {
    searchController.clear();
    _rxResults.value = const Status.idle();
  }
}
