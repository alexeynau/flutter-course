import 'package:flutter/material.dart';
import '../../data/repository/repository_impl.dart';
import '../../domain/repository/repository.dart';
import '../../presentation/widgets/person_list_tile.dart';

import 'person_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Repository repository = RepositoryImpl();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Adaptive App')
      ),
      body: FutureBuilder(
          future: repository.getPersonsList(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.done:
                return LayoutBuilder(builder: (context, constraints) {
                  return constraints.maxWidth < 720
                      ? ListView(
                          children: snapshot.hasData
                              ? snapshot.data!
                                  .map((e) => Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: PersonListTile(personModel: e),
                                      ))
                                  .toList()
                              : [const Text('Not Found')],
                        )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              color: Colors.amber,
                              width: MediaQuery.of(context).size.width < 900
                                  ? MediaQuery.of(context).size.width - 500
                                  : MediaQuery.of(context).size.width - 720,
                              height: double.maxFinite,
                              child: const Center(child: Text('addaptive app')),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width < 900
                                  ? 500
                                  : 720,
                              child: GridView.builder(
                                gridDelegate:
                                    SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount:
                                      MediaQuery.of(context).size.width < 1200
                                          ? (MediaQuery.of(context)
                                                  .size
                                                  .width ~/
                                              300)
                                          : 3,
                                  crossAxisSpacing: 20,
                                  mainAxisSpacing: 20,
                                ),
                                itemCount: snapshot.data!.length,
                                itemBuilder: (context, index) {
                                  return PersonCard(
                                      personModel: snapshot.data![index]);
                                },
                              ),
                            ),
                          ],
                        );
                });

              default:
                return const CircularProgressIndicator();
            }
          }),

    );
  }
}
