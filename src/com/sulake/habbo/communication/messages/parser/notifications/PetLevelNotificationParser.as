package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_1925:int;
      
      private var var_2439:String;
      
      private var var_1223:int;
      
      private var var_1198:int;
      
      private var var_1779:int;
      
      private var _color:String;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1925 = param1.readInteger();
         this.var_2439 = param1.readString();
         this.var_1223 = param1.readInteger();
         this.var_1198 = param1.readInteger();
         this.var_1779 = param1.readInteger();
         this._color = param1.readString();
         return true;
      }
      
      public function get petId() : int
      {
         return this.var_1925;
      }
      
      public function get petName() : String
      {
         return this.var_2439;
      }
      
      public function get level() : int
      {
         return this.var_1223;
      }
      
      public function get petType() : int
      {
         return this.var_1198;
      }
      
      public function get breed() : int
      {
         return this.var_1779;
      }
      
      public function get color() : String
      {
         return this._color;
      }
   }
}
