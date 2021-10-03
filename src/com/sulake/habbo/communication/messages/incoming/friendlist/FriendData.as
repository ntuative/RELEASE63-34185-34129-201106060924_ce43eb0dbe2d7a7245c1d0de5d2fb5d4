package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var _id:int;
      
      private var _name:String;
      
      private var var_931:int;
      
      private var var_872:Boolean;
      
      private var var_2063:Boolean;
      
      private var var_611:String;
      
      private var var_1603:int;
      
      private var var_2075:String;
      
      private var var_2074:String;
      
      private var var_2076:String;
      
      private var var_2767:String;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_931 = param1.readInteger();
         this.var_872 = param1.readBoolean();
         this.var_2063 = param1.readBoolean();
         this.var_611 = param1.readString();
         this.var_1603 = param1.readInteger();
         this.var_2075 = param1.readString();
         this.var_2074 = param1.readString();
         this.var_2076 = param1.readString();
         this.var_2767 = param1.readString();
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get gender() : int
      {
         return this.var_931;
      }
      
      public function get online() : Boolean
      {
         return this.var_872;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_2063;
      }
      
      public function get figure() : String
      {
         return this.var_611;
      }
      
      public function get categoryId() : int
      {
         return this.var_1603;
      }
      
      public function get motto() : String
      {
         return this.var_2075;
      }
      
      public function get lastAccess() : String
      {
         return this.var_2074;
      }
      
      public function get realName() : String
      {
         return this.var_2076;
      }
      
      public function get facebookId() : String
      {
         return this.var_2767;
      }
   }
}
