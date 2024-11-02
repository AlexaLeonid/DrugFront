import 'package:flutter/material.dart';

class DrugPage extends StatelessWidget {
  final String medicineName;

  const DrugPage({super.key, required this.medicineName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(medicineName),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ExpansionTile(
              title: Text("Описание"),
              children: [
                ListTile(title: Text("Здесь будет описание лекарства.")),
              ],
            ),
            ExpansionTile(
              title: Text("Характеристики"),
              children: [
                ListTile(title: Text("Здесь будут характеристики лекарства.")),
              ],
            ),
            ExpansionTile(
              title: Text("Инструкция"),
              children: [
                ListTile(title: Text("Здесь будет инструкция по применению.")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}