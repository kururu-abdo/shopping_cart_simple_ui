
import 'package:flutter/material.dart';
import 'package:simple_food_menu/data/model/food_model.dart';
import 'package:simple_food_menu/presentation/controllers/shopping_cart_streams.dart';

class CartItemWidget extends StatefulWidget {
  final String? desc;
  final String? title;
  final int? rate;
  final double? weight;
  final double?  price;
final FoodData? foodData;
final int? quantity;
  const CartItemWidget({super.key,
  
  this.foodData,
   this.desc, this.title, this.rate, this.weight, this.price, this.quantity});

  @override
  State<CartItemWidget> createState() => _FoodWidgetState();
}

class _FoodWidgetState extends State<CartItemWidget>   with TickerProviderStateMixin{
   AnimationController? animationController;
  Animation<Offset>? animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

animationController = AnimationController(vsync: this , duration: const Duration(milliseconds: 400));

animation =  Tween<Offset>(  begin: const Offset(1, 0) , end: const Offset(0, 0)  )
.animate(CurvedAnimation(parent: animationController!, curve: Curves.easeInOut));

// animate(animationController!);

animationController!.forward();



  }

@override
  void dispose() {
    animationController!.dispose();
    super.dispose();
  }


bool  _isToggled= false;
  @override
  Widget build(BuildContext context) {
          // 

    return 
    
     Container(
          margin: const EdgeInsets.only(
            bottom: 15
          ),
          width: MediaQuery.of(context).size.width ,
          child: Stack(
        
        children: [
          Center(
            child: GestureDetector(
              onTap: (){
                _isToggled= !_isToggled;
                setState(() {
                  
                });
              },
    
              child: Container(
                  
                  width: (MediaQuery.of(context).size.width-100) ,
                  height: 150 ,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 60 ,  vertical: 20
                  ),
                  decoration:  BoxDecoration(
                    color: Colors.white ,
                    borderRadius: BorderRadius.circular(20),
                    
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey[100]!, 
                  
                  offset: const Offset(0, .8) ,  
                  
                  blurRadius: 5,spreadRadius:1
                      )
                    ]
                  ), 
                  
                  child:  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text("${widget.title}" , maxLines: 2 , overflow: TextOverflow.ellipsis , style: const TextStyle(
                      fontSize: 18   ,fontWeight: FontWeight.w600
                    ),)
                  , 
                  Row(
                    mainAxisSize: MainAxisSize.min, 
                    children: List.generate(5, (index) => Icon(Icons.star ,size: 18   ,
                    color: index<widget.rate!? Colors.amber:Colors.grey[400],
                    
                    )),
                  )
                  , 
            
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
                    children: [
            
              Text("${widget.weight} g" , style: TextStyle(
                      fontSize: 15 , fontWeight: FontWeight.w500  , color: Colors.grey[300]
                    ),)
            ,
            
            
                       Text("\$${widget.price}" , style: const TextStyle(
                      fontSize: 16 , fontWeight: FontWeight.w500  , color: Colors.red
                    ),)
                    ],
                  )
                  ], ),
              ),
            ),
          ),  
        
        
        
           Positioned(
            left:  0,
            top: (150-60)/2,
            child: 
         Container(
        width: 60,  height: 60, 
        decoration:  BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle, 
        



        image: DecorationImage(image: AssetImage(widget.foodData!.assets!) , fit: BoxFit.cover),
            boxShadow: [
                    BoxShadow(
                      color: Colors.grey[200]!, 
        
        offset: const Offset(0, 3) ,  
        
        blurRadius: 10
                    )
                  ]
         ),
         )
          
          ),
        
             Positioned(
            right: 0,
            top: (150-120)/2,
            child: 
          GestureDetector(
            onTap: (){
                // cart!.addFoodToCart(widget.foodData!);
                // bloc.addFoodToCart(widget.foodData!);
            },
            child: Container(
              width:   50, height: 120, 
                
              decoration:  BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                 color:Colors.white,
                boxShadow:[
                   BoxShadow(
                        color: Colors.grey[200]!, 
                
                offset: const Offset(0, 2) ,  
                
                blurRadius: 20
                      )
                    ]
              ),
            child: Column(

              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
IconButton(onPressed: (){
bloc.decreaseFood(widget.foodData!.id);
}, icon: const Icon(Icons.remove)) ,

Text('${bloc.allItems[widget.foodData!.id]!.length}'),

IconButton(onPressed: (){
bloc.increaseFood(widget.foodData!.id);
}, icon: const Icon(Icons.add))


              ],
            )
           
            ),
          )
          
          )
        ],
        
          ),
        );
      
  
  }
}