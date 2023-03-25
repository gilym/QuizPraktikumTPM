import 'package:flutter/material.dart';
import 'pokemon_data.dart';
import 'package:url_launcher/url_launcher.dart';

class Detail extends StatefulWidget {
  final PokemonData pokemon;
  const Detail({Key? key, required this.pokemon}) : super(key: key);


  @override
  State<Detail> createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  bool favorite = true;

  @override
  Widget build(BuildContext context) {
   return SafeArea(
     child: Scaffold(
       appBar: AppBar(
         title: Text(widget.pokemon.name),
         centerTitle: true,
         actions: <Widget>[
           InkWell(
             onTap: () {
               setState(() {
                 favorite = !favorite;
               });

               SnackBar snackBar = SnackBar(
                 content: (favorite)?Text("Berhasil Menambahkan Ke Favorite"):Text("Berhasil Menghapus Dari Favorite"),
                 backgroundColor: Colors.black,
               );
               ScaffoldMessenger.of(context).showSnackBar(snackBar);

             },
             child: Icon((favorite) ? Icons.favorite_border : Icons.favorite),
           ),
           SizedBox(width: 10,)



         ],
       ),
       body: ListView(

         children: [
           Container(
             height: 250,
             child: Image.network(widget.pokemon.image),
           ),
           Center(
             child: Column(
               children: [
                 Text("Type",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),),
                 Container(
                   height: 50,
                   child: Center(
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(8),
                       itemCount: widget.pokemon.type.length,
                       itemBuilder: (context, index) {
                         return Row(
                           children: [
                             Text("["),
                             Text(widget.pokemon.type[index]),
                             Text("]"),
                             SizedBox(width: 10,)
                           ],
                         );
                       },
                     ),
                   ),
                 ),
                 Text("Weaknes",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),),
                 Container(
                   width: 400,
                   height: 50,
                   child: Center(
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(8),
                       itemCount: widget.pokemon.weakness.length,
                       itemBuilder: (context, index) {
                         return Row(
                           children: [
                             Text("["),
                             Text(widget.pokemon.weakness[index],
                             ) ,
                             Text("]"),
                             SizedBox(width: 10,)
                           ],
                         );
                       },
                     ),
                   )
                 ),
                 Text("Previous Evolution",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),),
                 Container(
                   width: 400,
                   height: 50,
                   child:Center(
                     child:  ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(8),
                       itemCount: widget.pokemon.prevEvolution.length,
                       itemBuilder: (context, index) {
                         return Row(
                           children: [
                             Text("["),
                             Text(widget.pokemon.prevEvolution[index],),
                             Text("]"),
                             SizedBox(width: 8,)
                           ],
                         );
                       },
                     ),
                   )
                 ),
                 Text("Next Evolution",
                   style: TextStyle(
                       fontSize: 20,
                       fontWeight: FontWeight.bold
                   ),),
                 Container(
                   width: 400,
                   height: 50,
                   child : Center(
                     child: ListView.builder(
                       scrollDirection: Axis.horizontal,
                       shrinkWrap: true,
                       padding: const EdgeInsets.all(8),
                       itemCount: widget.pokemon.nextEvolution.length,
                       itemBuilder: (context, index) {
                         return Row(
                           children: [
                             Text("["),
                             Text(widget.pokemon.nextEvolution[index],),
                             Text("]"),
                             SizedBox(width: 8,)
                           ],
                         );
                       },
                     ),
                   )
                 ),

               ],
             ),
           )
         ],
       ),
       floatingActionButton: FloatingActionButton(
         onPressed: (){
           _launchUrl (widget.pokemon.wikiUrl);
         },
         tooltip: 'Increment',
         child: const Icon(Icons.travel_explore),
       ),

     ),
   );
  }

  Future<void> _launchUrl(String url) async{
    final Uri _url = Uri.parse(url);
    if(!await launchUrl (_url)){
      throw Exception('Could Not Launch $_url');
    }
  }

}
