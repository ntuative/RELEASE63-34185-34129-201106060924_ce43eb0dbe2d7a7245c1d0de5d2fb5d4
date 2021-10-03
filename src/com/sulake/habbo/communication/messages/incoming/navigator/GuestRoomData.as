package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var var_383:int;
      
      private var var_746:Boolean;
      
      private var var_1027:String;
      
      private var _ownerName:String;
      
      private var var_2237:int;
      
      private var var_2519:int;
      
      private var var_2520:int;
      
      private var var_1892:String;
      
      private var var_2523:int;
      
      private var var_2518:Boolean;
      
      private var var_786:int;
      
      private var var_1603:int;
      
      private var var_2521:String;
      
      private var var_896:Array;
      
      private var var_2522:RoomThumbnailData;
      
      private var var_2241:Boolean;
      
      private var var_2524:Boolean;
      
      private var _disposed:Boolean;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_896 = new Array();
         super();
         this.var_383 = param1.readInteger();
         this.var_746 = param1.readBoolean();
         this.var_1027 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2237 = param1.readInteger();
         this.var_2519 = param1.readInteger();
         this.var_2520 = param1.readInteger();
         this.var_1892 = param1.readString();
         this.var_2523 = param1.readInteger();
         this.var_2518 = param1.readBoolean();
         this.var_786 = param1.readInteger();
         this.var_1603 = param1.readInteger();
         this.var_2521 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_896.push(_loc4_);
            _loc3_++;
         }
         this.var_2522 = new RoomThumbnailData(param1);
         this.var_2241 = param1.readBoolean();
         this.var_2524 = param1.readBoolean();
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
      
      public function get flatId() : int
      {
         return this.var_383;
      }
      
      public function get event() : Boolean
      {
         return this.var_746;
      }
      
      public function get roomName() : String
      {
         return this.var_1027;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get doorMode() : int
      {
         return this.var_2237;
      }
      
      public function get userCount() : int
      {
         return this.var_2519;
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2520;
      }
      
      public function get description() : String
      {
         return this.var_1892;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2523;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2518;
      }
      
      public function get score() : int
      {
         return this.var_786;
      }
      
      public function get categoryId() : int
      {
         return this.var_1603;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2521;
      }
      
      public function get tags() : Array
      {
         return this.var_896;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2522;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2241;
      }
      
      public function get displayRoomEntryAd() : Boolean
      {
         return this.var_2524;
      }
   }
}
