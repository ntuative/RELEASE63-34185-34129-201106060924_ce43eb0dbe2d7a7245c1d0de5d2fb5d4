package com.sulake.habbo.inventory.purse
{
   public class Purse
   {
       
      
      private var var_2091:int = 0;
      
      private var var_2090:int = 0;
      
      private var var_2347:int = 0;
      
      private var var_2346:Boolean = false;
      
      private var var_2323:Boolean = false;
      
      public function Purse()
      {
         super();
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2091 = Math.max(0,param1);
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2090 = Math.max(0,param1);
      }
      
      public function set clubPastPeriods(param1:int) : void
      {
         this.var_2347 = Math.max(0,param1);
      }
      
      public function set clubHasEverBeenMember(param1:Boolean) : void
      {
         this.var_2346 = param1;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2323 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2091;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2090;
      }
      
      public function get clubPastPeriods() : int
      {
         return this.var_2347;
      }
      
      public function get clubHasEverBeenMember() : Boolean
      {
         return this.var_2346;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2323;
      }
   }
}
