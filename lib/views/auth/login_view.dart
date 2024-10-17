import 'package:flutter/material.dart';
import 'package:wilde_buren/config/app_config.dart';
import 'package:wilde_buren/config/theme/custom_theme.dart';
import 'package:wilde_buren/views/auth/verification_view.dart';
import 'package:wilde_buren/widgets/custom_scaffold.dart';
import 'package:wildlife_api_connection/auth_api.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  @override
  void initState() {
    super.initState();
  }

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  login() async {
    if (_formKey.currentState!.validate()) {
      final email = _emailController.text;

      AuthApi(AppConfig.shared.apiClient).authenticate('Wilde buren', email);

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => VerificationView(
            email: email,
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
        body: Form(
      key: _formKey,
      child: ListView(
        children: [
          const SizedBox(height: 50),
          TextFormField(
            controller: _emailController,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Email*',
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Field cannot be empty.';
              }

              String pattern = r'^[\w-\.]+@([\w-]+\.)+[\w]{2,4}$';
              RegExp regex = RegExp(pattern);

              if (!regex.hasMatch(value)) {
                return 'Give a valid email address.';
              }
              return null;
            },
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: login,
            child: Text(
              'Inloggen',
              style: CustomTheme(context).themeData.textTheme.titleSmall,
            ),
          ),
        ],
      ),
    ));
  }
}
