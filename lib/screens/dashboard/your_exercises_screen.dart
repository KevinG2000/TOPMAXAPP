import 'package:flutter/material.dart';
import 'package:salong/utils/colors.dart';
import 'package:salong/models/exercise.dart';
import 'package:salong/screens/dashboard/edit_exercise_screen.dart';

class YourExercisesScreen extends StatefulWidget {
  @override
  _YourExercisesScreenState createState() => _YourExercisesScreenState();
}

class _YourExercisesScreenState extends State<YourExercisesScreen> {
  List<Exercise> exercises = [
    Exercise(
      id: '1',
      name: 'Push-ups',
      measurementType: MeasurementType.repetition
    ),
    Exercise(
      id: '2',
      name: 'Running',
      measurementType: MeasurementType.time
    ),
    Exercise(
      id: '3',
      name: 'Bench Press',
      measurementType: MeasurementType.weightAndRepetition
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Exercises'),
        backgroundColor: CustomColor.accentColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: exercises.length,
              itemBuilder: (context, index) {
                final exercise = exercises[index];
                return ListTile(
                  title: Text(exercise.name),
                  subtitle: Text(_getMeasurementTypeText(exercise.measurementType)),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () => _editExercise(exercise),
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteExercise(exercise),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.accentColor,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _addNewExercise,
              child: Text('Add New Exercise'),
            ),
          ),
        ],
      ),
    );
  }

  String _getMeasurementTypeText(MeasurementType type) {
    switch (type) {
      case MeasurementType.time:
        return 'Time';
      case MeasurementType.repetition:
        return 'Repetition';
      case MeasurementType.weight:
        return 'Weight';
      case MeasurementType.weightAndRepetition:
        return 'Weight and Repetition';
      case MeasurementType.repetitionAndTime:
        return 'Repetition and Time';
    }
  }

  Future<void> _addNewExercise() async {
    final result = await Navigator.push<Exercise>(
      context,
      MaterialPageRoute(
        builder: (context) => EditExerciseScreen(),
      ),
    );
    
    if (result != null) {
      setState(() {
        exercises.add(result);
      });
      // TODO: Save to backend
    }
  }

  Future<void> _editExercise(Exercise exercise) async {
    final result = await Navigator.push<Exercise>(
      context,
      MaterialPageRoute(
        builder: (context) => EditExerciseScreen(exercise: exercise),
      ),
    );
    
    if (result != null) {
      setState(() {
        final index = exercises.indexWhere((e) => e.id == exercise.id);
        if (index != -1) {
          exercises[index] = result;
        }
      });
      // TODO: Update in backend
    }
  }

  void _deleteExercise(Exercise exercise) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete Exercise'),
        content: Text('Are you sure you want to delete ${exercise.name}?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              setState(() {
                exercises.removeWhere((e) => e.id == exercise.id);
              });
              // TODO: Delete from backend
              Navigator.pop(context);
            },
            child: Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}