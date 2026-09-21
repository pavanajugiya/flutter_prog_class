import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:pro/APIs/api_services/api_services.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController{
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  ApiServices api = ApiServices();

  Future<void> LoginCont() async{
    final respo = await api.login(email.text, password.text);

    if (respo.responseCode.toString() == "1") {
    //   if res code id 1 than we can return snake bar
      Get.snackbar("Success", respo.message.toString(), backgroundColor: Colors.green,);

      // for storing id or pass in session
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      prefs.setString("set_id", respo.userData?.id.toString() ?? "");

      final userId = prefs.getString("set_id"); // getting that id from session

    //   implementing navigation
      Get.to(ClassNameTonavigateAt());
    }
    else {
      // message from API
      Get.snackbar("Error", respo.message.toString(),backgroundColor: Colors.green,);
    }

  }

}