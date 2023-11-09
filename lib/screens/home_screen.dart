import 'package:aplikasipemob/screens/about_screen.dart';
import 'package:aplikasipemob/screens/convert_screen.dart';
import 'package:aplikasipemob/screens/course_screen.dart';
import 'package:aplikasipemob/screens/calculator.dart';
import 'package:aplikasipemob/screens/bmi_screen.dart';
import 'package:aplikasipemob/screens/about_screen.dart';
import 'package:aplikasipemob/screens/history_screen.dart';
import 'package:aplikasipemob/screens/login_screen.dart';
import 'package:aplikasipemob/screens/temperature_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List catergories = [
    "UI/UX",
    "Coding",
    "App Design",
    "Basics",
  ];

  List courses = ["Web Design", "App Development", "UI Design", "Ecommerce"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Online Course Learning'),
        ),
        drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.only(top: 25),
            children: <Widget>[
              Row(
                children: [
                  Icon(
                    Icons.flutter_dash_outlined,
                    color: Colors.blue[400],
                    size: 100,
                  ),
                ],
              ),
              SizedBox(height: 20),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.calculate,
                      color: Colors.blue[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Calculator',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Calculator(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.fitness_center,
                      color: Colors.blue[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'BMI',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => BMIScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.attach_money,
                      color: Colors.blue[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Money Converter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ConvertMoneyPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Row(
                  children: [
                    Icon(
                      Icons.thermostat,
                      color: Colors.blue[400],
                    ),
                    SizedBox(width: 8),
                    Text(
                      'Temperature Converter',
                      style: TextStyle(fontSize: 20),
                    ),
                  ],
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => TemperatureConverter(),
                    ),
                  );
                },
              ),
              SizedBox(height: 240),
              ListTile(
                title: Text(
                  'History',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HistoryPage(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'About',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => AboutScreen(),
                    ),
                  );
                },
              ),
              ListTile(
                title: Text(
                  'Log out',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LoginScreen(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
                padding: EdgeInsets.only(top: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                "Choose Your",
                                style: TextStyle(
                                    fontSize: 20, color: Colors.black54),
                              ),
                              SizedBox(height: 2),
                              Text(
                                "Desire Course",
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child:
                                Image.asset("images/profile.jpg", height: 50),
                          )
                        ],
                      ),
                    ),
                    Container(
                      margin:
                          EdgeInsets.symmetric(vertical: 25, horizontal: 20),
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: "Search for course",
                          border: InputBorder.none,
                          suffixIcon: Icon(Icons.search),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Category",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    SizedBox(
                      height: 42,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(left: 20),
                            padding: EdgeInsets.symmetric(horizontal: 25),
                            decoration: BoxDecoration(
                              color: index == 0 ? Colors.blue[400] : null,
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Colors.blue,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                catergories[index],
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                  color: index == 0
                                      ? Colors.white
                                      : Colors.blue[400],
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 40),
                    SizedBox(
                      height: 110,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        itemCount: 4,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Stack(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(left: 20),
                                  padding: EdgeInsets.only(
                                      left: 100,
                                      right: 15,
                                      top: 10,
                                      bottom: 10),
                                  decoration: BoxDecoration(
                                    color: Colors.grey[100],
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        courses[index],
                                        style: TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "24 lesson",
                                            style: TextStyle(
                                                color: Colors.black54),
                                          ),
                                          SizedBox(width: 20),
                                          Row(
                                            children: [
                                              Text("4.3"),
                                              Icon(
                                                Icons.star,
                                                color: Colors.yellow[600],
                                                size: 18,
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "\$25",
                                            style: TextStyle(
                                                color: Colors.blue[400],
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(width: 40),
                                          InkWell(
                                            onTap: () {},
                                            child: Container(
                                              padding: EdgeInsets.all(3),
                                              decoration: BoxDecoration(
                                                color: Colors.blue[400],
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                              ),
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                                size: 20,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                                Center(
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 60),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Image.asset(
                                        "images/${courses[index]}.png",
                                        height: 80,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 30),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Popular Course",
                        style: TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    SizedBox(height: 5),
                    GridView.builder(
                      shrinkWrap: true,
                      itemCount: courses.length,
                      physics: NeverScrollableScrollPhysics(),
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => CourseScreen(),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 10, horizontal: 15),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              color: Colors.grey[100],
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  courses[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500),
                                ),
                                SizedBox(height: 6),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "24 lesson",
                                      style: TextStyle(color: Colors.black54),
                                    ),
                                    Row(
                                      children: [
                                        Text("4.3"),
                                        Icon(
                                          Icons.star,
                                          color: Colors.blue[400],
                                          size: 15,
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: EdgeInsets.all(10),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(10),
                                    child: Image.asset(
                                        "images/${courses[index]}.png",
                                        height: 90),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                )),
          ),
        ));
  }
}
