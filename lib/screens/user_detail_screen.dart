import 'package:flutter/material.dart';

import '../utils/home_appbar.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar('USER DETAILS'),
      ),
    );
  }
}