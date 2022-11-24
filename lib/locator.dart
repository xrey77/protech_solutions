import 'package:get_it/get_it.dart';
import 'getsession.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerLazySingleton<GetsSession>(() => GetsSession.uname);
}
