import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/constants/endpoints.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

import 'package:http/http.dart' as http;

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  Future<UserModel>? futureUser;

  Future<void> userInfo() async {
    if (Config.loggedIn == true) {
      final response = await http.get(
        Uri.parse('${EndPoints.baseUrl}auth/login'),
        headers: {
          "Content-type": "application/json",
        },
      );
      print(response.body);
      if (response.statusCode == 200) {
        print("Correct");
        Config.loggedIn = true;
        Navigator.pop(context);
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ProfilePage(),
          ),
        );
      } else {
        print("Wrong");
        print(response.statusCode);
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "نامعتبر",
              style: TextStyle(
                fontFamily: "Estedad",
              ),
            ),
          ),
        );
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Blank field is not allowed")));
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: "حساب کاربری",
          rightIcon: IconlyLight.info_circle,
          rightIconOnPressed: () {
            aboutModal(context);
          },
          leftIcon: IconlyLight.arrow_left,
          leftIconOnPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: FutureBuilder(
        future: futureUser,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            return Text(snapshot.data!.name);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
