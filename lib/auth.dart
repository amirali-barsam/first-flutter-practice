import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 50),
            Center(child: SvgPicture.asset('img/icons/logo.svg')),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 32),
                child: Container(
                  // height: 500,
                  decoration: BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(32),
                      topRight: Radius.circular(32),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Column(
                      children: [
                        SizedBox(height: 15),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "LOGIN",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                "SIGN UP",
                                style: TextStyle(
                                  fontFamily: "Avenir",
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 15),
                        Expanded(
                          child: Container(
                            // height: double.infinity,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(32),
                                topRight: Radius.circular(32),
                              ),
                            ),
                            child: SingleChildScrollView(
                              child: Padding(
                                padding: const EdgeInsets.all(32),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome back",
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      "Sing in with your account",
                                      style: TextStyle(
                                        fontFamily: "Avenir",
                                        fontSize: 16,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Username',
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    TextField(
                                      obscureText: true,
                                      enableSuggestions: false,
                                      autocorrect: false,
                                      decoration: InputDecoration(
                                        border: UnderlineInputBorder(),
                                        labelText: 'Password',
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ElevatedButton(
                                          onPressed: () {},
                                          child: Text(
                                            "LOGIN",
                                            style: TextStyle(
                                              fontFamily: "Avenir",
                                              fontSize: 18,
                                              color: Colors.white,
                                            ),
                                          ),
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: Size.fromHeight(60),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(16),
                                            ),
                                            backgroundColor: Colors.blueAccent,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "Forget your password?",
                                              style: TextStyle(
                                                fontFamily: "Avenir",
                                                fontSize: 16,
                                                color: Colors.black,
                                              ),
                                            ),
                                            TextButton(
                                              onPressed: () {},
                                              child: Text(
                                                "Reset here",
                                                style: TextStyle(
                                                  fontFamily: "Avenir",
                                                  fontSize: 16,
                                                  color: Colors.blue,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(height: 30),
                                        Text(
                                          "OR SIGN IN WITH",
                                          style: TextStyle(
                                            fontFamily: "Avenir",
                                            fontSize: 16,
                                            color: Colors.black,
                                          ),
                                        ),
                                        SizedBox(height: 20),
                                        Divider(thickness: 1),
                                        SizedBox(height: 20),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Image.asset(
                                              "img/icons/Google.png",
                                              width: 40,
                                            ),
                                            Image.asset(
                                              "img/icons/Facebook.png",
                                              width: 40,
                                            ),
                                            Image.asset(
                                              "img/icons/Twitter.png",
                                              width: 40,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
