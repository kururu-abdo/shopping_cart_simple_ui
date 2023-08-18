import 'package:flutter/material.dart';
import 'package:simple_food_menu/data/model/food_model.dart';
import 'package:simple_food_menu/data/model/summary_model.dart';


class ShoppingCartState extends InheritedWidget {

 
  @override
  final Widget child;

  
  ShoppingCartState({Key? key,required this.child, })
      : super(key: key, child: child);


  Map< int,List<FoodData>>  cartFoods = {};
  static ShoppingCartState? of(BuildContext context) {
    return 
    context.dependOnInheritedWidgetOfExactType<ShoppingCartState>()!;
    
    // (context.dependOnInheritedWidgetOfExactType<ShoppingCartState>());
  }
void addFoodToCart(FoodData foodData){
  if (!cartFoods.keys.contains(foodData.id)) {
    cartFoods[foodData.id]=[foodData];
  }
}
  void increaseFood(int food ){
    var foodModel=
  cartFoods[food];

   cartFoods[food]!.add(foodModel!.first);
  }

  void decreaseFood(int food ){
     var foodModel=
  cartFoods[food];
if(foodModel!.length>1){
foodModel.removeLast();
}


  }
List<FoodData> getFoods(){
  return [ 
    FoodData(id: 1, title: 'Itailian Foods with Sudanese',
    assets: 'assets/pizza1.jpg',
    
     desc:
    
     'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ,lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkflorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ', 
    
    
    
    rate: 3, price: 7.59) , 

       FoodData(id: 2, title: 'Fried Chicken with lemon',
    assets: 'assets/pizaa2.jpg',
    
     desc:
    
     'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ,lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkflorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ', 
    
    
    
    rate: 5, price: 7.20) ,


         FoodData(id: 3, title: 'Indian Snacks',
    assets: 'assets/pizza4.jpg',
    
     desc:
    
     'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ,lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkflorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ', 
    
    
    
    rate: 5, price: 5.20) ,

  ];
}
  SummaryModel getSummary(){
    SummaryModel? summaryModel;
    ///TODO:implement 
    ///
    ///
    

    return summaryModel!;
  }
  @override
  bool updateShouldNotify(ShoppingCartState oldWidget) {
    //return true;
    return child != oldWidget.child;
  }
}