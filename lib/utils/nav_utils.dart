
import 'package:form_validation/success_screen.dart';
import 'package:form_validation/utils/exports.dart';

goHome() async {
  Navigator.push(navigatorKey.currentContext!,
      MaterialPageRoute(builder: (context) => const SuccessScreen()));
}
