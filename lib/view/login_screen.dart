
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../customs/Textformfieldcustom.dart';
import 'Homescreen.dart';
import 'Signup.dart';

final eyeofpassword = StateProvider<bool>((ref) {
  return true; // initial value of provider
});

class Login extends HookConsumerWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final gmailcontroller = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    return MaterialApp(
      home: Scaffold(
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(50),
                child: Column(
                  children: [
                    const ListTile(
                      title: Text("welcome back!",
                          style: TextStyle(
                              fontSize: 50, fontStyle: FontStyle.italic)),
                      subtitle: Text("log in to your existing account",
                          style: TextStyle(
                            fontSize: 15,
                          )),
                    ),
                    Image.network(
                      "https://png.pngtree.com/png-clipart/20230328/original/pngtree-international-women-s-day-8-march-with-frame-of-flower-and-png-image_9006378.png",
                      height: 500,
                      width: 400,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [Text("Email Address")]),
                    Textformfieldcustom(
                      hintText: "e.g name @example.com",
                      controller: gmailcontroller,
                      border: const OutlineInputBorder(),
                      validator: (value) {
                        if (value == null ||
                            value.isEmpty ||
                            !value.contains("@") ||
                            value.length < 5) {
                          return "Please enter your gmail";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: const [Text("password")]),
                    Consumer(builder: (context, ref, child) {
                      debugPrint('textFormfiled');
                      final visibility = ref.watch(eyeofpassword);
                      return Textformfieldcustom(
                          hintText: "e.g******************",
                          controller: passwordController,
                          obscureText: visibility,
                          suffixIcon: IconButton(
                              onPressed: () {
                                // change value of provider every time i clicked on icon
                                ref
                                    .watch(eyeofpassword.notifier)
                                    .update((state) => !state);
                                // ref.watch(eyeofpassword.notifier).state = !visibility;
                              },
                              icon:
                                  visibility // if(visibility == true) {icon(icons.visbility)}else{icons(Icons.visbility_off)}
                                      ? const Icon(Icons.visibility)
                                      : const Icon(Icons.visibility_off)),
                          border: const OutlineInputBorder(),
                          validator: (value) {
                            if (value == null ||
                                value.isEmpty ||
                                value.length < 8) {
                              return "your password must be at least 8 individuals";
                            }
                            return null;
                          });
                    }),
                    Row(
                      children: [
                        Checkbox(value: true, onChanged: (v) {}),
                        const Text("remember me"),
                        const SizedBox(
                          width: 600,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text("forgot password"),
                        )
                      ],
                    ),
                    ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.push(context, MaterialPageRoute(
                              builder: (context) {
                                return Homescreen();
                              },
                            ));
                          }
                        },
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [Text("log in")],
                          ),
                        )),
                    const SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        CircleAvatar(
                          backgroundColor: Colors.blue,
                          radius: 30,
                          child: Text(
                            "F",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.red,
                          radius: 30,
                          child: Text(
                            "G",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 100,
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      const Text(
                        "Dont have an account",
                        style: TextStyle(color: Colors.grey),
                      ),
                      TextButton(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return  const Signup();
                            }));
                          },
                          child: const Text("Sign up"))
                    ])
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
