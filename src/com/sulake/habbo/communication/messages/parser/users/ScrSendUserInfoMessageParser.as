package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ScrSendUserInfoMessageParser implements IMessageParser
   {
      
      public static const const_2208:int = 1;
      
      public static const const_1780:int = 2;
       
      
      private var var_1049:String;
      
      private var var_2317:int;
      
      private var var_2319:int;
      
      private var var_2318:int;
      
      private var var_2316:int;
      
      private var var_2324:Boolean;
      
      private var var_2323:Boolean;
      
      private var var_2320:int;
      
      private var var_2325:int;
      
      private var var_2326:Boolean;
      
      private var var_2321:int;
      
      private var var_2322:int;
      
      public function ScrSendUserInfoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1049 = param1.readString();
         this.var_2317 = param1.readInteger();
         this.var_2319 = param1.readInteger();
         this.var_2318 = param1.readInteger();
         this.var_2316 = param1.readInteger();
         this.var_2324 = param1.readBoolean();
         this.var_2323 = param1.readBoolean();
         this.var_2320 = param1.readInteger();
         this.var_2325 = param1.readInteger();
         this.var_2326 = param1.readBoolean();
         this.var_2321 = param1.readInteger();
         this.var_2322 = param1.readInteger();
         return true;
      }
      
      public function get productName() : String
      {
         return this.var_1049;
      }
      
      public function get daysToPeriodEnd() : int
      {
         return this.var_2317;
      }
      
      public function get memberPeriods() : int
      {
         return this.var_2319;
      }
      
      public function get periodsSubscribedAhead() : int
      {
         return this.var_2318;
      }
      
      public function get responseType() : int
      {
         return this.var_2316;
      }
      
      public function get hasEverBeenMember() : Boolean
      {
         return this.var_2324;
      }
      
      public function get isVIP() : Boolean
      {
         return this.var_2323;
      }
      
      public function get pastClubDays() : int
      {
         return this.var_2320;
      }
      
      public function get pastVipDays() : int
      {
         return this.var_2325;
      }
      
      public function get isShowBasicPromo() : Boolean
      {
         return this.var_2326;
      }
      
      public function get basicNormalPrice() : int
      {
         return this.var_2321;
      }
      
      public function get basicPromoPrice() : int
      {
         return this.var_2322;
      }
   }
}
