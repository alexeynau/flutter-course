import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_16/features/data/models/person_model.dart';

class PersonCard extends StatelessWidget {
  final PersonModel personModel;
  const PersonCard({super.key, required this.personModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: (details) => showCupertinoModalPopup(
        anchorPoint: details.globalPosition,
        context: context, 
        builder: (context) {
          //print(details.globalPosition);
              return Container(
                //padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
                child: SizedBox(
                  height: 170,
                  child: Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      // ListTile closes Bottom Sheet on tap
                      children: [
                        ListTile(
                          onTap: () => Navigator.of(context).pop(),
                          leading: const Icon(Icons.person),
                          title: const Text('VIEW PROFILE'),
                        ),
                        ListTile(
                           onTap: () => Navigator.of(context).pop(),
                          leading: const Icon(Icons.people),
                          title: const Text('FRIENDS'),
                        ),
                        ListTile(
                           onTap: () => Navigator.of(context).pop(),
                          leading: const Icon(Icons.textsms_outlined),
                          title: const Text('REPORT'),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
        ),
      child: Card(
        color: const Color.fromARGB(255, 60, 184, 247),
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/images/${personModel.photo}'),
            ),
            Text(
              personModel.name,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(personModel.email),
          ],
        ),
      ),
    );
  }
}
