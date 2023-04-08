import 'package:flutter/material.dart';
import 'package:user_list/screens/user_detail_screen.dart';
import 'package:user_list/utils/user_card.dart';
import '../constants/constants.dart';
import '../utils/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar('UserQuery'),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              left: 15,
              right: 15,
              top: 10,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  '30 Users found',
                  style: ktextHeadstyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const ScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 15),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const UserDetailScreen(),
                            ),
                          );
                        },
                        child: const UserCard(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
