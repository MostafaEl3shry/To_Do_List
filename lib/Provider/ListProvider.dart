import 'package:flutter/cupertino.dart';
import 'package:to_do_list/Models/TodoModel.dart';
import 'package:to_do_list/services/ApiServices.dart';

class TodoProvider extends ChangeNotifier{
  ListModel? data;

  Future<void> featchData() async{
    data = await ApiServices.getData();
    notifyListeners();
  }

  Future<void> addData(String Todo) async{
    await ApiServices.postData(todo:Todo);

    data?.result.add(
      {
        "todo":Todo,
        "completed":false,
        "userId":1,
      }
    );
    data?.Total+=1;
    notifyListeners();
  }
}