import 'package:flutter/material.dart';
import 'package:simple_food_menu/presentation/controllers/shopping_cart_streams.dart';
import 'package:simple_food_menu/presentation/widgets/cart_icon.dart';
import 'package:simple_food_menu/presentation/widgets/cart_item.dart';
import 'package:simple_food_menu/presentation/widgets/category_widget.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  bool _isShowSummary= false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(

bottomSheet: 
AnimatedCrossFade(firstChild: Container(
  height: 100, 
  padding: const EdgeInsets.symmetric(
    vertical: 10 
 ,horizontal: 20  ),
  decoration: const BoxDecoration(
    color: Colors.white , 

    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25) ,  

      topRight:   Radius.circular(25) ,  
    )
  ),
  child: Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween, 
    // crossAxisAlignment: CrossAxisAlignment.center,
    children: [
       const Text('shopping Cart Summary' ,
       
       style: TextStyle(
        fontSize: 18, fontWeight: FontWeight.w400
       ),
       
       ) , 
      IconButton(onPressed: (){
_isShowSummary= !_isShowSummary;
setState(() {
  
});
      }, icon: const Icon(Icons.keyboard_arrow_down_outlined ,color: Colors.redAccent,))
    ],
  ),
)
,

 secondChild: Container(
  height: 350, 
  padding: const EdgeInsets.symmetric(
    vertical: 20 
 ,horizontal: 20  ),
  decoration: const BoxDecoration(
    color: Colors.white , 

    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(25) ,  

      topRight:   Radius.circular(25) ,  
    )
  ),
  child: Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, 
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
           const Text('shopping Cart Summary' ,
           
           style: TextStyle(
            fontSize: 18, fontWeight: FontWeight.w400
           ),
           
           ) , 
          IconButton(onPressed: (){
_isShowSummary= !_isShowSummary;
setState(() {
      
});
          }, icon: const Icon(Icons.keyboard_arrow_up_outlined ,
          color: Colors.redAccent,))
        ],
      ),


const SizedBox(height: 20,) , 
Column(
  crossAxisAlignment: CrossAxisAlignment.start,
 
  children: [
Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        const SizedBox(
      width: 150  ,
      child: Text('Number of Items:'),
    ),
    Text(bloc.getSummary().numOfItems!.toString())
  ],
)
 , 
const SizedBox(height: 10,),
 Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        const SizedBox(
      width: 150  ,
      child: Text('Subtotal:'),
    ),
    Text("\$${bloc.getSummary().subtotal!.toStringAsFixed(2)}")
  ],
) , 
const SizedBox(height: 10,),
Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        const SizedBox(
      width: 150  ,
      child: Text('Tax:'),
    ),
    Text("\$${bloc.getSummary().tax!.toStringAsFixed(2)}")
  ],
) , 

const SizedBox(height: 10,),
Row(
   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [
        const SizedBox(
      width: 150  ,
      child: Text('Total:'),
    ),
    Text("\$${bloc.getSummary().total!.toStringAsFixed(2)}" ,    
    style:  TextStyle(
      color: Colors.red[900] ,  
      
    ),
    
    
    )
  ],
) , 





  ],
)
, 

const Spacer() , 

 Row(
  mainAxisAlignment: MainAxisAlignment.spaceBetween,
  children: [

    const Row(
      mainAxisSize: MainAxisSize.min,
      children: [],
    ) ,

Container(
  width: 180, 
  height: 50, 
  decoration:  BoxDecoration(
    borderRadius: BorderRadius.circular(50),
    gradient:  LinearGradient(
      
      begin: Alignment.topCenter , 
      end: Alignment.bottomCenter,
      colors: [ 
       Colors.red[200]! ,  
      Colors.red ,  


    ]
    )
  ),
  child: const Center(
    child: Text(
      'Checkout' , style: TextStyle(
        color: Colors.white , fontWeight: FontWeight.bold ,fontSize: 15
      ),
    ),
  ),
)





  ],
)




    ],
  ),
)
, 
 crossFadeState: 
  _isShowSummary? CrossFadeState.showSecond:CrossFadeState.showFirst,
  duration: const Duration(milliseconds: 400))



,
body: Stack(   
  children: [


        Container(
    
    child: Row(
      children: [
    
        Hero(
          tag: 'redAccent',
          child: Container(
            width: MediaQuery.of(context).size.width, 
            color: Colors.redAccent ,
            
          ),
        ) ,

        
       

  // Container(
  //   padding:  const EdgeInsets.symmetric(
  //     horizontal: 20
  //   ),
  //   child:  const Column(
  //     children: [
  // SizedBox(height: 80,) , 
  //  Row(
  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //   children: [
  //     Hero(
  //       tag: 'menu',
  //       child: Icon(Icons.arrow_back , color: Colors.white, )), 
  //     CartIcon()
  //   ],
  // ) ,

 
  
  //     ],
  //   ),
  // )
  
  
      
      
      ],
    ),
    
    ),
  

Container(


  padding: const EdgeInsets.symmetric(horizontal: 20 ),

  child: Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [

 const SizedBox(height: 80,) , 
    Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Hero(
              tag: 'menu',
              child: GestureDetector(
                
                onTap: () {
                  Navigator.pop(context);
                },
                child: const Icon(Icons.arrow_back , color: Colors.white, ))),
      const CartIcon(
        isCartPage: true,
      )
    ],
  ) ,

 const SizedBox(height: 20,) , 
         const Text("Shopping\nCart" , style: TextStyle(
                        fontSize: 40 , fontWeight: FontWeight.bold ,  color: Colors.white
                      ),), 
                       const SizedBox(height: 20,) , 
       Expanded(child: 
  
 StreamBuilder(
      initialData: bloc.allItems,
      stream: bloc.cartListStram,
      builder: (context, snapshot) {
      return ListView(

children: bloc.allItems.values.map((e) => 
CartItemWidget( 
 foodData: e.first,
          price: e.first.price,
          rate: e.first.rate, 
          weight: 250,
          title: e.first.title ,
          desc: e.first.desc,
          quantity: e.length,

)

).toList()

// children: const [

// CategoryWigets(
//   title: 'Pizza',
//   numOfItems: 30,
// )
// , 
// CategoryWigets(
//   title: 'Salads',
//   numOfItems: 20,
// )



// ],

      );
    }
  )
  
  
  )
  
    ],
  ),
)




  ],
  
),
    );
  }
}