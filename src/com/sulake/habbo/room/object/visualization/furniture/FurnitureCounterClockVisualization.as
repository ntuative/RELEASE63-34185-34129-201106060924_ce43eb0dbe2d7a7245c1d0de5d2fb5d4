package com.sulake.habbo.room.object.visualization.furniture
{
   public class FurnitureCounterClockVisualization extends AnimatedFurnitureVisualization
   {
      
      private static const const_1446:String = "seconds_sprite";
      
      private static const const_1447:String = "ten_seconds_sprite";
      
      private static const const_1445:String = "minutes_sprite";
      
      private static const const_1444:String = "ten_minutes_sprite";
       
      
      public function FurnitureCounterClockVisualization()
      {
         super();
      }
      
      override public function get animationId() : int
      {
         return 0;
      }
      
      override protected function getFrameNumber(param1:int, param2:int) : int
      {
         var _loc3_:String = getSpriteTag(param1,direction,param2);
         var _loc4_:int = super.animationId;
         switch(_loc3_)
         {
            case const_1446:
               return _loc4_ % 60 % 10;
            case const_1447:
               return _loc4_ % 60 / 10;
            case const_1445:
               return _loc4_ / 60 % 10;
            case const_1444:
               return _loc4_ / 60 / 10 % 10;
            default:
               return super.getFrameNumber(param1,param2);
         }
      }
   }
}
