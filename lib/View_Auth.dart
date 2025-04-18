
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:moneymanager/View_BottomTab.dart';
import 'package:moneymanager/uid/uid.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({super.key});
  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  get sharedPreferences => null;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  CarouselController controller = CarouselController();

  @override
  void initState() {
    super.initState(); // Call the overridden method
    controller.addListener(() {
      if (controller.position.pixels <= 0) {
        // If at the start of the carousel
        setState(() {
          isSignIn = true;
        });
      } else if (controller.position.pixels >=
          controller.position.maxScrollExtent) {
        // If at the end of the carousel
        setState(() {
          isSignIn = false;
        });
      }
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Future<void> _signInWithEmail() async {
    try {
      await _auth.signInWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print("Signed in: ${_auth.currentUser?.email}");
      toggleLoginStatus();
    } catch (e) {
      print("Sign-In Error: $e");
    }
  }

  Future<void> _signUpWithEmail() async {
    try {
      await _auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );
      print("User registered: ${_auth.currentUser?.email}");
      toggleLoginStatus();
    } catch (e) {
      print("Sign-Up Error: $e");
    }
  }

  
  Future<void> toggleLoginStatus() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool("isLoggedIn", true);
    userId.initUid();
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => BottomTab()));
  }

  bool isSignIn = true;

  void toggle(bool signInSelected) {
    setState(() {
      isSignIn = signInSelected;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 100,
              ),
              toggleButton(),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        labelText: "  Email",
                        border: InputBorder.none, // Removes the border line
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )),
              SizedBox(
                height: 20,
              ),
              Container(
                  decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 215, 215, 215),
                      borderRadius: BorderRadius.circular(20)),
                  child: Padding(
                    padding: EdgeInsets.all(5),
                    child: TextField(
                      obscureText: true,
                      controller: passwordController,
                      decoration: InputDecoration(
                        labelText: "  Password",
                        border: InputBorder.none, // Removes the border line
                      ),
                      keyboardType: TextInputType.emailAddress,
                    ),
                  )),
              SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  isSignIn ? _signInWithEmail() : _signUpWithEmail();
                },
                child: Container(
                  width: 250,
                  height: 60,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 152, 209, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Enter→',
                      style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
   

  Widget toggleButton() {
    return Column(children: [
      Container(
          height: 200,
          width: 250,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 255, 255),
            borderRadius: BorderRadius.circular(100),
          ),
          child: ConstrainedBox(
            constraints: BoxConstraints.tightFor(width: 250, height: 60),
            child: NotificationListener<ScrollNotification>(
                onNotification: (scrollNotification) {
                  if (scrollNotification is ScrollEndNotification) {
                    if (controller.position.pixels <= 0) {
                      setState(() {
                        isSignIn = true;
                      });
                    } else if (controller.position.pixels >=
                        controller.position.maxScrollExtent) {
                      setState(() {
                        isSignIn = false;
                      });
                    }
                  }
                  return true;
                },
                child: CarouselView(
                  controller: controller,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  itemExtent: 200,
                  shrinkExtent: 60,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.blue, Colors.purple], // グラデーションの色
                          begin: Alignment.topLeft, // グラデーションの開始位置
                          end: Alignment.bottomRight, // グラデーションの終了位置
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Sign In",
                          maxLines: 1,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'fancy',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            const Color.fromARGB(255, 117, 242, 251),
                            const Color.fromARGB(255, 215, 120, 131)
                          ], // グラデーションの色
                          begin: Alignment.topLeft, // グラデーションの開始位置
                          end: Alignment.bottomRight, // グラデーションの終了位置
                        ),
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Center(
                        child: Text(
                          "Sign Up",
                          maxLines: 1,
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 255, 255),
                            fontWeight: FontWeight.w300,
                            fontFamily: 'fancy',
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ],
                )),
          )),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isSignIn ? Colors.black : Colors.grey,
            ),
            width: 10,
            height: 10,
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              color: isSignIn ? Colors.grey : Colors.black,
            ),
            width: 10,
            height: 10,
          ),
        ],
      )
    ]);
  }
}
