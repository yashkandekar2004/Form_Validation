import 'package:form_validation/utils/exports.dart';

class FormScreen extends StatelessWidget {
  const FormScreen({super.key});

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
        body: BlocBuilder<FormBloc, FormScreenState>(builder: (context, state) {
          return Padding(
            padding: const EdgeInsets.all(30),
            child: Form(
                key: state.formKey,
                child: Column(
                  children: [
                    CustomeFormField(
                      hintText: "Name",
                      inputFormatters: [
                        FilteringTextInputFormatter.allow(RegExp(
                            r"^\s*([A-zA-z]{1,}([\.,]|[-']|	))+[A-Za-z]+\.?\s*$"))
                      ],
                      onChange: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            NameChangeevent(name: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.name.error;
                      },
                    ),
                    CustomeFormField(
                      hintText: "Email",
                      inputFormatters: const [],
                      onChange: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            EmailChangeEvent(email: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.email.error;
                      },
                    ),
                    CustomeFormField(
                      hintText: "Phone",
                      onChange: (val) {
                        BlocProvider.of<FormBloc>(context).add(
                            PhoneChangeEvent(phone: BlocFormItem(value: val!)));
                      },
                      validator: (val) {
                        return state.phone.error;
                      },
                      inputFormatters: [],
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    Row(
                      children: [
                        ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<FormBloc>(context)
                                  .add(const FormSubmitEvent());
                            },
                            child: const Text("SUBMIT")),
                        const SizedBox(
                          width: 30,
                        ),
                        ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<FormBloc>(context)
                                  .add(const FormResetEvent());
                            },
                            child: const Text("RESET"))
                      ],
                    )
                  ],
                )),
          );
        }));
  }
}
