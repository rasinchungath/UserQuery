import 'package:flutter/material.dart';
import 'package:user_list/screens/user_detail_screen.dart';
import 'package:user_list/services/helper_services.dart';
import 'package:user_list/utils/user_card.dart';
import '../constants/constants.dart';
import '../models/user_model.dart';
import '../utils/home_appbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<User>? users;
  bool isloaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async {
    users = await HelperServices().getUserDetails();
    if (users == null) {
      setState(() {
        isloaded = false;
      });
    } else {
      setState(() {
        isloaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: homeAppBar('UserQuery'),
        body: !isloaded
            ? const Center(
                child: CircularProgressIndicator(
                  color: kPrimaryColor,
                ),
              )
            : SingleChildScrollView(
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
                        '${users!.length} Users found',
                        style: ktextHeadstyle,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: users!.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15),
                            child: InkWell(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        UserDetailScreen(user: users![index]),
                                  ),
                                );
                              },
                              child: UserCard(
                                name: users![index].name,
                                phone: users![index].phone,
                                email: users![index].email,
                              ),
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
