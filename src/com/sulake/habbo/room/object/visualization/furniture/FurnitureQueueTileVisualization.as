package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureQueueTileVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1450:int = 3;
      
      private static const const_1602:int = 2;
      
      private static const const_1604:int = 1;
      
      private static const const_1603:int = 15;
       
      
      private var var_334:Array;
      
      private var var_1313:int;
      
      public function FurnitureQueueTileVisualization()
      {
         this.var_334 = new Array();
         super();
      }
      
      override protected function method_1(param1:int) : void
      {
         if(param1 == const_1602)
         {
            this.var_334 = new Array();
            this.var_334.push(const_1604);
            this.var_1313 = const_1603;
         }
         super.method_1(param1);
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(this.var_1313 > 0)
         {
            --this.var_1313;
         }
         if(this.var_1313 == 0)
         {
            if(this.var_334.length > 0)
            {
               super.method_1(this.var_334.shift());
            }
         }
         return super.updateAnimation(param1);
      }
   }
}
