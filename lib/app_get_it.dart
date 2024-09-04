import 'package:get_it/get_it.dart';

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

  static void _setupClientsAndAdapters() {}

  static void _setupDatasources() {}

  static void _setupRepositories() {}

  static void _setupUseCases() {}

  static void _setupControllers() {}
}
