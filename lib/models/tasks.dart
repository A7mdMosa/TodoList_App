class Task {
  String name;
  bool isChedcked;

  Task({required this.name, this.isChedcked = false});

  void changeState() {
    isChedcked = !isChedcked;
  }

  factory Task.fromjson(Map<String, dynamic> json) {
    return Task(
      name: json['name'],
      isChedcked: json['isChedcked'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'isChedcked': isChedcked,
    };
  }
}
