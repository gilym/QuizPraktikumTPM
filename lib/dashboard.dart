import 'package:flutter/material.dart';
import 'package:quizprakmobile/detail.dart';
import 'pokemon_data.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(
         title: Text("Dashboard"),
         centerTitle: true,
       ),
       body: GridView.builder(
           gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
               maxCrossAxisExtent: 200,
               childAspectRatio: 3 / 2,
               crossAxisSpacing: 20,
               mainAxisSpacing: 20),
           itemCount: listPokemon.length,
           itemBuilder: (BuildContext ctx, index) {
             final PokemonData pokemon = listPokemon[index];
             return InkWell(
                 onTap: () {
                   // Navigator.push(
                   //     context,
                   //     MaterialPageRoute(
                   //         builder: (context) => detail(
                   //           place: place,
                   //         )
                   //     )
                   // );

                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) => Detail(pokemon: pokemon,)
                       )
                   );
                 },
               child: Container(
                 color: Colors.red,

                 child:  Card(

                   child: Column(
                     children: [
                       Container(
                         height: 100,
                         child: Image.network(pokemon.image),
                       ),
                       Text(pokemon.name,
                         style: TextStyle(
                           fontSize: 14,
                           fontWeight: FontWeight.bold,

                         ),)
                     ],
                   ),
                 ) ,
               )
             );
           }),
     ),
   );
  }
}
