import '../../data/models/person_model.dart';

abstract class Repository {
  Future<List<PersonModel>> getPersonsList();
}