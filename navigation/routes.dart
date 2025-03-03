class Routes {

  static final Routes _instance = Routes._internal();
  Routes._internal();

  static Routes get instance => _instance;

  static const String routeHome = '/';
  static const String routeItemDetail = '/ItemDetailRoute';
  static const String routeScanner = '/ScannerRoute';

}