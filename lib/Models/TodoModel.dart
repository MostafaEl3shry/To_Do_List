class ListModel{
  List<dynamic> result;
  int Total;
  ListModel({required this.result,required this.Total});
  factory ListModel.fromjson(Map<String,dynamic>json){
    return ListModel(result: json["todos"], Total: json["total"]);
  }
}