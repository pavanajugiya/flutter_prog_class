
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pro/APIs/login/login_controller.dart';
import 'package:get/get.dart';

class LoginScreenFomAPi extends StatelessWidget {
  // const LoginScreenFomAPi({super.key});

  // screen -> Api services -> controller ->
  LoginController controller = Get.put();

  LoginScreenFomAPi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF1B3B5A),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(child: Text("Login to your account", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25, color: Colors.white),)),

          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20)
              ),
              child: const Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text("Username"),

                  // text box uname
                  Padding(
                    padding: EdgeInsets.all(10.0),
                    child: SizedBox(
                      width: 320,
                      child: TextField(
                        decoration: InputDecoration(

                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
