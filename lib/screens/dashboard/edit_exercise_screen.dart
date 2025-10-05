import 'package:flutter/material.dart';
import 'package:salong/models/exercise.dart';
import 'package:salong/utils/colors.dart';

class EditExerciseScreen extends StatefulWidget {
  final Exercise? exercise;
  
  EditExerciseScreen({this.exercise});
  
  @override
  _EditExerciseScreenState createState() => _EditExerciseScreenState();
}

class _EditExerciseScreenState extends State<EditExerciseScreen> {
  late TextEditingController _nameController;
  late MeasurementType _selectedType;
  
  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController(text: widget.exercise?.name ?? '');
    _selectedType = widget.exercise?.measurementType ?? MeasurementType.repetition;
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.exercise == null ? 'Add Exercise' : 'Edit Exercise'),
        backgroundColor: CustomColor.accentColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Exercise Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 20),
            Text('Measurement Type:', style: TextStyle(fontSize: 16)),
            SizedBox(height: 10),
            ...MeasurementType.values.map((type) => RadioListTile<MeasurementType>(
              title: Text(_getMeasurementTypeText(type)),
              value: type,
              groupValue: _selectedType,
              onChanged: (MeasurementType? value) {
                if (value != null) {
                  setState(() => _selectedType = value);
                }
              },
            )).toList(),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.accentColor,
                padding: EdgeInsets.symmetric(vertical: 16),
              ),
              onPressed: () {
                if (_nameController.text.isNotEmpty) {
                  final exercise = Exercise(
                    id: widget.exercise?.id ?? DateTime.now().toString(),
                    name: _nameController.text,
                    measurementType: _selectedType,
                  );
                  Navigator.pop(context, exercise);
                }
              },
              child: Text(widget.exercise == null ? 'Add' : 'Save Changes'),
            ),
          ],
        ),
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
  
  @override
  void dispose() {
    _nameController.dispose();
    super.dispose();
  }
}