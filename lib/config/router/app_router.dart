// import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cinemapedia/presentation/screens/screens.dart';

final appRouter = GoRouter(
  initialLocation: '/home/0', 
  // errorBuilder: (context, state) => const NotFoundScreen(),
  routes: [

    GoRoute(
      path: '/home/:page',
      name: HomeScreen.name,
      builder: (context, state) {
        final pageIndex = int.parse(state.pathParameters['page'] ?? '0');

        return HomeScreen(pageIndex: pageIndex);
      },
      routes: [
    
        GoRoute(
          path: 'movie/:id',
          name: MovieScreen.name,
          builder: (context, state) {
            final movieId = state.pathParameters['id'] ?? 'no-Id';

            return MovieScreen(movieId: movieId);
          }
          ),
        ]
      ),

      GoRoute(
        path: '/',
        redirect: ( _ , __ ) => '/home/0',
      ),

  ]
  );