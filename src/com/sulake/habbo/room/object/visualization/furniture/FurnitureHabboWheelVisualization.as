package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureHabboWheelVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1096:int = 10;
      
      private static const const_698:int = 20;
      
      private static const const_1567:int = 31;
      
      private static const const_1450:int = 32;
       
      
      private var var_334:Array;
      
      private var var_798:Boolean = false;
      
      public function FurnitureHabboWheelVisualization()
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
               this.var_334.push(const_1567);
               this.var_334.push(const_1450);
               return;
            }
         }
         if(param1 > 0 && param1 <= const_1096)
         {
            if(this.var_798)
            {
               this.var_798 = false;
               this.var_334 = new Array();
               this.var_334.push(const_1096 + param1);
               this.var_334.push(const_698 + param1);
               this.var_334.push(param1);
               return;
            }
            super.method_1(param1);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(1) && super.getLastFramePlayed(2) && super.getLastFramePlayed(3))
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
