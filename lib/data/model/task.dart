class Task {
  Task({required this.id, required this.name, this.completed = false});

  final int id;
  final String name;
  final bool completed;

  Task copyWith({int? id, String? name, bool? completed}) {
    return Task(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
    );
  }
}
