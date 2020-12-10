import 'package:flutter/material.dart';
import 'package:news/src/blocs/stories_provider.dart';
import '../blocs/stories_bloc.dart';

class Refresh extends StatelessWidget {
  final Widget child;
  Refresh({this.child});
  Widget build(context) {
    final bloc = StoriesProvider.of(context);
    return RefreshIndicator(
      child: child,
      onRefresh: () async {
        await bloc.clearCache();
        await bloc.fetchTopIds();
      },
    );
  }
}