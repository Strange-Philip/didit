class Todo {
  int? id;
  String? todo;
  bool? isCompleted;
  String? date;
  int? color;

  Todo({this.id, this.todo, this.isCompleted, this.date, this.color});

  Todo.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    todo = json['todo'];
    isCompleted = json['isCompleted'];
    date = json['date'];
    color = json['color'];
  }
  

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['todo'] = this.todo;
    data['isCompleted'] = this.isCompleted;
    data['date'] = this.date;
    data['color'] = this.color;
    return data;
  }
}
