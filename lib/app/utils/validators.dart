import 'package:form_field_validator/form_field_validator.dart';

class Validators {
  static final name = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MaxLengthValidator(150, errorText: "Max length is 150"),
    MinLengthValidator(2, errorText: "Name is too short!")
  ]);

  static final phoneNumber = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
  ]);

  static final email = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    EmailValidator(errorText: "Provide valid email.")
  ]);

  static final password = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MinLengthValidator(8, errorText: "Required 6 digitalis at least.")
  ]);

  static final address = MultiValidator([
    RequiredValidator(errorText: "This field is required!"),
    MinLengthValidator(5, errorText: "Address is too short!")
  ]);
}
