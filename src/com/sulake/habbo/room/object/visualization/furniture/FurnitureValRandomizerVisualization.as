package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureValRandomizerVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1096:int = 20;
      
      private static const const_698:int = 10;
      
      private static const const_1567:int = 31;
      
      private static const const_1450:int = 32;
      
      private static const const_699:int = 30;
       
      
      private var var_334:Array;
      
      private var var_798:Boolean = false;
      
      public function FurnitureValRandomizerVisualization()
      {
         this.var_334 = new Array();
         super();
         super.method_1(const_699);
      }
      
      override protected function method_1(param1:int) : void
      {
         if(param1 == 0)
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
         if(param1 > 0 && param1 <= const_698)
         {
            if(this.var_798)
            {
               this.var_798 = false;
               this.var_334 = new Array();
               if(direction == 2)
               {
                  this.var_334.push(const_1096 + 5 - param1);
                  this.var_334.push(const_698 + 5 - param1);
               }
               else
               {
                  this.var_334.push(const_1096 + param1);
                  this.var_334.push(const_698 + param1);
               }
               this.var_334.push(const_699);
               return;
            }
            super.method_1(const_699);
         }
      }
      
      override protected function updateAnimation(param1:Number) : int
      {
         if(super.getLastFramePlayed(11))
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
