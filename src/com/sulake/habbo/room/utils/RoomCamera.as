package com.sulake.habbo.room.utils
{
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class RoomCamera
   {
      
      private static const const_1432:Number = 12;
       
      
      private var var_2376:int = -1;
      
      private var var_2377:int = -2;
      
      private var var_205:Vector3d = null;
      
      private var var_1163:Number = 0;
      
      private var var_1445:Number = 0;
      
      private var var_1749:Boolean = false;
      
      private var var_182:Vector3d = null;
      
      private var var_1751:Vector3d;
      
      private var var_2381:Boolean = false;
      
      private var var_2378:Boolean = false;
      
      private var var_2382:Boolean = false;
      
      private var var_2380:Boolean = false;
      
      private var var_2374:int = 0;
      
      private var var_2375:int = 0;
      
      private var _scale:int = 0;
      
      private var var_2379:int = 0;
      
      private var var_2383:int = 0;
      
      private var var_1750:int = -1;
      
      private var var_1747:int = 0;
      
      private var var_1748:Boolean = false;
      
      public function RoomCamera()
      {
         this.var_1751 = new Vector3d();
         super();
      }
      
      public function get location() : IVector3d
      {
         return this.var_182;
      }
      
      public function get targetId() : int
      {
         return this.var_2376;
      }
      
      public function get targetCategory() : int
      {
         return this.var_2377;
      }
      
      public function get targetObjectLoc() : IVector3d
      {
         return this.var_1751;
      }
      
      public function get limitedLocationX() : Boolean
      {
         return this.var_2381;
      }
      
      public function get limitedLocationY() : Boolean
      {
         return this.var_2378;
      }
      
      public function get centeredLocX() : Boolean
      {
         return this.var_2382;
      }
      
      public function get centeredLocY() : Boolean
      {
         return this.var_2380;
      }
      
      public function get screenWd() : int
      {
         return this.var_2374;
      }
      
      public function get screenHt() : int
      {
         return this.var_2375;
      }
      
      public function get scale() : int
      {
         return this._scale;
      }
      
      public function get roomWd() : int
      {
         return this.var_2379;
      }
      
      public function get roomHt() : int
      {
         return this.var_2383;
      }
      
      public function get geometryUpdateId() : int
      {
         return this.var_1750;
      }
      
      public function get isMoving() : Boolean
      {
         if(this.var_205 != null && this.var_182 != null)
         {
            return true;
         }
         return false;
      }
      
      public function set targetId(param1:int) : void
      {
         this.var_2376 = param1;
      }
      
      public function set targetObjectLoc(param1:IVector3d) : void
      {
         this.var_1751.assign(param1);
      }
      
      public function set targetCategory(param1:int) : void
      {
         this.var_2377 = param1;
      }
      
      public function set limitedLocationX(param1:Boolean) : void
      {
         this.var_2381 = param1;
      }
      
      public function set limitedLocationY(param1:Boolean) : void
      {
         this.var_2378 = param1;
      }
      
      public function set centeredLocX(param1:Boolean) : void
      {
         this.var_2382 = param1;
      }
      
      public function set centeredLocY(param1:Boolean) : void
      {
         this.var_2380 = param1;
      }
      
      public function set screenWd(param1:int) : void
      {
         this.var_2374 = param1;
      }
      
      public function set screenHt(param1:int) : void
      {
         this.var_2375 = param1;
      }
      
      public function set scale(param1:int) : void
      {
         if(this._scale != param1)
         {
            this._scale = param1;
            this.var_1748 = true;
         }
      }
      
      public function set roomWd(param1:int) : void
      {
         this.var_2379 = param1;
      }
      
      public function set roomHt(param1:int) : void
      {
         this.var_2383 = param1;
      }
      
      public function set geometryUpdateId(param1:int) : void
      {
         this.var_1750 = param1;
      }
      
      public function set target(param1:IVector3d) : void
      {
         var _loc2_:* = null;
         if(this.var_205 == null)
         {
            this.var_205 = new Vector3d();
         }
         if(this.var_205.x != param1.x || this.var_205.y != param1.y || this.var_205.z != param1.z)
         {
            this.var_205.assign(param1);
            this.var_1747 = 0;
            _loc2_ = Vector3d.dif(this.var_205,this.var_182);
            this.var_1163 = _loc2_.length;
            this.var_1749 = true;
         }
      }
      
      public function dispose() : void
      {
         this.var_205 = null;
         this.var_182 = null;
      }
      
      public function initializeLocation(param1:IVector3d) : void
      {
         if(this.var_182 != null)
         {
            return;
         }
         this.var_182 = new Vector3d();
         this.var_182.assign(param1);
      }
      
      public function resetLocation(param1:IVector3d) : void
      {
         if(this.var_182 == null)
         {
            this.var_182 = new Vector3d();
         }
         this.var_182.assign(param1);
      }
      
      public function update(param1:uint, param2:Number) : void
      {
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         var _loc6_:Number = NaN;
         var _loc7_:Number = NaN;
         if(this.var_205 != null && this.var_182 != null)
         {
            ++this.var_1747;
            if(this.var_1748)
            {
               this.var_1748 = false;
               this.var_182 = this.var_205;
               this.var_205 = null;
               return;
            }
            _loc3_ = Vector3d.dif(this.var_205,this.var_182);
            if(_loc3_.length > this.var_1163)
            {
               this.var_1163 = _loc3_.length;
            }
            if(_loc3_.length <= param2)
            {
               this.var_182 = this.var_205;
               this.var_205 = null;
               this.var_1445 = 0;
            }
            else
            {
               _loc4_ = Math.sin(0 * _loc3_.length / this.var_1163);
               _loc5_ = param2 * 0.5;
               _loc6_ = this.var_1163 / const_1432;
               _loc7_ = _loc5_ + (_loc6_ - _loc5_) * _loc4_;
               if(this.var_1749)
               {
                  if(_loc7_ < this.var_1445)
                  {
                     _loc7_ = this.var_1445;
                     if(_loc7_ > _loc3_.length)
                     {
                        _loc7_ = _loc3_.length;
                     }
                  }
                  else
                  {
                     this.var_1749 = false;
                  }
               }
               this.var_1445 = _loc7_;
               _loc3_.div(_loc3_.length);
               _loc3_.mul(_loc7_);
               this.var_182 = Vector3d.sum(this.var_182,_loc3_);
            }
         }
      }
      
      public function reset() : void
      {
         this.var_1750 = -1;
      }
   }
}
