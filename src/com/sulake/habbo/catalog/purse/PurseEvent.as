package com.sulake.habbo.catalog.purse
{
   import flash.events.Event;
   
   public class PurseEvent extends Event
   {
      
      public static const const_77:String = "catalog_purse_credit_balance";
      
      public static const const_107:String = "catalog_purse_pixel_balance";
       
      
      private var var_1916:int;
      
      public function PurseEvent(param1:String, param2:int, param3:Boolean = false, param4:Boolean = false)
      {
         super(param1,param3,param4);
         this.var_1916 = param2;
      }
      
      public function get balance() : int
      {
         return this.var_1916;
      }
   }
}
