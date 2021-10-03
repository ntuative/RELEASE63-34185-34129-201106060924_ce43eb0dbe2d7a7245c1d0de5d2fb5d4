package com.sulake.room.utils
{
   import com.sulake.core.utils.Map;
   import flash.geom.Point;
   
   public class RoomGeometry implements IRoomGeometry
   {
      
      public static const const_591:Number = 64;
      
      public static const const_1212:Number = 32;
       
      
      private var var_175:int = 0;
      
      private var _x:Vector3d;
      
      private var var_166:Vector3d;
      
      private var var_167:Vector3d;
      
      private var var_1344:Vector3d;
      
      private var var_477:Vector3d;
      
      private var _direction:Vector3d;
      
      private var var_1343:Vector3d;
      
      private var _scale:Number = 1.0;
      
      private var var_474:Number = 1.0;
      
      private var var_475:Number = 1.0;
      
      private var var_476:Number = 1.0;
      
      private var var_2079:Number = 1.0;
      
      private var var_2077:Number = 1.0;
      
      private var var_2078:Number = 1.0;
      
      private var var_101:Vector3d;
      
      private var var_478:Vector3d;
      
      private var var_3023:Number = -500.0;
      
      private var var_3022:Number = 500.0;
      
      private var var_575:Map = null;
      
      public function RoomGeometry(param1:Number, param2:IVector3d, param3:IVector3d, param4:IVector3d = null)
      {
         super();
         this.scale = param1;
         this._x = new Vector3d();
         this.var_166 = new Vector3d();
         this.var_167 = new Vector3d();
         this.var_1344 = new Vector3d();
         this.var_477 = new Vector3d();
         this._direction = new Vector3d();
         this.var_1343 = new Vector3d();
         this.var_2079 = 1;
         this.var_2077 = 1;
         this.x_scale = 1;
         this.y_scale = 1;
         this.var_2078 = Math.sqrt(0.5) / Math.sqrt(0.75);
         this.z_scale = 1;
         this.location = new Vector3d(param3.x,param3.y,param3.z);
         this.direction = new Vector3d(param2.x,param2.y,param2.z);
         if(param4 != null)
         {
            this.setDepthVector(param4);
         }
         else
         {
            this.setDepthVector(param2);
         }
         this.var_575 = new Map();
      }
      
      public static function getIntersectionVector(param1:IVector3d, param2:IVector3d, param3:IVector3d, param4:IVector3d) : IVector3d
      {
         var _loc5_:Number = Vector3d.dotProduct(param2,param4);
         if(Math.abs(_loc5_) < 0.00001)
         {
            return null;
         }
         var _loc6_:Vector3d = Vector3d.dif(param1,param3);
         var _loc7_:Number = -Vector3d.dotProduct(param4,_loc6_) / _loc5_;
         return Vector3d.sum(param1,Vector3d.product(param2,_loc7_));
      }
      
      public function get updateId() : int
      {
         return this.var_175;
      }
      
      public function get scale() : Number
      {
         return this._scale / Math.sqrt(0.5);
      }
      
      public function get directionAxis() : IVector3d
      {
         return this.var_1344;
      }
      
      public function get location() : IVector3d
      {
         this.var_477.assign(this.var_101);
         this.var_477.x *= this.var_474;
         this.var_477.y *= this.var_475;
         this.var_477.z *= this.var_476;
         return this.var_477;
      }
      
      public function get direction() : IVector3d
      {
         return this._direction;
      }
      
      public function set x_scale(param1:Number) : void
      {
         if(this.var_474 != param1 * this.var_2079)
         {
            this.var_474 = param1 * this.var_2079;
            ++this.var_175;
         }
      }
      
      public function set y_scale(param1:Number) : void
      {
         if(this.var_475 != param1 * this.var_2077)
         {
            this.var_475 = param1 * this.var_2077;
            ++this.var_175;
         }
      }
      
      public function set z_scale(param1:Number) : void
      {
         if(this.var_476 != param1 * this.var_2078)
         {
            this.var_476 = param1 * this.var_2078;
            ++this.var_175;
         }
      }
      
      public function set scale(param1:Number) : void
      {
         if(param1 <= 1)
         {
            param1 = 1;
         }
         param1 *= Math.sqrt(0.5);
         if(param1 != this._scale)
         {
            this._scale = param1;
            ++this.var_175;
         }
      }
      
      public function set location(param1:IVector3d) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.var_101 == null)
         {
            this.var_101 = new Vector3d();
         }
         var _loc2_:Number = this.var_101.x;
         var _loc3_:Number = this.var_101.y;
         var _loc4_:Number = this.var_101.z;
         this.var_101.assign(param1);
         this.var_101.x /= this.var_474;
         this.var_101.y /= this.var_475;
         this.var_101.z /= this.var_476;
         if(this.var_101.x != _loc2_ || this.var_101.y != _loc3_ || this.var_101.z != _loc4_)
         {
            ++this.var_175;
         }
      }
      
      public function set direction(param1:IVector3d) : void
      {
         var _loc21_:Number = NaN;
         var _loc22_:Number = NaN;
         var _loc23_:* = null;
         var _loc24_:* = null;
         var _loc25_:* = null;
         if(param1 == null)
         {
            return;
         }
         if(this.var_478 == null)
         {
            this.var_478 = new Vector3d();
         }
         var _loc2_:Number = this.var_478.x;
         var _loc3_:Number = this.var_478.y;
         var _loc4_:Number = this.var_478.z;
         this.var_478.assign(param1);
         this._direction.assign(param1);
         if(this.var_478.x != _loc2_ || this.var_478.y != _loc3_ || this.var_478.z != _loc4_)
         {
            ++this.var_175;
         }
         var _loc5_:Vector3d = new Vector3d(0,1,0);
         var _loc6_:Vector3d = new Vector3d(0,0,1);
         var _loc7_:Vector3d = new Vector3d(1,0,0);
         var _loc8_:Number = param1.x / 180 * 0;
         var _loc9_:Number = param1.y / 180 * 0;
         var _loc10_:Number = param1.z / 180 * 0;
         var _loc11_:Number = Math.cos(_loc8_);
         var _loc12_:Number = Math.sin(_loc8_);
         var _loc13_:Vector3d = Vector3d.sum(Vector3d.product(_loc5_,_loc11_),Vector3d.product(_loc7_,-_loc12_));
         var _loc14_:Vector3d = new Vector3d(_loc6_.x,_loc6_.y,_loc6_.z);
         var _loc15_:Vector3d = Vector3d.sum(Vector3d.product(_loc5_,_loc12_),Vector3d.product(_loc7_,_loc11_));
         var _loc16_:Number = Math.cos(_loc9_);
         var _loc17_:Number = Math.sin(_loc9_);
         var _loc18_:Vector3d = new Vector3d(_loc13_.x,_loc13_.y,_loc13_.z);
         var _loc19_:Vector3d = Vector3d.sum(Vector3d.product(_loc14_,_loc16_),Vector3d.product(_loc15_,_loc17_));
         var _loc20_:Vector3d = Vector3d.sum(Vector3d.product(_loc14_,-_loc17_),Vector3d.product(_loc15_,_loc16_));
         if(_loc10_ != 0)
         {
            _loc21_ = Math.cos(_loc10_);
            _loc22_ = Math.sin(_loc10_);
            _loc23_ = Vector3d.sum(Vector3d.product(_loc18_,_loc21_),Vector3d.product(_loc19_,_loc22_));
            _loc24_ = Vector3d.sum(Vector3d.product(_loc18_,-_loc22_),Vector3d.product(_loc19_,_loc21_));
            _loc25_ = new Vector3d(_loc20_.x,_loc20_.y,_loc20_.z);
            this._x.assign(_loc23_);
            this.var_166.assign(_loc24_);
            this.var_167.assign(_loc25_);
            this.var_1344.assign(this.var_167);
         }
         else
         {
            this._x.assign(_loc18_);
            this.var_166.assign(_loc19_);
            this.var_167.assign(_loc20_);
            this.var_1344.assign(this.var_167);
         }
      }
      
      public function dispose() : void
      {
         this._x = null;
         this.var_166 = null;
         this.var_167 = null;
         this.var_101 = null;
         this.var_478 = null;
         this.var_1344 = null;
         this.var_477 = null;
         if(this.var_575 != null)
         {
            this.var_575.dispose();
            this.var_575 = null;
         }
      }
      
      public function setDisplacement(param1:IVector3d, param2:IVector3d) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 == null || param2 == null)
         {
            return;
         }
         if(this.var_575 != null)
         {
            _loc3_ = int(Math.round(param1.x)) + "_" + int(Math.round(param1.y)) + "_" + int(Math.round(param1.z));
            this.var_575.remove(_loc3_);
            _loc4_ = new Vector3d();
            _loc4_.assign(param2);
            this.var_575.add(_loc3_,_loc4_);
            ++this.var_175;
         }
      }
      
      private function getDisplacenent(param1:IVector3d) : IVector3d
      {
         var _loc2_:* = null;
         if(this.var_575 != null)
         {
            _loc2_ = int(Math.round(param1.x)) + "_" + int(Math.round(param1.y)) + "_" + int(Math.round(param1.z));
            return this.var_575.getValue(_loc2_);
         }
         return null;
      }
      
      public function setDepthVector(param1:IVector3d) : void
      {
         var _loc18_:Number = NaN;
         var _loc19_:Number = NaN;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc2_:Vector3d = new Vector3d(0,1,0);
         var _loc3_:Vector3d = new Vector3d(0,0,1);
         var _loc4_:Vector3d = new Vector3d(1,0,0);
         var _loc5_:Number = param1.x / 180 * 0;
         var _loc6_:Number = param1.y / 180 * 0;
         var _loc7_:Number = param1.z / 180 * 0;
         var _loc8_:Number = Math.cos(_loc5_);
         var _loc9_:Number = Math.sin(_loc5_);
         var _loc10_:Vector3d = Vector3d.sum(Vector3d.product(_loc2_,_loc8_),Vector3d.product(_loc4_,-_loc9_));
         var _loc11_:Vector3d = new Vector3d(_loc3_.x,_loc3_.y,_loc3_.z);
         var _loc12_:Vector3d = Vector3d.sum(Vector3d.product(_loc2_,_loc9_),Vector3d.product(_loc4_,_loc8_));
         var _loc13_:Number = Math.cos(_loc6_);
         var _loc14_:Number = Math.sin(_loc6_);
         var _loc15_:Vector3d = new Vector3d(_loc10_.x,_loc10_.y,_loc10_.z);
         var _loc16_:Vector3d = Vector3d.sum(Vector3d.product(_loc11_,_loc13_),Vector3d.product(_loc12_,_loc14_));
         var _loc17_:Vector3d = Vector3d.sum(Vector3d.product(_loc11_,-_loc14_),Vector3d.product(_loc12_,_loc13_));
         if(_loc7_ != 0)
         {
            _loc18_ = Math.cos(_loc7_);
            _loc19_ = Math.sin(_loc7_);
            _loc20_ = Vector3d.sum(Vector3d.product(_loc15_,_loc18_),Vector3d.product(_loc16_,_loc19_));
            _loc21_ = Vector3d.sum(Vector3d.product(_loc15_,-_loc19_),Vector3d.product(_loc16_,_loc18_));
            _loc22_ = new Vector3d(_loc17_.x,_loc17_.y,_loc17_.z);
            this.var_1343.assign(_loc22_);
         }
         else
         {
            this.var_1343.assign(_loc17_);
         }
         ++this.var_175;
      }
      
      public function adjustLocation(param1:IVector3d, param2:Number) : void
      {
         if(param1 == null || this.var_167 == null)
         {
            return;
         }
         var _loc3_:Vector3d = Vector3d.product(this.var_167,-param2);
         var _loc4_:Vector3d = new Vector3d(param1.x + _loc3_.x,param1.y + _loc3_.y,param1.z + _loc3_.z);
         this.location = _loc4_;
      }
      
      public function getCoordinatePosition(param1:IVector3d) : IVector3d
      {
         if(param1 == null)
         {
            return null;
         }
         var _loc2_:Number = Vector3d.scalarProjection(param1,this._x);
         var _loc3_:Number = Vector3d.scalarProjection(param1,this.var_166);
         var _loc4_:Number = Vector3d.scalarProjection(param1,this.var_167);
         return new Vector3d(_loc2_,_loc3_,_loc4_);
      }
      
      public function getScreenPosition(param1:IVector3d) : IVector3d
      {
         var _loc2_:Vector3d = Vector3d.dif(param1,this.var_101);
         _loc2_.x *= this.var_474;
         _loc2_.y *= this.var_475;
         _loc2_.z *= this.var_476;
         var _loc3_:Number = Vector3d.scalarProjection(_loc2_,this.var_1343);
         if(_loc3_ < this.var_3023 || _loc3_ > this.var_3022)
         {
            return null;
         }
         var _loc4_:Number = Vector3d.scalarProjection(_loc2_,this._x);
         var _loc5_:Number = -Vector3d.scalarProjection(_loc2_,this.var_166);
         _loc4_ *= this._scale;
         _loc5_ *= this._scale;
         var _loc6_:IVector3d = this.getDisplacenent(param1);
         if(_loc6_ != null)
         {
            _loc2_ = Vector3d.dif(param1,this.var_101);
            _loc2_.add(_loc6_);
            _loc2_.x *= this.var_474;
            _loc2_.y *= this.var_475;
            _loc2_.z *= this.var_476;
            _loc3_ = Vector3d.scalarProjection(_loc2_,this.var_1343);
         }
         _loc2_.x = _loc4_;
         _loc2_.y = _loc5_;
         _loc2_.z = _loc3_;
         return _loc2_;
      }
      
      public function getScreenPoint(param1:IVector3d) : Point
      {
         var _loc2_:IVector3d = this.getScreenPosition(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      public function getPlanePosition(param1:Point, param2:IVector3d, param3:IVector3d, param4:IVector3d) : Point
      {
         var _loc15_:Number = NaN;
         var _loc16_:Number = NaN;
         var _loc5_:Number = param1.x / this._scale;
         var _loc6_:Number = -param1.y / this._scale;
         var _loc7_:Vector3d = Vector3d.product(this._x,_loc5_);
         _loc7_.add(Vector3d.product(this.var_166,_loc6_));
         var _loc8_:Vector3d = new Vector3d(this.var_101.x * this.var_474,this.var_101.y * this.var_475,this.var_101.z * this.var_476);
         _loc8_.add(_loc7_);
         var _loc9_:IVector3d = this.var_167;
         var _loc10_:Vector3d = new Vector3d(param2.x * this.var_474,param2.y * this.var_475,param2.z * this.var_476);
         var _loc11_:Vector3d = new Vector3d(param3.x * this.var_474,param3.y * this.var_475,param3.z * this.var_476);
         var _loc12_:Vector3d = new Vector3d(param4.x * this.var_474,param4.y * this.var_475,param4.z * this.var_476);
         var _loc13_:IVector3d = Vector3d.crossProduct(_loc11_,_loc12_);
         var _loc14_:Vector3d = new Vector3d();
         _loc14_.assign(RoomGeometry.getIntersectionVector(_loc8_,_loc9_,_loc10_,_loc13_));
         if(_loc14_ != null)
         {
            _loc14_.sub(_loc10_);
            _loc15_ = Vector3d.scalarProjection(_loc14_,param3) / _loc11_.length * param3.length;
            _loc16_ = Vector3d.scalarProjection(_loc14_,param4) / _loc12_.length * param4.length;
            return new Point(_loc15_,_loc16_);
         }
         return null;
      }
      
      public function performZoom() : void
      {
         if(this.isZoomedIn())
         {
            this.scale = const_1212;
         }
         else
         {
            this.scale = const_591;
         }
      }
      
      public function isZoomedIn() : Boolean
      {
         return this.scale == const_591;
      }
      
      public function performZoomOut() : void
      {
         this.scale = const_1212;
      }
      
      public function performZoomIn() : void
      {
         this.scale = const_591;
      }
   }
}
