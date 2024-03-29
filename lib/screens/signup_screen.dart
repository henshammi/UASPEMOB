import 'package:aplikasipemob/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  bool passToggle = true;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            const SizedBox(height: 0),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Image.asset("images/Ecommerce.png"),
            ),
            const SizedBox(height: 0),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Full Name",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                decoration: InputDecoration(
                  labelText: "Phone Number",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.phone),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
              child: TextField(
                obscureText: passToggle ? true : false,
                decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    label: const Text("Password"),
                    prefixIcon: const Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        if (passToggle == true) {
                          passToggle = false;
                        } else {
                          passToggle = true;
                        }
                        setState(() {});
                      },
                      child: passToggle
                          ? const Icon(CupertinoIcons.eye_slash_fill)
                          : const Icon(CupertinoIcons.eye_fill),
                    )),
              ),
            ),
            const SizedBox(height: 15),
            Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: double.infinity,
                child: Material(
                  color: Colors.blue[400],
                  borderRadius: BorderRadius.circular(10),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => LoginScreen()));
                    },
                    child: const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      child: Center(
                        child: Text(
                          "Create Account",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Already have account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Colors.black54,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => LoginScreen()));
                  },
                  child: const Text(
                    'Log In here!',
                    style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
