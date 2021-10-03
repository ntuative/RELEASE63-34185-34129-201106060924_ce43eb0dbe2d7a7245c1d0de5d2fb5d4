package com.sulake.habbo.communication.messages.parser.room.furniture
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ViralFurniStatusMessageParser implements IMessageParser
   {
       
      
      private var var_196:String;
      
      private var var_222:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1618:int = 0;
      
      private var var_415:int;
      
      private var _shareId:String;
      
      private var var_2314:String;
      
      public function ViralFurniStatusMessageParser()
      {
         super();
      }
      
      public function get campaignID() : String
      {
         return this.var_196;
      }
      
      public function get objectId() : int
      {
         return this.var_222;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1618;
      }
      
      public function get shareId() : String
      {
         return this._shareId;
      }
      
      public function get status() : int
      {
         return this.var_415;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2314;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_196 = param1.readString();
         this.var_222 = param1.readInteger();
         this.var_415 = param1.readInteger();
         this._shareId = param1.readString();
         this.var_2314 = param1.readString();
         this.var_1618 = param1.readInteger();
         return true;
      }
   }
}
