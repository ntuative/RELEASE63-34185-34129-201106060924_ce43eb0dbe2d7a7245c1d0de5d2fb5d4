package com.sulake.habbo.catalog.purse
{
   import flash.utils.Dictionary;
   
   public class Purse implements IPurse
   {
       
      
      private var var_2101:int = 0;
      
      private var var_1631:Dictionary;
      
      private var var_2091:int = 0;
      
      private var var_2090:int = 0;
      
      private var var_2323:Boolean = false;
      
      private var var_2320:int = 0;
      
      private var var_2325:int = 0;
      
      public function Purse()
      {
         this.var_1631 = new Dictionary();
         super();
      }
      
      public function get credits() : int
      {
         return this.var_2101;
      }
      
      public function set credits(param1:int) : void
      {
         this.var_2101 = param1;
      }
      
      public function get clubDays() : int
      {
         return this.var_2091;
      }
      
      public function set clubDays(param1:int) : void
      {
         this.var_2091 = param1;
      }
      
      public function get clubPeriods() : int
      {
         return this.var_2090;
      }
      
      public function set clubPeriods(param1:int) : void
      {
         this.var_2090 = param1;
      }
      
      public function get hasClubLeft() : Boolean
      {
         return this.var_2091 > 0 || this.var_2090 > 0;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2323;
      }
      
      public function set isVIP(param1:Boolean) : void
      {
         this.var_2323 = param1;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2320;
      }
      
      public function set pastClubDays(param1:int) : void
      {
         this.var_2320 = param1;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2325;
      }
      
      public function set pastVipDays(param1:int) : void
      {
         this.var_2325 = param1;
      }
      
      public function get activityPoints() : Dictionary
      {
         return this.var_1631;
      }
      
      public function set activityPoints(param1:Dictionary) : void
      {
         this.var_1631 = param1;
      }
      
      public function getActivityPointsForType(param1:int) : int
      {
         return this.var_1631[param1];
      }
   }
}
