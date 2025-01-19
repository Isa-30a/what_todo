class Task {
  const Task({required this.id, required this.title, this.completed});

  final int id;
  final String title;
  final bool? completed;

  Task copyWith({int? id, String? name, bool? completed}) {
    return Task(
      id: id ?? this.id,
      title: name ?? title,
      completed: completed ?? this.completed,
    );
  }

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      title: json['name'],
      completed: json['completed'] ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': title,
      'completed': completed,
    };
  }
}
