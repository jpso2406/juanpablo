import 'package:flutter/material.dart';

// Importar widgets de usuario
import 'widgets/user/user_initial.dart';
import 'widgets/user/user_loading.dart';
import 'widgets/user/user_success.dart';
import 'widgets/user/user_error.dart';

// Importar widgets de tareas
import 'widgets/tasks/task_initial.dart';
import 'widgets/tasks/task_loading.dart';
import 'widgets/tasks/task_success.dart';
import 'widgets/tasks/task_error.dart';

enum ViewState { initial, loading, error, success }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ViewState userState = ViewState.initial;
  ViewState taskState = ViewState.initial;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Demo 8 Widgets")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildUserContainer(),
            const SizedBox(height: 20),
            _buildTaskContainer(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            // Cambiar estados para probar
            userState = ViewState.values[(userState.index + 1) % ViewState.values.length];
            taskState = ViewState.values[(taskState.index + 1) % ViewState.values.length];
          });
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }

  Widget _buildUserContainer() {
    switch (userState) {
      case ViewState.initial:
        return const UserInitial();
      case ViewState.loading:
        return const UserLoading();
      case ViewState.success:
        return const UserSuccess();
      case ViewState.error:
        return const UserError();
    }
  }

  Widget _buildTaskContainer() {
    switch (taskState) {
      case ViewState.initial:
        return const TaskInitial();
      case ViewState.loading:
        return const TaskLoading();
      case ViewState.success:
        return const TaskSuccess();
      case ViewState.error:
        return const TaskError();
    }
  }
}