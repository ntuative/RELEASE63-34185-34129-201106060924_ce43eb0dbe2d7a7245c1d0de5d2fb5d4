package com.sulake.habbo.communication.messages.parser.sound
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NowPlayingMessageParser implements IMessageParser
   {
       
      
      private var var_1993:int;
      
      private var _currentPosition:int;
      
      private var var_1994:int;
      
      private var var_1991:int;
      
      private var var_1992:int;
      
      public function NowPlayingMessageParser()
      {
         super();
      }
      
      public function get currentSongId() : int
      {
         return this.var_1993;
      }
      
      public function get currentPosition() : int
      {
         return this._currentPosition;
      }
      
      public function get nextSongId() : int
      {
         return this.var_1994;
      }
      
      public function get nextPosition() : int
      {
         return this.var_1991;
      }
      
      public function get syncCount() : int
      {
         return this.var_1992;
      }
      
      public function flush() : Boolean
      {
         this.var_1993 = -1;
         this._currentPosition = -1;
         this.var_1994 = -1;
         this.var_1991 = -1;
         this.var_1992 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1993 = param1.readInteger();
         this._currentPosition = param1.readInteger();
         this.var_1994 = param1.readInteger();
         this.var_1991 = param1.readInteger();
         this.var_1992 = param1.readInteger();
         return true;
      }
   }
}
