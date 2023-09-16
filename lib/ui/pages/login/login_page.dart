import 'package:amigo_fiel/presentation/presenters/getx_login_presenter.dart';
import 'package:amigo_fiel/ui/components/components.dart';
import 'package:amigo_fiel/ui/pages/login/login.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final GetxLoginPresenter presenter;

  const LoginPage({super.key, required this.presenter});

  @override
  Widget build(BuildContext context) {
    void hideKeyboard() {
      final currentFocus = FocusScope.of(context);
      if (!currentFocus.hasPrimaryFocus) {
        currentFocus.unfocus();
      }
    }

    return SafeArea(
      child: Scaffold(
        body: Builder(
          builder: (context) {
            presenter.isLoading.listen((isLoading) {
              if (isLoading) {
                showLoading(context);
              } else {
                hideLoading(context);
              }
            });
            presenter.mainError.listen((error) {
              if (error != null) {}
            });
            return GestureDetector(
              onTap: hideKeyboard,
              child: SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const LoginHeader(),
                      Form(
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
