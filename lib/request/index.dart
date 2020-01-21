import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

// 静态成员不能访问非静态成员( static 关键字修饰的成员 不能访问 非 static 关键字修饰的成员)
// 非静态成员可以访问静态成员

class Request {
  Dio dio = new Dio();
  Request() {
    // 请求头配置
    // dio.options.headers = {
    //   "Content-Type": "application/x-www-form-urlencoded",
    //   "Authorization": 'Bearer ',
    // };
    // 域名配置
    dio.options.baseUrl = "http://192.168.0.4:7001";
    dio.options.connectTimeout = 5000; // 连接超时
    dio.options.receiveTimeout = 3000; // 接收超时

    dio.interceptors.add(InterceptorsWrapper(
      onRequest:(RequestOptions options) async { // 发送请求之前拦截器
        options.headers = {
          "Content-Type": "application/x-www-form-urlencoded",
          "Authorization": 'Bearer ' + await getToken(),
        };
        // print(options.headers);
        return options; //continue
    
      },
      onResponse:(Response response) async { // 返回响应数据拦截器
        print('---interceptors response---');
        print(response);
        return response;
      },
      onError: (DioError e) async { // 处理错误响应
        return e;
      }
    ));

  }

  getToken() async{
    print('getToken');
    var prefs = await SharedPreferences.getInstance();
    String token = await prefs.getString('token') ?? '';
    // print(token);
    return token;
  }

  // get请求
  get(String url, dynamic params) async {
    return await _requstHttp(url, params, "get");
  }

  // post请求
  post(String url, dynamic params) async {
    print('----post请求-----');
    return await _requstHttp(url, params, "post");
  }

  // 处理网络请求
  _requstHttp(String url, dynamic params, String method) async {
    Response response;
    try {
      switch (method) {
        case 'get':
          // response = await dio.get(url, queryParameters: params);
          // response = await dio.get(url, queryParameters: {"id": 12, "name": "wendu"});
          // response = await dio.get("/test?id=12&name=wendu");
        break;
        case 'post':
          response = await dio.post(url, data: params);
        break;
      }

      // print('---_requstHttp---');
      // print(response.data.toString());
      // print(response.data['code']);

      return responseFilter(response.data);

    } on DioError catch(e) {
      print('----DioError---');
      print(e);
    }
  }

  // 数据过滤
  responseFilter(Map response) {

    // print('---responseFilter---');
    // print(response);

    switch (response['code']) {
      case 502:
      case 503:
        print("----需要登录----");
        return response;
        break;
      case 500:
        return response;
      default:
        return response;
    }
  }
}