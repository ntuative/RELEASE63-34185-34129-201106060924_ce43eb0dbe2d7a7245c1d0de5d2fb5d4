package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.room.messages.RoomObjectMoveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectController;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.object.logic.ObjectLogicBase;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   
   public class MovingObjectLogic extends ObjectLogicBase
   {
      
      public static const const_767:int = 500;
      
      private static var var_643:Vector3d = new Vector3d();
       
      
      private var var_450:Vector3d;
      
      private var var_101:Vector3d;
      
      private var var_973:Number = 0.0;
      
      private var var_1845:int = 0;
      
      private var var_2530:int;
      
      private var var_972:int = 500;
      
      public function MovingObjectLogic()
      {
         this.var_450 = new Vector3d();
         this.var_101 = new Vector3d();
         super();
      }
      
      protected function get lastUpdateTime() : int
      {
         return this.var_1845;
      }
      
      override public function dispose() : void
      {
         super.dispose();
         this.var_101 = null;
         this.var_450 = null;
      }
      
      override public function set object(param1:IRoomObjectController) : void
      {
         super.object = param1;
         if(param1 != null)
         {
            this.var_101.assign(param1.getLocation());
         }
      }
      
      protected function set moveUpdateInterval(param1:int) : void
      {
         if(param1 <= 0)
         {
            param1 = 1;
         }
         this.var_972 = param1;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         if(param1.loc != null)
         {
            this.var_101.assign(param1.loc);
         }
         var _loc2_:RoomObjectMoveUpdateMessage = param1 as RoomObjectMoveUpdateMessage;
         if(_loc2_ == null)
         {
            return;
         }
         if(object != null)
         {
            if(param1.loc != null)
            {
               _loc3_ = _loc2_.targetLoc;
               this.var_2530 = this.var_1845;
               this.var_450.assign(_loc3_);
               this.var_450.sub(this.var_101);
            }
         }
      }
      
      protected function getLocationOffset() : IVector3d
      {
         return null;
      }
      
      override public function update(param1:int) : void
      {
         var _loc4_:int = 0;
         var _loc2_:IVector3d = this.getLocationOffset();
         var _loc3_:IRoomObjectModelController = object.getModelController();
         if(_loc3_ != null)
         {
            if(_loc2_ != null)
            {
               if(this.var_973 != _loc2_.z)
               {
                  this.var_973 = _loc2_.z;
                  _loc3_.setNumber(RoomObjectVariableEnum.const_930,this.var_973);
               }
            }
            else if(this.var_973 != 0)
            {
               this.var_973 = 0;
               _loc3_.setNumber(RoomObjectVariableEnum.const_930,this.var_973);
            }
         }
         if(this.var_450.length > 0 || _loc2_ != null)
         {
            _loc4_ = param1 - this.var_2530;
            if(_loc4_ == this.var_972 >> 1)
            {
               _loc4_++;
            }
            if(_loc4_ > this.var_972)
            {
               _loc4_ = this.var_972;
            }
            if(this.var_450.length > 0)
            {
               var_643.assign(this.var_450);
               var_643.mul(_loc4_ / Number(this.var_972));
               var_643.add(this.var_101);
            }
            else
            {
               var_643.assign(this.var_101);
            }
            if(_loc2_ != null)
            {
               var_643.add(_loc2_);
            }
            if(object != null)
            {
               object.setLocation(var_643);
            }
            if(_loc4_ == this.var_972)
            {
               this.var_450.x = 0;
               this.var_450.y = 0;
               this.var_450.z = 0;
            }
         }
         this.var_1845 = param1;
      }
   }
}
