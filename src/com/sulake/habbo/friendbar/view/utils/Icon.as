package com.sulake.habbo.friendbar.view.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import flash.display.BitmapData;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.utils.Timer;
   
   public class Icon implements IDisposable
   {
      
      protected static const const_2247:int = 0;
      
      protected static const const_651:int = 1;
      
      protected static const const_1971:int = 2;
      
      protected static const const_1972:int = 3;
      
      protected static const const_137:int = 4;
      
      protected static const const_652:int = 8;
      
      protected static const const_284:int = 18;
      
      protected static const const_1970:int = 18;
       
      
      private var _disposed:Boolean = false;
      
      private var var_1679:Boolean = false;
      
      protected var var_46:BitmapDataAsset;
      
      protected var var_92:IBitmapWrapperWindow;
      
      private var var_1128:uint;
      
      protected var var_216:Timer;
      
      protected var _frame:int = 0;
      
      private var var_594:Point;
      
      protected var var_894:Boolean = false;
      
      protected var _hover:Boolean = false;
      
      public function Icon()
      {
         this.var_1128 = const_651 | const_652;
         this.var_594 = new Point();
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get disabled() : Boolean
      {
         return this.var_1679;
      }
      
      protected function set image(param1:BitmapDataAsset) : void
      {
         this.var_46 = param1;
         this.redraw();
      }
      
      protected function get image() : BitmapDataAsset
      {
         return this.var_46;
      }
      
      protected function set canvas(param1:IBitmapWrapperWindow) : void
      {
         this.var_92 = param1;
         this.redraw();
      }
      
      protected function get canvas() : IBitmapWrapperWindow
      {
         return this.var_92;
      }
      
      protected function set alignment(param1:uint) : void
      {
         this.var_1128 = param1;
         this.redraw();
      }
      
      protected function get alignment() : uint
      {
         return this.var_1128;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this.toggleTimer(false,0);
            this.image = null;
            this.canvas = null;
            this._disposed = true;
         }
      }
      
      public function notify(param1:Boolean) : void
      {
         this.var_894 = param1;
         if(this.var_894 && this.var_1679)
         {
            this.enable(true);
         }
      }
      
      public function hover(param1:Boolean) : void
      {
         this._hover = param1;
      }
      
      public function enable(param1:Boolean) : void
      {
         this.var_1679 = !param1;
      }
      
      protected function redraw() : void
      {
         var _loc1_:* = null;
         if(this.var_92 && !this.var_92.disposed)
         {
            if(!this.var_92.bitmap)
            {
               this.var_92.bitmap = new BitmapData(this.var_92.width,this.var_92.height,true,0);
            }
            else
            {
               this.var_92.bitmap.fillRect(this.var_92.bitmap.rect,0);
            }
            if(this.var_46 && !this.var_46.disposed)
            {
               this.var_594.x = this.var_594.y = 0;
               _loc1_ = this.var_46.content as BitmapData;
               switch(this.var_1128 & const_1972)
               {
                  case const_651:
                     this.var_594.x = this.var_92.bitmap.width / 2 - _loc1_.width / 2;
                     break;
                  case const_1971:
                     this.var_594.x = this.var_92.bitmap.width - _loc1_.width;
               }
               switch(this.var_1128 & const_1970)
               {
                  case const_652:
                     this.var_594.y = this.var_92.bitmap.height / 2 - _loc1_.height / 2;
                     break;
                  case const_284:
                     this.var_594.y = this.var_92.bitmap.height - _loc1_.height;
               }
               this.var_92.bitmap.copyPixels(_loc1_,_loc1_.rect,this.var_594);
               this.var_92.invalidate();
            }
         }
      }
      
      protected function toggleTimer(param1:Boolean, param2:int) : void
      {
         if(param1)
         {
            if(!this.var_216)
            {
               this.var_216 = new Timer(param2,0);
               this.var_216.addEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_216.start();
               this.onTimerEvent(null);
            }
            this.var_216.delay = param2;
         }
         else
         {
            this._frame = 0;
            if(this.var_216)
            {
               this.var_216.reset();
               this.var_216.removeEventListener(TimerEvent.TIMER,this.onTimerEvent);
               this.var_216 = null;
            }
         }
      }
      
      protected function onTimerEvent(param1:TimerEvent) : void
      {
      }
   }
}
