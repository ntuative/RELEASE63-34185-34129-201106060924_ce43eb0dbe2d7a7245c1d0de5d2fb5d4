package com.sulake.habbo.avatar.structure.parts
{
   public class PartDefinition
   {
       
      
      private var var_2218:String;
      
      private var var_1684:String;
      
      private var var_2219:String;
      
      private var var_1682:Boolean;
      
      private var var_1683:int = -1;
      
      public function PartDefinition(param1:XML)
      {
         super();
         this.var_2218 = String(param1["set-type"]);
         this.var_1684 = String(param1["flipped-set-type"]);
         this.var_2219 = String(param1["remove-set-type"]);
         this.var_1682 = false;
      }
      
      public function hasStaticId() : Boolean
      {
         return this.var_1683 >= 0;
      }
      
      public function get staticId() : int
      {
         return this.var_1683;
      }
      
      public function set staticId(param1:int) : void
      {
         this.var_1683 = param1;
      }
      
      public function get setType() : String
      {
         return this.var_2218;
      }
      
      public function get flippedSetType() : String
      {
         return this.var_1684;
      }
      
      public function get removeSetType() : String
      {
         return this.var_2219;
      }
      
      public function get appendToFigure() : Boolean
      {
         return this.var_1682;
      }
      
      public function set appendToFigure(param1:Boolean) : void
      {
         this.var_1682 = param1;
      }
      
      public function set flippedSetType(param1:String) : void
      {
         this.var_1684 = param1;
      }
   }
}
