import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jobs_flutter_app/app/data/remote/repositories/search_repository.dart';

import '../../../data/remote/base/state.dart' as base;
import '../../../data/remote/dto/search/search_out_dto.dart';
import '../../../di/locator.dart';

class SearchController extends GetxController {
  final _searchRepository = getIt.get<SearchRepository>();
  final searchController = TextEditingController();

  final Rx<base.State<List<SearchOutDto>>> _rxResults =
      Rx<base.State<List<SearchOutDto>>>(const base.State.idle());

  base.State<List<SearchOutDto>> get rxResults => _rxResults.value;

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
  }

  getSearchResult() async {
    final base.State<List<SearchOutDto>> results =
        await _searchRepository.getAll(q: searchController.text);
    _rxResults.value = results;
  }
}
