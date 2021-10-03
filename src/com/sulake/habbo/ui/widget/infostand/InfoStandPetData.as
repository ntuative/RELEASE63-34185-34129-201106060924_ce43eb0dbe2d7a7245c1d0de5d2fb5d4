package com.sulake.habbo.ui.widget.infostand
{
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1223:int;
      
      private var var_2262:int;
      
      private var var_2267:int;
      
      private var var_2265:int;
      
      private var _energy:int;
      
      private var var_2269:int;
      
      private var _nutrition:int;
      
      private var var_2270:int;
      
      private var _petRespect:int;
      
      private var _name:String = "";
      
      private var var_1925:int = -1;
      
      private var _type:int;
      
      private var var_2295:int;
      
      private var var_46:BitmapData;
      
      private var var_2264:Boolean;
      
      private var var_2266:int;
      
      private var _ownerName:String;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_2263:int;
      
      private var var_533:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this.var_1925;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get race() : int
      {
         return this.var_2295;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2264;
      }
      
      public function get method_2() : int
      {
         return this.var_2266;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get age() : int
      {
         return this.var_533;
      }
      
      public function get level() : int
      {
         return this.var_1223;
      }
      
      public function get levelMax() : int
      {
         return this.var_2262;
      }
      
      public function get experience() : int
      {
         return this.var_2267;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2265;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get energyMax() : int
      {
         return this.var_2269;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2270;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2263;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1925 = param1.id;
         this._type = param1.petType;
         this.var_2295 = param1.petRace;
         this.var_46 = param1.image;
         this.var_2264 = param1.isOwnPet;
         this.var_2266 = param1.method_2;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1223 = param1.level;
         this.var_2262 = param1.levelMax;
         this.var_2267 = param1.experience;
         this.var_2265 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2269 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2270 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2263 = param1.roomIndex;
         this.var_533 = param1.age;
      }
   }
}
