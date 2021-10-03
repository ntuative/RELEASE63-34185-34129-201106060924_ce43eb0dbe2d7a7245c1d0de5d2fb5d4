package com.sulake.habbo.communication.messages.incoming.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class AchievementLevelUpData
   {
       
      
      private var _type:int;
      
      private var var_1223:int;
      
      private var var_2048:int;
      
      private var var_2352:int;
      
      private var var_1921:int;
      
      private var var_1546:int;
      
      private var var_315:int;
      
      private var var_2411:String = "";
      
      private var var_2412:String = "";
      
      private var var_2413:int;
      
      private var _category:String;
      
      public function AchievementLevelUpData(param1:IMessageDataWrapper)
      {
         super();
         this._type = param1.readInteger();
         this.var_1223 = param1.readInteger();
         this.var_315 = param1.readInteger();
         this.var_2411 = param1.readString();
         this.var_2048 = param1.readInteger();
         this.var_2352 = param1.readInteger();
         this.var_1921 = param1.readInteger();
         this.var_1546 = param1.readInteger();
         this.var_2413 = param1.readInteger();
         this.var_2412 = param1.readString();
         this._category = param1.readString();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get level() : int
      {
         return this.var_1223;
      }
      
      public function get points() : int
      {
         return this.var_2048;
      }
      
      public function get levelRewardPoints() : int
      {
         return this.var_2352;
      }
      
      public function get levelRewardPointType() : int
      {
         return this.var_1921;
      }
      
      public function get bonusPoints() : int
      {
         return this.var_1546;
      }
      
      public function get badgeId() : int
      {
         return this.var_315;
      }
      
      public function get badgeCode() : String
      {
         return this.var_2411;
      }
      
      public function get removedBadgeCode() : String
      {
         return this.var_2412;
      }
      
      public function get achievementID() : int
      {
         return this.var_2413;
      }
      
      public function get category() : String
      {
         return this._category;
      }
   }
}
