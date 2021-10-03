package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var var_1986:Boolean;
      
      private var var_2734:int;
      
      private var var_2735:String;
      
      private var var_383:int;
      
      private var var_2736:int;
      
      private var var_1926:String;
      
      private var var_2738:String;
      
      private var var_2737:String;
      
      private var var_896:Array;
      
      private var _disposed:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_896 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1986 = false;
            return;
         }
         this.var_1986 = true;
         this.var_2734 = int(_loc2_);
         this.var_2735 = param1.readString();
         this.var_383 = int(param1.readString());
         this.var_2736 = param1.readInteger();
         this.var_1926 = param1.readString();
         this.var_2738 = param1.readString();
         this.var_2737 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_896.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_896 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2734;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2735;
      }
      
      public function get flatId() : int
      {
         return this.var_383;
      }
      
      public function get eventType() : int
      {
         return this.var_2736;
      }
      
      public function get eventName() : String
      {
         return this.var_1926;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2738;
      }
      
      public function get creationTime() : String
      {
         return this.var_2737;
      }
      
      public function get tags() : Array
      {
         return this.var_896;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1986;
      }
   }
}
