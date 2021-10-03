package com.sulake.habbo.communication.messages.incoming.inventory.achievements
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementData
   {
       
      
      private var _type:int;
      
      private var var_1223:int;
      
      private var var_315:String;
      
      private var var_1739:int;
      
      private var var_2352:int;
      
      private var var_1921:int;
      
      private var var_1738:int;
      
      private var var_1740:Boolean;
      
      private var _category:String;
      
      private var var_2351:int;
      
      public function AchievementData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1223 = param1.readInteger();
         this.var_315 = param1.readString();
         this.var_1739 = Math.max(1,param1.readInteger());
         this.var_2352 = param1.readInteger();
         this.var_1921 = param1.readInteger();
         this.var_1738 = param1.readInteger();
         this.var_1740 = param1.readBoolean();
         this._category = param1.readString();
         this.var_2351 = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get badgeId() : String
      {
         return this.var_315;
      }
      
      public function get level() : int
      {
         return this.var_1223;
      }
      
      public function get scoreLimit() : int
      {
         return this.var_1739;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2352;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1921;
      }
      
      public function get currentPoints() : int
      {
         return this.var_1738;
      }
      
      public function get finalLevel() : Boolean
      {
         return this.var_1740;
      }
      
      public function get category() : String
      {
         return this._category;
      }
      
      public function get levelCount() : int
      {
         return this.var_2351;
      }
      
      public function get firstLevelAchieved() : Boolean
      {
         return this.var_1223 > 1 || this.var_1740;
      }
      
      public function setMaxProgress() : void
      {
         this.var_1738 = this.var_1739;
      }
   }
}
