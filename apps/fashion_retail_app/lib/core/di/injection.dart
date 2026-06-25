import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:core/core.dart';
import 'package:networking/networking.dart';
import 'package:auth/auth.dart';
import '../../config/app_config_impl.dart';
import 'injection.config.dart';

final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async {
  // 1. Initialize core storage & packages
  final prefs = await SharedPreferences.getInstance();
  CorePackage.init(getIt, prefs);

  // 2. Inject application specific branding config contract
  getIt.registerSingleton<AppConfig>(FashionAppConfig());

  // 3. Initialize networking configuration
  configureNetworkingDependencies(getIt);

  // 4. Initialize authentication feature configuration
  configureAuthDependencies(getIt);

  // 5. Bootstrap local app dependency injection
  await getIt.init();
}
