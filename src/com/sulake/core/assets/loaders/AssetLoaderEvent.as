package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_29:String = "AssetLoaderEventComplete";
      
      public static const const_1335:String = "AssetLoaderEventProgress";
      
      public static const const_1139:String = "AssetLoaderEventUnload";
      
      public static const const_1368:String = "AssetLoaderEventStatus";
      
      public static const const_43:String = "AssetLoaderEventError";
      
      public static const const_1310:String = "AssetLoaderEventOpen";
       
      
      private var var_415:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_415 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_415;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_415);
      }
      
      override public function toString() : String
      {
         return formatToString("AssetLoaderEvent","type","status");
      }
   }
}
