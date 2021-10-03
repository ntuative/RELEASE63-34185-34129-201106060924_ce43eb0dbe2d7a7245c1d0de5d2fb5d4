package com.sulake.habbo.ui.widget.avatarinfo
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.inventory.events.HabboInventoryEffectsEvent;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.room.events.RoomEngineObjectEvent;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   import com.sulake.habbo.room.object.RoomObjectTypeEnum;
   import com.sulake.habbo.session.HabboClubLevelEnum;
   import com.sulake.habbo.session.IUserData;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.handler.AvatarInfoWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetAvatarInfoEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomEngineUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectNameEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserDataUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetUserLocationUpdateEvent;
   import com.sulake.habbo.ui.widget.memenu.IWidgetAvatarEffect;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetGetUserLocationMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   
   public class AvatarInfoWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_1073:String = "use_minimized_own_avatar_menu";
       
      
      private var var_23:Component;
      
      private var var_181:IHabboConfigurationManager;
      
      private var _view:AvatarInfoView;
      
      private var var_200:Boolean = false;
      
      private var var_1864:Boolean = false;
      
      private var var_233:AvatarInfoData;
      
      private var var_2572:Boolean;
      
      private var var_1866:Boolean;
      
      private var var_1865:int = -1;
      
      private var var_3008:Boolean;
      
      private var var_795:AvatarInfoView;
      
      private var var_797:OwnAvatarMenuView;
      
      private var var_796:AvatarMenuView;
      
      private var var_378:Map;
      
      private var var_2571:Boolean = false;
      
      public function AvatarInfoWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboConfigurationManager, param5:IHabboLocalizationManager, param6:Component)
      {
         super(param1,param2,param3,param5);
         this.var_23 = param6;
         this.var_181 = param4;
         this.var_233 = new AvatarInfoData();
         this.var_2572 = Boolean(this.var_181.getBoolean("menu.avatar.enabled",false));
         this.var_1866 = this.var_181.getBoolean("menu.own_avatar.enabled",false);
         this.var_378 = new Map();
         this.handler.roomEngine.events.addEventListener(RoomEngineObjectEvent.const_176,this.onRoomObjectAdded);
         this.handler.roomEngine.events.addEventListener(RoomEngineObjectEvent.const_434,this.onRoomObjectRemoved);
         this.handler.container.inventory.events.addEventListener(HabboInventoryEffectsEvent.const_381,this.onEffectsChanged);
      }
      
      public function get handler() : AvatarInfoWidgetHandler
      {
         return var_1285 as AvatarInfoWidgetHandler;
      }
      
      public function get configuration() : IHabboConfigurationManager
      {
         return this.var_181;
      }
      
      private function onRoomObjectAdded(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         if(param1.category == RoomObjectCategoryEnum.const_30)
         {
            _loc2_ = this.handler.roomSession.userDataManager.getUserDataByIndex(param1.objectId);
            if(_loc2_)
            {
               if(this.handler.friendList.getFriendNames().indexOf(_loc2_.name) > -1)
               {
                  this.showFriendName(_loc2_,param1.objectId);
               }
            }
         }
      }
      
      private function onRoomObjectRemoved(param1:RoomEngineObjectEvent) : void
      {
         var _loc2_:* = null;
         if(param1.category == RoomObjectCategoryEnum.const_30)
         {
            for each(_loc2_ in this.var_378)
            {
               if(_loc2_.objectId == param1.objectId)
               {
                  this.removeView(_loc2_,false);
               }
            }
         }
      }
      
      private function onEffectsChanged(param1:HabboInventoryEffectsEvent) : void
      {
         if(this._view is OwnAvatarMenuView)
         {
            (this._view as OwnAvatarMenuView).updateButtons();
         }
      }
      
      private function getOwnCharacterInfo() : void
      {
         messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_1002,0,0));
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         for each(_loc1_ in this.var_378)
         {
            _loc1_.dispose();
         }
         this.var_378 = null;
         if(this.var_23)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         if(this.var_795)
         {
            this.var_795.dispose();
            this.var_795 = null;
         }
         if(this.var_796)
         {
            this.var_796.dispose();
            this.var_796 = null;
         }
         if(this.var_797)
         {
            this.var_797.dispose();
            this.var_797 = null;
         }
         if(this._view)
         {
            if(!this._view.disposed)
            {
               this._view.dispose();
               this._view = null;
            }
         }
         this.handler.roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_176,this.onRoomObjectAdded);
         this.handler.roomEngine.events.removeEventListener(RoomEngineObjectEvent.const_434,this.onRoomObjectRemoved);
         this.handler.container.inventory.events.removeEventListener(HabboInventoryEffectsEvent.const_381,this.onEffectsChanged);
         this._view = null;
         this.var_181 = null;
         super.dispose();
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(!param1)
         {
            return;
         }
         param1.addEventListener(RoomWidgetAvatarInfoEvent.const_135,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_153,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_146,this.updateEventHandler);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_318,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.addEventListener(RoomWidgetUserDataUpdateEvent.const_120,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_187,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_100,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomEngineUpdateEvent.const_435,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectNameEvent.const_575,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_998,this.updateEventHandler);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_442,this.updateEventHandler);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetAvatarInfoEvent.const_135,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_110,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_153,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_146,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_318,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.PET_INFO,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetUserDataUpdateEvent.const_120,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_187,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_100,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomEngineUpdateEvent.const_435,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectNameEvent.const_575,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_442,this.updateEventHandler);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_442,this.updateEventHandler);
      }
      
      private function updateEventHandler(param1:RoomWidgetUpdateEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         switch(param1.type)
         {
            case RoomWidgetAvatarInfoEvent.const_135:
               _loc2_ = param1 as RoomWidgetAvatarInfoEvent;
               if(this.var_1866 && _loc2_.allowNameChange)
               {
                  this.useMinimizedOwnAvatarMenu = true;
                  this.selectOwnAvatar();
               }
               else
               {
                  this.updateView(_loc2_.userId,_loc2_.userName,_loc2_.roomIndex,RoomObjectTypeEnum.const_125,_loc2_.allowNameChange,null);
               }
               this.var_200 = true;
               break;
            case RoomWidgetRoomObjectNameEvent.const_575:
               if(RoomWidgetRoomObjectNameEvent(param1).category == RoomObjectCategoryEnum.const_30)
               {
                  this.updateView(RoomWidgetRoomObjectNameEvent(param1).userId,RoomWidgetRoomObjectNameEvent(param1).userName,RoomWidgetRoomObjectNameEvent(param1).roomIndex,RoomObjectTypeEnum.const_125,false,null);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_146:
            case RoomWidgetFurniInfoUpdateEvent.const_318:
               if(this._view)
               {
                  this.removeView(this._view,false);
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_998:
               if(!(this._view is AvatarMenuView || this._view is OwnAvatarMenuView))
               {
                  this.var_1865 = RoomWidgetRoomObjectUpdateEvent(param1).id;
                  messageListener.processWidgetMessage(new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_999,RoomWidgetRoomObjectUpdateEvent(param1).id,RoomWidgetRoomObjectUpdateEvent(param1).category));
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_442:
               if(!(this._view is AvatarMenuView || this._view is OwnAvatarMenuView))
               {
                  if(RoomWidgetRoomObjectUpdateEvent(param1).id == this.var_1865)
                  {
                     if(this._view && !this._view.allowNameChange)
                     {
                        this.removeView(this._view,false);
                        this.var_1865 = -1;
                     }
                  }
               }
               break;
            case RoomWidgetUserInfoUpdateEvent.const_110:
            case RoomWidgetUserInfoUpdateEvent.const_153:
               _loc3_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.storeUserInfo(_loc3_);
               this.updateView(_loc3_.webID,_loc3_.name,_loc3_.userRoomId,RoomObjectTypeEnum.const_125,false,!!_loc3_.isSpectatorMode ? null : this.var_233);
               break;
            case RoomWidgetUserInfoUpdateEvent.BOT:
               _loc4_ = param1 as RoomWidgetUserInfoUpdateEvent;
               this.updateView(_loc4_.webID,_loc4_.name,_loc4_.userRoomId,RoomObjectTypeEnum.const_489,false,null);
               break;
            case RoomWidgetPetInfoUpdateEvent.PET_INFO:
               _loc5_ = param1 as RoomWidgetPetInfoUpdateEvent;
               this.updateView(_loc5_.id,_loc5_.name,_loc5_.roomIndex,RoomObjectTypeEnum.const_224,false,null);
               break;
            case RoomWidgetUserDataUpdateEvent.const_120:
               if(!this.var_200)
               {
                  this.getOwnCharacterInfo();
               }
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_187:
               _loc6_ = param1 as RoomWidgetRoomObjectUpdateEvent;
               if(this._view && this._view.roomIndex == _loc6_.id)
               {
                  this.removeView(this._view,false);
               }
               for each(_loc7_ in this.var_378)
               {
                  if(_loc7_.objectId == _loc6_.id)
                  {
                     this.removeView(_loc7_,false);
                     break;
                  }
               }
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_100:
               this.var_1864 = false;
               break;
            case RoomWidgetRoomEngineUpdateEvent.const_435:
               this.var_1864 = true;
         }
         this.checkUpdateNeed();
      }
      
      private function selectOwnAvatar() : void
      {
         var _loc3_:* = null;
         var _loc1_:int = this.handler.container.sessionDataManager.userId;
         var _loc2_:IUserData = this.handler.roomSession.userDataManager.getUserData(_loc1_);
         _loc3_ = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_346,_loc2_.id,RoomObjectCategoryEnum.const_30);
         this.handler.container.processWidgetMessage(_loc3_);
      }
      
      private function storeUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.var_233.amIAnyRoomController = param1.amIAnyRoomController;
         this.var_233.amIController = param1.amIController;
         this.var_233.amIOwner = param1.amIOwner;
         this.var_233.canBeAskedAsFriend = param1.canBeAskedAsFriend;
         this.var_233.canBeKicked = param1.canBeKicked;
         this.var_233.canTrade = param1.canTrade;
         this.var_233.canTradeReason = param1.canTradeReason;
         this.var_233.hasFlatControl = param1.hasFlatControl;
         this.var_233.isIgnored = param1.isIgnored;
         this.var_233.respectLeft = param1.respectLeft;
         this.var_233.isOwnUser = param1.type == RoomWidgetUserInfoUpdateEvent.const_110;
         this.var_233.allowNameChange = param1.allowNameChange;
      }
      
      private function updateView(param1:int, param2:String, param3:int, param4:int, param5:Boolean, param6:AvatarInfoData) : void
      {
         var _loc8_:* = null;
         var _loc7_:Boolean = false;
         if(param6)
         {
            _loc7_ = !!param6.isOwnUser ? Boolean(this.var_1866) : Boolean(this.var_2572);
         }
         if(_loc7_ && this._view && !(this._view is AvatarMenuView || this._view is OwnAvatarMenuView))
         {
            this.removeView(this._view,false);
         }
         if(this._view == null || this._view.userId != param1 || this._view.userName != param2 || this._view.roomIndex != param3 || this._view.userType != param4 || param5)
         {
            if(this._view)
            {
               this.removeView(this._view,false);
            }
            if(!this.var_1864)
            {
               if(_loc7_)
               {
                  if(param6.isOwnUser)
                  {
                     if(!this.var_797)
                     {
                        this.var_797 = new OwnAvatarMenuView(this);
                     }
                     this._view = this.var_797;
                     OwnAvatarMenuView.setup(this._view as OwnAvatarMenuView,param1,param2,param3,param4,param6);
                  }
                  else
                  {
                     if(!this.var_796)
                     {
                        this.var_796 = new AvatarMenuView(this);
                     }
                     this._view = this.var_796;
                     AvatarMenuView.setup(this._view as AvatarMenuView,param1,param2,param3,param4,param6);
                     for each(_loc8_ in this.var_378)
                     {
                        if(_loc8_.userId == param1)
                        {
                           this.removeView(_loc8_,false);
                           break;
                        }
                     }
                  }
               }
               else
               {
                  if(!this.var_795)
                  {
                     this.var_795 = new AvatarInfoView(this);
                  }
                  this._view = this.var_795;
                  AvatarInfoView.setup(this._view,param1,param2,param3,param4,param5);
               }
            }
         }
         else if(this._view is AvatarMenuView)
         {
            if(this._view.userName == param2)
            {
               this.removeView(this._view,false);
            }
         }
      }
      
      public function removeView(param1:AvatarInfoView, param2:Boolean) : void
      {
         if(param1)
         {
            if(this.var_3008)
            {
               param1.hide(param2);
            }
            else
            {
               param1.dispose();
               this.var_795 = null;
               this.var_796 = null;
               this.var_797 = null;
            }
            if(param1 == this._view)
            {
               this._view = null;
            }
            if(param1 is FriendNameView)
            {
               this.var_378.remove(param1.userName);
               param1.dispose();
               this.checkUpdateNeed();
            }
         }
      }
      
      private function showFriendName(param1:IUserData, param2:int) : void
      {
         var _loc3_:* = null;
         if(this.var_378[param1.name] == null)
         {
            _loc3_ = new FriendNameView(this);
            FriendNameView.setup(_loc3_,param1.webID,param1.name,-1,RoomObjectTypeEnum.const_125,param2);
            this.var_378[param1.name] = _loc3_;
            this.checkUpdateNeed();
         }
      }
      
      public function checkUpdateNeed() : void
      {
         if(!this.var_23)
         {
            return;
         }
         if(this._view || this.var_378.length > 0)
         {
            this.var_23.registerUpdateReceiver(this,10);
         }
         else
         {
            this.var_23.removeUpdateReceiver(this);
         }
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._view)
         {
            _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(this._view.userId,this._view.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(!_loc2_)
            {
               return;
            }
            this._view.update(_loc2_.rectangle,_loc2_.screenLocation,param1);
         }
         for each(_loc3_ in this.var_378)
         {
            _loc2_ = messageListener.processWidgetMessage(new RoomWidgetGetUserLocationMessage(_loc3_.userId,_loc3_.userType)) as RoomWidgetUserLocationUpdateEvent;
            if(_loc2_)
            {
               _loc3_.update(_loc2_.rectangle,_loc2_.screenLocation,param1);
            }
         }
      }
      
      public function openAvatarInfo() : void
      {
         this.handler.container.avatarEditor.openEditor();
      }
      
      public function get hasClub() : Boolean
      {
         return this.handler.container.sessionDataManager.hasUserRight(null,HabboClubLevelEnum.const_37);
      }
      
      public function get hasEffectOn() : Boolean
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.handler.container.inventory.getActivatedAvatarEffects();
         for each(_loc2_ in _loc1_)
         {
            if(_loc2_.isInUse)
            {
               return true;
            }
         }
         return false;
      }
      
      public function set isDancing(param1:Boolean) : void
      {
         this.var_2571 = param1;
      }
      
      public function get isDancing() : Boolean
      {
         return this.var_2571;
      }
      
      public function get useMinimizedOwnAvatarMenu() : Boolean
      {
         return this.handler.container.config.getBoolean(const_1073,true);
      }
      
      public function set useMinimizedOwnAvatarMenu(param1:Boolean) : void
      {
         this.handler.container.config.setKey(const_1073,!!param1 ? "1" : "0");
      }
   }
}
