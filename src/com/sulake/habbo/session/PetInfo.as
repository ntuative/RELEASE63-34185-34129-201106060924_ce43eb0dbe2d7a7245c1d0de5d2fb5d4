package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1925:int;
      
      private var var_1223:int;
      
      private var var_2262:int;
      
      private var var_2267:int;
      
      private var var_2265:int;
      
      private var _energy:int;
      
      private var var_2269:int;
      
      private var _nutrition:int;
      
      private var var_2270:int;
      
      private var var_2266:int;
      
      private var _ownerName:String;
      
      private var var_2479:int;
      
      private var var_533:int;
      
      public function PetInfo()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1925;
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
      
      public function get method_2() : int
      {
         return this.var_2266;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2479;
      }
      
      public function get age() : int
      {
         return this.var_533;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1925 = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1223 = param1;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2262 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2267 = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2265 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2269 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2270 = param1;
      }
      
      public function set method_2(param1:int) : void
      {
         this.var_2266 = param1;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set respect(param1:int) : void
      {
         this.var_2479 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_533 = param1;
      }
   }
}
