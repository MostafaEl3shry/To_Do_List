import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_list/Provider/ListProvider.dart';

class AddTask extends StatelessWidget {
  const AddTask({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();

    return ChangeNotifierProvider(
      create: (context) =>  TodoProvider(),
      child:  Container(
        width: double.infinity,
        child: Column(
          children: [
            const Text("Add Task"),
            Container(width: 300,child: TextField(controller: controller,decoration:const InputDecoration(border: OutlineInputBorder(borderRadius:BorderRadius.all(Radius.circular(10))),hintText: "Task name"),)),
            Consumer<TodoProvider>   (
              builder:(context, value, child) =>  MaterialButton(onPressed: (){
                value.addData(controller.text);
                controller.clear();
                Navigator.pop(context);
              },child: Text("Add"),color: Colors.teal[400],),
            ),
          ],
        ),
      ),
    );
  }
}
