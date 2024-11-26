// ViewModel 클래스 - 상태와 로직을 담당 한다.
import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start02/models/todo.dart';

// ChangeNotifier 상속한다
class TodoViewModel extends ChangeNotifier{
  // 데이턱 ㅏ필요하다
  List<Todo> todos = [];

  // 할 일을 추가하는 기능

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    todos.add(newTodo);
    // 상태 알림 호출
    notifyListeners(); // ChangeNotifier를 ��시하고 notifyAllListeners()를 호출
  }

 void removeTodo(String id) {
    todos.removeWhere( (todo) => todo.id == id); // 포문 단축으로 if문
   // UI에 상태가 변경되었다고 알림
   notifyListeners();
 }






}
