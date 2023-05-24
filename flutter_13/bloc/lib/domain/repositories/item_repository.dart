import '../../data/models/item_model.dart';

abstract class ItemRepository {
 Future<List<ItemModel>> getAllItems();
}