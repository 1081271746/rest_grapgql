import 'package:flutter/material.dart';
import 'restaurant_screen.dart';
import 'country_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("EcoFood"),
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(

          mainAxisAlignment: MainAxisAlignment.center,

          children: [

            Icon(
              Icons.restaurant,
              size: 100,
              color: Colors.green,
            ),

            SizedBox(height:20),

            Text(
              "Reduce el desperdicio de comida",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              textAlign: TextAlign.center,
            ),

            SizedBox(height:40),

            ElevatedButton.icon(

              icon: Icon(Icons.store),

              label: Text("Ver Restaurantes (REST)"),

              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50)
              ),

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => RestaurantScreen(),
                  ),
                );

              },
            ),

            SizedBox(height:20),

            ElevatedButton.icon(

              icon: Icon(Icons.public),

              label: Text("Ver Países (GraphQL)"),

              style: ElevatedButton.styleFrom(
                minimumSize: Size(double.infinity,50)
              ),

              onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => CountryScreen(),
                  ),
                );

              },
            ),

          ],
        ),
      ),
    );
  }
}