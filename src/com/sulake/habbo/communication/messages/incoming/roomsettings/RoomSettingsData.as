package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   public class RoomSettingsData
   {
      
      public static const const_600:int = 0;
      
      public static const const_201:int = 1;
      
      public static const const_127:int = 2;
      
      public static const const_825:Array = ["open","closed","password"];
       
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var var_1892:String;
      
      private var var_2237:int;
      
      private var var_1603:int;
      
      private var var_2238:int;
      
      private var var_2748:int;
      
      private var var_896:Array;
      
      private var var_2239:Array;
      
      private var var_2747:int;
      
      private var var_2241:Boolean;
      
      private var var_2245:Boolean;
      
      private var var_2240:Boolean;
      
      private var var_2244:Boolean;
      
      private var var_2242:int;
      
      private var var_2243:int;
      
      public function RoomSettingsData()
      {
         super();
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2241;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2241 = param1;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2245;
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2245 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2240;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2240 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2244;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2244 = param1;
      }
      
      public function get wallThickness() : int
      {
         return this.var_2242;
      }
      
      public function set wallThickness(param1:int) : void
      {
         this.var_2242 = param1;
      }
      
      public function get floorThickness() : int
      {
         return this.var_2243;
      }
      
      public function set floorThickness(param1:int) : void
      {
         this.var_2243 = param1;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get description() : String
      {
         return this.var_1892;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1892 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2237;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2237 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1603;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1603 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2238;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2238 = param1;
      }
      
      public function get maximumVisitorsLimit() : int
      {
         return this.var_2748;
      }
      
      public function set maximumVisitorsLimit(param1:int) : void
      {
         this.var_2748 = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_896;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_896 = param1;
      }
      
      public function get controllers() : Array
      {
         return this.var_2239;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2239 = param1;
      }
      
      public function get controllerCount() : int
      {
         return this.var_2747;
      }
      
      public function set controllerCount(param1:int) : void
      {
         this.var_2747 = param1;
      }
   }
}
