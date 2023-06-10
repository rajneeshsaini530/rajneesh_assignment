import 'package:rajneesh_assignment/view_model/form_view_model.dart';

class RegisterViewModel extends FormViewModel {
  ///Register user
  Future<bool> register() async {
    ///Do register API call here
    await Future.delayed(const Duration(seconds: 2));

    ///And return the State from here
    return true;
  }
}
