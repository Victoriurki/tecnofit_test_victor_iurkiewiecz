import 'package:get/get.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/auth/auth_manager.dart';

class LoginPageController extends GetxController with StateMixin {
  RxBool keepMeConnected = false.obs;
  RxBool isLoading = false.obs;
  RxBool showError = false.obs;
  String errorMessage = '';

  Future<bool> login({
    required String email,
    required String password,
  }) async {
    isLoading.value = true;
    showError.value = false;

    final result = await AuthServices.login(email: email, password: password);
    isLoading.value = false;

    if (!result.hasError) {
      return true;
    } else {
      showError.value = true;
      errorMessage = (result.error is Exception)
          ? (result.error as Exception).toString()
          : 'Erro desconhecido';
      return false;
    }
  }
}
