package com.sulake.habbo.communication.messages.incoming.inventory.trading
{
   public class ItemDataStructure
   {
       
      
      private var var_2487:int;
      
      private var var_1648:String;
      
      private var var_2932:int;
      
      private var var_2929:int;
      
      private var _category:int;
      
      private var var_2200:String;
      
      private var var_1441:int;
      
      private var var_2927:int;
      
      private var var_2933:int;
      
      private var var_2928:int;
      
      private var var_2931:int;
      
      private var var_2930:Boolean;
      
      private var var_3050:int;
      
      public function ItemDataStructure(param1:int, param2:String, param3:int, param4:int, param5:int, param6:String, param7:int, param8:int, param9:int, param10:int, param11:int, param12:Boolean)
      {
         super();
         this.var_2487 = param1;
         this.var_1648 = param2;
         this.var_2932 = param3;
         this.var_2929 = param4;
         this._category = param5;
         this.var_2200 = param6;
         this.var_1441 = param7;
         this.var_2927 = param8;
         this.var_2933 = param9;
         this.var_2928 = param10;
         this.var_2931 = param11;
         this.var_2930 = param12;
      }
      
      public function get itemID() : int
      {
         return this.var_2487;
      }
      
      public function get itemType() : String
      {
         return this.var_1648;
      }
      
      public function get roomItemID() : int
      {
         return this.var_2932;
      }
      
      public function get itemTypeID() : int
      {
         return this.var_2929;
      }
      
      public function get category() : int
      {
         return this._category;
      }
      
      public function get stuffData() : String
      {
         return this.var_2200;
      }
      
      public function get extra() : int
      {
         return this.var_1441;
      }
      
      public function get timeToExpiration() : int
      {
         return this.var_2927;
      }
      
      public function get creationDay() : int
      {
         return this.var_2933;
      }
      
      public function get creationMonth() : int
      {
         return this.var_2928;
      }
      
      public function get creationYear() : int
      {
         return this.var_2931;
      }
      
      public function get groupable() : Boolean
      {
         return this.var_2930;
      }
      
      public function get songID() : int
      {
         return this.var_1441;
      }
   }
}
