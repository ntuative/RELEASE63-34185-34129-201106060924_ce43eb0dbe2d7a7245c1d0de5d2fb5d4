package com.sulake.habbo.catalog.viewer.widgets.events
{
   import flash.events.Event;
   
   public class CatalogWidgetMultiColoursEvent extends Event
   {
       
      
      private var var_1071:Array;
      
      private var var_2408:String;
      
      private var var_2409:String;
      
      private var var_2410:String;
      
      public function CatalogWidgetMultiColoursEvent(param1:Array, param2:String, param3:String, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(WidgetEvent.CWE_MULTI_COLOUR_ARRAY,param5,param6);
         this.var_1071 = param1;
         this.var_2408 = param2;
         this.var_2409 = param3;
         this.var_2410 = param4;
      }
      
      public function get colours() : Array
      {
         return this.var_1071;
      }
      
      public function get backgroundAssetName() : String
      {
         return this.var_2408;
      }
      
      public function get colourAssetName() : String
      {
         return this.var_2409;
      }
      
      public function get chosenColourAssetName() : String
      {
         return this.var_2410;
      }
   }
}
