package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.habbo.communication.messages.incoming.quest.QuestMessageData;
   
   public class QuestController implements IDisposable, IUpdateReceiver
   {
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var var_595:QuestsList;
      
      private var var_501:QuestDetails;
      
      private var _questCompleted:QuestCompleted;
      
      private var var_349:QuestTracker;
      
      private var var_905:CampaignCompleted;
      
      public function QuestController(param1:HabboQuestEngine)
      {
         super();
         this._questEngine = param1;
         this.var_349 = new QuestTracker(this._questEngine);
         this.var_595 = new QuestsList(this._questEngine);
         this.var_501 = new QuestDetails(this._questEngine);
         this._questCompleted = new QuestCompleted(this._questEngine);
         this.var_905 = new CampaignCompleted(this._questEngine);
      }
      
      public function onToolbarClick() : void
      {
         this.var_595.onToolbarClick();
      }
      
      public function onQuests(param1:Array, param2:Boolean) : void
      {
         this.var_595.onQuests(param1,param2);
      }
      
      public function onQuest(param1:QuestMessageData) : void
      {
         this.var_349.onQuest(param1);
         this.var_501.onQuest(param1);
         this._questCompleted.onQuest(param1);
      }
      
      public function onQuestCompleted(param1:QuestMessageData) : void
      {
         this.var_349.onQuestCompleted(param1);
         this.var_501.onQuestCompleted(param1);
         this._questCompleted.onQuestCompleted(param1);
      }
      
      public function onQuestCancelled() : void
      {
         this.var_349.onQuestCancelled();
         this.var_501.onQuestCancelled();
         this._questCompleted.onQuestCancelled();
      }
      
      public function onRoomEnter() : void
      {
         this.var_349.onRoomEnter();
      }
      
      public function onRoomExit() : void
      {
         this.var_595.onRoomExit();
         this.var_349.onRoomExit();
         this.var_501.onRoomExit();
         this.var_905.onRoomExit();
      }
      
      public function update(param1:uint) : void
      {
         this._questCompleted.update(param1);
         this.var_349.update(param1);
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         if(this.var_595)
         {
            this.var_595.dispose();
            this.var_595 = null;
         }
         if(this.var_349)
         {
            this.var_349.dispose();
            this.var_349 = null;
         }
         if(this.var_501)
         {
            this.var_501.dispose();
            this.var_501 = null;
         }
         if(this._questCompleted)
         {
            this._questCompleted.dispose();
            this._questCompleted = null;
         }
         if(this.var_905)
         {
            this.var_905.dispose();
            this.var_905 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      public function get questsList() : QuestsList
      {
         return this.var_595;
      }
      
      public function get questDetails() : QuestDetails
      {
         return this.var_501;
      }
      
      public function get questTracker() : QuestTracker
      {
         return this.var_349;
      }
      
      public function get campaignCompleted() : CampaignCompleted
      {
         return this.var_905;
      }
   }
}
