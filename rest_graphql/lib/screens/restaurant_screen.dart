import 'package:flutter/material.dart';
import '../services/rest_service.dart';
import '../models/restaurant.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {

  final RestService service = RestService();

  late Future<List<Restaurant>> restaurants;

  @override
  void initState() {
    super.initState();
    restaurants = service.fetchRestaurants();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Restaurantes"),
      ),

      body: FutureBuilder<List<Restaurant>>(

        future: restaurants,

        builder: (context, snapshot) {

          if(snapshot.hasData){

            return ListView.builder(

              itemCount: snapshot.data!.length,

              itemBuilder: (context,index){

                final r = snapshot.data![index];

                return Card(

                  margin: EdgeInsets.all(10),

                  child: ListTile(

                    leading: CircleAvatar(
                      child: Icon(Icons.restaurant),
                    ),

                    title: Text(r.name),

                    subtitle: Text(r.email),

                  ),
                );
              },
            );
          }

          if(snapshot.hasError){
            return Center(child: Text("Error cargando datos"));
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}