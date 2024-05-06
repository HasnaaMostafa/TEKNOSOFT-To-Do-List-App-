import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:teknosoft/features/home/presentation/manager/task_cubit/task_cubit.dart';
import 'package:teknosoft/features/home/presentation/views/home_view.dart';
import 'package:teknosoft/features/task/presentation/manager/add_task_cubit/add_task_cubit.dart';

import 'core/bloc_observer/bloc_observer.dart';
import 'core/constants/constants.dart';
import 'core/helper/cache_helper.dart';
import 'features/task/data/models/task_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  await Hive.initFlutter();
  Hive.registerAdapter(TaskModelAdapter());
  await Hive.openBox<TaskModel>(kTasksBox);
  Bloc.observer = MyBlocObserver();
  runApp(const TodoListApp());
}

class TodoListApp extends StatelessWidget {
  const TodoListApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) => TaskCubit()..fetchTasks()),
        BlocProvider(create: (BuildContext context) => AddTaskCubit()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const HomeView(),
      ),
    );
  }
}
