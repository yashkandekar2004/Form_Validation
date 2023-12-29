import 'package:form_validation/utils/exports.dart';

class FormNotifier extends ChangeNotifier {
  final _formKey = GlobalKey<FormState>();

  GlobalKey<FormState> get formKey => _formKey;
  final FormItem _title = const FormItem(
    hintText: 'title',
  );
  final FormItem _name = FormItem(
      hintText: 'Name',
      errorMessage: 'Please enter Name',
      formatters: [FilteringTextInputFormatter.allow(RegExp(r"[a-zA-Z]+/\s"))]);
  final FormItem _email =
      const FormItem(hintText: 'Email', errorMessage: 'Pleae enter Email');
  final FormItem _phone =
      const FormItem(hintText: 'Phone', errorMessage: 'Please Enter Phone');
  final FormItem _submit = const FormItem(hintText: 'SUBMIT');
  final FormItem _reset = const FormItem(hintText: 'RESET');

  FormItem get title => _title;
  FormItem get name => _name;
  FormItem get email => _email;
  FormItem get phone => _phone;
  FormItem get submit => _submit;
  FormItem get reset => _reset;

  validateName(String? val) =>
      val != null && !val.isValidName ? name.errorMessage : null;

  validateEmail(String? val) =>
      val != null && !val.isValidEmail ? email.errorMessage : null;

  validatePhone(String? val) =>
      val != null && !val.isValidPhone ? phone.errorMessage : null;

  submitForm() {
    if (formKey.currentState!.validate()) {
      return goHome();
    }
  }

  resetForm() => formKey.currentState?.reset();
}
