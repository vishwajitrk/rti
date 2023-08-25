import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rti/blocs/employee/employees_bloc.dart';
import 'package:rti/config/theme.dart';
import 'package:rti/constants/navigation_routes.dart';
import 'package:rti/storage/database_helper.dart';
// import 'simple_bloc_observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // initialize the database
  await dbHelper.init();

  runApp(const App());

  // BlocOverrides.runZoned(
  //   () {
  //     runApp(const App());
  //   },
  //   blocObserver: SimpleBlocObserver(),
  // );
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => EmployeesBloc()..getEmployees(),
        ),
      ],
      child: MaterialApp(
        title: 'BloC Pattern - Employees',
        onGenerateRoute: generateRoute,
        initialRoute: Routing.landing,
        theme: AppTheme.of(context),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
