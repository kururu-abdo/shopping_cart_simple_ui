import 'package:simple_food_menu/data/model/food_model.dart';
import 'package:simple_food_menu/data/model/summary_model.dart';

abstract class ShpoointCartRepo {
  




  void addFoodToCart(FoodData foodData);
  void increaseFood(int food , count);

  void decreaseFood(int food , count);

  SummaryModel getSummary();


}