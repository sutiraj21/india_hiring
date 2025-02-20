import 'package:flutter/material.dart';
import 'package:inidiahiringg/Utils/Routes/Routes_Name.dart';
import 'package:inidiahiringg/View/home_screen.dart';
import 'Candidate_Profile.dart';
import 'Profile_Setup.dart';
import 'fade.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool _obscurePassword = true;
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Use MediaQuery to get the screen size
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 130.0),
          child: Container(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05), // Dynamic padding
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FadeAnimation(
                        delay: 1,
                        translateX: 50,
                        child: Text(
                          "WELCOME BACK\nINDIA HIRINGS",
                          style: TextStyle(
                            fontSize: screenWidth * 0.08, // Responsive font size
                            fontWeight: FontWeight.bold,
                            color: Colors.blue,
                          ),
                        ),),
                      SizedBox(height: screenHeight * 0.01), // Dynamic spacing
                      FadeAnimation(
                        delay: 1,
                        translateX: 50,
                        child: Text(
                          "Sign in to continue",
                          style: TextStyle(color: Colors.black, fontSize: screenWidth * 0.05),
                        ),),
                      SizedBox(height: screenHeight * 0.05),
                      FadeAnimation(
                        delay: 1,
                        child:
                        TextFormField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your email';
                            }
                            return null;
                          },
                        ),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      FadeAnimation(
                        delay: 1,
                        child: TextFormField(
                          controller: _passwordController,
                          obscureText: _obscurePassword,
                          style: TextStyle(color: Colors.black),
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(color: Colors.black54),
                            filled: true,
                            fillColor: Colors.blue.shade50,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                            suffixIcon: IconButton(
                              icon: Icon(
                                _obscurePassword ? Icons.visibility_off : Icons.visibility,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                setState(() {
                                  _obscurePassword = !_obscurePassword;
                                });
                              },
                            ),),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your password';
                            } else if (value.length < 2) {
                              return 'Password must be at least 7 characters';
                            }
                            return null;
                          },
                        ),),
                      SizedBox(height: screenHeight * 0.01),
                      FadeAnimation(
                        delay: 1,
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: TextButton(
                            onPressed: () {
                            },
                            child: Text("Forgot Password?", style: TextStyle(color: Colors.black54)),
                          ),
                        ),),
                      SizedBox(height: screenHeight * 0.05),
                      FadeAnimation(
                        delay: 2,
                        child: SizedBox(
                          width: double.infinity,
                          height: screenHeight * 0.07, // Dynamic height for button
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue.shade400,
                              foregroundColor: Colors.white,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                               Navigator.pushNamed(context,RoutesName.profilesetup);
                              }
                            },
                            child: Text("LOGIN", style: TextStyle(fontSize: screenWidth *
                                0.05, fontWeight: FontWeight.bold,)),
                          ),
                        ),),
                      SizedBox(height: screenHeight * 0.02),
                      GestureDetector(
                        onTap: () {

                        },
                        child: Container(
                          height: 50,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                blurRadius: 4,
                                offset: Offset(0, 2),
                              ),],
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Image.asset(
                              //   'assets/google_logo.png', // Ensure this image is in the assets folder
                              //   height: 24,
                              // ),`
                              SizedBox(width: 10),
                              Text(
                                "Sign in with Google",
                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                              ),],
                          ),),
                      ),
                      SizedBox(height: screenHeight * 0.02),
                      FadeAnimation(
                        delay: 2,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't have an account? ", style: TextStyle(color: Colors.black54)),
                            TextButton(
                              onPressed: () {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context)=>HomeScreen()));
                              },
                              child: Text("Sign Up", style: TextStyle(color: Colors.black54, fontWeight: FontWeight.bold)),
                            ),],
                        ),),
                    ],),),
              ),),
          ),),
      ),);
  }}
