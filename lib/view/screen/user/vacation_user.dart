import 'package:flutter/material.dart';
import 'package:smart_presence_app/widget/list_permission.dart';
import 'custom_permission_user.dart';

class VacationPage extends StatefulWidget {
  const VacationPage({super.key});

  @override
  State<VacationPage> createState() => _VacationPageState();
}

class _VacationPageState extends State<VacationPage> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: ListVacation());
  }
}

class ListVacation extends StatelessWidget {
  const ListVacation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: const [
            ListPermission(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Theme.of(context).buttonColor,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
            builder: (context) {
              return const CustomPermissionPage();
            },
          ));
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
