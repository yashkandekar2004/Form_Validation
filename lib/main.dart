// import 'package:form_validation/bloc_forms/bloc/form_bloc.dart';
// import 'package:form_validation/bloc_forms/bloc/form_bloc_event.dart';
import 'package:form_validation/utils/exports.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       navigatorKey: navigatorKey,
  //       debugShowCheckedModeBanner: false,
  //       title: 'Flutter Form Validation',
  //       home: const FormScreen());
  // }
  // @override
  // Widget build(BuildContext context) {
  //   return MaterialApp(
  //       navigatorKey: navigatorKey,
  //       debugShowCheckedModeBanner: false,
  //       title: 'Flutter Form Validation',
  //       home: MultiProvider(
  //         providers: [
  //           ChangeNotifierProvider(
  //             create: (context) => FormNotifier(),
  //           )
  //         ],
  //         child: const FormScreen(),
  //       ));
  // }


    @override
  Widget build(BuildContext context) {
    return MaterialApp(
        navigatorKey: navigatorKey,
        debugShowCheckedModeBanner: false,
        title: 'Flutter Form Validation',
        home: BlocProvider(
          create:  (context)=>FormBloc()..add(const InitEvent()),
          child: const FormScreen(),
        ));
  }
}
