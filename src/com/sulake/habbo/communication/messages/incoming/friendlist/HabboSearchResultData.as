package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class HabboSearchResultData
   {
       
      
      private var var_2582:int;
      
      private var var_2086:String;
      
      private var var_2799:String;
      
      private var var_2795:Boolean;
      
      private var var_2797:Boolean;
      
      private var var_2796:int;
      
      private var var_2800:String;
      
      private var var_2798:String;
      
      private var var_2076:String;
      
      public function HabboSearchResultData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2582 = param1.readInteger();
         this.var_2086 = param1.readString();
         this.var_2799 = param1.readString();
         this.var_2795 = param1.readBoolean();
         this.var_2797 = param1.readBoolean();
         param1.readString();
         this.var_2796 = param1.readInteger();
         this.var_2800 = param1.readString();
         this.var_2798 = param1.readString();
         this.var_2076 = param1.readString();
      }
      
      public function get avatarId() : int
      {
         return this.var_2582;
      }
      
      public function get avatarName() : String
      {
         return this.var_2086;
      }
      
      public function get avatarMotto() : String
      {
         return this.var_2799;
      }
      
      public function get isAvatarOnline() : Boolean
      {
         return this.var_2795;
      }
      
      public function get canFollow() : Boolean
      {
         return this.var_2797;
      }
      
      public function get avatarGender() : int
      {
         return this.var_2796;
      }
      
      public function get avatarFigure() : String
      {
         return this.var_2800;
      }
      
      public function get lastOnlineDate() : String
      {
         return this.var_2798;
      }
      
      public function get realName() : String
      {
         return this.var_2076;
      }
   }
}
