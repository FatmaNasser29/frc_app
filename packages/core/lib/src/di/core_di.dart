import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../local_storage/shared_prefs_service.dart';

class CorePackage {
  static void init(GetIt getIt, SharedPreferences prefs) {
    getIt.registerSingleton<SharedPrefsService>(SharedPrefsService(prefs));
  }
}
