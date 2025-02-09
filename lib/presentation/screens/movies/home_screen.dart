import 'package:flutter/material.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';

import '../../views/views.dart';

class HomeScreen extends StatelessWidget {
  
  static const name = 'home-screen';
  final int pageIndex;

  const HomeScreen({
    super.key,
    required this.pageIndex
  });

  final viewRoutes = const <Widget>[
    HomeView(),
    CateView(), // <----- Categorias View
    FavoriteView(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: pageIndex,
        children: viewRoutes,
      ),
      bottomNavigationBar: CustomBottomNavigation(currenIndex: pageIndex),
    );
  }
}