import 'package:flutter/material.dart';
import 'package:my_mvvm_v01/start03/view_models/todo_view_model.dart';

void main() => runApp(MaterialApp(home: TodoScreen()));

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {

  // MVVM 패턴이기 때문ㅇ ㅔ View는 ViewModel 클래스만 참조하면 된다.
  final TextEditingController _controller = TextEditingController();
  final TodoViewModel todoViewModel = TodoViewModel();

  @override
  void initState() {
    super.initState();
    todoViewModel.addListener(() {
      // UI 재 렌더링하는 메서드
      setState(() {
      });
    });
    // 단 한번만 호출되는 메서드`
  }
  @override
  void dispose() {
    todoViewModel.dispose();
    _controller.dispose();
    super.dispose();

  }
  // 프레젠테이션 로직을 함수화 시키자

  void _addTodo() {
    if(_controller.text.trim().isNotEmpty) {
      todoViewModel.addTodo(_controller.text);
      _controller.clear();
    }
  }
  // 프레젠테이션 로직
  void _removeTodo(String id){
    todoViewModel.removeTodo(id);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MVVM Basic Todo List'),
      ),
      body: Column(
        children: [
          // 입력 필드 만들기
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: InputDecoration(labelText: '작업을 입력 하시오'),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.add),
                  onPressed: _addTodo,
                  //같은매개변수일때 값불러오기로 생략간능 -> addTodo: () => addTodo(),
                ),
              ],
            ),
          ),
          // 아래에 할일 목록 표시 구성
          Expanded(
            child: ListView.builder(
                itemCount: todoViewModel.todos.length,
                itemBuilder: (context, index) {
                  // 뷰모델에 있는 자료구조안에 각 인덱스에 맵핑된 객체 Todo인스턴스 하나
                  final todo= todoViewModel.todos[index];
                  return ListTile(
                    title: Text(todo.title),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () => _removeTodo(todo.id),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
    ;
  }
}
