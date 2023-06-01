import 'package:flutter/material.dart';
import '../../data/models/person_model.dart';

class PersonListTile extends StatelessWidget {
  final PersonModel personModel;

  const PersonListTile({super.key, required this.personModel});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListTile(
        onTap: () {
          showBottomSheet(
            elevation: 8,
            backgroundColor: Colors.transparent,
           context: context,
            builder: (context) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10, bottom: 50),
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
          );
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        leading: Container(
          width: 100,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: Image.asset('assets/images/${personModel.photo}').image,
                fit: BoxFit.fill,
                scale: 1.0),
          ),
        ),
        title: Text(personModel.name),
        visualDensity: VisualDensity(
          vertical: 4
        ),
        subtitle: Text(personModel.email),
        tileColor: const Color.fromARGB(255, 60, 184, 247),
      ),
    );
  }
}
