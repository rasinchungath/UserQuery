import 'package:flutter/material.dart';
import '../constants/constants.dart';

class UserCard extends StatelessWidget {
  const UserCard({
    required this.name,
    required this.email,
    required this.phone,
  });
  final String name;
  final String email;
  final String phone;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.3,
          color: kBorderColor,
        ),
        borderRadius: BorderRadius.circular(10),
        color: kWhiteBGColor,
        boxShadow: const [
          BoxShadow(
            offset: Offset(1, 7),
            blurRadius: 5,
            color: kShadowColor,
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 79,
            height: 80,
            decoration: const BoxDecoration(
                color: Color(0xFFF3F3F3),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10))),
            child: const Icon(
              Icons.account_box_rounded,
              size: 40,
              color: kPrimaryColor,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: ktextTitleSytle,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  email,
                  style: ktextSytle,
                ),
                const SizedBox(
                  height: 3,
                ),
                Text(
                  phone,
                  style: ktextSytle,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
