package com.sulake.habbo.sound.music
{
   import flash.utils.getTimer;
   
   public class SongStartRequestData
   {
       
      
      private var var_1710:int;
      
      private var var_1724:Number;
      
      private var var_2312:Number;
      
      private var var_2309:int;
      
      private var var_2311:Number;
      
      private var var_2310:Number;
      
      public function SongStartRequestData(param1:int, param2:Number, param3:Number, param4:Number = 2.0, param5:Number = 1.0)
      {
         super();
         this.var_1710 = param1;
         this.var_1724 = param2;
         this.var_2312 = param3;
         this.var_2311 = param4;
         this.var_2310 = param5;
         this.var_2309 = getTimer();
      }
      
      public function get songId() : int
      {
         return this.var_1710;
      }
      
      public function get startPos() : Number
      {
         if(this.var_1724 < 0)
         {
            return 0;
         }
         return this.var_1724 + (getTimer() - this.var_2309) / 1000;
      }
      
      public function get playLength() : Number
      {
         return this.var_2312;
      }
      
      public function get fadeInSeconds() : Number
      {
         return this.var_2311;
      }
      
      public function get fadeOutSeconds() : Number
      {
         return this.var_2310;
      }
   }
}
