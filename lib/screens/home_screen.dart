import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:user_list/screens/user_detail_screen.dart';
import 'package:user_list/utils/user_card.dart';
import '../constants/constants.dart';
import '../controller/user_provider.dart';
import '../models/user_model.dart';
import '../utils/home_appbar.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar('UserQuery'),
        body: RefreshIndicator(
          color: kPrimaryColor,
          onRefresh: () => context.read<UserProvider>().fetchUser(),
          child: FutureBuilder<List<User>?>(
            future: context.read<UserProvider>().fetchUser(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var userslist = snapshot.data;
                return SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 10,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${userslist!.length} Users found',
                          style: ktextHeadstyle,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          shrinkWrap: true,
                          physics: const ScrollPhysics(),
                          itemCount: userslist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 15),
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => UserDetailScreen(
                                          user: userslist[index]),
                                    ),
                                  );
                                },
                                child: UserCard(
                                  name: userslist[index].name,
                                  email: userslist[index].email,
                                  phone: userslist[index].phone,
                                ),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                );
              } else if (snapshot.hasError) {
                return Center(
                  child: Text('Error: ${snapshot.error}'),
                );
              } else {
                return const Center(
                  child: CircularProgressIndicator(
                    color: kPrimaryColor,
                  ),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
