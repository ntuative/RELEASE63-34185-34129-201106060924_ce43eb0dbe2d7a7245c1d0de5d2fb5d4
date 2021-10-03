package com.sulake.core.utils.profiler.tracking
{
   import flash.display.BitmapData;
   
   public class TrackedBitmapData extends BitmapData
   {
      
      public static const const_2158:int = 16777215;
      
      public static const const_1199:int = 8191;
      
      public static const const_1297:int = 8191;
      
      public static const const_2171:int = 1;
      
      public static const const_1171:int = 1;
      
      public static const const_1341:int = 1;
      
      private static var var_559:uint = 0;
      
      private static var var_558:uint = 0;
       
      
      private var _owner:Object;
      
      private var _disposed:Boolean = false;
      
      public function TrackedBitmapData(param1:*, param2:int, param3:int, param4:Boolean = true, param5:uint = 4.294967295E9)
      {
         if(param2 > const_1199)
         {
            param2 = const_1199;
         }
         else if(param2 < const_1171)
         {
            param2 = const_1171;
         }
         if(param3 > const_1297)
         {
            param3 = const_1297;
         }
         else if(param3 < const_1341)
         {
            param3 = const_1341;
         }
         super(param2,param3,param4,param5);
         ++var_559;
         var_558 += param2 * param3 * 4;
         this._owner = param1;
      }
      
      public static function get numInstances() : uint
      {
         return var_559;
      }
      
      public static function get allocatedByteCount() : uint
      {
         return var_558;
      }
      
      override public function dispose() : void
      {
         if(!this._disposed)
         {
            var_558 -= width * height * 4;
            --var_559;
            this._disposed = true;
            this._owner = null;
            super.dispose();
         }
      }
   }
}
