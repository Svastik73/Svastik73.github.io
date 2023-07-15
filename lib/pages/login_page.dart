import 'dart:js_util';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Material(
        color: Colors.white,
        child: Column(
          children: [
            Image.asset(
              "assets/images/login.png",
              fit: BoxFit.cover,
              height: 400,
            ),
            Text(
              "Welcome",
              style: TextStyle(
                color: Colors.green,
                fontSize: 25,
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
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        print("hello");
                      },
                      child: Text("Login"),
                      style: TextButton.styleFrom(),
                    ),
                  ],
                ))
          ],
        ));
  }
}
