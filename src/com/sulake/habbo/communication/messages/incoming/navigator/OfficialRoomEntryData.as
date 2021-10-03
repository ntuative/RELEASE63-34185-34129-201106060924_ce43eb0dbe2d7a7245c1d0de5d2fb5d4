package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1261:int = 1;
      
      public static const const_868:int = 2;
      
      public static const const_802:int = 3;
      
      public static const const_1832:int = 4;
       
      
      private var _index:int;
      
      private var var_2825:String;
      
      private var var_2827:String;
      
      private var var_2826:Boolean;
      
      private var var_2824:String;
      
      private var var_1012:String;
      
      private var var_2823:int;
      
      private var var_2519:int;
      
      private var _type:int;
      
      private var var_2275:String;
      
      private var var_1074:GuestRoomData;
      
      private var var_1073:PublicRoomData;
      
      private var _open:Boolean;
      
      private var _disposed:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2825 = param1.readString();
         this.var_2827 = param1.readString();
         this.var_2826 = param1.readInteger() == 1;
         this.var_2824 = param1.readString();
         this.var_1012 = param1.readString();
         this.var_2823 = param1.readInteger();
         this.var_2519 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_1261)
         {
            this.var_2275 = param1.readString();
         }
         else if(this._type == const_802)
         {
            this.var_1073 = new PublicRoomData(param1);
         }
         else if(this._type == const_868)
         {
            this.var_1074 = new GuestRoomData(param1);
         }
         else
         {
            this._open = param1.readBoolean();
         }
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_1074 != null)
         {
            this.var_1074.dispose();
            this.var_1074 = null;
         }
         if(this.var_1073 != null)
         {
            this.var_1073.dispose();
            this.var_1073 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2825;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2827;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2826;
      }
      
      public function get picText() : String
      {
         return this.var_2824;
      }
      
      public function get picRef() : String
      {
         return this.var_1012;
      }
      
      public function get folderId() : int
      {
         return this.var_2823;
      }
      
      public function get tag() : String
      {
         return this.var_2275;
      }
      
      public function get userCount() : int
      {
         return this.var_2519;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_1074;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_1073;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_1261)
         {
            return 0;
         }
         if(this.type == const_868)
         {
            return this.var_1074.maxUserCount;
         }
         if(this.type == const_802)
         {
            return this.var_1073.maxUsers;
         }
         return 0;
      }
   }
}
