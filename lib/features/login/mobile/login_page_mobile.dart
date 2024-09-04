import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get_it/get_it.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/routes/app_routes.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/routes/router_generator.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/core/widgets/app_scroll_and_expanded.dart';
import 'package:tecnofit_test_victor_iurkiewiecz/features/login/common/login_page_controller.dart';

class LoginPageMobile extends StatefulWidget {
  const LoginPageMobile({super.key});

  @override
  State<LoginPageMobile> createState() => _LoginPageMobileState();
}

class _LoginPageMobileState extends State<LoginPageMobile> {
  @override
  void initState() {
    SystemChrome.setPreferredOrientations(
      [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ],
    );
    super.initState();
  }

  final LoginPageController _controller = GetIt.instance();

  final _userTextController = TextEditingController();

  final _passwordTextController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  late BuildContext pageContext;

  @override
  Widget build(BuildContext context) {
    String buttonText = _controller.isLoading.value ? 'Entrando' : 'Entrar';
    pageContext = context;
    return Obx(() => Scaffold(
          body: SafeArea(
            child: AppScrollAndExpanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 24,
                    right: 24,
                  ),
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(
                      maxWidth: 450,
                    ),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: <Widget>[
                          if (_controller.showError.value)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 42,
                                ),
                                Center(
                                  child: Text(
                                    'Credenciais inválidas\n${_controller.errorMessage}',
                                    style: const TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 16,
                                ),
                              ],
                            ),
                          if (!_controller.showError.value)
                            const SizedBox(
                              height: 42,
                            ),
                          TextFormField(
                            autofocus: true,
                            controller: _userTextController,
                            decoration: const InputDecoration(
                              labelText: 'E-mail',
                              hintText: 'Insira seu e-mail',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite o e-mail ou nome de usuário';
                              }
                              return null;
                            },
                            readOnly: _controller.isLoading.value,
                            // onTapOutside: (p0) =>
                            //     _formKeyEmail.currentState!.validate(),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          TextFormField(
                            autofocus: true,
                            controller: _passwordTextController,
                            decoration: const InputDecoration(
                              labelText: 'Senha',
                              hintText: 'Insira sua senha',
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Digite a senha';
                              }
                              return null;
                            },
                            obscureText: true,
                            readOnly: _controller.isLoading.value,
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          SizedBox(
                            height: 48,
                            width: double.infinity,
                            child: ElevatedButton(
                              style: ButtonStyle(
                                shape: WidgetStatePropertyAll<
                                    RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(4),
                                  ),
                                ),
                              ),
                              child: _controller.isLoading.value
                                  ? _childIsLoading(buttonText)
                                  : _child(buttonText),
                              onPressed:
                                  _controller.isLoading.value ? () {} : _login,
                            ),
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ));
  }

  Future<void> _login() async {
    if (!_controller.isLoading.value && _formKey.currentState!.validate()) {
      if (await _controller.login(
        email: _userTextController.text.trim(),
        password: _passwordTextController.text,
      )) {
        RouterGenerator.router.pushReplacementNamed(AppRoutes.home);
      }
    }
  }
}

_child(String text) {
  return _textButton(text);
}

_childIsLoading(String text) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      _textButton(text),
      const SizedBox(
        width: 8,
      ),
      const SizedBox(
        width: 19,
        height: 19,
        child: CircularProgressIndicator(
          color: Colors.blue,
          strokeWidth: 2,
        ),
      ),
    ],
  );
}

_textButton(String text) {
  return Text(
    text,
    style: const TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 16,
    ),
  );
}
