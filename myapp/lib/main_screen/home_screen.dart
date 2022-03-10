import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

//flutter run -d chrome --web-renderer html
class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String timeText = "";
  String dateText = "";
  String formatCurrentLiveTime(DateTime time) {
    return DateFormat("hh:mm:ss a").format(time);
  }

  String formatCurrentLiveDate(DateTime date) {
    return DateFormat("dd MMM, yyyy").format(date);
  }

  getCurrentLiveTime() {
    final DateTime timeNow = DateTime.now();
    final String liveTime = formatCurrentLiveTime(timeNow);
    final String liveDate = formatCurrentLiveDate(timeNow);

    if (this.mounted) {
      setState(() {
        timeText = liveTime;
        dateText = liveDate;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //time
    dateText = formatCurrentLiveDate(DateTime.now());
    //date
    timeText = formatCurrentLiveTime(DateTime.now());
    //live time
    Timer.periodic(const Duration(seconds: 1), (timer) {
      getCurrentLiveTime();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.black87,
                Colors.black45,
              ],
              begin: FractionalOffset(0.0, 0.0),
              end: FractionalOffset(1.0, 0.0),
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp,
            ),
          ),
        ),
        title: const Text(
          "Admin web portal",
          style: TextStyle(fontSize: 20, letterSpacing: 3),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Text(
                    timeText + "\n" + dateText,
                    style: const TextStyle(
                      fontSize: 25,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                //user activate and block accounts ui

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Activate User".toUpperCase() +
                            "\n" +
                            "   Account".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                        fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.blueGrey),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add_disabled,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Block User ".toUpperCase() +
                            "\n" +
                            "  Account".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.red.shade900),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Seller activate and block accounts ui
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Activate Seller".toUpperCase() +
                            "\n" +
                            "   Account".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.blueGrey.shade600),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.block_flipped,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Block Seller ".toUpperCase() +
                            "\n" +
                            "  Account".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.red.shade600),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                //Rider activate and block accounts ui
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.person_add,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Activate Delivery".toUpperCase() +
                            "\n" +
                            "   Account".toUpperCase().substring(0,4),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.blueGrey.shade300),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.block_flipped,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Block Delivery ".toUpperCase() +
                            "\n" +
                            "  Account".toUpperCase(),
                        style: const TextStyle(
                            fontSize: 16, color: Colors.white, letterSpacing: 2),
                      ),
                      style: ElevatedButton.styleFrom(
                          fixedSize: const Size(250, 80),
                          padding: const EdgeInsets.all(30),
                          primary: Colors.red.shade300),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.logout,
                    color: Colors.white,
                  ),
                  label: Text(
                    "Admin Logout ".toUpperCase(),
                    style: const TextStyle(
                        fontSize: 16, color: Colors.white, letterSpacing: 2),
                  ),
                  style: ElevatedButton.styleFrom(
                      fixedSize: const Size(250, 80),
                      padding: const EdgeInsets.all(15), primary: Colors.white24),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
