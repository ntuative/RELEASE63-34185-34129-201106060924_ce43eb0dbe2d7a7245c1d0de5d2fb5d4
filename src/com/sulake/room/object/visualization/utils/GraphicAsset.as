package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import flash.display.BitmapData;
   
   public class GraphicAsset implements IGraphicAsset
   {
       
      
      private var var_2567:String;
      
      private var var_2880:String;
      
      private var var_454:BitmapDataAsset;
      
      private var var_1511:Boolean;
      
      private var var_1512:Boolean;
      
      private var var_2881:Boolean;
      
      private var _offsetX:int;
      
      private var var_1146:int;
      
      private var var_253:int;
      
      private var _height:int;
      
      private var var_754:Boolean;
      
      public function GraphicAsset(param1:String, param2:String, param3:IAsset, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:Boolean = false)
      {
         super();
         this.var_2567 = param1;
         this.var_2880 = param2;
         var _loc9_:BitmapDataAsset = param3 as BitmapDataAsset;
         if(_loc9_ != null)
         {
            this.var_454 = _loc9_;
            this.var_754 = false;
         }
         else
         {
            this.var_454 = null;
            this.var_754 = true;
         }
         this.var_1511 = param4;
         this.var_1512 = param5;
         this._offsetX = param6;
         this.var_1146 = param7;
         this.var_2881 = param8;
      }
      
      public function dispose() : void
      {
         this.var_454 = null;
      }
      
      private function initialize() : void
      {
         var _loc1_:* = null;
         if(!this.var_754 && this.var_454 != null)
         {
            _loc1_ = this.var_454.content as BitmapData;
            if(_loc1_ != null)
            {
               this.var_253 = _loc1_.width;
               this._height = _loc1_.height;
            }
            this.var_754 = true;
         }
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1512;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1511;
      }
      
      public function get width() : int
      {
         this.initialize();
         return this.var_253;
      }
      
      public function get height() : int
      {
         this.initialize();
         return this._height;
      }
      
      public function get assetName() : String
      {
         return this.var_2567;
      }
      
      public function get libraryAssetName() : String
      {
         return this.var_2880;
      }
      
      public function get asset() : IAsset
      {
         return this.var_454;
      }
      
      public function get usesPalette() : Boolean
      {
         return this.var_2881;
      }
      
      public function get offsetX() : int
      {
         if(!this.var_1511)
         {
            return this._offsetX;
         }
         return -(this.width + this._offsetX);
      }
      
      public function get offsetY() : int
      {
         if(!this.var_1512)
         {
            return this.var_1146;
         }
         return -(this.height + this.var_1146);
      }
      
      public function get originalOffsetX() : int
      {
         return this._offsetX;
      }
      
      public function get originalOffsetY() : int
      {
         return this.var_1146;
      }
   }
}
