import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:wilde_buren/config/app_config.dart';
import 'package:wilde_buren/config/theme/custom_colors.dart';
import 'package:wilde_buren/views/home/home_view.dart';
import 'package:wilde_buren/widgets/custom_scaffold.dart';
import 'package:wildlife_api_connection/auth_api.dart';
import 'package:wildlife_api_connection/models/user.dart';

class VerificationView extends StatefulWidget {
  const VerificationView({super.key, required this.email});
  final String email;
  @override
  State<VerificationView> createState() => _VerificationViewState();
}

class _VerificationViewState extends State<VerificationView> {
  final FocusNode pincodeFocusNode = FocusNode();
  final TextEditingController _verificationCodeController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    pincodeFocusNode.requestFocus();
  }

  void checkVerificationCode() async {
    try {
      User user = await AuthApi(AppConfig.shared.apiClient)
          .authorize(widget.email, _verificationCodeController.text);
      debugPrint(user.name);
      if (!mounted) return;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const HomeView(),
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      automaticallyImplyLeading: true,
      body: ListView(
        children: [
          const SizedBox(
            height: 50,
          ),
          const SizedBox(height: 50),
          PinCodeTextField(
            pinTheme: PinTheme(
              shape: PinCodeFieldShape.box,
              borderRadius: BorderRadius.circular(5),
              fieldHeight: 50,
              fieldWidth: 40,
              activeFillColor: CustomColors.light200,
              inactiveFillColor: CustomColors.light200,
              selectedFillColor: CustomColors.light250,
            ),
            appContext: context,
            length: 6,
            focusNode: pincodeFocusNode,
            controller: _verificationCodeController,
            onCompleted: (p0) {
              checkVerificationCode();
            },
          ),
        ],
      ),
    );
  }
}
