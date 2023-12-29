import 'package:form_validation/utils/exports.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          "Form Validation",
          style: TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
            key: _formKey,
            child: Column(
              children: [
                CustomeFormField(
                  hintText: "Name",
                  inputFormatters: [
                    // FilteringTextInputFormatter.allow(RegExp(
                    //     r"^\s*([A-zA-z]{1,}([\.,]|[-']|	))+[A-Za-z]+\.?\s*$"))
                  ],
                  
                  validator: (val) {
                    if (val != null && val.isValidName) {
                      return 'Enter Valid Name';
                    }
                    return null;
                  },
                  onChange: (String) {},
                ),
                CustomeFormField(
                  hintText: "Email",
                  validator: (val) {
                    if (val != null && !val.isValidEmail) {
                      return 'Enter Valid Email';
                    }
                    return null;
                  },
                  inputFormatters: const [],
                  onChange: (String) {},
                ),
                CustomeFormField(
                  hintText: "Phone",
                  validator: (val) {
                    if (val != null && !val.isValidPhone) {
                      return 'Enter Valid Phone';
                    }
                    return null;
                  },
                  inputFormatters: [],
                  onChange: (String) {},
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            goHome();
                          }
                        },
                        child: const Text("SUBMIT")),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () async {}, child: const Text("RESET"))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
