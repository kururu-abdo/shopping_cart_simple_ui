class SummaryModel {
  

  final int?   numOfItems;
  final double? subtotal;
  final double?  tax;
  final double? total;

  SummaryModel({ this.numOfItems,  this.subtotal,  this.tax,  this.total});


  SummaryModel copyWith({int? numOfItems, 
  double? subtotal ,double? tax , double? total
  
  }) => SummaryModel(
          numOfItems: numOfItems?? this.numOfItems , 
          subtotal: subtotal?? this.subtotal , 
          tax: tax?? this.tax , 
          total: total?? this.total
      );
}