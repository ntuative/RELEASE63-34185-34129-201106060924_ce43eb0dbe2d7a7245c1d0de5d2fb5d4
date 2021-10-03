package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDataProvider;
   
   public class EffectListProxy implements IThumbListDataProvider
   {
       
      
      private var var_73:EffectsModel;
      
      private var var_152:int;
      
      public function EffectListProxy(param1:EffectsModel, param2:int)
      {
         super();
         this.var_73 = param1;
         this.var_152 = param2;
      }
      
      public function dispose() : void
      {
         this.var_73 = null;
      }
      
      public function getDrawableList() : Array
      {
         return this.var_73.getEffects(this.var_152);
      }
   }
}
