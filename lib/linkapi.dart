class AppLink {
  static const String server = "http://192.168.100.22/myappphp";

  static const String test = "$server/test.php";

  //=================Auth=================== //
  static const String signUp = "$server/auth/signup.php";
  static const String Login = "$server/auth/login.php";
  static const String verifycodesignup = "$server/auth/verifycode.php";

  //================homepage================ //
  static const String getSensorData = "$server/sensors/getsensordata.php";

  //================Forget Password================ //
  static const String checkemail = "$server/forgetpassword/checkemail.php";
  static const String verifycodeforgetpassword =
      "$server/forgetpassword/verifycodeforgetpass.php";
  static const String resetpassword =
      "$server/forgetpassword/resetpassword.php";
}
