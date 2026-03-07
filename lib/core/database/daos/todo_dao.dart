part of 'package:bloc_skeleton_project/core/database/database.dart';

extension TodoDatabaseX on AppDatabase {
  Future<int> createTodo(String title) {
    return into(todos).insert(TodosCompanion.insert(title: title));
  }

  Future<List<Todo>> getAllTodos() {
    return (select(
      todos,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).get();
  }

  Stream<List<Todo>> watchTodos() {
    return (select(
      todos,
    )..orderBy([(t) => OrderingTerm.asc(t.createdAt)])).watch();
  }

  Future<bool> toggleTodo(int id, bool completed) async {
    final rows = await (update(todos)..where((t) => t.id.equals(id))).write(
      TodosCompanion(completed: Value(completed)),
    );
    return rows > 0;
  }

  Future<bool> deleteTodoById(int id) async {
    final rows = await (delete(todos)..where((t) => t.id.equals(id))).go();
    return rows > 0;
  }
}
