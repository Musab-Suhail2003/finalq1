import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:readmore/readmore.dart';
import 'package:sample_q1/bloc/juice_bloc.dart';
import 'package:sample_q1/bloc/juice_state.dart';

class JuiceScreen extends StatelessWidget {
  const JuiceScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(0, 0, 0, 0),
        leading: IconButton(
          icon: const Icon(Icons.arrow_left_sharp),
          onPressed: () {},
        ),
        title: const Text("Details", style: TextStyle(fontSize: 15),),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.share_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<JuiceBloc, JuiceState>(
        builder: (context, state) {
          if (state is JuiceLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is JuiceLoaded) {
            return 
             Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Positioned.fill(

                  child: Image.asset('./assets/images/1092631.jpg', fit: BoxFit.cover),
                ),
                Expanded(child: Image.network(state.juice[0].imageUrl, ),), 
                Expanded( 
                  
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(state.juice[0].name, 
                      style: const TextStyle(fontWeight: FontWeight.bold, ),
                    ), 
                    const Icon(Icons.add_circle_outline), 
                    const Text('1'),
                    const Icon(Icons.remove_circle_outline),
                    
                  ],
                ),
                
      ),
              Text("Each (${state.juice[0].Serving})", style: TextStyle(fontWeight: FontWeight.w400),),
              const Row(children: [Icon(Icons.star, size: 15, color: Colors.yellow,), Icon(Icons.star, size: 15, color: Colors.yellow,), Icon(Icons.star, size: 15, color: Colors.yellow,), Icon(Icons.star, size: 15, color: Colors.yellow,), Icon(Icons.star, size: 15, color: Colors.yellow,), Text("(30)")],),
              ReadMoreText(
                  state.juice[0].description,
                  trimMode: TrimMode.Line,
                  trimLines: 1,
                  colorClickableText: Colors.pink,
                  trimCollapsedText: 'Read more',
                  trimExpandedText: 'Read less',
                  moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                ),
              Row( children: [Icon(Icons.lock_clock), Column(children: [
                Text('Delivery Time', style: TextStyle(fontWeight: FontWeight.bold),),
                Text(state.juice[0].delivery_time),
              ],)],),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                Column(children: [Text("total price", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 10),), Text("\$${state.juice[0].price}", style: TextStyle(fontWeight: FontWeight.bold),)],)
                ,ElevatedButton(onPressed: (){}, child: Text("Add to Cart"), style: ButtonStyle(backgroundColor: MaterialStateProperty.all(Colors.pink),),)
              ],)  
              ]
            ,
            );
          } else if (state is JuiceError) {
            return Center(child: Text(state.message));
          } else {
            return Container();
          }
        },
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    if (date.year == now.year && date.month == now.month && date.day == now.day) {
      return 'Today';
    } else {
      return '${date.month}/${date.day}/${date.year}';
    }
  }
}