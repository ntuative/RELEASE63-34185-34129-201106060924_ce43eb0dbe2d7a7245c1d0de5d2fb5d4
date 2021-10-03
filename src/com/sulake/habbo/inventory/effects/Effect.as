package com.sulake.habbo.inventory.effects
{
   import com.sulake.habbo.inventory.common.IThumbListDrawableItem;
   import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
   import flash.display.BitmapData;
   
   public class Effect implements IWidgetAvatarEffect, IThumbListDrawableItem
   {
       
      
      private var _type:int;
      
      private var var_1970:int;
      
      private var var_1082:int = 1;
      
      private var var_1625:int;
      
      private var var_576:Boolean = false;
      
      private var _isSelected:Boolean = false;
      
      private var var_2069:Boolean = false;
      
      private var var_722:BitmapData;
      
      private var var_2845:Date;
      
      public function Effect()
      {
         super();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get duration() : int
      {
         return this.var_1970;
      }
      
      public function get effectsInInventory() : int
      {
         return this.var_1082;
      }
      
      public function get isActive() : Boolean
      {
         return this.var_576;
      }
      
      public function get isInUse() : Boolean
      {
         return this.var_2069;
      }
      
      public function get isSelected() : Boolean
      {
         return this._isSelected;
      }
      
      public function get icon() : BitmapData
      {
         return this.var_722;
      }
      
      public function get iconImage() : BitmapData
      {
         return this.var_722;
      }
      
      public function get method_4() : int
      {
         var _loc1_:int = 0;
         if(this.var_576)
         {
            _loc1_ = this.var_1625 - (new Date().valueOf() - this.var_2845.valueOf()) / 1000;
            _loc1_ = Math.floor(_loc1_);
            if(_loc1_ < 0)
            {
               _loc1_ = 0;
            }
            return _loc1_;
         }
         return this.var_1625;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function set duration(param1:int) : void
      {
         this.var_1970 = param1;
      }
      
      public function set method_4(param1:int) : void
      {
         this.var_1625 = param1;
      }
      
      public function set isSelected(param1:Boolean) : void
      {
         this._isSelected = param1;
      }
      
      public function set isInUse(param1:Boolean) : void
      {
         this.var_2069 = param1;
      }
      
      public function set iconImage(param1:BitmapData) : void
      {
         this.var_722 = param1;
      }
      
      public function set effectsInInventory(param1:int) : void
      {
         this.var_1082 = param1;
      }
      
      public function set isActive(param1:Boolean) : void
      {
         if(param1 && !this.var_576)
         {
            this.var_2845 = new Date();
         }
         this.var_576 = param1;
      }
      
      public function setOneEffectExpired() : void
      {
         --this.var_1082;
         if(this.var_1082 < 0)
         {
            this.var_1082 = 0;
         }
         this.var_1625 = this.var_1970;
         this.var_576 = false;
         this.var_2069 = false;
      }
   }
}
