import 'package:flutter/material.dart';
import 'package:simple_food_menu/presentation/controllers/shopping_cart_inherited_widget.dart';
import 'package:simple_food_menu/presentation/controllers/shopping_cart_streams.dart';
import 'package:simple_food_menu/presentation/pages/cart_page.dart';

class CartIcon extends StatelessWidget {
  final  bool? isCartPage;
  const CartIcon({super.key, 
  
  this.isCartPage=false});

  @override
  Widget build(BuildContext context) {
   
    return

     StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.cartListStram,
      builder: (context, snapshot) {
        return 
          
          
           bloc.allItems.values.isNotEmpty?
    // false?
    GestureDetector(
      onTap: (){
        if (   bloc.allItems.values.isNotEmpty) {
           Navigator.of(context).push(
                
                MaterialPageRoute(builder: (_)=>  const CartPage()  )
               );
        }
      },
      child: Stack(
        children: [
      
            Icon(Icons.shopping_basket_outlined ,color:
            
            
            isCartPage!?Colors.white:
             Colors.grey[400], size: 30,) , 
      
      Positioned(
        
        top: -3,
        right: 0,
        child: 
      
      Container(
        padding: const EdgeInsets.all(
            5
        ),
        decoration:  BoxDecoration(
            shape: BoxShape.circle ,   
            color:
              isCartPage!?Colors.white:
            
             Colors.redAccent
        ),
        child:  Center(
            child: Text('${bloc.allItems.keys.length}'  , style:  TextStyle(
              fontSize: 10,
              color: 
              
              
                isCartPage!?Colors.redAccent:
              Colors.white),),
        ),
      )
      )
        ],
      ),
    )
    
    :
    
          Icon(Icons.shopping_basket_outlined ,color: Colors.grey[400],);
      },
    );
    ShoppingCartState(
      child: Builder(
        builder: (context) {
           var cart =  ShoppingCartState.of(context);
          return 
          
          
          cart!.cartFoods.values.isNotEmpty?
    // false?
    Stack(
      children: [
    
          Icon(Icons.shopping_basket_outlined ,color: Colors.grey[400], size: 30,) , 
    
    Positioned(
      
      top: -3,
      right: 0,
      child: 
    
    Container(
      padding: const EdgeInsets.all(
          5
      ),
      decoration: const BoxDecoration(
          shape: BoxShape.circle ,   
          color: Colors.redAccent
      ),
      child: const Center(
          child: Text('8'  , style: TextStyle(color: Colors.white),),
      ),
    )
    )
      ],
    )
    
    :
    
          Icon(Icons.shopping_basket_outlined ,color: Colors.grey[400],);
        }
      ),
    );
  
  
  
  }
}