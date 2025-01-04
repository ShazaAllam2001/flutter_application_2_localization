import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_application_2_localization/shopping_page/shopping_page.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _visible = true;

  bool hiddenPassword1 = true;
  bool hiddenPassword2 = true;

  togglePassword1() {
    hiddenPassword1 = !hiddenPassword1;
    setState(() {

    });
  }

  togglePassword2() {
    hiddenPassword2 = !hiddenPassword2;
    setState(() {

    });
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController confPassController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(tr("app_bar_title")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: AnimatedOpacity(
          opacity: _visible ? 1.0 : 0.0,
          duration: const Duration(seconds: 2),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Image.asset(
                  "assets/images/shopping.png",
                  height: 100,
                ),
          
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: nameController,
                    validator: (value) {
                      if (value == null) {
                        return tr("full_name_required");
                      }
                      else if(value[0] != value[0].toUpperCase()) {
                        return tr("full_name_error");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr("full_name_title"),
                    )
                  ),
                ),

                 Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: emailController,
                    validator: (value) {
                      if (value == null) {
                        return tr("email_required");
                      }
                      else if(!value.contains("@")) {
                        return tr("email_error");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr("email_title"),
                    )
                  ),
                ),
          
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: passController,
                    obscureText: hiddenPassword1,
                    validator: (value) {
                      if (value == null) {
                        return tr("password_required");
                      }
                      else if (value.length < 6) {
                        return tr("password_error");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr("password_title"),
                      suffixIcon: IconButton(
                        onPressed: togglePassword1, 
                        icon: Icon(hiddenPassword1? Icons.visibility_off : Icons.visibility),
                      )
                    )
                  ),    
                ),
                
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: TextFormField(
                    controller: confPassController,
                    obscureText: hiddenPassword2,
                    validator: (value) {
                      if (value == null) {
                        return tr("confirm_password_required");
                      }
                      else if (passController.text != value) {
                        return tr("confirm_password_error");
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: tr("confirm_password_title"),
                      suffixIcon: IconButton(
                        onPressed: togglePassword2, 
                        icon: Icon(hiddenPassword2? Icons.visibility_off : Icons.visibility),
                      )
                    )
                  ),
                ),

                SizedBox(height: 30),
          
                ElevatedButton(
                  onPressed: () {
                    debugPrint(nameController.text);
                    debugPrint(emailController.text);
                    debugPrint(passController.text);
                    debugPrint(confPassController.text);

                    if (formKey.currentState!.validate()) {
                      loginDialog();
                    }
                    else {
                      SnackBar snackBar = SnackBar(
                        content: Text(tr("error_input")),
                        duration: Duration(seconds: 2),
                        action: SnackBarAction(
                          label: "ok",
                          onPressed: () {},
                        ),
                      );
          
                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }
                  },
                  child: Text(tr("sign_up")),
                )
              ]
            )
          )
        ),
      ),

      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.language),
        onPressed: () {
          if (context.locale == Locale("ar", "EG")) {
            context.setLocale(Locale("en", "US"));
          }
          else {
            context.setLocale(Locale("ar", "EG"));
          }
        }),
    );
  }

  Future<void> loginDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(tr("sign_up")),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text(tr("create_account")),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text(tr("close")),
              onPressed: () {
                setState(() { // page transistion for sign up page
                  _visible = !_visible;
                });

                Navigator.of(context).pop();
                Navigator.of(context).push(
                  PageTransition( // page transistion for shopping page
                    type: PageTransitionType.fade,
                    childBuilder: (context) => ShoppingPage()
                  )
                );
              },
            ),
          ],
        );
      },
    );
  }
}
