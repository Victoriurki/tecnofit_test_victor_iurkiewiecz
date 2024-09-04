import 'package:get_it/get_it.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/adapters/remote_client/remote_client_adapter.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/auth/session_manager.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/constants/urls/url_constants.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/generics/resource.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/routes/router_generator.dart';

class AuthServices {
  static final _remoteClient = GetIt.instance<RemoteClientAdapter>();

  static Future<Resource<void, Exception>> login({
    required String email,
    required String password,
  }) async {
    try {
      String url = '${UrlConstants.baseUrl}login';
      final body = {"email": email, "password": password};

      final result = await _remoteClient.post(url: url, body: body);

      if (result.hasError) {
        return Resource.failed(error: Exception(result.error.toString()));
      }

      String token = result.data['token'];

      await SessionManager().saveSession(
        token: token,
        password: password,
        email: email,
      );

      return Resource.success();
    } catch (e) {
      return Resource.failed(error: Exception(e.toString()));
    }
  }

  static Future<void> logout() async {
    await SessionManager().clearSession();
    RouterGenerator.router.pushReplacementNamed('/');
  }
}
