import 'package:flutter/material.dart';
import 'package:user_list/constants/constants.dart';
import '../models/user_model.dart';
import '../utils/home_appbar.dart';

class UserDetailScreen extends StatelessWidget {
  const UserDetailScreen({super.key, required this.user});
  final User user;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar('USER DETAILS'),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 10, top: 10, bottom: 10),
                child: RawMaterialButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  fillColor: kPrimaryColor,
                  shape: const CircleBorder(),
                  child: const Icon(
                    Icons.arrow_back,
                    color: kWhiteBGColor,
                    size: 30.0,
                  ),
                ),
              ),
              Container(
                height: 560,
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
                  borderRadius: const BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  border: Border.all(
                    width: 0.3,
                    color: kBorderColor,
                  ),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 35,
                    ),
                    const Icon(
                      Icons.account_circle,
                      color: kPrimaryColor,
                      size: 110,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      user.name,
                      style: const TextStyle(
                        letterSpacing: 0.8,
                        color: kPrimaryColor,
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      'User name: ${user.username}',
                      style: kDetailPageStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Email: ${user.email}',
                      style: kDetailPageStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Phone: ${user.phone}',
                      style: kDetailPageStyle,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Website: ${user.website}',
                      style: kDetailPageStyle,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${user.address.street}, ',
                            style: kDetailPageAdrsStyle),
                        Text('${user.address.suite},',
                            style: kDetailPageAdrsStyle),
                      ],
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('${user.address.city}, ',
                            style: kDetailPageAdrsStyle),
                        Text(user.address.zipcode, style: kDetailPageAdrsStyle),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
