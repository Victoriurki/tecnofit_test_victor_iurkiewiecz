import 'package:get_it/get_it.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/remote_client/remote_client_adapter.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/secure_storage/secure_storage_adapter.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/features/login/common/login_page_controller.dart';

class AppGetIt {
  static final instance = GetIt.instance;

  static void setUp() {
    //Clients and Adapters
    _setupClientsAndAdapters();

    //Datasources
    _setupDatasources();

    //Repositories
    _setupRepositories();

    //UseCases
    _setupUseCases();

    //Controllers
    _setupControllers();
  }

  static void _setupClientsAndAdapters() {
    instance.registerFactory<RemoteClientAdapter>(
        () => RemoteClientDioImplementation());
    instance.registerFactory<SecureStorageAdapter>(
        () => SecureStorageAdapterImplementation());
  }

  static void _setupDatasources() {}

  static void _setupRepositories() {}

  static void _setupUseCases() {}

  static void _setupControllers() {
    instance.registerLazySingleton<LoginPageController>(
        () => LoginPageController());
  }
}
