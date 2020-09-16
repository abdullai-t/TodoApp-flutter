class Todos{
  String todo;
  String time;
  Todos({this.time,this.todo});
}

List<Todos> todos = [
  Todos(time:"2020-09-16 14:41:05", todo: "Add you first Todo item"),

];

List<Todos> deleted = [
  Todos(time:"2020-09-16 14:41:05", todo: "No item deleted yet"),
];