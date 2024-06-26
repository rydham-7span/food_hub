import 'package:flutter/material.dart';

mixin PaginationService<T extends StatefulWidget> on State<T> {
  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    scrollController.addListener(listener);
  }

  void listener() {
    if (scrollController.offset > scrollController.position.maxScrollExtent / 2) {
      _checkIfCanLoadMore();
    }
  }

  bool _canFetchBottom = true;

  bool _canFetchTop = true;

  Future<void> _checkIfCanLoadMore() async {
    if (scrollController.position.pixels == 0) {
      if (!_canFetchTop) return;
      _canFetchTop = false;
      onTopScroll();
      _canFetchTop = true;
    } else {
      if (!_canFetchBottom) return;
      _canFetchBottom = false;
      onEndScroll();
      _canFetchBottom = true;
    }
  }

  void onEndScroll();

  void onTopScroll() {}

  @override
  void dispose() {
    scrollController.removeListener(listener);
    super.dispose();
  }
}
