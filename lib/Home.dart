import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Provider/ListProvider.dart';
import 'package:to_do_list/Widgets/Custome%20Widget.dart';
import 'package:to_do_list/Widgets/add_task.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal[400],
      body: Column(
        children: [
          const SizedBox(height: 15,),
          const Row(
            children: [
              Icon(Icons.list , size: 35, color: Colors.white,),
              Text("ToDayDo",style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 35
              ),
             )
            ],
          ),
          const Text("Tasks" , style: TextStyle(color: Colors.white),),
          Expanded(child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Container(
                width: 300,
                color: Colors.white,
                child: Consumer<TodoProvider>(
                  builder: (context, provider, child) {
                    var model = provider.data;
                    if(model == null)
                      {
                        provider.featchData();
                        return const Center(child:  CircularProgressIndicator());
                      }
                    return ListView.builder(
                      itemBuilder: (context, index) => CutomTextWidget(textData: model.result[index]["todo"]),
                      itemCount: model.result.length,
                    );
                  }
                ),
              ),
            ),
          ))
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          showModalBottomSheet(context: context, builder: (context) =>const AddTask(),);
        },
        backgroundColor: Colors.teal[400],
        child: const Icon(Icons.add,color: Colors.white,),


      ),
    );
  }
}
