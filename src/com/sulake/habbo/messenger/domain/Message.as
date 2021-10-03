package com.sulake.habbo.messenger.domain
{
   public class Message
   {
      
      public static const const_853:int = 1;
      
      public static const const_895:int = 2;
      
      public static const const_953:int = 3;
      
      public static const const_1270:int = 4;
      
      public static const const_890:int = 5;
      
      public static const const_1208:int = 6;
       
      
      private var _type:int;
      
      private var var_1138:int;
      
      private var var_2223:String;
      
      private var var_2222:String;
      
      public function Message(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this._type = param1;
         this.var_1138 = param2;
         this.var_2223 = param3;
         this.var_2222 = param4;
      }
      
      public function get messageText() : String
      {
         return this.var_2223;
      }
      
      public function get time() : String
      {
         return this.var_2222;
      }
      
      public function get senderId() : int
      {
         return this.var_1138;
      }
      
      public function get type() : int
      {
         return this._type;
      }
   }
}
