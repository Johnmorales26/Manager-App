import 'package:go_router/go_router.dart';
import 'package:manager_app/navigation/routes.dart';
import 'package:manager_app/views/home_screen.dart';
import 'package:manager_app/views/item_detail_screen.dart';
import 'package:manager_app/views/scanner_screen.dart';

class Navigation {
  GoRouter navigation() {
    return GoRouter(
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
}