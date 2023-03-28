import 'package:exam/utils/sharedhelper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLogin = false;
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtpass = TextEditingController();

  @override
  void initState() {
    super.initState();
    Sharedhelper.sharedhelper.isLogin(false);
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            "Sign In",
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 20,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.menu,
                color: Colors.black,
              ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(height: 30),
              Image.asset(
                "assets/image/news.png",
                height: 150,
              ),
              SizedBox(height: 50),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 15),
                child: TextField(
                  controller: txtEmail,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.email),
                      labelText: 'Email',
                      hintText: 'Enter valid email id as abc@gmail.com'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: TextField(
                  controller: txtpass,
                  obscureText: true,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      prefixIcon: Icon(Icons.password),
                      labelText: 'Password',
                      hintText: 'Enter secure password'),
                ),
              ),
              InkWell(
                onTap: () async {
                  Map data = await Sharedhelper.sharedhelper.readData();
                  if(data['email']==txtEmail.text &&data['password']==txtpass.text ){
                    Sharedhelper.sharedhelper.isLogin(true);
                    Get.offNamed('navigator');
                  }
                },
                child: Container(
                  height: 50,
                  alignment: Alignment.center,
                  width: 250,
                  child: Text(
                    "Login",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500),
                  ),
                  decoration: BoxDecoration(
                    color: Colors.blue,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              SizedBox(
                height: 200,
              ),
              TextButton(
                child: Text('New User? Create Account'),
                onPressed: () {
                  Get.offNamed('signup');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
