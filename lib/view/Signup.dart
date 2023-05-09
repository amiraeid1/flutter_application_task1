import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../customs/Textformfieldcustom.dart';
import 'Verificationscreen.dart';
import 'login_screen.dart';

final eyeofpassword = StateProvider<bool>((ref) {
  return true; // initial value of provider
});

class Signup extends HookConsumerWidget {
  const Signup({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final passwordController = useTextEditingController();
    final gmailcontroller = useTextEditingController();
    final nameconroller = useTextEditingController();
    final _formKey = useMemoized(() => GlobalKey<FormState>());
    return Scaffold(
        body: Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(50),
          child: Column(
            children: [
              const ListTile(
                title: Text("Sign up",
                    style:
                        TextStyle(fontSize: 50, fontStyle: FontStyle.italic)),
                subtitle: Text("please enter your information below to sign up",
                    style: TextStyle(
                      fontSize: 15,
                    )),
              ),
              Image.network(
                "https://png.pngtree.com/png-clipart/20230328/original/pngtree-international-women-s-day-8-march-with-frame-of-flower-and-png-image_9006378.png",
                height: 500,
                width: 400,
              ),
              SizedBox(
                width: 100,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  const Text("name"),
                  Textformfieldcustom(
                    hintText: "please enter your name",
                    controller: nameconroller,
                    border: const OutlineInputBorder(),
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 5) {
                        return "please enter your name";
                      }
                      return null;
                    },
                  )
                ]),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text("Email"),
                Textformfieldcustom(
                  hintText: "please enter your email",
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
              ]),
              const SizedBox(height: 20),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                const Text("password"),
                Consumer(builder: (context, ref, child) {
                  debugPrint('textFormfiled');
                  final visibility = ref.watch(eyeofpassword);
                  return Textformfieldcustom(
                      hintText: "Please enter your password",
                      controller: passwordController,
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
                })
              ]),
              ElevatedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                      return Verificationscreen();
                    }));
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [Text("sign up")],
                  )),
              const SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  const Text("already have an account"),
                  TextButton(
                      onPressed: () {
                        Navigator.pop(context,
                            MaterialPageRoute(builder: (context) {
                          return const Login();
                        }));
                      },
                      child: const Text("sign in"))
                ],
              )
            ],
          ),
        ),
      ),
    ));
  }
}
