import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:module1_business/src/bloc_factory.config.dart';
import '../../data/repositories/repository_provider.dart';

@InjectableInit()
void initializeBlocs(){
  initializeRepository();
  $initGetIt(GetIt.I);
}