import 'dart:io';
import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'tables.dart'; // Importa las tablas

part 'app_database.g.dart'; // Drift generará este archivo automáticamente

@DriftDatabase(tables: [Tasks]) // Conecta las tablas
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1; // Incrementa si haces cambios en la estructura

  // Consultas personalizadas
  Future<List<Task>> getAllTasks() => select(tasks).get();
  Future<int> insertTask(TasksCompanion task) => into(tasks).insert(task);
  Future<int> deleteTask(int id) =>
      (delete(tasks)..where((t) => t.id.equals(id))).go();
  Future<bool> updateTask(Task task) =>
      (update(tasks)..where((t) => t.id.equals(task.id))).replace(task);
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'app_database.sqlite'));
    return NativeDatabase(file);
  });
}
