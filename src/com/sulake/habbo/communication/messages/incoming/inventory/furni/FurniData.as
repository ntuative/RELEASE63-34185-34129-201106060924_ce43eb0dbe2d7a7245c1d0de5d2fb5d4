package com.sulake.habbo.communication.messages.incoming.inventory.furni
{
   public class FurniData
   {
       
      
      private var var_2507:int;
      
      private var var_1648:String;
      
      private var _objId:int;
      
      private var var_1718:int;
      
      private var _category:int;
      
      private var var_2200:String;
      
      private var var_2506:Boolean;
      
      private var var_2505:Boolean;
      
      private var var_2508:Boolean;
      
      private var var_2504:Boolean;
      
      private var var_2441:int;
      
      private var var_1441:int;
      
      private var var_1752:String = "";
      
      private var var_1710:int = -1;
      
      public function FurniData(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:Boolean, param8:Boolean, param9:Boolean, param10:Boolean, param11:int)
      {
         super();
         this.var_2507 = param1;
         this.var_1648 = param2;
         this._objId = param3;
         this.var_1718 = param4;
         this._category = param5;
         this.var_2200 = param6;
         this.var_2506 = param7;
         this.var_2505 = param8;
         this.var_2508 = param9;
         this.var_2504 = param10;
         this.var_2441 = param11;
      }
      
      public function setExtraData(param1:String, param2:int) : void
      {
         this.var_1752 = param1;
         this.var_1441 = param2;
      }
      
      public function get stripId() : int
      {
         return this.var_2507;
      }
      
      public function get itemType() : String
      {
         return this.var_1648;
      }
      
      public function get objId() : int
      {
         return this._objId;
      }
      
      public function get classId() : int
      {
         return this.var_1718;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2200;
      }
      
      public function get isGroupable() : Boolean
      {
         return this.var_2506;
      }
      
      public function get isRecyclable() : Boolean
      {
         return this.var_2505;
      }
      
      public function get isTradeable() : Boolean
      {
         return this.var_2508;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2504;
      }
      
      public function get expiryTime() : int
      {
         return this.var_2441;
      }
      
      public function get slotId() : String
      {
         return this.var_1752;
      }
      
      public function get songId() : int
      {
         return this.var_1710;
      }
      
      public function get extra() : int
      {
         return this.var_1441;
      }
   }
}
