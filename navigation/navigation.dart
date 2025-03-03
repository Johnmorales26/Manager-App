import 'package:go_router/go_router.dart';
import 'routes.dart';

import '../lib/views/screens.dart';

class Navigation {

  static final Navigation _instance = Navigation._internal();
  Navigation._internal();

  static Navigation get instance => _instance;

  final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: Routes.routeHome,
        builder: (context, state) => HomeScreen(),
      ),
      GoRoute(
        path: Routes.routeScanner,
        builder: (context, state) => ScannerScreen(),
      ),
      GoRoute(
        path: '${Routes.routeItemDetail}/:productId',
        builder: (context, state) {
          final String productId = state.pathParameters['productId']!;
          return ItemDetailScreen(productId: productId);
        },
      ),
    ],
  );

}