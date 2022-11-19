// import 'package:dio/dio.dart';
// import 'package:get_it/get_it.dart';

// import 'login.dart';

// final getIt = GetIt.instance;

// Future<void> setup() async {
//   getIt.registerSingleton(Dio());
//   getIt.registerSingleton(DioClient(getIt<Dio>()));
//   getIt.registerSingleton(UserApi(dioClient: getIt<DioClient>()));
//   getIt.registerSingleton(UserRepository(getIt.get<UserApi>()));
// }
