import 'dart:convert';
import 'dart:io';
// import 'dart:html';
// import ‘package:flutter/foundation.dart’;
import 'dart:io' show Platform;
// import 'dart:ui';
// import 'dart:core';
// import 'package:desktop_window/desktop_window.dart';
import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:protech_solutions/navbar.dart';
// import 'package:http/http.dart';
// import 'package:protech_solutions/signup.dart';
// import 'models/userlogin.dart';
import 'utility.dart';
// import 'dart:convert' as convert;
import 'package:dio/dio.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
// import 'package:flutter/scheduler.dart';

final usrController = TextEditingController();
final pwdController = TextEditingController();

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _State();
}

class _State extends State<Login> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: modalDialog(context),
      ),
    );
  }
}

modalDialog(BuildContext context) async {
  return await AwesomeDialog(
    context: context,
    width: 600.0,
    animType: AnimType.scale,
    dialogType: DialogType.question,
    keyboardAware: true,
    body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: <Widget>[
          Text(
            'Login to your Account',
            style: Theme.of(context).textTheme.headline6,
          ),
          //=========USERNAME===================
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              autofocus: true,
              minLines: 1,
              controller: usrController,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
              ),
            ),
          ),
          //=========PASSWORD ==================
          const SizedBox(
            height: 10,
          ),
          Material(
            elevation: 0,
            color: Colors.blueGrey.withAlpha(40),
            child: TextFormField(
              obscureText: true,
              autofocus: true,
              controller: pwdController,
              // keyboardType: TextInputType.text,
              minLines: 1,
              maxLines: 1,
              decoration: const InputDecoration(
                border: InputBorder.none,
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
              ),
            ),
          ),
          //=============SUBMIT BUTTON==================
          const SizedBox(
            height: 10,
          ),

          AnimatedButton(
            isFixedHeight: false,
            text: 'Submit',
            pressEvent: () {
              submitLogindata(context, usrController.text, pwdController.text);
              MaterialPageRoute(builder: (context) => const NavBar());
            },
          ),
          const SizedBox(
            height: 10,
          ),
          //============CLOSE BUTTON=================
          AnimatedButton(
            isFixedHeight: false,
            color: Colors.green,
            text: 'Close',
            pressEvent: () {
              Navigator.pop(context, true);
            },
          )
        ],
      ),
    ),
  ).show();
}

void submitLogindata(context, String usr, String pwd) async {
  var client = http.Client();
  try {
    final url = Uri.parse('http://localhost:9000/user/login');

    final hdrs = {'Content-Type': 'application/json'};

    Map<String, dynamic> data = {
      'username': usr,
      'password': pwd,
    };
    final jsonbody = jsonEncode(data);
    final encoding = Encoding.getByName('utf-8');

    final response = await client.post(url,
        headers: hdrs, body: jsonbody, encoding: encoding);
    final HttpSession s;

    var statuscode = response.statusCode;
    Map<String, dynamic> responseJson = jsonDecode(response.body);
    if (statuscode == 200) {
      await SessionManager().set("USERID", responseJson['id']);
      await SessionManager().set("USERNAME", responseJson['username']);
      await SessionManager().set("ROLE", responseJson['role']);
      await SessionManager().set("TOKEN", responseJson['token']);
      await SessionManager().set("USERPIC", responseJson['userpicture']);
      Navigator.pop(context, true);
      okMsg(context);
    } else {
      int? code = statuscode;
      errMsg(context, code);
    }
    // ignore: empty_catches
  } catch (ex) {}
}

void submitForm(context, String usrname, String pwd) async {
  var dio = Dio();
  try {
    dio.options.headers['content-Type'] = 'application/json;charset=UTF-8';

    Response response = await dio.post('http://localhost:9000/user/login',
        options: Options(headers: {
          HttpHeaders.contentTypeHeader: "application/json;charset=UTF-8",
        }),
        data: {'username': usrname, 'password': pwd});

    if (response.statusCode == 200) {
      Navigator.pop(context, true);
      okMsg(context);
    }
  } on DioError catch (e) {
    int? code = e.response?.statusCode;
    errMsg(context, code);
  }
}

void okMsg(context) {
  try {
    if (Platform.isIOS || Platform.isMacOS) {
      alertIOSMesage(
          context, "You have successfully logged-in to your account.");
    } else if (Platform.isAndroid) {
      alertANDROIDMesage(
          context, "You have successfully logged-in to your account.");
    }
  } catch (ex) {
    alertIOSMesage(context, "You have successfully logged-in to your account.");
  }
}

void errMsg(context, int? code) {
  if (code == 401) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context, "Wrong password.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context, "Wrong password.");
      }
    } catch (ex) {
      alertIOSMesage(context, "Wrong password.");
    }
  } else if (code == 404) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context,
            "Username is not yet registered, please click register link at the top right of the screen.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context,
            "Username is not yet registered, please click register link at the top right of the screen.");
      }
    } catch (ex) {
      alertIOSMesage(context,
          "Username is not yet registered, please click register link at the top right of the screen.");
    }
  } else if (code == 406) {
    try {
      if (Platform.isIOS || Platform.isMacOS) {
        alertIOSMesage(context,
            "You account is not yet activated, please check you Email inbox and click Activate button.");
      } else if (Platform.isAndroid) {
        alertANDROIDMesage(context,
            "You account is not yet activated, please check you Email inbox and click Activate button.");
      }
    } catch (ex) {
      alertIOSMesage(context,
          "You account is not yet activated, please check you Email inbox and click Activate button.");
    }
  }
}

// submitLogindata(context, String usr, String pwd) async {}

// class UserApi {
//   final DioClient dioClient;

//   UserApi({required this.dioClient});

//   Future<Response> addUserApi(String usrname, String pwd) async {
//     try {
//       final Response response = await dioClient.post(
//         Endpoints.users,
//         data: {
//           'usernname': usrname,
//           'password': pwd,
//         },
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Response> getUsersApi() async {
//     try {
//       final Response response = await dioClient.get(Endpoints.users);
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<Response> updateUserApi(int id, String usrname, String pwd) async {
//     try {
//       final Response response = await dioClient.put(
//         Endpoints.users + '/$id',
//         data: {
//           'username': usrname,
//           'password': pwd,
//         },
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

//   Future<void> deleteUserApi(int id) async {
//     try {
//       await dioClient.delete(Endpoints.users + '/$id');
//     } catch (e) {
//       rethrow;
//     }
//   }
// }

// class Endpoints {
//   Endpoints._();

//   // base url
//   static const String baseUrl = "http://localhost:9000/user";

//   // receiveTimeout
//   static const int receiveTimeout = 15000;

//   // connectTimeout
//   static const int connectionTimeout = 15000;

//   static const String users = '/login';
// }

// class DioClient {
// // dio instance
//   final Dio _dio;

//   DioClient(this._dio) {
//     _dio
//       ..options.baseUrl = Endpoints.baseUrl
//       ..options.connectTimeout = Endpoints.connectionTimeout
//       ..options.receiveTimeout = Endpoints.receiveTimeout
//       ..options.responseType = ResponseType.json;
//   }

// // Post:----------------------------------------------------------------------
//   Future<Response> post(
//     String url, {
//     data,
//     Map<String, dynamic>? queryParameters,
//     Options? options,
//     CancelToken? cancelToken,
//     ProgressCallback? onSendProgress,
//     ProgressCallback? onReceiveProgress,
//   }) async {
//     try {
//       final Response response = await _dio.post(
//         url,
//         data: data,
//         queryParameters: queryParameters,
//         options: options,
//         cancelToken: cancelToken,
//         onSendProgress: onSendProgress,
//         onReceiveProgress: onReceiveProgress,
//       );
//       return response;
//     } catch (e) {
//       rethrow;
//     }
//   }

// // Get:-----------------------------------------------------------------------
//   // Future<Response> get(
//   //   String url, {
//   //   Map<String, dynamic>? queryParameters,
//   //   Options? options,
//   //   CancelToken? cancelToken,
//   //   ProgressCallback? onReceiveProgress,
//   // }) async {
//   //   try {
//   //     final Response response = await _dio.get(
//   //       url,
//   //       queryParameters: queryParameters,
//   //       options: options,
//   //       cancelToken: cancelToken,
//   //       onReceiveProgress: onReceiveProgress,
//   //     );
//   //     return response;
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }

// // Put:-----------------------------------------------------------------------
//   // Future<Response> put(
//   //   String url, {
//   //   data,
//   //   Map<String, dynamic>? queryParameters,
//   //   Options? options,
//   //   CancelToken? cancelToken,
//   //   ProgressCallback? onSendProgress,
//   //   ProgressCallback? onReceiveProgress,
//   // }) async {
//   //   try {
//   //     final Response response = await _dio.put(
//   //       url,
//   //       data: data,
//   //       queryParameters: queryParameters,
//   //       options: options,
//   //       cancelToken: cancelToken,
//   //       onSendProgress: onSendProgress,
//   //       onReceiveProgress: onReceiveProgress,
//   //     );
//   //     return response;
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }

// // Delete:--------------------------------------------------------------------
//   // Future<dynamic> delete(
//   //   String url, {
//   //   data,
//   //   Map<String, dynamic>? queryParameters,
//   //   Options? options,
//   //   CancelToken? cancelToken,
//   //   ProgressCallback? onSendProgress,
//   //   ProgressCallback? onReceiveProgress,
//   // }) async {
//   //   try {
//   //     final Response response = await _dio.delete(
//   //       url,
//   //       data: data,
//   //       queryParameters: queryParameters,
//   //       options: options,
//   //       cancelToken: cancelToken,
//   //     );
//   //     return response.data;
//   //   } catch (e) {
//   //     rethrow;
//   //   }
//   // }
// }

// class DioExceptions implements Exception {
//   late String message;

//   DioExceptions.fromDioError(DioError dioError) {
//     switch (dioError.type) {
//       case DioErrorType.cancel:
//         message = "Request to API server was cancelled";
//         break;
//       case DioErrorType.connectTimeout:
//         message = "Connection timeout with API server";
//         break;
//       case DioErrorType.receiveTimeout:
//         message = "Receive timeout in connection with API server";
//         break;
//       case DioErrorType.response:
//         message = _handleError(
//           dioError.response?.statusCode,
//           dioError.response?.data,
//         );
//         break;
//       case DioErrorType.sendTimeout:
//         message = "Send timeout in connection with API server";
//         break;
//       case DioErrorType.other:
//         if (dioError.message.contains("SocketException")) {
//           message = 'No Internet';
//           break;
//         }
//         message = "Unexpected error occurred";
//         break;
//       default:
//         message = "Something went wrong";
//         break;
//     }
//   }

//   String _handleError(int? statusCode, dynamic error) {
//     switch (statusCode) {
//       case 400:
//         return 'Bad request';
//       case 401:
//         return 'Unauthorized';
//       case 403:
//         return 'Forbidden';
//       case 404:
//         return error['message'];
//       case 500:
//         return 'Internal server error';
//       case 502:
//         return 'Bad gateway';
//       default:
//         return 'Oops something went wrong';
//     }
//   }

//   @override
//   String toString() => message;
// }

// class UserRepository {
//   final UserApi userApi;

//   UserRepository(this.userApi);

//   Future<List<Userlogin>> getUsersRequested() async {
//     try {
//       final response = await userApi.getUsersApi();
//       final users = (response.data['data'] as List)
//           .map((e) => Userlogin.fromJson(e))
//           .toList();
//       return users;
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       throw errorMessage;
//     }
//   }

//   Future<Userlogin> addNewUserRequested(String name, String job) async {
//     try {
//       final response = await userApi.addUserApi(name, job);
//       return Userlogin.fromJson(response.data);
//     } on DioError catch (e) {
//       final errorMessage = DioExceptions.fromDioError(e).toString();
//       throw errorMessage;
//     }
//   }

//   // Future<Userlogin> updateUserRequested(int id, String name, String job) async {
//   //   try {
//   //     final response = await userApi.updateUserApi(id, name, job);
//   //     return Userlogin.fromJson(response.data);
//   //   } on DioError catch (e) {
//   //     final errorMessage = DioExceptions.fromDioError(e).toString();
//   //     throw errorMessage;
//   //   }
//   // }

//   // Future<void> deleteNewUserRequested(int id) async {
//   //   try {
//   //     await userApi.deleteUserApi(id);
//   //   } on DioError catch (e) {
//   //     final errorMessage = DioExceptions.fromDioError(e).toString();
//   //     throw errorMessage;
//   //   }
//   // }
// }

// class HomeController {
//   // --------------- Repository -------------
//   final userRepository = getIt.get<UserRepository>();

//   // -------------- Textfield Controller ---------------
//   // final nameController = TextEditingController();
//   // final jobController = TextEditingController();

//   // -------------- Local Variables ---------------
//   final List<Userlogin> newUsers = [];

//   // -------------- Methods ---------------

//   Future<List<Userlogin>> getUsers() async {
//     final users = await userRepository.getUsersRequested();
//     return users;
//   }

//   Future<Userlogin> addNewUser() async {
//     final newlyAddedUser = await userRepository.addNewUserRequested(
//       usernameController.text,
//       passwordController.text,
//     );
//     newUsers.add(newlyAddedUser);
//     return newlyAddedUser;
//   }

  // Future<Userlogin> updateUser(int id, String name, String job) async {
  //   final updatedUser = await userRepository.updateUserRequested(
  //     id,
  //     name,
  //     job,
  //   );
  //   newUsers[id] = updatedUser;
  //   return updatedUser;
  // }

  // Future<void> deleteNewUser(int id) async {
  //   await userRepository.deleteNewUserRequested(id);
  //   newUsers.removeAt(id);
  // }
// }
