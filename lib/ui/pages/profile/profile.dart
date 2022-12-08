import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:landina_coupon/constants/config.dart';
import 'package:landina_coupon/models/user.dart';
import 'package:landina_coupon/services/api.services.dart';
import 'package:landina_coupon/ui/components/modals/about.modal.dart';
import 'package:landina_coupon/ui/widgets/appbar/appbar.dart';

// String Extension for Capitalize
import 'package:landina_coupon/ui/extensions/string.extension.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  ApiService client = ApiService();

  @override
  void initState() {
    super.initState();
    Config.inProfile = true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(65),
        child: LandinaAppbar(
          title: AppLocalizations.of(context)!.account.capitalize(),
          rightIcon: IconlyLight.logout,
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
        future: client.userInfo(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasData) {
            // return Text(snapshot.data!.name);
            UserModel? userInfo = snapshot.data;
            print(userInfo?.user?.name);
          } else if (snapshot.hasError) {
            return Text('${snapshot.error}');
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Color(0xff3B3B3B),
            ),
          );
        },
      ),
    );
  }
}
