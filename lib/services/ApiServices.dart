import 'package:dio/dio.dart';
import 'package:to_do_list/Models/TodoModel.dart';

class ApiServices{
  static Dio dio = Dio();
  static Map PostData = {"todo" : "","completed":false,"userId":1};
  static Future<ListModel> getData() async{
    try{
      const String url = "https://dummyjson.com/todos/user/1";
      var response = await dio.get(url);
      if(response.statusCode == 200){
        return ListModel.fromjson(response.data);
      }
      throw Exception("Bad Request");
    }catch(e){
      throw Exception(e.toString());
    }
  }
  static Future<void> postData({required String todo}) async{
    postData(todo : todo); 
    await dio.post("https://dummyjson.com/todos/add",data:postData);
  }
}