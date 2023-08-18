import 'dart:async';

import 'package:simple_food_menu/data/model/food_model.dart';
import 'package:simple_food_menu/data/model/summary_model.dart';

class ShoppingCartStreams {

 final cartStreamController = StreamController.broadcast();
  Stream get getStream => cartStreamController.stream;


  final cartList = StreamController< Map< int,List<FoodData>>>.broadcast();
  final summaryStramController = StreamController< SummaryModel>.broadcast();



  Stream<
  Map< int,List<FoodData>>> get cartListStram => cartList.stream;


Sink<
  Map< int,List<FoodData>>> get cartListSink => cartList.sink;


  Stream<
 SummaryModel> get summaryStream => summaryStramController.stream;


Sink<
 SummaryModel> get summarySink => summaryStramController.sink;



  final Map< int,List<FoodData>> allItems={};
void addFoodToCart(FoodData foodData){
  if (!allItems.keys.contains(foodData.id)) {
    allItems[foodData.id]=[foodData];
  }
  cartListSink.add(allItems);
}
  void increaseFood(int food ){
    var foodModel=
  allItems[food];

   allItems[food]!.add(foodModel!.first);
     cartListSink.add(allItems);
  }

  void decreaseFood(int food ){
     var foodModel=
  allItems[food];
if (foodModel!.isNotEmpty &&  foodModel.length>1) {
  foodModel.removeLast();

}
cartListSink.add(allItems);
  }

  clear(){
allItems.clear();
cartListSink.add(allItems);

  }
  SummaryModel getSummary(){
    SummaryModel? summaryModel;
    ///TODO:implement 
    ///
    ///
    double tax = 2.00;
       double total = 0.00;
   double subtotal = 0.00;
int items=allItems.keys.length;

for (var key in allItems.keys) {
  

  for (var item in allItems[key]!) {
       subtotal+= item.price;
  }

}
total = subtotal+tax;

summaryModel = SummaryModel(
  numOfItems: items , 
  subtotal: subtotal  , total: total , 
  tax: tax
);


    return summaryModel;
  }
    void dispose() {
    cartStreamController.close(); // close our StreamController
    cartList.close();
  }
}
final bloc = ShoppingCartStreams();