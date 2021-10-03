package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureBottleVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1096:int = 20;
      
      private static const const_698:int = 9;
      
      private static const const_1450:int = -1;
       
      
      private var var_334:Array;
      
      private var var_798:Boolean = false;
      
      public function FurnitureBottleVisualization()
      {
         this.var_334 = new Array();
         super();
      }
      
      override protected function method_1(param1:int) : void
      {
         if(param1 == -1)
         {
            if(!this.var_798)
            {
               this.var_798 = true;
               this.var_334 = new Array();
               this.var_334.push(const_1450);
               return;
            }
         }
         if(param1 >= 0 && param1 <= 7)
         {
            if(this.var_798)
            {
               this.var_798 = false;
               this.var_334 = new Array();
               this.var_334.push(const_1096);
               this.var_334.push(const_698 + param1);
               this.var_334.push(param1);
               return;
            }
            super.method_1(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(0))
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
