import 'package:catalog/utils/routes.dart';
import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String namee = "";
  final _formkey = GlobalKey<FormState>();
  movetohome(BuildContext context) async {
    if (_formkey.currentState!.validate()) {
      setState(() {
        change = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushNamed(context, MyRoutes.homeRoute);
      setState(() {
        change = false;
      });
    }
  }

  bool change = false;
  Widget build(BuildContext context) {
    return Material(
        color: context.canvasColor,
        child: SingleChildScrollView(
            child: Form(
                key: _formkey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/login.png",
                      fit: BoxFit.cover,
                      height: 400,
                    ),
                    Text(
                      "Welcome " + namee,
                      style: TextStyle(
                        color: Color.fromARGB(255, 21, 20, 19),
                        fontSize: 29,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 14.0, horizontal: 500.0),
                        child: Column(
                          children: [
                            TextFormField(
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.amber,
                                hintText: "Enter name",
                                labelText: "Name",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Name cannot be empty";
                                }
                                return null;
                              },
                              onChanged: (value) {
                                namee = value;
                                setState(() {
                                  // changes state of widget again by calling build method!
                                });
                              }, // return  string
                            ),
                            TextFormField(
                              obscuringCharacter: "^",
                              obscureText: true,
                              style: TextStyle(color: Colors.black),
                              decoration: InputDecoration(
                                fillColor: Colors.amber,
                                hintText: " Enter Password",
                                labelText: "Password",
                              ),
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "enter the password";
                                } else if (value.length < 6) {
                                  return "password length must be 6 atleast!";
                                }
                                return null;
                              },
                            ),
                            SizedBox(
                              height: 40,
                            ),
                            Material(
                              borderRadius: BorderRadius.circular(
                                  change == true ? 50 : 8),
                              child: InkWell(
                                highlightColor: Colors.teal,
                                splashColor: Colors.blueAccent,
                                hoverColor: Colors.amberAccent,
                                onTap: () => movetohome(context),
                                child: AnimatedContainer(
                                  duration: Duration(seconds: 2),
                                  width: change ? 150 : 100,
                                  height: 50,
                                  alignment: Alignment.center,
                                  child: change
                                      ? Icon(
                                          color: Colors.pinkAccent,
                                          Icons.done,
                                        )
                                      : Text(
                                          "Login",
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 13, 5, 5),
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18,
                                          ),
                                        ),
                                ),
                              ),
                            ),
                          ],
                        ))
                  ],
                ))));
  }
}
