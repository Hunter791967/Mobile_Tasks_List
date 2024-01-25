import 'package:flutter/material.dart';
import 'Todo.dart';
class AlertText extends StatefulWidget {
  const AlertText({super.key});

  @override
  State<AlertText> createState() => _AlertTextState();
}

class _AlertTextState extends State<AlertText> {
  final List<Todo> _todos = [];
  String newTextInput = '';
  void _showInputDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.deepOrange[700],
            title: const Text(
              'Enter Your Task',
              style: TextStyle(color: Colors.white),
            ),
            content: TextField(
              autofocus: true,
              onChanged: (value) {
                newTextInput = value;
              },
              maxLength: 100,
              decoration: const InputDecoration(
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              style: const TextStyle(color: Colors.white),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Cancel',
                  style: TextStyle(color: Colors.white),
                  textAlign: TextAlign.center,
                ),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    _todos.add(
                        Todo(task: newTextInput, isDone: false)
                        );
                  });
                  Navigator.of(context).pop();
                },
                child: const Text(
                  'Save',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.white),
                ),
              )
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    bool checkBoxValue = false;
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Column(
        // set the crossAxisAlignment property to center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Container(
              width: 400.0,
              height: 300.0,
              decoration: BoxDecoration(
                color: Colors.deepOrange,
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(
                  color: Colors.deepOrange,
                  width: 2.0,
                ),
              ),
              child: ListView.builder(
                  itemCount: _todos.length,
                  itemBuilder: (context, index) {
                    // final List toDo = [];
                    return ListTile(
                      leading: Checkbox(
                        value: _todos[index].isDone,

                        side: const BorderSide(width: 2, color: Colors.white),
                        // fillColor: MaterialStateProperty.all(Colors.white),
                        activeColor: Colors.white,
                        checkColor: Colors.deepOrange,
                        onChanged: (bool? value) {
                          setState(() {
                            _todos[index].isDone = value!;
                          });
                        },
                      ),
                      title: Text(
                        _todos[index].task,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20),
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.edit_calendar),
                            onPressed: () {
                              setState(() {
                                // _textInput[index] =
                              });
                              // Navigator.of(context).push;
                            },
                            color: Colors.white,
                          ),
                          IconButton(
                            icon: const Icon(Icons.delete),
                            onPressed: () {
                              setState(() {
                                _todos.removeAt(index);
                              });
                            },
                            color: Colors.white,
                          ),
                        ],
                      ),
                    );
                  }),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: SizedBox(
              width: 80,
              height: 80,
              child: MaterialButton(
                color: Colors.deepOrange,
                shape: const CircleBorder(),
                onPressed: _showInputDialog,
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 40,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
