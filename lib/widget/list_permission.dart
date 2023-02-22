import 'package:flutter/material.dart';

class ListPermission extends StatelessWidget {
  const ListPermission({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: InkWell(
        onTap: () {},
        child: Card(
          child: Row(
            children: [
              const SizedBox(
                width: 10,
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100),
                      image: const DecorationImage(
                          image: NetworkImage(
                              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSbzYi-opUwgHCbmFzGQ-ffnXfGknhvv72sKA&usqp=CAU"),
                          fit: BoxFit.fill)),
                ),
              ),
              Expanded(
                flex: 5,
                child: ListTile(
                  title: const Text(
                    "غسان صالح",
                  ),
                  subtitle: const Text(
                    "كلية الهندسة ",
                  ),
                  trailing: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.edit),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
