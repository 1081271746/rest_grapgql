import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class CountryScreen extends StatelessWidget {
  const CountryScreen({super.key});

  final String query = """
  query {
    countries {
      code
      name
      emoji
    }
  }
  """;

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title: Text("Países"),
      ),

      body: Query(

        options: QueryOptions(
          document: gql(query),
        ),

        builder: (result, {fetchMore, refetch}) {

          if(result.isLoading){
            return Center(child: CircularProgressIndicator());
          }

          if(result.hasException){
            return Center(child: Text("Error GraphQL"));
          }

          final countries = result.data!['countries'];

          return ListView.builder(

            itemCount: countries.length,

            itemBuilder: (context,index){

              return ListTile(

                leading: Text(
                  countries[index]['emoji'],
                  style: TextStyle(fontSize:25),
                ),

                title: Text(countries[index]['name']),

              );
            },
          );
        },
      ),
    );
  }
}