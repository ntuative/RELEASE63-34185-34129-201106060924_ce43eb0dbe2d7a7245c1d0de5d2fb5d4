package com.sulake.habbo.ui.widget.events
{
   public class RoomWidgetTeaserDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_612:String = "RWTDUE_TEASER_DATA";
      
      public static const const_786:String = "RWTDUE_GIFT_DATA";
      
      public static const const_717:String = "RWTDUE_GIFT_RECEIVED";
       
      
      private var var_222:int;
      
      private var _data:String;
      
      private var var_415:int;
      
      private var var_196:String;
      
      private var var_2314:String;
      
      private var var_2315:Boolean;
      
      private var var_1618:int = 0;
      
      private var var_2905:String;
      
      public function RoomWidgetTeaserDataUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get objectId() : int
      {
         return this.var_222;
      }
      
      public function get data() : String
      {
         return this._data;
      }
      
      public function get status() : int
      {
         return this.var_415;
      }
      
      public function get firstClickUserName() : String
      {
         return this.var_2314;
      }
      
      public function get giftWasReceived() : Boolean
      {
         return this.var_2315;
      }
      
      public function get ownRealName() : String
      {
         return this.var_2905;
      }
      
      public function get itemCategory() : int
      {
         return this.var_1618;
      }
      
      public function set status(param1:int) : void
      {
         this.var_415 = param1;
      }
      
      public function set data(param1:String) : void
      {
         this._data = param1;
      }
      
      public function set firstClickUserName(param1:String) : void
      {
         this.var_2314 = param1;
      }
      
      public function set giftWasReceived(param1:Boolean) : void
      {
         this.var_2315 = param1;
      }
      
      public function set ownRealName(param1:String) : void
      {
         this.var_2905 = param1;
      }
      
      public function set objectId(param1:int) : void
      {
         this.var_222 = param1;
      }
      
      public function get campaignID() : String
      {
         return this.var_196;
      }
      
      public function set campaignID(param1:String) : void
      {
         this.var_196 = param1;
      }
      
      public function set itemCategory(param1:int) : void
      {
         this.var_1618 = param1;
      }
   }
}
