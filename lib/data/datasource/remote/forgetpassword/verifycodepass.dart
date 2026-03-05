import 'package:airaystem/core/class/crud.dart';
import 'package:airaystem/linkapi.dart';

class VerifycodepassData {
  Crud crud;
  VerifycodepassData(this.crud);
  postdata(String email, String verifycode) async {
    var response = await crud.postData(AppLink.verifycodeforgetpassword, {
      "email": email,
      "verifycode": verifycode,
    });
    return response.fold((l) => l, (r) => r);
  }
}
