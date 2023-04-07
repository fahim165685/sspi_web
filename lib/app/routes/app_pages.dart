import 'package:get/get.dart';

import '../../helper/widget_tree.dart';
import '../modules/panel_right/from/components/from_widget_tree.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const initial = Routes.FROM_WIDGET_TREE; //Routes.WIDGET_TREE;

  static final routes = [
    GetPage(
      name: _Paths.WIDGET_TREE,
      page: () => const WidgetTree(),
    ),
    GetPage(
      name: _Paths.FROM_WIDGET_TREE,
      page: () => FromWidgetTree(),
    ),
  ];
}
