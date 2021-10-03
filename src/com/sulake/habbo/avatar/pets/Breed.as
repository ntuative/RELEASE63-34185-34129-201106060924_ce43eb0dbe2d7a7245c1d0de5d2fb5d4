package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var _id:int;
      
      private var var_2922:String = "";
      
      private var var_931:String;
      
      private var var_1637:Boolean;
      
      private var var_2504:Boolean = true;
      
      private var var_2923:int;
      
      private var var_2924:String;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2923 = parseInt(param1.@pattern);
         this.var_931 = String(param1.@gender);
         this.var_1637 = Boolean(parseInt(param1.@colorable));
         this.var_2922 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2504 = false;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get gender() : String
      {
         return this.var_931;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1637;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2504;
      }
      
      public function get patternId() : int
      {
         return this.var_2923;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2924;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2924 = param1;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2922;
      }
   }
}
