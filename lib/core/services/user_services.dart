import 'package:get/get.dart';
import 'package:get_it/get_it.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/remote_client/remote_client_adapter.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/domain/entities/user_entity.dart';

class UserServices {
   static final _remoteClient = GetIt.instance<RemoteClientAdapter>();
  static Rx<UserEntity?> userData = Rxn<UserEntity>();

  static Future<void> fetchUserData() async {
    
    final result = await _remoteClient.get(url: '/user');
    // if (!result.hasError) {
    //   userData.value = UserEntity.fromJson(result.data);
    // }
  }
}
