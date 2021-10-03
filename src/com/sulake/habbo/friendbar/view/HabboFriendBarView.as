package com.sulake.habbo.friendbar.view
{
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.friendbar.HabboFriendBar;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.data.IHabboFriendBarData;
   import com.sulake.habbo.friendbar.events.FindFriendsNotificationEvent;
   import com.sulake.habbo.friendbar.events.FriendBarUpdateEvent;
   import com.sulake.habbo.friendbar.events.FriendRequestEvent;
   import com.sulake.habbo.friendbar.events.NewMessageEvent;
   import com.sulake.habbo.friendbar.events.NotificationEvent;
   import com.sulake.habbo.friendbar.iid.IIDHabboFriendBarData;
   import com.sulake.habbo.friendbar.view.tabs.AddFriendsTab;
   import com.sulake.habbo.friendbar.view.tabs.FriendEntityTab;
   import com.sulake.habbo.friendbar.view.tabs.ITab;
   import com.sulake.habbo.friendbar.view.tabs.Tab;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.friendbar.view.utils.FriendListIcon;
   import com.sulake.habbo.friendbar.view.utils.Icon;
   import com.sulake.habbo.friendbar.view.utils.MessengerIcon;
   import com.sulake.habbo.friendbar.view.utils.TextCropper;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboAlertDialogFlag;
   import com.sulake.habbo.window.utils.IAlertDialog;
   import com.sulake.iid.IIDAvatarRenderManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import flash.display.BitmapData;
   import flash.events.Event;
   import iid.IIDHabboWindowManager;
   
   public class HabboFriendBarView extends Component implements IHabboFriendBarView, IAvatarImageListener
   {
      
      private static const const_1406:int = 127;
      
      private static const const_458:int = 1;
      
      private static const const_1404:int = 2;
      
      private static const const_656:int = 3;
      
      private static const const_1021:int = 3;
      
      private static const const_1415:Boolean = false;
      
      private static const const_658:int = 3;
      
      private static const const_1413:String = "arrow";
      
      private static const const_1405:String = "left";
      
      private static const const_1410:String = "right";
      
      private static const const_1407:String = "bar_xml";
      
      private static const const_1418:String = "toggle_xml";
      
      private static const const_88:String = "container";
      
      private static const const_1416:String = "wrapper";
      
      private static const const_1402:String = "border";
      
      private static const const_657:String = "list";
      
      private static const const_661:String = "header";
      
      private static const const_662:String = "canvas";
      
      private static const const_1019:String = "icon";
      
      private static const PIECES:String = "pieces";
      
      private static const const_1417:String = "button_left";
      
      private static const const_1411:String = "button_right";
      
      private static const const_1408:String = "button_left_page";
      
      private static const const_1409:String = "button_right_page";
      
      private static const const_1412:String = "button_left_end";
      
      private static const const_1403:String = "button_right_end";
      
      private static const const_1372:String = "button_close";
      
      private static const const_1419:String = "button_open";
      
      private static const const_1414:String = "messenger";
      
      private static const const_1020:String = "friendlist";
       
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_741:IAvatarRenderManager;
      
      private var var_60:IHabboFriendBarData;
      
      private var var_918:IHabboLocalizationManager;
      
      private var var_50:IWindowContainer;
      
      private var var_202:IWindowContainer;
      
      private var var_97:Vector.<ITab>;
      
      private var var_1429:ITab;
      
      private var var_917:int = -1;
      
      private var _startIndex:int = 0;
      
      private var var_1428:TextCropper;
      
      private var var_506:FriendListIcon;
      
      private var var_353:MessengerIcon;
      
      private var var_1430:Boolean = true;
      
      public function HabboFriendBarView(param1:HabboFriendBar, param2:uint, param3:IAssetLibrary)
      {
         super(param1,param2,param3);
         this.var_1428 = new TextCropper();
         this.var_97 = new Vector.<ITab>();
         queueInterface(new IIDAvatarRenderManager(),this.onAvatarRendererAvailable);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerAvailable);
         queueInterface(new IIDHabboFriendBarData(),this.onFriendBarDataAvailable);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationAvailable);
      }
      
      public function setMessengerIconNotify(param1:Boolean) : void
      {
         if(this.var_353)
         {
            this.var_353.notify(param1);
         }
      }
      
      public function setFriendListIconNotify(param1:Boolean) : void
      {
         if(this.var_506)
         {
            this.var_506.notify(param1);
         }
      }
      
      override public function dispose() : void
      {
         if(!disposed)
         {
            if(this.var_353)
            {
               this.var_353.dispose();
               this.var_353 = null;
            }
            if(this.var_506)
            {
               this.var_506.dispose();
               this.var_506 = null;
            }
            if(this.var_202)
            {
               this.var_202.dispose();
               this.var_202 = null;
            }
            if(this.var_50)
            {
               this.var_50.dispose();
               this.var_50 = null;
            }
            while(this.var_97.length > 0)
            {
               ITab(this.var_97.pop()).dispose();
            }
            if(this.var_60)
            {
               if(!this.var_60.disposed)
               {
                  if(this.var_60.events)
                  {
                     this.var_60.events.removeEventListener(FriendBarUpdateEvent.const_794,this.onRefreshView);
                     this.var_60.events.removeEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
                     this.var_60.events.removeEventListener(FriendRequestEvent.const_921,this.onFriendRequestUpdate);
                     this.var_60.events.removeEventListener(NewMessageEvent.const_742,this.onNewInstantMessage);
                     this.var_60.events.removeEventListener(NotificationEvent.const_883,this.onFriendNotification);
                  }
                  this.var_60.release(new IIDHabboFriendBarData());
                  this.var_60 = null;
               }
            }
            if(this._windowManager)
            {
               if(!this._windowManager.disposed)
               {
                  this._windowManager.getWindowContext(const_458).getDesktopWindow().removeEventListener(WindowEvent.const_41,this.onDesktopResized);
                  this._windowManager.release(new IIDHabboWindowManager());
                  this._windowManager = null;
               }
            }
            if(this.var_741)
            {
               if(!this.var_741.disposed)
               {
                  this.var_741.release(new IIDAvatarRenderManager());
                  this.var_741 = null;
               }
            }
            if(this.var_918)
            {
               if(!this.var_918.disposed)
               {
                  this.var_918.release(new IIDHabboLocalizationManager());
                  this.var_918 = null;
               }
            }
            this.var_1428.dispose();
            this.var_1428 = null;
            super.dispose();
         }
      }
      
      public function set visible(param1:Boolean) : void
      {
         if(this.var_50)
         {
            this.var_50.visible = param1;
            this.var_50.activate();
         }
         if(this.var_202)
         {
            this.var_202.visible = !param1;
            if(this.var_50)
            {
               this.var_202.x = this.var_50.x;
               this.var_202.y = this.var_50.y;
               this.var_202.activate();
            }
         }
      }
      
      public function get visible() : Boolean
      {
         return this.var_50 && this.var_50.visible;
      }
      
      public function populate() : void
      {
         var _loc5_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc1_:int = this.var_917;
         this.deSelect(false);
         var _loc2_:IWindowContainer = this.var_50.findChildByName(const_88) as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_657) as IItemListWindow;
         _loc3_.autoArrangeItems = false;
         var _loc4_:int = _loc3_.numListItems;
         _loc5_ = _loc4_;
         while(_loc5_ > 0)
         {
            _loc3_.removeListItemAt(_loc5_ - 1);
            _loc5_--;
         }
         while(this.var_97.length > 0)
         {
            this.var_97.pop().recycle();
         }
         var _loc6_:int = this.var_60.numFriends + (!!this.var_1430 ? 1 : 0);
         var _loc7_:int = Math.min(this.maxNumOfTabsVisible,_loc6_);
         if(this._startIndex + _loc7_ > _loc6_)
         {
            this._startIndex = Math.max(0,this._startIndex - (this._startIndex + _loc7_ - _loc6_));
         }
         _loc4_ = Math.min(this.var_60.numFriends,this._startIndex + _loc7_);
         _loc5_ = this._startIndex;
         while(_loc5_ < _loc4_)
         {
            _loc8_ = this.var_60.getFriendAt(_loc5_);
            _loc9_ = FriendEntityTab.allocate(_loc8_);
            this.var_97.push(_loc9_);
            _loc3_.addListItem(_loc9_.window);
            _loc5_++;
         }
         if(this.var_1430)
         {
            _loc10_ = this.maxNumOfTabsVisible;
            if(this.var_97.length < _loc10_)
            {
               _loc11_ = 1;
               if(this.var_97.length + _loc11_ < const_658)
               {
                  _loc11_ = Math.min(_loc10_ - this.var_97.length,const_658 - this.var_97.length);
               }
               _loc6_ = this.var_60.numFriends + _loc11_;
               while(_loc11_-- > 0)
               {
                  _loc12_ = AddFriendsTab.allocate();
                  _loc3_.addListItem(_loc12_.window);
                  this.var_97.push(_loc12_);
               }
            }
         }
         _loc3_.autoArrangeItems = true;
         if(_loc1_ > -1)
         {
            this.selectFriendEntity(_loc1_);
         }
         _loc2_.visible = this.var_97.length > 0;
         this.toggleArrowButtons(this.var_97.length < _loc6_,this._startIndex != 0,this._startIndex + this.var_97.length < _loc6_);
      }
      
      private function getFriendEntityTabByID(param1:int) : FriendEntityTab
      {
         var _loc2_:* = null;
         var _loc3_:int = this.var_97.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc2_ = this.var_97[_loc4_] as FriendEntityTab;
            if(_loc2_)
            {
               if(_loc2_.friend.id == param1)
               {
                  return _loc2_;
               }
            }
            _loc4_++;
         }
         return null;
      }
      
      private function onFriendBarDataAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_60 = param2 as IHabboFriendBarData;
         this.var_60.events.addEventListener(FriendBarUpdateEvent.const_794,this.onRefreshView);
         this.var_60.events.addEventListener(FindFriendsNotificationEvent.TYPE,this.onFindFriendsNotification);
         this.var_60.events.addEventListener(FriendRequestEvent.const_921,this.onFriendRequestUpdate);
         this.var_60.events.addEventListener(NewMessageEvent.const_742,this.onNewInstantMessage);
         this.var_60.events.addEventListener(NotificationEvent.const_883,this.onFriendNotification);
      }
      
      private function onWindowManagerAvailable(param1:IID, param2:IUnknown) : void
      {
         this._windowManager = param2 as IHabboWindowManager;
      }
      
      private function onLocalizationAvailable(param1:IID, param2:IHabboLocalizationManager) : void
      {
         this.var_918 = param2 as IHabboLocalizationManager;
      }
      
      private function isUserInterfaceReady() : Boolean
      {
         return this.var_50 && !this.var_50.disposed;
      }
      
      private function buildUserInterface() : void
      {
         var _loc2_:* = null;
         Tab.var_1105 = this.var_60;
         Tab.var_1375 = this;
         Tab.ASSETS = assets;
         Tab.WINDOWING = this._windowManager;
         Tab.var_2968 = this.var_918;
         Tab.var_2168 = this.var_1428;
         Token.WINDOWING = this._windowManager;
         Token.ASSETS = assets;
         var _loc1_:IAsset = assets.getAssetByName(const_1407);
         this.var_50 = this._windowManager.buildFromXML(_loc1_.content as XML,const_458) as IWindowContainer;
         this.var_50.x = const_656;
         this.var_50.y = this.var_50.parent.height - (this.var_50.height + const_1404);
         this.var_50.width = this.var_50.parent.width - (const_656 + const_1021);
         this.var_50.setParamFlag(WindowParam.const_252,true);
         this.var_50.procedure = this.barWindowEventProc;
         if(const_1415)
         {
            _loc1_ = assets.getAssetByName(const_1418);
            this.var_202 = this._windowManager.buildFromXML(_loc1_.content as XML,const_458) as IWindowContainer;
            this.var_202.x = this.var_50.x;
            this.var_202.y = this.var_50.y;
            this.var_202.setParamFlag(WindowParam.const_252,true);
            this.var_202.visible = false;
            this.var_202.procedure = this.toggleWindowEventProc;
         }
         _loc2_ = IWindowContainer(this.var_50.findChildByName(const_1020));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_506 = new FriendListIcon(assets,_loc2_.getChildByName(const_1019) as IBitmapWrapperWindow);
         _loc2_ = IWindowContainer(this.var_50.findChildByName(const_1414));
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,this.onIconMouseEvent);
         _loc2_.addEventListener(WindowMouseEvent.const_25,this.onIconMouseEvent);
         this.var_353 = new MessengerIcon(assets,_loc2_.getChildByName(const_1019) as IBitmapWrapperWindow);
         this.var_353.enable(false);
         this.visible = true;
         this._windowManager.getWindowContext(const_458).getDesktopWindow().addEventListener(WindowEvent.const_41,this.onDesktopResized);
      }
      
      private function onAvatarRendererAvailable(param1:IID, param2:IUnknown) : void
      {
         this.var_741 = param2 as IAvatarRenderManager;
      }
      
      public function getAvatarFaceBitmap(param1:String) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(!_loc2_)
         {
            if(this.var_741)
            {
               _loc3_ = this.var_741.createAvatarImage(param1,AvatarScaleType.const_60,null,this);
               if(_loc3_)
               {
                  _loc2_ = _loc3_.getCroppedImage(AvatarSetType.const_53);
                  _loc3_.dispose();
               }
            }
         }
         return _loc2_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         var _loc2_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc3_:IItemListWindow = this.var_50.findChildByName(const_657) as IItemListWindow;
         var _loc4_:int = this.var_60.numFriends;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_)
         {
            _loc2_ = this.var_60.getFriendAt(_loc5_);
            if(_loc2_.figure == param1)
            {
               _loc6_ = this.getAvatarFaceBitmap(_loc2_.figure);
               if(_loc6_)
               {
                  _loc7_ = _loc3_.getListItemByID(_loc2_.id) as IWindowContainer;
                  if(_loc7_)
                  {
                     _loc8_ = _loc7_.getChildByName(PIECES) as IItemListWindow;
                     if(_loc8_)
                     {
                        _loc9_ = IWindowContainer(_loc8_.getListItemByName(const_661));
                        if(_loc9_)
                        {
                           _loc10_ = _loc9_.findChildByName(const_662) as IBitmapWrapperWindow;
                           _loc10_.bitmap = _loc6_;
                           _loc10_.width = _loc6_.width;
                           _loc10_.height = _loc6_.height;
                        }
                     }
                  }
               }
            }
            _loc5_++;
         }
      }
      
      public function faceBookImageReady(param1:BitmapData) : void
      {
      }
      
      private function isFriendSelected(param1:IFriendEntity) : Boolean
      {
         return this.var_917 == param1.id;
      }
      
      public function selectTab(param1:ITab, param2:Boolean) : void
      {
         if(!param1.selected)
         {
            if(this.var_1429)
            {
               this.deSelect(true);
            }
            param1.select(param2);
            this.var_1429 = param1;
            if(param1 is FriendEntityTab)
            {
               this.var_917 = FriendEntityTab(param1).friend.id;
            }
         }
      }
      
      public function selectFriendEntity(param1:int) : void
      {
         if(this.var_917 == param1)
         {
            return;
         }
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1);
         if(_loc2_)
         {
            this.selectTab(_loc2_,false);
            this.var_917 = param1;
         }
      }
      
      public function deSelect(param1:Boolean) : void
      {
         if(this.var_1429)
         {
            this.var_1429.deselect(param1);
            this.var_917 = -1;
         }
      }
      
      private function onRefreshView(param1:Event) : void
      {
         if(!this.isUserInterfaceReady())
         {
            this.buildUserInterface();
         }
         this.resizeAndPopulate(true);
      }
      
      private function onFindFriendsNotification(param1:FindFriendsNotificationEvent) : void
      {
         var event:FindFriendsNotificationEvent = param1;
         var title:String = !!event.success ? "${friendbar.find.success.title}" : "${friendbar.find.error.title}";
         var text:String = !!event.success ? "${friendbar.find.success.text}" : "${friendbar.find.error.text}";
         this._windowManager.notify(title,text,function(param1:IAlertDialog, param2:WindowEvent):void
         {
            param1.dispose();
         },HabboAlertDialogFlag.const_620);
      }
      
      private function onFriendRequestUpdate(param1:FriendRequestEvent) : void
      {
         if(this.var_506)
         {
            this.var_506.notify(this.var_60.numFriendRequests > 0);
         }
      }
      
      private function onNewInstantMessage(param1:NewMessageEvent) : void
      {
         if(this.var_353)
         {
            if(param1.notify)
            {
               this.var_353.notify(true);
            }
            else
            {
               this.var_353.enable(true);
            }
         }
      }
      
      private function onFriendNotification(param1:NotificationEvent) : void
      {
         var _loc2_:FriendEntityTab = this.getFriendEntityTabByID(param1.var_2966);
         if(!_loc2_)
         {
            return;
         }
         _loc2_.addNotificationToken(param1.notification,true);
      }
      
      private function barWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1.type == WindowMouseEvent.const_44)
         {
            _loc3_ = this._startIndex;
            _loc4_ = this.var_60.numFriends + (!!this.var_1430 ? 1 : 0);
            switch(param2.name)
            {
               case const_1417:
                  _loc3_ = Math.max(0,this._startIndex - 1);
                  break;
               case const_1408:
                  _loc3_ = Math.max(0,this._startIndex - this.maxNumOfTabsVisible);
                  break;
               case const_1412:
                  _loc3_ = 0;
                  break;
               case const_1411:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + 1));
                  break;
               case const_1409:
                  _loc3_ = Math.max(0,Math.min(_loc4_ - this.maxNumOfTabsVisible,this._startIndex + this.maxNumOfTabsVisible));
                  break;
               case const_1403:
                  _loc3_ = Math.max(0,_loc4_ - this.maxNumOfTabsVisible);
                  break;
               case const_1372:
                  this.visible = false;
                  break;
               case const_1402:
                  this.deSelect(true);
            }
            if(_loc3_ != this._startIndex)
            {
               this.deSelect(true);
               this._startIndex = _loc3_;
               this.resizeAndPopulate(true);
            }
         }
         if(param1.type == WindowEvent.const_571)
         {
            this.deSelect(true);
         }
      }
      
      private function onIconMouseEvent(param1:WindowMouseEvent) : void
      {
         var _loc2_:Icon = param1.window.name == const_1020 ? this.var_506 : this.var_353;
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(_loc2_ is FriendListIcon)
               {
                  this.var_60.toggleFriendList();
                  _loc2_.notify(false);
               }
               else if(_loc2_ is MessengerIcon)
               {
                  this.var_60.toggleMessenger();
                  _loc2_.notify(false);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               _loc2_.hover(true);
               break;
            case WindowMouseEvent.const_25:
               _loc2_.hover(false);
         }
      }
      
      private function toggleWindowEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         if(this.var_202.visible)
         {
            if(param1.type == WindowMouseEvent.const_44)
            {
               switch(param2.name)
               {
                  case const_1419:
                     this.visible = true;
               }
            }
         }
      }
      
      private function toggleArrowButtons(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:IWindowContainer = this.var_50.findChildByName(const_1416) as IWindowContainer;
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1413,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            _loc4_.visible = param1;
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1405,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param2)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
         _loc5_ = [];
         _loc6_.groupChildrenWithTag(const_1410,_loc5_);
         for each(_loc4_ in _loc5_)
         {
            if(param3)
            {
               _loc4_.enable();
            }
            else
            {
               _loc4_.disable();
            }
         }
      }
      
      private function resizeAndPopulate(param1:Boolean = false) : void
      {
         var _loc2_:int = 0;
         if(!disposed)
         {
            if(this.var_50)
            {
               this.var_50.width = this.var_50.parent.width - (const_656 + const_1021);
               if(!param1)
               {
                  _loc2_ = this.maxNumOfTabsVisible;
                  if(_loc2_ < this.var_97.length)
                  {
                     param1 = true;
                  }
                  else if(_loc2_ > this.var_97.length)
                  {
                     if(this.var_97.length < const_658)
                     {
                        param1 = true;
                     }
                     else if(this.var_97.length < this.var_60.numFriends + (!!this.var_1430 ? 1 : 0))
                     {
                        param1 = true;
                     }
                     else if(this.numFriendEntityTabsVisible < this.var_60.numFriends)
                     {
                        param1 = true;
                     }
                  }
               }
               if(param1)
               {
                  this.populate();
               }
            }
         }
      }
      
      private function get numFriendEntityTabsVisible() : int
      {
         var _loc1_:int = 0;
         var _loc2_:int = this.var_97.length;
         while(_loc2_-- > 0)
         {
            if(this.var_97[_loc2_] is FriendEntityTab)
            {
               _loc1_++;
            }
         }
         return _loc1_;
      }
      
      private function get maxNumOfTabsVisible() : int
      {
         var _loc1_:IWindowContainer = this.var_50.findChildByName(const_88) as IWindowContainer;
         var _loc2_:IWindowContainer = _loc1_.getChildByName("wrapper") as IWindowContainer;
         var _loc3_:IItemListWindow = _loc2_.findChildByName(const_657) as IItemListWindow;
         var _loc4_:int = _loc2_.width - _loc3_.width;
         return (_loc1_.width - _loc4_) / (const_1406 + _loc3_.spacing);
      }
      
      private function onDesktopResized(param1:WindowEvent) : void
      {
         this.resizeAndPopulate(false);
      }
   }
}
