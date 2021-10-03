package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_1925:int;
      
      private var _name:String;
      
      private var var_1223:int;
      
      private var var_2858:int;
      
      private var var_2267:int;
      
      private var _energy:int;
      
      private var _nutrition:int;
      
      private var var_611:String;
      
      private var var_2857:int;
      
      private var var_2855:int;
      
      private var var_2856:int;
      
      private var var_2479:int;
      
      private var var_2266:int;
      
      private var _ownerName:String;
      
      private var var_533:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1925;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get level() : int
      {
         return this.var_1223;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2858;
      }
      
      public function get experience() : int
      {
         return this.var_2267;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get figure() : String
      {
         return this.var_611;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2857;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2855;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2856;
      }
      
      public function get respect() : int
      {
         return this.var_2479;
      }
      
      public function get method_2() : int
      {
         return this.var_2266;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get age() : int
      {
         return this.var_533;
      }
      
      public function flush() : Boolean
      {
         this.var_1925 = -1;
         return true;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1925 = param1.readInteger();
         this._name = param1.readString();
         this.var_1223 = param1.readInteger();
         this.var_2858 = param1.readInteger();
         this.var_2267 = param1.readInteger();
         this.var_2857 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2855 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2856 = param1.readInteger();
         this.var_611 = param1.readString();
         this.var_2479 = param1.readInteger();
         this.var_2266 = param1.readInteger();
         this.var_533 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
   }
}
