import 'package:flutter/material.dart';

import 'login_screen.dart';

class splashscreen extends StatefulWidget {
  const splashscreen({
    Key? key,
  }) : super(key: key);

  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {
  @override
  void didChangeDependencies() async {
    Future.delayed(const Duration(seconds: 3), () async {
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();

      // final SharedPrefsLocalStorageCaller shared =
      //     SharedPrefsLocalStorageCaller(sharedPreferences: sharedPreferences);

      // await shared
      //     .restoreUserData(
      //   key: 'user',
      // )
      // .then((user) {
      // debugPrint('user=$user');
      // if (user != null) {
      // Navigator.of(context).pushAndRemoveUntil(
      //     MaterialPageRoute(builder: (context) =>  Homescreen()),
      //     (route) => false);
      // } else {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const Login()),
          (route) => false);
      // }
    });
    // });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Image.network(
          "https://png.pngtree.com/png-clipart/20230328/original/pngtree-international-women-s-day-8-march-with-frame-of-flower-and-png-image_9006378.png"),
    );
  }
}
