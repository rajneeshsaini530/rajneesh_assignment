import 'package:rajneesh_assignment/view_model/form_view_model.dart';

class LoginViewModel extends FormViewModel {

  ///Login user
  Future<bool> login()async {
    ///Do Login API call here
    await Future.delayed(const Duration(seconds: 2));
    ///And return the State from here
    return true;
  }
}
