import 'package:form_validation/provider_forms/state/form_notifier.dart';
import 'package:form_validation/utils/exports.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final state = context.watch<FormNotifier>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          state.title.hintText,
          style: const TextStyle(
              fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Form(
            key: state.formKey,
            child: Column(
              children: [
                CustomeFormField(
                  hintText: state.name.hintText,
                  inputFormatters: state.name.formatters,
                  validator: (val) => state.name.errorMessage,
                  onChange: (String) {},
                ),
                CustomeFormField(
                  hintText: state.email.hintText,
                  validator: (val) => state.email.errorMessage,
                  inputFormatters: const [],
                  onChange: (String) {},
                ),
                CustomeFormField(
                  hintText: state.phone.hintText,
                  validator: (val) => state.email.errorMessage,
                  inputFormatters: [],
                  onChange: (String) {},
                ),
                const SizedBox(
                  width: 30,
                ),
                Row(
                  children: [
                    ElevatedButton(
                        onPressed: () => state.submitForm(),
                        child: Text(state.submit.hintText)),
                    const SizedBox(
                      width: 30,
                    ),
                    ElevatedButton(
                        onPressed: () => state.resetForm(),
                        child: Text(state.reset.hintText))
                  ],
                )
              ],
            )),
      ),
    );
  }
}
