import 'package:flutter/material.dart';
import 'package:simple_food_menu/domain/repository/shppong_cart_repo.dart';
import 'package:simple_food_menu/presentation/controllers/shopping_cart_inherited_widget.dart';
import 'package:simple_food_menu/presentation/widgets/cart_icon.dart';
import 'package:simple_food_menu/presentation/widgets/category_widget.dart';
import 'package:simple_food_menu/presentation/widgets/food_widget.dart';

class CategoryFoodsPage extends StatefulWidget {
  const CategoryFoodsPage({super.key});

  @override
  State<CategoryFoodsPage> createState() => _CategoryFoodsPageState();
}

class _CategoryFoodsPageState extends State<CategoryFoodsPage> {
  
  @override
  Widget build(BuildContext context) {
    return 
    
        Scaffold( body: ShoppingCartState(
          child: Builder(
            builder: (context) {
                var cart =  ShoppingCartState.of(context);
              return SizedBox.expand(
        child: Stack(
          children: [
              Container(
            
            child: Row(
              children: [
            
              Hero(
                   tag: 'redAccent',
                child: Container(
                  width: MediaQuery.of(context).size.width*.65, 
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
        
        
             const CartIcon()
            ],
          ) ,
          const SizedBox(height: 20,) , 
         const Text("Salads\nMenu" , style: TextStyle(
                        fontSize: 40 , fontWeight: FontWeight.bold ,  color: Colors.white
                      ),), 
                       const SizedBox(height: 20,) , 
          Expanded(child: 
          
          ListView(
        
        
        
        children:
        
        cart!.getFoods()
        .map((e) => FoodWidget(
          foodData: e,
          price: e.price,
          rate: e.rate, 
          weight: 250,
          title: e.title ,
          desc: e.desc,
        ) ).toList()
        
        
        //  const [
        
        // FoodWidget(
        //   price: 7.50,
        //   rate: 1, 
        //   weight: 250,
        //   title: 'Italian Food with frech Smell' ,
        //   desc: 'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ,lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkflorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf  ',
        // ) , 
        
        
        
        // FoodWidget(
        //   price: 7.50,
        //   rate: 2, 
        //   weight: 250,
        //   title: 'Sudanese Food with frech Smell' ,
        //   desc: 'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf   ',
        // ) ,
        
        // FoodWidget(
        //   price: 7.50,
        //   rate: 3, 
        //   weight: 250,
        //   title: 'Egyptain Food with frech Smell' ,
        //   desc: 'lorem lorem adsjfhadsjlf   laksdjnfkljdasn  \n dkfjhsdf   sdfksdjfkljsdlkf  \njshdjkfhsdkf   ',
        // )
        
        
        // ],
        
       
       
          )
          
          
          )
          
          
              ],
            ),
          )
          
          
          ],
        ),
        
            );
            }
          ),
        ),   );
  
  
  
  }
}