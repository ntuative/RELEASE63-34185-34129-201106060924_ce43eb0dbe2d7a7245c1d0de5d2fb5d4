package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_2238:int = 1;
      
      public static const const_2130:int = 2;
      
      public static const const_2036:int = 3;
      
      public static const const_2217:int = 4;
      
      public static const const_1945:int = 5;
      
      public static const const_2226:int = 6;
      
      public static const const_1833:int = 7;
      
      public static const const_1911:int = 8;
      
      public static const const_2176:int = 9;
      
      public static const const_1669:int = 10;
      
      public static const const_1916:int = 11;
      
      public static const const_1908:int = 12;
       
      
      private var _roomId:int;
      
      private var var_1965:int;
      
      private var var_614:String;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1965 = param1.readInteger();
         this.var_614 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get errorCode() : int
      {
         return this.var_1965;
      }
      
      public function get info() : String
      {
         return this.var_614;
      }
   }
}
