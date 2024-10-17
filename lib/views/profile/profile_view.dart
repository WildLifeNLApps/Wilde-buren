import 'package:flutter/material.dart';
import 'package:wilde_buren/widgets/custom_scaffold.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return const CustomScaffold(body: Center(child: Text('Profile')));
  }
}
