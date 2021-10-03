package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_1078:String = "avatar";
      
      private static const const_673:Number = -0.01;
      
      private static const const_674:Number = -0.409;
      
      private static const const_1079:int = 2;
      
      private static const const_1387:Array = [0,0,0];
      
      private static const const_1521:int = 3;
       
      
      private var var_658:AvatarVisualizationData = null;
      
      private var var_504:Map;
      
      private var var_536:Map;
      
      private var var_1142:int = 0;
      
      private var var_945:Boolean;
      
      private var var_611:String;
      
      private var var_931:String;
      
      private var var_1141:int = 0;
      
      private var var_657:BitmapDataAsset;
      
      private var var_998:BitmapDataAsset;
      
      private var var_1705:int = -1;
      
      private var var_1900:int = -1;
      
      private var var_1901:int = -1;
      
      private const const_1080:int = 0;
      
      private const const_1986:int = 1;
      
      private const const_2012:int = 2;
      
      private const const_2011:int = 3;
      
      private const const_1388:int = 4;
      
      private var var_1750:int = -1;
      
      private var var_272:String = "";
      
      private var var_1536:String = "";
      
      private var var_1897:Boolean = false;
      
      private var var_1895:Boolean = false;
      
      private var var_1898:Boolean = false;
      
      private var var_1537:Boolean = false;
      
      private var var_700:Boolean = false;
      
      private var var_1420:int = 0;
      
      private var _danceStyle:int = 0;
      
      private var var_1894:int = 0;
      
      private var var_808:int = 0;
      
      private var var_806:int = 0;
      
      private var var_656:int = 0;
      
      private var var_1535:int = 0;
      
      private var var_1235:Boolean = false;
      
      private var var_1899:Boolean = false;
      
      private var var_1234:int = 0;
      
      private var var_807:int = 0;
      
      private var var_1896:Boolean = false;
      
      private var var_1236:int = 0;
      
      private var var_63:IAvatarImage = null;
      
      private var var_1113:Boolean;
      
      public function AvatarVisualization()
      {
         super();
         this.var_504 = new Map();
         this.var_536 = new Map();
         this.var_945 = false;
      }
      
      override public function dispose() : void
      {
         if(this.var_504 != null)
         {
            this.resetImages();
            this.var_504.dispose();
            this.var_536.dispose();
            this.var_504 = null;
         }
         this.var_658 = null;
         this.var_657 = null;
         this.var_998 = null;
         super.dispose();
         this.var_1113 = true;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1113;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_658 = param1 as AvatarVisualizationData;
         createSprites(this.const_1388);
         return true;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_157)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_186) > 0 && param3);
            if(_loc5_ != this.var_1897)
            {
               this.var_1897 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_268) > 0;
            if(_loc5_ != this.var_1895)
            {
               this.var_1895 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_269) > 0;
            if(_loc5_ != this.var_1898)
            {
               this.var_1898 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_713) > 0 && param3);
            if(_loc5_ != this.var_1537)
            {
               this.var_1537 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_632) > 0;
            if(_loc5_ != this.var_700)
            {
               this.var_700 = _loc5_;
               _loc4_ = true;
               this.updateTypingBubble(param2);
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_145);
            if(_loc6_ != this.var_1420)
            {
               this.var_1420 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_278);
            if(_loc7_ != this.var_272)
            {
               this.var_272 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_834);
            if(_loc7_ != this.var_1536)
            {
               this.var_1536 = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_572);
            if(_loc6_ != this._danceStyle)
            {
               this._danceStyle = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_554);
            if(_loc6_ != this.var_808)
            {
               this.var_808 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_358);
            if(_loc6_ != this.var_806)
            {
               this.var_806 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_244);
            if(_loc6_ != this.var_656)
            {
               this.var_656 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_206);
            if(_loc6_ != this.var_1705)
            {
               this.var_1705 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_806 > 0 && param1.getNumber(RoomObjectVariableEnum.const_244) > 0)
            {
               if(this.var_656 != this.var_806)
               {
                  this.var_656 = this.var_806;
                  _loc4_ = true;
               }
            }
            else if(this.var_656 != 0)
            {
               this.var_656 = 0;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_389);
            if(_loc6_ != this.var_1234)
            {
               this.var_1234 = _loc6_;
               _loc4_ = true;
               this.updateNumberBubble(param2);
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.AVATAR_GENDER);
            if(_loc7_ != this.var_931)
            {
               this.var_931 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_205);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_447);
            if(_loc6_ != this.var_1894)
            {
               _loc4_ = true;
            }
            var_157 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_611 != param1)
         {
            this.var_611 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_504)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         for each(_loc1_ in this.var_536)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_504.reset();
         this.var_536.reset();
         this.var_63 = null;
         _loc2_ = getSprite(this.const_1080);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1537 = false;
         }
         if(this.var_272 == "sit" || this.var_272 == "lay")
         {
            this.var_1535 = param1 / 2;
         }
         else
         {
            this.var_1535 = 0;
         }
         this.var_1899 = false;
         this.var_1235 = false;
         if(this.var_272 == "lay")
         {
            this.var_1235 = true;
            _loc2_ = int(this.var_1536);
            if(_loc2_ < 0)
            {
               this.var_1899 = true;
            }
         }
      }
      
      private function getAvatarImage(param1:Number, param2:int) : IAvatarImage
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc4_:String = "avatarImage" + param1.toString();
         if(param2 == 0)
         {
            _loc3_ = this.var_504.getValue(_loc4_) as IAvatarImage;
         }
         else
         {
            _loc4_ += "-" + param2;
            _loc3_ = this.var_536.getValue(_loc4_) as IAvatarImage;
            if(_loc3_)
            {
               _loc3_.forceActionUpdate();
            }
         }
         if(_loc3_ == null)
         {
            _loc3_ = this.var_658.getAvatar(this.var_611,param1,this.var_931,this);
            if(_loc3_ != null)
            {
               if(param2 == 0)
               {
                  this.var_504.add(_loc4_,_loc3_);
               }
               else
               {
                  if(this.var_536.length >= const_1521)
                  {
                     _loc5_ = this.var_536.remove(this.var_536.getKey(0));
                     if(_loc5_)
                     {
                        _loc5_.dispose();
                     }
                  }
                  this.var_536.add(_loc4_,_loc3_);
               }
            }
         }
         return _loc3_;
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_498 != param1.getUpdateID() || this.var_1750 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1705;
            if(this.var_272 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1900 || param4)
            {
               _loc5_ = true;
               this.var_1900 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_63.setDirectionAngle(AvatarSetType.const_42,_loc6_);
            }
            if(_loc7_ != this.var_1901 || param4)
            {
               _loc5_ = true;
               this.var_1901 = _loc7_;
               if(this.var_1901 != this.var_1900)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_63.setDirectionAngle(AvatarSetType.const_53,_loc7_);
               }
            }
            var_498 = param1.getUpdateID();
            this.var_1750 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1986);
         this.var_657 = null;
         if(this.var_272 == "mv" || this.var_272 == "std")
         {
            _loc2_.visible = true;
            if(this.var_657 == null || param1 != var_96)
            {
               _loc3_ = 0;
               _loc4_ = 0;
               if(param1 < 48)
               {
                  this.var_657 = this.var_63.getAsset("sh_std_sd_1_0_0");
                  _loc3_ = -8;
                  _loc4_ = -3;
               }
               else
               {
                  this.var_657 = this.var_63.getAsset("h_std_sd_1_0_0");
                  _loc3_ = -17;
                  _loc4_ = -7;
               }
               if(this.var_657 != null)
               {
                  _loc2_.asset = this.var_657.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_657 = null;
            _loc2_.visible = false;
         }
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_998 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2012);
         if(this.var_700)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_998 = this.var_658.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_998 = this.var_658.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_272 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_272 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_998 != null)
            {
               _loc2_.asset = this.var_998.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      private function updateNumberBubble(param1:Number) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:int = 0;
         var _loc2_:* = null;
         var _loc3_:IRoomObjectSprite = getSprite(this.const_2011);
         if(this.var_1234 > 0)
         {
            _loc6_ = 64;
            if(param1 < 48)
            {
               _loc2_ = this.var_658.getAvatarRendererAsset("number_" + this.var_1234 + "_small_png") as BitmapDataAsset;
               _loc4_ = -6;
               _loc5_ = -52;
               _loc6_ = 32;
            }
            else
            {
               _loc2_ = this.var_658.getAvatarRendererAsset("number_" + this.var_1234 + "_png") as BitmapDataAsset;
               _loc4_ = -8;
               _loc5_ = -105;
            }
            if(this.var_272 == "sit")
            {
               _loc5_ += _loc6_ / 2;
            }
            else if(this.var_272 == "lay")
            {
               _loc5_ += _loc6_;
            }
            if(_loc2_ != null)
            {
               _loc3_.visible = true;
               _loc3_.asset = _loc2_.content as BitmapData;
               _loc3_.offsetX = _loc4_;
               _loc3_.offsetY = _loc5_;
               _loc3_.relativeDepth = -0.01;
               this.var_807 = 1;
               this.var_1896 = true;
               this.var_1236 = 0;
               _loc3_.alpha = 0;
            }
            else
            {
               _loc3_.visible = false;
            }
         }
         else if(_loc3_.visible)
         {
            this.var_807 = -1;
         }
      }
      
      private function animateNumberBubble(param1:int) : Boolean
      {
         var _loc5_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_2011);
         var _loc3_:int = _loc2_.alpha;
         var _loc4_:Boolean = false;
         if(this.var_1896)
         {
            ++this.var_1236;
            if(this.var_1236 < 10)
            {
               return false;
            }
            if(this.var_807 < 0)
            {
               if(param1 < 48)
               {
                  _loc2_.offsetY -= 2;
               }
               else
               {
                  _loc2_.offsetY -= 4;
               }
            }
            else
            {
               _loc5_ = 4;
               if(param1 < 48)
               {
                  _loc5_ = 8;
               }
               if(this.var_1236 % _loc5_ == 0)
               {
                  --_loc2_.offsetY;
                  _loc4_ = true;
               }
            }
         }
         if(this.var_807 > 0)
         {
            if(_loc3_ < 255)
            {
               _loc3_ += 32;
            }
            if(_loc3_ >= 255)
            {
               _loc3_ = 255;
               this.var_807 = 0;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         if(this.var_807 < 0)
         {
            if(_loc3_ >= 0)
            {
               _loc3_ -= 32;
            }
            if(_loc3_ <= 0)
            {
               this.var_807 = 0;
               this.var_1896 = false;
               _loc3_ = 0;
               _loc2_.visible = false;
            }
            _loc2_.alpha = _loc3_;
            return true;
         }
         return _loc4_;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean, param4:Boolean) : void
      {
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:int = 0;
         var _loc20_:* = null;
         var _loc21_:* = null;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:int = 0;
         var _loc29_:int = 0;
         var _loc30_:int = 0;
         var _loc31_:* = null;
         var _loc32_:* = null;
         var _loc5_:IRoomObject = object;
         if(_loc5_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_658 == null)
         {
            return;
         }
         var _loc6_:IRoomObjectModel = _loc5_.getModel();
         var _loc7_:Number = param1.scale;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = false;
         var _loc11_:int = this.var_808;
         var _loc12_:Boolean = false;
         var _loc13_:Boolean = this.updateModel(_loc6_,_loc7_,param3);
         if(this.animateNumberBubble(_loc7_))
         {
            increaseUpdateId();
         }
         if(_loc13_ || _loc7_ != var_96 || this.var_63 == null)
         {
            if(_loc7_ != var_96)
            {
               _loc9_ = true;
               this.validateActions(_loc7_);
            }
            if(_loc11_ != this.var_808)
            {
               _loc12_ = true;
            }
            if(_loc9_ || this.var_63 == null || _loc12_)
            {
               this.var_63 = this.getAvatarImage(_loc7_,this.var_808);
               if(this.var_63 == null)
               {
                  return;
               }
               _loc8_ = true;
               _loc16_ = getSprite(this.const_1080);
               if(_loc16_ && this.var_63 && this.var_63.isPlaceholder())
               {
                  _loc16_.alpha = 150;
               }
               else if(_loc16_)
               {
                  _loc16_.alpha = 255;
               }
            }
            if(this.var_63 == null)
            {
               return;
            }
            this.updateShadow(_loc7_);
            if(_loc9_)
            {
               this.updateTypingBubble(_loc7_);
               this.updateNumberBubble(_loc7_);
            }
            _loc10_ = this.updateObject(_loc5_,param1,param3,true);
            this.updateActions(this.var_63);
            var_96 = _loc7_;
         }
         else
         {
            _loc10_ = this.updateObject(_loc5_,param1,param3);
         }
         var _loc14_:Boolean = _loc10_ || _loc13_ || _loc9_;
         var _loc15_:Boolean = (this.var_945 || this.var_1141 > 0) && param3;
         if(_loc14_)
         {
            this.var_1141 = const_1079;
         }
         if(_loc14_ || _loc15_)
         {
            increaseUpdateId();
            --this.var_1141;
            --this.var_1142;
            if(!(this.var_1142 <= 0 || _loc9_ || _loc13_ || _loc8_))
            {
               return;
            }
            this.var_63.updateAnimationByFrames(1);
            this.var_1142 = const_1079;
            _loc18_ = this.var_63.getCanvasOffsets();
            if(_loc18_ == null || _loc18_.length < 3)
            {
               _loc18_ = const_1387;
            }
            _loc17_ = getSprite(this.const_1080);
            if(_loc17_ != null)
            {
               _loc21_ = this.var_63.getImage(AvatarSetType.const_42,false);
               if(_loc21_ != null)
               {
                  _loc17_.asset = _loc21_;
               }
               if(_loc17_.asset)
               {
                  _loc17_.offsetX = -1 * _loc7_ / 2 + _loc18_[0];
                  _loc17_.offsetY = -_loc17_.asset.height + _loc7_ / 4 + _loc18_[1] + this.var_1535;
               }
               if(this.var_1235)
               {
                  if(this.var_1899)
                  {
                     _loc17_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc17_.relativeDepth = const_674 + _loc18_[2];
                  }
               }
               else
               {
                  _loc17_.relativeDepth = const_673 + _loc18_[2];
               }
            }
            _loc17_ = getSprite(this.const_2012);
            if(_loc17_ != null && _loc17_.visible)
            {
               if(!this.var_1235)
               {
                  _loc17_.relativeDepth = const_673 - 0.01 + _loc18_[2];
               }
               else
               {
                  _loc17_.relativeDepth = const_674 - 0.01 + _loc18_[2];
               }
            }
            this.var_945 = this.var_63.isAnimating();
            _loc19_ = this.const_1388;
            for each(_loc20_ in this.var_63.getSprites())
            {
               if(_loc20_.id == const_1078)
               {
                  _loc17_ = getSprite(this.const_1080);
                  _loc22_ = this.var_63.getLayerData(_loc20_);
                  _loc23_ = _loc20_.getDirectionOffsetX(this.var_63.getDirection());
                  _loc24_ = _loc20_.getDirectionOffsetY(this.var_63.getDirection());
                  if(_loc22_ != null)
                  {
                     _loc23_ += _loc22_.dx;
                     _loc24_ += _loc22_.dy;
                  }
                  if(_loc7_ < 48)
                  {
                     _loc23_ /= 2;
                     _loc24_ /= 2;
                  }
                  _loc17_.offsetX += _loc23_;
                  _loc17_.offsetY += _loc24_;
               }
               else
               {
                  _loc17_ = getSprite(_loc19_);
                  if(_loc17_ != null)
                  {
                     _loc17_.capturesMouse = false;
                     _loc17_.visible = true;
                     _loc25_ = this.var_63.getLayerData(_loc20_);
                     _loc26_ = 0;
                     _loc27_ = _loc20_.getDirectionOffsetX(this.var_63.getDirection());
                     _loc28_ = _loc20_.getDirectionOffsetY(this.var_63.getDirection());
                     _loc29_ = _loc20_.getDirectionOffsetZ(this.var_63.getDirection());
                     _loc30_ = 0;
                     if(_loc20_.hasDirections)
                     {
                        _loc30_ = this.var_63.getDirection();
                     }
                     if(_loc25_ != null)
                     {
                        _loc26_ = _loc25_.animationFrame;
                        _loc27_ += _loc25_.dx;
                        _loc28_ += _loc25_.dy;
                        _loc30_ += _loc25_.directionOffset;
                     }
                     if(_loc7_ < 48)
                     {
                        _loc27_ /= 2;
                        _loc28_ /= 2;
                     }
                     if(_loc30_ < 0)
                     {
                        _loc30_ += 8;
                     }
                     else if(_loc30_ > 7)
                     {
                        _loc30_ -= 8;
                     }
                     _loc31_ = this.var_63.getScale() + "_" + _loc20_.member + "_" + _loc30_ + "_" + _loc26_;
                     _loc32_ = this.var_63.getAsset(_loc31_);
                     if(_loc32_ == null)
                     {
                        continue;
                     }
                     _loc17_.asset = _loc32_.content as BitmapData;
                     _loc17_.offsetX = -_loc32_.offset.x - _loc7_ / 2 + _loc27_;
                     _loc17_.offsetY = -_loc32_.offset.y + _loc28_ + this.var_1535;
                     if(this.var_1235)
                     {
                        _loc17_.relativeDepth = const_674 - 0.001 * spriteCount * _loc29_;
                     }
                     else
                     {
                        _loc17_.relativeDepth = const_673 - 0.001 * spriteCount * _loc29_;
                     }
                     if(_loc20_.ink == 33)
                     {
                        _loc17_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc17_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc19_++;
               }
            }
         }
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_444,this.var_272,this.var_1536);
         if(this.var_1420 > 0)
         {
            param1.appendAction(AvatarAction.const_320,AvatarAction.const_1939[this.var_1420]);
         }
         if(this._danceStyle > 0)
         {
            param1.appendAction(AvatarAction.const_906,this._danceStyle);
         }
         if(this.var_1894 > 0)
         {
            param1.appendAction(AvatarAction.const_878,this.var_1894);
         }
         if(this.var_806 > 0)
         {
            param1.appendAction(AvatarAction.const_966,this.var_806);
         }
         if(this.var_656 > 0)
         {
            param1.appendAction(AvatarAction.const_798,this.var_656);
         }
         if(this.var_1897)
         {
            param1.appendAction(AvatarAction.const_356);
         }
         if(this.var_1898 || this.var_1537)
         {
            param1.appendAction(AvatarAction.const_536);
         }
         if(this.var_1895)
         {
            param1.appendAction(AvatarAction.const_291);
         }
         if(this.var_808 > 0)
         {
            param1.appendAction(AvatarAction.const_319,this.var_808);
         }
         param1.endActionAppends();
         this.var_945 = param1.isAnimating();
         var _loc2_:int = this.const_1388;
         for each(_loc3_ in this.var_63.getSprites())
         {
            if(_loc3_.id != const_1078)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
   }
}
