import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:simple_food_menu/presentation/pages/category_foods.dart';

class CategoryWigets extends StatefulWidget {
  final String?  title;
  final int? numOfItems;
  const CategoryWigets({super.key, this.title, this.numOfItems});

  @override
  State<CategoryWigets> createState() => _CategoryWigetsState();
}

class _CategoryWigetsState extends State<CategoryWigets>  with TickerProviderStateMixin{
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

  @override
  Widget build(BuildContext context) {
    return 
    
AnimatedBuilder(
  animation: animationController!,
  builder: (context, child) {
    return     SlideTransition(
      position: animation!,
      child: Container(
        margin: const EdgeInsets.only(
          bottom: 15
        ),
        width: MediaQuery.of(context).size.width ,
        child: Stack(
      
      children: [
        Center(
          child: Container(
      
              width: (MediaQuery.of(context).size.width-100) ,
              height: 130 ,
              padding: const EdgeInsets.symmetric(
                horizontal: 60 ,  vertical: 20
              ),
              decoration:  BoxDecoration(
                color: Colors.white ,
                borderRadius: BorderRadius.circular(20),
                
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey[100]!, 
      
      offset: const Offset(0, 1) ,  
      
      blurRadius: 1,spreadRadius:1
                  )
                ]
              ), 
      
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                 Text("${widget.title}" , style: const TextStyle(
                  fontSize: 30 , fontWeight: FontWeight.bold
                ),)
      , 
      Text("${widget.numOfItems} items" , style: TextStyle(
                  fontSize: 15 , fontWeight: FontWeight.w500  , color: Colors.grey[500]
                ),)
      
              ], ),
          ),
        ),  
      
      
      
         Positioned(
          left:  0,
          top: (120-60)/2,
          child: 
       Container(
      width: 60,  height: 60, 
      padding: const EdgeInsets.all(5),
      decoration:  BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle, 
      
          boxShadow: [
                  BoxShadow(
                    color: Colors.grey[200]!, 
      
      offset: const Offset(0, 3) ,  
      
      blurRadius: 1 , spreadRadius: 1
                  )
                ]
       ),

       child: const CircleAvatar(
  radius: 30,
  backgroundImage: AssetImage( "assets/pizza1.jpg",),
  
),
       )
        
        ),
      
           Positioned(
          right: 0,
          top: (100-25)/2,
          child: 
        GestureDetector(
          onTap: (){
               Navigator.of(context).push(
                
                MaterialPageRoute(builder: (_)=>  const CategoryFoodsPage()  )
               );
          },
          child: Container(
            width:   50, height: 50, 
              
            decoration:  BoxDecoration(
                shape: BoxShape.circle , color:Colors.white,
              boxShadow:[
                 BoxShadow(
                      color: Colors.grey[200]!, 
              
              offset: const Offset(0, 2) ,  
              
              blurRadius: 1 , spreadRadius: 1
                    )
                  ]
            ),
          child: const Center(
            child: Icon(
              Icons.arrow_forward_ios ,color: Colors.redAccent,
            ),
          ),
          ),
        )
        
        )
      ],
      
        ),
      ),
    );
  }
)

;
  }
}