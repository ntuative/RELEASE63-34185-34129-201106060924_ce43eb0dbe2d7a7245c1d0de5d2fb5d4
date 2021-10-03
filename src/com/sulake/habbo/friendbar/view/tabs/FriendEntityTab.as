package com.sulake.habbo.friendbar.view.tabs
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.components.ITextWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.friendbar.data.FriendNotification;
   import com.sulake.habbo.friendbar.data.IFriendEntity;
   import com.sulake.habbo.friendbar.view.tabs.tokens.AchievementToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.MessengerToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.RoomEventToken;
   import com.sulake.habbo.friendbar.view.tabs.tokens.Token;
   import com.sulake.habbo.tracking.HabboTracking;
   import flash.display.BitmapData;
   import flash.utils.getQualifiedClassName;
   
   public class FriendEntityTab extends Tab
   {
      
      private static const const_1422:String = "entity_xml";
      
      private static const const_1421:String = "facebook_piece_xml";
      
      private static const const_1420:String = "controls_piece_xml";
      
      private static const PIECES:String = "pieces";
      
      private static const const_663:String = "icons";
      
      private static const const_661:String = "header";
      
      private static const const_1024:String = "facebook";
      
      private static const const_1025:String = "controls";
      
      private static const const_662:String = "canvas";
      
      private static const const_660:String = "name";
      
      private static const const_1013:String = "btn_message";
      
      private static const const_659:String = "icon_message";
      
      private static const const_1023:String = "btn_visit";
      
      private static const const_1019:String = "icon";
      
      private static const const_488:String = "notification";
      
      private static const const_70:uint = 10338138;
      
      private static const const_1022:uint = 13891476;
      
      private static const POOL:Array = [];
      
      private static const const_459:Array = [];
       
      
      private var var_228:IFriendEntity;
      
      private var var_118:Vector.<Token>;
      
      public function FriendEntityTab()
      {
         super();
      }
      
      public static function allocate(param1:IFriendEntity) : FriendEntityTab
      {
         var _loc3_:* = null;
         var _loc2_:FriendEntityTab = false ? POOL.pop() : new FriendEntityTab();
         _loc2_.var_494 = false;
         _loc2_.friend = param1;
         if(param1.notifications.length > 0)
         {
            for each(_loc3_ in param1.notifications)
            {
               _loc2_.addNotificationToken(_loc3_,false);
            }
         }
         return _loc2_;
      }
      
      private static function purgeEntityPieces(param1:IWindowContainer) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:IItemListWindow = IItemListWindow(param1.getChildByName(PIECES));
         _loc3_ = _loc2_.getListItemByName(const_1024) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         _loc3_ = _loc2_.getListItemByName(const_1025) as IWindowContainer;
         if(_loc3_)
         {
            _loc3_.dispose();
         }
         var _loc4_:* = [];
         _loc2_.groupListItemsWithTag(const_488,_loc4_);
         if(_loc4_.length > 0)
         {
            for each(_loc5_ in _loc4_)
            {
               _loc5_.parent = null;
            }
         }
         param1.height = name_1;
         param1.y = 0;
      }
      
      public function set friend(param1:IFriendEntity) : void
      {
         this.var_228 = param1;
         this.refresh();
      }
      
      public function get friend() : IFriendEntity
      {
         return this.var_228;
      }
      
      override public function recycle() : void
      {
         if(!disposed)
         {
            if(!var_494)
            {
               if(_window)
               {
                  this.releaseEntityWindow(_window);
                  _window = null;
               }
               if(this.var_118)
               {
                  while(this.var_118.length > 0)
                  {
                     this.var_118.pop().dispose();
                  }
                  this.var_118 = null;
               }
               this.var_228 = null;
               var_494 = true;
               POOL.push(this);
            }
         }
      }
      
      override public function select(param1:Boolean) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         if(!selected)
         {
            _loc2_ = IItemListWindow(window.getChildByName(PIECES));
            if(this.friend.realName != null && this.friend.realName != "")
            {
               _loc3_ = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1421).content as XML) as IWindowContainer;
               _loc3_.name = const_1024;
               _loc5_ = _loc3_.getChildByName(const_660) as ITextWindow;
               _loc5_.caption = this.friend.realName;
               if(!_loc5_.wordWrap)
               {
                  var_2168.crop(_loc5_);
               }
               _loc4_ = IBitmapWrapperWindow(_loc3_.getChildByName(const_1019));
               _loc4_.bitmap = ASSETS.getAssetByName(_loc4_.bitmapAssetName).content as BitmapData;
               _loc4_.width = _loc4_.bitmap.width;
               _loc4_.height = _loc4_.bitmap.height;
               _loc2_.addListItem(_loc3_);
            }
            if(this.var_118)
            {
               for each(_loc6_ in this.var_118)
               {
                  _loc2_.addListItem(_loc6_.windowElement);
               }
            }
            if(this.friend.online)
            {
               _loc3_ = WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1420).content as XML) as IWindowContainer;
               _loc3_.name = const_1025;
               _loc7_ = _loc3_.getChildByName(const_1013);
               if(_loc7_)
               {
                  _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               }
               _loc7_ = _loc3_.getChildByName(const_1023);
               if(_loc7_)
               {
                  if(this.friend.allowFollow)
                  {
                     _loc7_.visible = true;
                     _loc7_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
                  }
                  else
                  {
                     _loc7_.visible = false;
                  }
               }
               _loc2_.addListItem(_loc3_);
            }
            window.height = _loc2_.height;
            window.y = name_1 - 0;
            super.select(param1);
            if(param1)
            {
               HabboTracking.getInstance().trackEventLog("FriendBar","","clicked",this.friend.logEventId > 0 ? String(this.friend.logEventId) : "");
               this.friend.logEventId = -1;
            }
         }
      }
      
      override public function deselect(param1:Boolean) : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         if(selected)
         {
            if(_window)
            {
               purgeEntityPieces(_window);
               if(this.var_118)
               {
                  _loc2_ = this.var_118.length - 1;
                  while(_loc2_ > -1)
                  {
                     _loc3_ = this.var_118[_loc2_];
                     if(_loc3_.viewOnce)
                     {
                        this.removeNotificationToken(_loc3_.typeCode,param1);
                     }
                     _loc2_--;
                  }
               }
            }
            super.deselect(param1);
         }
      }
      
      override protected function expose() : void
      {
         super.expose();
         _window.color = !!exposed ? uint(const_1022) : uint(const_70);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      override protected function conceal() : void
      {
         super.conceal();
         _window.color = !!exposed ? uint(const_1022) : uint(const_70);
         ITextWindow(_window.findChildByTag("label")).underline = exposed;
      }
      
      protected function refresh() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         if(!_window)
         {
            _window = this.allocateEntityWindow();
         }
         if(this.var_228)
         {
            _window.id = this.var_228.id;
            _loc1_ = IItemListWindow(_window.getChildByName(PIECES)).getListItemByName(const_661) as IWindowContainer;
            _loc1_.findChildByName(const_660).caption = this.var_228.name;
            var_2168.crop(_loc1_.getChildByName(const_660) as ITextWindow);
            _loc2_ = IBitmapWrapperWindow(_loc1_.findChildByName(const_662));
            _loc2_.bitmap = var_1375.getAvatarFaceBitmap(this.var_228.figure);
            _loc2_.width = _loc2_.bitmap.width;
            _loc2_.height = _loc2_.bitmap.height;
         }
      }
      
      private function allocateEntityWindow() : IWindowContainer
      {
         var _loc1_:IWindowContainer = false ? const_459.pop() : WINDOWING.buildFromXML(ASSETS.getAssetByName(const_1422).content as XML) as IWindowContainer;
         var _loc2_:IBitmapWrapperWindow = IBitmapWrapperWindow(_loc1_.findChildByName(const_662));
         var _loc3_:IRegionWindow = IRegionWindow(_loc1_.findChildByName(const_661));
         var _loc4_:IWindow = _loc1_.findChildByName(const_663);
         _loc1_.x = 0;
         _loc1_.y = 0;
         _loc1_.width = name_5;
         _loc1_.height = name_1;
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc1_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc1_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc3_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc3_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
         _loc4_.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
         _loc4_.addEventListener(WindowMouseEvent.const_25,onMouseOut);
         _loc2_.disposesBitmap = true;
         return _loc1_;
      }
      
      private function releaseEntityWindow(param1:IWindowContainer) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:* = null;
         if(param1 && !param1.disposed)
         {
            param1.procedure = null;
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            param1.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            param1.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc2_ = IRegionWindow(param1.findChildByName(const_661));
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc2_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseOver);
            _loc2_.removeEventListener(WindowMouseEvent.const_25,onMouseOut);
            _loc3_ = param1.findChildByName(const_663);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER,onMouseClick);
            _loc3_.removeEventListener(WindowMouseEvent.const_25,onMouseClick);
            param1.width = name_5;
            param1.height = name_1;
            _loc4_ = IBitmapWrapperWindow(param1.findChildByName(const_662));
            _loc4_.bitmap = null;
            purgeEntityPieces(param1);
            if(const_459.indexOf(param1) == -1)
            {
               const_459.push(param1);
            }
         }
      }
      
      private function onButtonClick(param1:WindowMouseEvent) : void
      {
         if(!disposed && !recycled)
         {
            switch(param1.window.name)
            {
               case const_1013:
               case const_659:
                  this.removeNotificationToken(FriendNotification.const_413,true);
                  if(var_1105 && this.var_228)
                  {
                     var_1105.startConversation(this.var_228.id);
                     this.deselect(true);
                     if(param1.window.name == const_659)
                     {
                        var_1375.setMessengerIconNotify(false);
                     }
                  }
                  break;
               case const_1023:
                  if(var_1105 && this.var_228)
                  {
                     var_1105.followToRoom(this.var_228.id);
                     this.deselect(true);
                  }
            }
         }
      }
      
      public function addNotificationToken(param1:FriendNotification, param2:Boolean) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.removeNotificationToken(param1.typeCode,false);
         if(!this.var_118)
         {
            this.var_118 = new Vector.<Token>();
         }
         var _loc3_:Boolean = selected;
         if(_loc3_)
         {
            _loc5_ = this.var_118;
            this.var_118 = null;
            this.deselect(false);
            this.var_118 = _loc5_;
         }
         switch(param1.typeCode)
         {
            case FriendNotification.const_1319:
               _loc4_ = new RoomEventToken(this.friend,param1,param2);
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
               break;
            case FriendNotification.TYPE_ACHIEVEMENT:
               _loc4_ = new AchievementToken(this.friend,param1,param2,var_2968);
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,onMouseClick);
               break;
            case FriendNotification.const_1284:
               break;
            case FriendNotification.const_413:
               _loc4_ = new MessengerToken(this.friend,param1,param2);
               _loc4_.iconElement.name = const_659;
               _loc4_.iconElement.addEventListener(WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK,this.onButtonClick);
               break;
            default:
               throw new Error("Unknown friend notification type: " + param1.typeCode + "!");
         }
         if(_loc4_)
         {
            this.var_118.push(_loc4_);
            IItemListWindow(_window.findChildByName(const_663)).addListItemAt(_loc4_.iconElement,0);
         }
         if(_loc3_)
         {
            this.select(false);
         }
      }
      
      public function removeNotificationToken(param1:int, param2:Boolean) : void
      {
         var _loc4_:* = null;
         if(!this.var_118)
         {
            return;
         }
         var _loc3_:int = this.var_118.length - 1;
         while(_loc3_ > -1)
         {
            _loc4_ = this.var_118[_loc3_];
            if(_loc4_.typeCode == param1)
            {
               this.var_118.splice(_loc3_,1);
               if(param2)
               {
                  this.var_228.notifications.splice(this.var_228.notifications.indexOf(_loc4_.notification),1);
               }
               _loc4_.dispose();
               return;
            }
            _loc3_--;
         }
      }
      
      public function toString() : String
      {
         return getQualifiedClassName(this) + " " + this.var_228.name;
      }
   }
}
