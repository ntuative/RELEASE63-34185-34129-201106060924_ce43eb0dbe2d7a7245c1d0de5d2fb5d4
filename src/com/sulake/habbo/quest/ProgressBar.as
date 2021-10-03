package com.sulake.habbo.quest
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.ITextWindow;
   import flash.display.BitmapData;
   import flash.filters.ColorMatrixFilter;
   import flash.geom.Point;
   
   public class ProgressBar implements IDisposable
   {
      
      private static const const_1456:int = 3;
      
      private static const const_1457:int = 10;
       
      
      private var _questEngine:HabboQuestEngine;
      
      private var _window:IWindowContainer;
      
      private var var_761:int;
      
      private var var_1179:String;
      
      private var var_2420:Boolean;
      
      private var var_1180:int;
      
      private var var_1178:int;
      
      private var var_2419:int;
      
      private var var_1782:int;
      
      private var var_258:int;
      
      private var var_1463:Boolean;
      
      private var var_760:BitmapData;
      
      private var var_618:Array;
      
      private var var_1781:ColorMatrixFilter;
      
      public function ProgressBar(param1:HabboQuestEngine, param2:IWindowContainer, param3:int, param4:String, param5:Boolean, param6:Point)
      {
         this.var_618 = [1,0,0,0,0,0,1,0,0,0,0,0,1,0,0,0,0,0,1,0];
         this.var_1781 = new ColorMatrixFilter(this.var_618);
         super();
         this._questEngine = param1;
         this._window = param2;
         this.var_761 = param3;
         this.var_1179 = param4;
         this.var_2420 = param5;
         var _loc7_:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
         if(_loc7_ == null)
         {
            _loc7_ = IWindowContainer(this._questEngine.getXmlWindow("ProgressBar"));
            this._window.addChild(_loc7_);
            _loc7_.x = param6.x;
            _loc7_.y = param6.y;
            _loc7_.width = this.var_761 + const_1457;
         }
         if(param5)
         {
            new PendingImage(this._questEngine,this._window.findChildByName("bar_l"),"ach_progressbar1");
            new PendingImage(this._questEngine,this._window.findChildByName("bar_c"),"ach_progressbar2");
            new PendingImage(this._questEngine,this._window.findChildByName("bar_r"),"ach_progressbar3");
         }
         new PendingImage(this._questEngine,this._window.findChildByName("bar_a_c"),"ach_progressbar4");
         new PendingImage(this._questEngine,this._window.findChildByName("bar_a_r"),"ach_progressbar5");
      }
      
      public function refresh(param1:int, param2:int, param3:int) : void
      {
         var _loc4_:Boolean = param3 != this.var_2419 || param2 != this.var_1178;
         this.var_1178 = param2;
         this.var_1180 = param1;
         this.var_1782 = this.var_258;
         this.var_2419 = param3;
         if(_loc4_)
         {
            this.var_258 = this.getProgressWidth(this.var_1180);
         }
         this.var_1463 = true;
         this.updateView();
      }
      
      public function set visible(param1:Boolean) : void
      {
         var _loc2_:IWindowContainer = IWindowContainer(this._window.findChildByName("progress_bar_cont"));
         if(_loc2_ != null)
         {
            _loc2_.visible = param1;
         }
      }
      
      public function updateView() : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:int = 0;
         if(!this.var_1463)
         {
            return;
         }
         var _loc1_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("bar_a_c"));
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(this._window.findChildByName("bar_a_r"));
         if(_loc1_.bitmap == null || _loc2_.bitmap == null)
         {
            return;
         }
         if(this.var_2420)
         {
            _loc7_ = IBitmapWrapperWindow(this._window.findChildByName("bar_c"));
            _loc8_ = IBitmapWrapperWindow(this._window.findChildByName("bar_r"));
            if(_loc7_.bitmap == null || _loc8_.bitmap == null)
            {
               return;
            }
            _loc7_.width = this.var_761;
            _loc8_.x = this.var_761 + _loc1_.x;
         }
         if(this.var_760 == null)
         {
            this.var_760 = _loc1_.bitmap.clone();
         }
         var _loc3_:int = this.getProgressWidth(this.var_1180);
         if(this.var_258 < _loc3_)
         {
            _loc9_ = Math.min(Math.abs(this.var_258 - _loc3_),Math.abs(this.var_1782 - _loc3_));
            this.var_258 = Math.min(_loc3_,this.var_258 + Math.max(1,Math.round(Math.sqrt(_loc9_))));
         }
         var _loc4_:* = this.var_258 > 0;
         _loc1_.visible = _loc4_;
         _loc2_.visible = _loc4_;
         if(_loc4_)
         {
            _loc1_.width = this.var_760.width;
            if(this.var_258 < _loc3_)
            {
               this.changeProgressColorFilter();
               _loc1_.bitmap.applyFilter(this.var_760,this.var_760.rect,new Point(0,0),this.var_1781);
            }
            else
            {
               _loc1_.bitmap.copyPixels(this.var_760,this.var_760.rect,new Point(0,0),null,null,true);
            }
            _loc1_.width = this.var_258;
            _loc2_.x = this.var_258 + _loc1_.x;
         }
         this.var_1463 = this.var_258 < _loc3_;
         var _loc5_:ITextWindow = ITextWindow(this._window.findChildByName("progress_txt"));
         var _loc6_:int = !!this.var_1463 ? int(Math.round(this.var_258 / this.var_761 * this.var_1178)) : int(this.var_1180);
         this._questEngine.localization.registerParameter(this.var_1179,"progress","" + _loc6_);
         this._questEngine.localization.registerParameter(this.var_1179,"limit","" + this.var_1178);
         _loc5_.caption = this._questEngine.localization.getKey(this.var_1179,this.var_1179);
         _loc5_.x = const_1456 + _loc1_.x + (this.var_761 - _loc5_.width) / 2;
      }
      
      public function dispose() : void
      {
         this._questEngine = null;
         this._window = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._questEngine == null;
      }
      
      private function getProgressWidth(param1:int) : int
      {
         return Math.max(0,Math.round(this.var_761 * param1 / this.var_1178));
      }
      
      private function changeProgressColorFilter() : void
      {
         var _loc1_:int = this.getProgressWidth(this.var_1180);
         var _loc2_:int = _loc1_ - this.var_1782;
         if(_loc2_ == 0)
         {
            return;
         }
         var _loc3_:Number = (_loc1_ - this.var_258) / _loc2_;
         this.var_618[3] = _loc3_;
         this.var_618[8] = _loc3_;
         this.var_618[0] = 1 - _loc3_;
         this.var_618[6] = 1 - _loc3_;
         this.var_618[12] = 1 - _loc3_;
         this.var_1781.matrix = this.var_618;
      }
   }
}
