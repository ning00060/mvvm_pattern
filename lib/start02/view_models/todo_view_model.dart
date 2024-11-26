// ViewModel 클래스 - 상태와 로직을 담당 한다.
import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start02/models/todo.dart';

class TodoViewModel {
  // 데이턱 ㅏ필요하다
  List<Todo> todos = [];

  // 할 일을 추가하는 기능

  void addTodo(String title) {
    final newTodo = Todo(id: DateTime.now().toString(), title: title);
    todos.add(newTodo);
  }

 void removeTodo(String id) {
    todos.removeWhere( (todo) => todo.id == id); // 포문 단축으로 if문
 }






}
