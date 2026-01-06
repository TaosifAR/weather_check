import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';


class AuthController extends GetxController{
  final box = GetStorage();
  void register(String email, String password,String confirmPassword)
  {

    if(email.isEmpty || password.isEmpty || confirmPassword.isEmpty)
      {
        Get.snackbar('Error', "All fields are required.");
        return;
      }
    if(password != confirmPassword)
      {
        Get.snackbar('Error', "Password does not match.");
        return;

      }
    if(box.hasData(email))
      {
        Get.snackbar('Info', "Already have an account.");
        return;
      }



    box.write(email, password);
    Get.snackbar('Success!', 'Registration completed.');
    Get.offAllNamed('/login');

  }
  void login(String email, String password)
  {
    if(email.isEmpty|| password.isEmpty)
      {
        Get.snackbar('Error', "All fields are required");
        return;
      }
    if(!box.hasData(email))
      {
        Get.snackbar('Error', "Account not found.");
        return;
      }
    final savePassword = box.read(email);
    if(savePassword == password)
      {
        Get.offAllNamed('/home');
      }
    else
      Get.snackbar('Error!', 'Invalid credentials');

  }
}