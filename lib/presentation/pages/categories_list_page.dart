import 'package:flutter/material.dart';
import 'package:simple_food_menu/presentation/widgets/cart_icon.dart';
import 'package:simple_food_menu/presentation/widgets/category_widget.dart';

class CagoriesListPage extends StatefulWidget {
  const CagoriesListPage({super.key});

  @override
  State<CagoriesListPage> createState() => _CagoriesListPageState();
}

class _CagoriesListPageState extends State<CagoriesListPage> {
  @override
  Widget build(BuildContext context) {



    return    Scaffold( body: SizedBox.expand(
child: Stack(
  children: [
    
        Container(
    
    child: Row(
      children: [
    
        Hero(
          tag: 'redAccent',
          child: Container(
            width: MediaQuery.of(context).size.width/3, 
            color: Colors.redAccent ,
            
          ),
        ) ,
        Expanded(child: 
        
        Container(
    
    
        )
        )
      ],
    ),
    
    ),
  



  Container(
    padding:  const EdgeInsets.symmetric(
      horizontal: 20
    ),
    child:  Column(
      children: [
  const SizedBox(height: 80,) , 
   Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Hero(
        tag: 'menu',
        child: const Icon(Icons.menu , color: Colors.white, )), 
      CartIcon()
    ],
  ) ,

  Expanded(child: 
  
  ListView(



children: const [

CategoryWigets(
  title: 'Pizza',
  numOfItems: 30,
)
, 
CategoryWigets(
  title: 'Salads',
  numOfItems: 20,
)



],

  )
  
  
  )
  
  
      ],
    ),
  )
  
  
  ],
),

    ),   );
  
  
  
  }
}