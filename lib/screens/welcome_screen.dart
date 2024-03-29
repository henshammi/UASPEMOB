import 'package:aplikasipemob/screens/calculator.dart';
import 'package:aplikasipemob/screens/login_screen.dart';
import 'package:aplikasipemob/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Image.asset("images/UI Design.png"),
          ),
          const SizedBox(height: 50),
          Text(
            "Online Learning",
            style: TextStyle(
              color: Colors.blue[400],
              fontSize: 35,
              fontWeight: FontWeight.bold,
              letterSpacing: 1,
              wordSpacing: 2,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            "Appoint Your Teacher",
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 60),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Material(
                color: Colors.blue[400],
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Log In",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              Material(
                color: const Color.fromARGB(255, 20, 82, 132),
                borderRadius: BorderRadius.circular(10),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => SignUpScreen()));
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ));
  }
}
