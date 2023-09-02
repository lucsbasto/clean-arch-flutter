import 'package:amigo_fiel/ui/components/components.dart';
import 'package:amigo_fiel/ui/pages/login/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  final LoginPresenter presenter;

  const LoginPage({super.key, required this.presenter});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  void _hideKeyboard() {
    final currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  @override
  void dispose() {
    super.dispose();
    widget.presenter.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            widget.presenter.isLoadingStream.listen((isLoading) {
              if (isLoading) {
                showLoading(context);
              } else {
                hideLoading(context);
              }
            });
            widget.presenter.mainErrorStream.listen((error) {
              if (error != null) {}
            });
            return GestureDetector(
              onTap: _hideKeyboard,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginHeader(),
                      Provider(
                        create: (_) => widget.presenter,
                        child: Form(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              EmailInput(),
                              SizedBox(
                                height: 20,
                              ),
                              PasswordInput(),
                              SizedBox(
                                height: 15,
                              ),
                              ForgotPassword(),
                              SizedBox(
                                height: 15,
                              ),
                              LoginButton()
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
