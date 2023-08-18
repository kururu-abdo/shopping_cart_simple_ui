class FoodData {
  final int id;
  final String?  assets;
  final String title;
  final String desc; 
  final int rate;
  final double price;

  FoodData({required this.id,this.assets ,
   required this.title, required this.desc, required this.rate, required this.price}); 



  @override
  bool operator ==(Object other) {
   return (
    (other is FoodData) &&
    
    other.id == id);
  }
  
     @override
	
    int get hashCode => Object.hash(id  ,title );
}