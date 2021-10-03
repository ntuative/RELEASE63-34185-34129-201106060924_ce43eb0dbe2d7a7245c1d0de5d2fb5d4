package com.sulake.habbo.ui.handler
{
   import com.sulake.habbo.avatar.IHabboAvatarEditorDataSaver;
   import com.sulake.habbo.avatar.enum.AvatarEditorFigureCategory;
   import com.sulake.habbo.avatar.events.AvatarEditorClosedEvent;
   import com.sulake.habbo.avatar.figuredata.FigureData;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.IRoomWidgetHandlerContainer;
   import com.sulake.habbo.ui.widget.enums.RoomWidgetEnum;
   import com.sulake.habbo.ui.widget.events.RoomWidgetClothingChangeUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetAvatarEditorMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetClothingChangeMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureClothingChangeWidgetHandler implements IRoomWidgetHandler, IHabboAvatarEditorDataSaver
   {
      
      private static const const_1394:String = "hr-165-45.hd-208-2.ch-250-64.lg-285-82.sh-290-64";
      
      private static const const_1395:String = "hr-681-41.hd-620-9.ch-879-90.lg-700-85.sh-735-68";
       
      
      private var var_1113:Boolean = false;
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_222:int = -1;
      
      public function FurnitureClothingChangeWidgetHandler()
      {
         super();
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1113;
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_593;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         if(this._container != null)
         {
            if(this._container.avatarEditor)
            {
               this._container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,this.onAvatarEditorClosed);
            }
         }
         this._container = param1;
         if(this._container.avatarEditor)
         {
            this._container.avatarEditor.events.addEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,this.onAvatarEditorClosed);
         }
      }
      
      private function onAvatarEditorClosed(param1:Event = null) : void
      {
         if(this._container == null)
         {
            return;
         }
         var _loc2_:RoomWidgetClothingChangeUpdateEvent = new RoomWidgetClothingChangeUpdateEvent(RoomWidgetClothingChangeUpdateEvent.const_441);
         this._container.events.dispatchEvent(_loc2_);
      }
      
      public function dispose() : void
      {
         if(this._container != null)
         {
            if(this._container.avatarEditor && this._container.avatarEditor.events)
            {
               this._container.avatarEditor.events.removeEventListener(AvatarEditorClosedEvent.AVATAREDITOR_CLOSED,this.onAvatarEditorClosed);
            }
         }
         this.var_1113 = true;
         this._container = null;
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_749,RoomWidgetClothingChangeMessage.const_397,RoomWidgetAvatarEditorMessage.const_424];
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:Boolean = false;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:int = 0;
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_749:
               _loc6_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc6_.roomId,_loc6_.roomCategory,_loc6_.id,_loc6_.category);
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.getModel();
                  if(_loc4_ != null)
                  {
                     _loc8_ = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
                     if(_loc8_)
                     {
                        _loc5_ = new RoomWidgetClothingChangeUpdateEvent(RoomWidgetClothingChangeUpdateEvent.const_422,_loc6_.id,_loc6_.category,_loc6_.roomId,_loc6_.roomCategory);
                        this._container.events.dispatchEvent(_loc5_);
                     }
                  }
               }
               break;
            case RoomWidgetClothingChangeMessage.const_397:
               _loc7_ = param1 as RoomWidgetClothingChangeMessage;
               _loc3_ = this._container.roomEngine.getRoomObject(_loc7_.roomId,_loc7_.roomCategory,_loc7_.objectId,_loc7_.objectCategory);
               if(_loc3_ != null)
               {
                  _loc4_ = _loc3_.getModel();
                  if(_loc4_ != null)
                  {
                     this.var_222 = _loc7_.objectId;
                     _loc9_ = "null";
                     _loc10_ = _loc4_.getString(RoomObjectVariableEnum.const_1195);
                     if(_loc10_ == null)
                     {
                        _loc10_ = const_1394;
                     }
                     if(_loc7_.gender == FigureData.FEMALE)
                     {
                        _loc9_ = "null";
                        _loc10_ = _loc4_.getString(RoomObjectVariableEnum.const_1289);
                        if(_loc10_ == null)
                        {
                           _loc10_ = const_1395;
                        }
                     }
                     if(this._container.avatarEditor.openEditor(_loc7_.window,this,[AvatarEditorFigureCategory.const_266,AvatarEditorFigureCategory.const_913],true))
                     {
                        _loc11_ = 0;
                        this._container.avatarEditor.loadAvatarInEditor(_loc10_,_loc9_,_loc11_);
                        _loc2_ = _loc4_.getString(RoomObjectVariableEnum.const_97);
                        if(_loc2_ == null)
                        {
                           _loc2_ = "";
                        }
                        _loc5_ = new RoomWidgetClothingChangeUpdateEvent(RoomWidgetClothingChangeUpdateEvent.const_422,_loc7_.objectId,_loc7_.objectCategory,_loc7_.roomId,_loc7_.roomCategory);
                        this._container.events.dispatchEvent(_loc5_);
                     }
                  }
               }
               break;
            case RoomWidgetAvatarEditorMessage.const_424:
               _loc5_ = new RoomWidgetClothingChangeUpdateEvent(RoomWidgetClothingChangeUpdateEvent.const_441);
               this._container.events.dispatchEvent(_loc5_);
         }
         return null;
      }
      
      public function update() : void
      {
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function processEvent(param1:Event) : void
      {
      }
      
      public function saveFigure(param1:String, param2:String) : void
      {
         if(this._container == null)
         {
            return;
         }
         this._container.roomSession.sendUpdateClothingChangeFurniture(this.var_222,param2,param1);
         this._container.avatarEditor.close();
      }
   }
}
