package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_383:int;
      
      private var var_2519:int;
      
      private var var_2835:Boolean;
      
      private var var_2266:int;
      
      private var _ownerName:String;
      
      private var var_130:RoomData;
      
      private var var_746:RoomData;
      
      private var _disposed:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_383 = param1.readInteger();
         this.var_2519 = param1.readInteger();
         this.var_2835 = param1.readBoolean();
         this.var_2266 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_130 = new RoomData(param1);
         this.var_746 = new RoomData(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_130 != null)
         {
            this.var_130.dispose();
            this.var_130 = null;
         }
         if(this.var_746 != null)
         {
            this.var_746.dispose();
            this.var_746 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_383;
      }
      
      public function get userCount() : int
      {
         return this.var_2519;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_2835;
      }
      
      public function get method_2() : int
      {
         return this.var_2266;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get room() : RoomData
      {
         return this.var_130;
      }
      
      public function get event() : RoomData
      {
         return this.var_746;
      }
   }
}
