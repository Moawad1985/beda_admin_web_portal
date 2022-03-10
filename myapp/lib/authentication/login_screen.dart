import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myapp/main_screen/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  String adminEmail= "";
  String adminPassword = "";

  allowAdminToLogin() async
  {
    //display Checking Admin message
    SnackBar snackBar =  SnackBar(content: const Text("Checking Admin ,please wait....." ,
      style: TextStyle(
        fontSize: 36,
        color: Colors.black,
      ),
    ),
      backgroundColor: Colors.blueGrey.shade300,
      duration: const Duration(seconds: 6),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);


    User? currentAdmin;
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: adminEmail, password: adminPassword
    ).then((fAuth) {
      currentAdmin = fAuth.user;
    }).catchError((onError){
      //display error message
      final snackBar =  SnackBar(content: Text("Error occurred " + onError.message.toString(),
      style: const TextStyle(
        fontSize: 36,
        color: Colors.black,
      ),
      ),
      backgroundColor: Colors.blueGrey.shade300,
        duration: const Duration(seconds: 5),

      );
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });


    //check if the admin record also exists in the admin collection
    //and Navigate
    if(currentAdmin != null)
    {
      await FirebaseFirestore.instance.collection("admins")
          .doc(currentAdmin!.uid)
          .get().then((snap){
            if(snap.exists){
              Navigator.push(context,
                  MaterialPageRoute(
                      builder: (c)=>const HomeScreen()));
            }
      });

    }
    else
      {
        //display Checking Admin not exist message
        SnackBar snackBar =  SnackBar(
          content: const Text("No record for this Admin " ,
          style: TextStyle(
            fontSize: 36,
            color: Colors.black,
          ),
        ),
          backgroundColor: Colors.blueGrey.shade300,
          duration: const Duration(seconds: 6),

        );
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }

  }


  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          Center(
            child: SizedBox(
              width: size.width * 0.5,
              child: ListView(
                children: [
                  Image.asset("images/admin.png"),
                  TextField(
                    onChanged: (value){
                      adminEmail = value;
                    },

                    style: const TextStyle(
                      fontSize: 16,color: Colors.white70,
                    ),
                    decoration: const InputDecoration(

                      prefixIcon: Icon(Icons.person),
                      label: Text("Name",style: TextStyle(color: Colors.white70),),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26,
                        width: 2,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24,
                        width: 2,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextField(
                    onChanged: (value){
                      adminPassword = value;
                    },
                    obscureText: true,
                    style: const TextStyle(
                      fontSize: 16,color: Colors.white70,
                    ),
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Icons.remove_red_eye),
                      label: Text("Password",style: TextStyle(color: Colors.white70)),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black26,
                        width: 2,
                        )
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white24,
                        width: 2,
                        )
                      ),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Container(
                    width: 50,
                    padding: EdgeInsets.symmetric(horizontal: size.width * 0.08),
                    child: ElevatedButton(
                      onPressed: (){
                        ///------------------LOGIN Function
                        allowAdminToLogin();
                      },
                      style: ElevatedButton.styleFrom(
                        fixedSize: Size(size.width * 0.05, 50),
                        primary: Colors.blueGrey,
                        padding: const EdgeInsets.symmetric(horizontal: 100,vertical: 20),
                      ),
                      child: const Text("Login",
                    style: TextStyle(
                      color: Colors.white70,
                      letterSpacing: 2,
                      fontSize: 16,
                    ),

                    ),),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
