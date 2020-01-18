
import './../pages/login/index.dart';
import './../pages/home/index.dart';
import './../pages/my/index.dart';
import './../pages/navigat/index.dart';
import './../pages/my/order/index.dart';
import './../pages/my/order/details/index.dart';
import './../pages/my/repairs/index.dart';
import './../pages/list/index.dart';
import './../pages/list/good/index.dart';
class Router {
  static config() {
    return {
      "/login": (context) => LoginPages(),
      "/home": (context) => HomePages(),
      "/my": (context) => MyPages(),
      '/list':(context) => ListPages(),
      "/navigat": (context) => MyAppPages(),
      "/my/repairs": (context) => RepairsPages(),
      "/my/order": (context) => OrderPages(),
      '/my/order/details': (context) => OrderDetailsPages(),
      '/list/goods': (context) => GoogListPages()
    };
  }
}