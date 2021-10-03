package com.sulake.habbo.communication.messages.incoming.quest
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class QuestMessageData
   {
       
      
      private var var_1691:String;
      
      private var var_2250:int;
      
      private var var_2247:int;
      
      private var var_1910:int;
      
      private var _id:int;
      
      private var var_1689:Boolean;
      
      private var _type:String;
      
      private var var_1690:String;
      
      private var var_1688:int;
      
      private var _localizationCode:String;
      
      private var var_2248:int;
      
      private var var_2249:int;
      
      private var var_2246:int;
      
      public function QuestMessageData(param1:IMessageDataWrapper)
      {
         super();
         this.var_1691 = param1.readString();
         this.var_2250 = param1.readInteger();
         this.var_2247 = param1.readInteger();
         this.var_1910 = param1.readInteger();
         this._id = param1.readInteger();
         this.var_1689 = param1.readBoolean();
         this._type = param1.readString();
         this.var_1690 = param1.readString();
         this.var_1688 = param1.readInteger();
         this._localizationCode = param1.readString();
         this.var_2248 = param1.readInteger();
         this.var_2249 = param1.readInteger();
         this.var_2246 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         this._id = 0;
         this._type = "";
         this.var_1690 = "";
         this.var_1688 = 0;
      }
      
      public function get campaignCode() : String
      {
         return this.var_1691;
      }
      
      public function get localizationCode() : String
      {
         return this._localizationCode;
      }
      
      public function get completedQuestsInCampaign() : int
      {
         return this.var_2250;
      }
      
      public function get questCountInCampaign() : int
      {
         return this.var_2247;
      }
      
      public function get activityPointType() : int
      {
         return this.var_1910;
      }
      
      public function get accepted() : Boolean
      {
         return this.var_1689;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get imageVersion() : String
      {
         return this.var_1690;
      }
      
      public function get rewardCurrencyAmount() : int
      {
         return this.var_1688;
      }
      
      public function get completedSteps() : int
      {
         return this.var_2248;
      }
      
      public function get totalSteps() : int
      {
         return this.var_2249;
      }
      
      public function get waitPeriodSeconds() : int
      {
         return this.var_2246;
      }
      
      public function getCampaignLocalizationKey() : String
      {
         return "quests." + this.var_1691;
      }
      
      public function getQuestLocalizationKey() : String
      {
         return this.getCampaignLocalizationKey() + "." + this._localizationCode;
      }
      
      public function get completedCampaign() : Boolean
      {
         return this._id < 1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set accepted(param1:Boolean) : void
      {
         this.var_1689 = param1;
      }
   }
}
