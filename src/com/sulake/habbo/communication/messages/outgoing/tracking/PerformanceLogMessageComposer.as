package com.sulake.habbo.communication.messages.outgoing.tracking
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class PerformanceLogMessageComposer implements IMessageComposer
   {
       
      
      private var var_2611:int = 0;
      
      private var var_1570:String = "";
      
      private var var_1947:String = "";
      
      private var var_2694:String = "";
      
      private var var_2876:String = "";
      
      private var var_2110:int = 0;
      
      private var var_2878:int = 0;
      
      private var var_2877:int = 0;
      
      private var var_1572:int = 0;
      
      private var var_2879:int = 0;
      
      private var var_1571:int = 0;
      
      public function PerformanceLogMessageComposer(param1:int, param2:String, param3:String, param4:String, param5:String, param6:Boolean, param7:int, param8:int, param9:int, param10:int, param11:int)
      {
         super();
         this.var_2611 = param1;
         this.var_1570 = param2;
         this.var_1947 = param3;
         this.var_2694 = param4;
         this.var_2876 = param5;
         if(param6)
         {
            this.var_2110 = 1;
         }
         else
         {
            this.var_2110 = 0;
         }
         this.var_2878 = param7;
         this.var_2877 = param8;
         this.var_1572 = param9;
         this.var_2879 = param10;
         this.var_1571 = param11;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2611,this.var_1570,this.var_1947,this.var_2694,this.var_2876,this.var_2110,this.var_2878,this.var_2877,this.var_1572,this.var_2879,this.var_1571];
      }
   }
}
