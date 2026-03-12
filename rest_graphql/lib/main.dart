import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'services/graphql_service.dart';
import 'screens/home_screen.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();
  await initHiveForFlutter();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return GraphQLProvider(
      client: GraphQLService.client,

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "EcoFood",

        theme: ThemeData(
          primarySwatch: Colors.green,
        ),

        home: const HomeScreen(),
      ),
    );
  }
}