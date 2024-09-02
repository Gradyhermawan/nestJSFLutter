import 'dart:convert';

import 'package:coba/HalamanBarang.dart';
import 'package:coba/Model/user.dart';
import 'package:coba/api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController email = TextEditingController();
    final TextEditingController password = TextEditingController();

    return Scaffold(
      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,vertical: 8  ),
          color: Colors.white,
          width: 500,
          height: 400,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Login",style: TextStyle(fontSize: 40),),
              const SizedBox(height: 24,),
              const Text("Email: "),
              TextFormField(
                controller: email,
              ),
              const SizedBox(height: 24,),
              const Text("Password :"),
              TextFormField(
                controller: password,
              ),
              const SizedBox(height: 8,),
              TextButton(
                  onPressed: () async {
                    String payload= jsonEncode({
                      'email':email.text,
                      'password':password.text
                    });
                    Response response = await API.fetch('user/login',"post",payload);
                    if(response.body.toString()=="true"){
                      Navigator.of(context).popAndPushNamed(Barang.route);
                    }else{
                      const snackBar = SnackBar(
                        content: Text('Email atau password anda salah'),
                      );

                      ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    }

              }, child: const Text("Login",style: TextStyle(color: Colors.green,),

              ))
            ],
          ),
        ),
      ),
    );
  }
}
