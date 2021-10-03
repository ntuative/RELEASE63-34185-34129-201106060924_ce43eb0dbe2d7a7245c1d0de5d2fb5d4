package com.sulake.habbo.ui.widget.roomchat
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IUpdateReceiver;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IItemListWindow;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.quest.IHabboQuestEngine;
   import com.sulake.habbo.ui.IRoomWidgetHandler;
   import com.sulake.habbo.ui.widget.RoomWidgetBase;
   import com.sulake.habbo.ui.widget.events.RoomWidgetChatUpdateEvent;
   import com.sulake.habbo.ui.widget.events.RoomWidgetRoomViewUpdateEvent;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetChatSelectAvatarMessage;
   import com.sulake.habbo.ui.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.getTimer;
   
   public class RoomChatWidget extends RoomWidgetBase implements IUpdateReceiver
   {
      
      private static const const_119:int = 18;
      
      private static const const_1580:int = 9;
      
      private static const const_1101:int = 10;
      
      private static const const_683:int = 25;
      
      private static const const_1579:int = 25;
      
      private static const const_1103:int = 4000;
      
      private static const const_1583:int = 6000;
      
      private static const const_1581:int = 3;
      
      private static const const_1582:int = 1;
      
      private static const const_684:int = 8;
      
      private static const const_468:int = 0;
      
      private static const const_1102:int = (const_684 + const_468) * const_119 + const_119;
      
      private static const const_467:int = 9;
      
      private static const const_1584:int = 200;
      
      private static const const_1585:int = 40;
       
      
      private var var_1295:int = 0;
      
      private var var_1052:int = 0;
      
      private var var_42:IWindowContainer;
      
      private var var_401:IItemListWindow;
      
      private var var_129:IWindowContainer;
      
      private var _itemList:Array;
      
      private var var_76:Array;
      
      private var var_284:Array;
      
      private var var_2757:int;
      
      private var var_2756:int = 0;
      
      private var var_843:Number = 1;
      
      private var _baseUrl:String;
      
      private var var_1053:Number = 1;
      
      private var var_1996:Number = 0;
      
      private var var_844:Point;
      
      private var var_29:RoomChatHistoryViewer;
      
      private var var_945:Boolean = false;
      
      private var var_1997:Boolean = false;
      
      private var var_23:Component = null;
      
      private var _questEngine:IHabboQuestEngine;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_2754:int = 150;
      
      private var var_242:int = 171.0;
      
      private var var_1054:int = 18;
      
      private var var_3018:int = 100;
      
      private var var_2755:int = 0;
      
      public function RoomChatWidget(param1:IRoomWidgetHandler, param2:IHabboWindowManager, param3:IAssetLibrary, param4:IHabboLocalizationManager, param5:IHabboConfigurationManager, param6:int, param7:Component, param8:IHabboQuestEngine)
      {
         this._itemList = new Array();
         this.var_76 = new Array();
         this.var_284 = new Array();
         this.var_844 = new Point();
         super(param1,param2,param3,param4);
         this._questEngine = param8;
         this._config = param5;
         this.var_2757 = param6;
         this.var_42 = param2.createWindow("chat_container","",HabboWindowType.const_88,HabboWindowStyle.const_32,HabboWindowParam.const_48,new Rectangle(0,0,200,this.var_242 + RoomChatHistoryPulldown.const_90),null,0) as IWindowContainer;
         this.var_42.background = true;
         this.var_42.color = 33554431;
         this.var_42.tags.push("room_widget_chat");
         this.var_401 = param2.createWindow("chat_contentlist","",HabboWindowType.const_1358,HabboWindowStyle.const_48,0 | 0,new Rectangle(0,0,200,this.var_242),null,0) as IItemListWindow;
         this.var_42.addChild(this.var_401);
         this.var_129 = param2.createWindow("chat_active_content","",HabboWindowType.const_88,HabboWindowStyle.const_48,HabboWindowParam.const_68,new Rectangle(0,0,200,this.var_242),null,0) as IWindowContainer;
         this.var_129.clipping = false;
         this.var_401.addListItem(this.var_129);
         this.var_29 = new RoomChatHistoryViewer(this,param2,this.var_42,param3);
         this._baseUrl = param5.getKey("site.url");
         this.var_2754 = int(param5.getKey("chat.history.item.max.count","150"));
         var _loc9_:Boolean = param5.getBoolean("chat.history.disabled",false);
         if(this.var_29 != null)
         {
            this.var_29.disabled = _loc9_;
         }
         if(param7 != null)
         {
            this.var_23 = param7;
            this.var_23.registerUpdateReceiver(this,1);
         }
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.var_42;
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(disposed)
         {
            return;
         }
         while(this.var_284.length > 0)
         {
            _loc1_ = this.var_284.shift();
         }
         this.var_29.dispose();
         this.var_29 = null;
         while(this._itemList.length > 0)
         {
            _loc1_ = this._itemList.shift();
            _loc1_.dispose();
         }
         while(this.var_76.length > 0)
         {
            _loc1_ = this.var_76.shift();
            _loc1_.dispose();
         }
         this.var_42.dispose();
         if(this.var_23 != null)
         {
            this.var_23.removeUpdateReceiver(this);
            this.var_23 = null;
         }
         this._questEngine = null;
         super.dispose();
      }
      
      public function update(param1:uint) : void
      {
         var _loc2_:int = 0;
         if(getTimer() > this.var_1295 && this.var_1295 > 0)
         {
            this.var_1295 = -1;
            this.animationStart();
         }
         if(this.var_945)
         {
            _loc2_ = param1 / const_1579 * const_1581;
            if(_loc2_ + this.var_1052 > this.var_1054)
            {
               _loc2_ = this.var_1054 - this.var_1052;
            }
            if(_loc2_ > 0)
            {
               this.moveItemsUp(_loc2_);
               this.var_1052 += _loc2_;
            }
            if(this.var_1052 >= this.var_1054)
            {
               this.var_1054 = const_119;
               this.var_1052 = 0;
               this.animationStop();
               this.processBuffer();
               this.var_1295 = getTimer() + const_1103;
            }
         }
         if(this.var_29 != null)
         {
            this.var_29.update(param1);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetChatUpdateEvent.const_1000,this.onChatMessage);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_479,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_917,this.onRoomViewUpdate);
         param1.addEventListener(RoomWidgetRoomViewUpdateEvent.const_967,this.onRoomViewUpdate);
         super.registerUpdateEvents(param1);
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetChatUpdateEvent.const_1000,this.onChatMessage);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_479,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_917,this.onRoomViewUpdate);
         param1.removeEventListener(RoomWidgetRoomViewUpdateEvent.const_967,this.onRoomViewUpdate);
      }
      
      private function onChatMessage(param1:RoomWidgetChatUpdateEvent) : void
      {
         var _loc2_:RoomChatItem = new RoomChatItem(this,windowManager,assets,this.getFreeItemId(),localizations,this._baseUrl);
         _loc2_.define(param1);
         if(this.var_1053 != 1)
         {
            _loc2_.senderX /= this.var_1053;
         }
         _loc2_.senderX -= this.var_844.x;
         this.setChatItemLocHorizontal(_loc2_);
         this.var_76.push(_loc2_);
         this.processBuffer();
      }
      
      private function onRoomViewUpdate(param1:RoomWidgetRoomViewUpdateEvent) : void
      {
         var _loc2_:Rectangle = param1.rect;
         if(param1.scale > 0)
         {
            if(this.var_1996 == 0)
            {
               this.var_1996 = param1.scale;
            }
            else
            {
               this.var_1053 = param1.scale / this.var_1996;
            }
         }
         if(param1.positionDelta != null)
         {
            this.var_844.x += param1.positionDelta.x / this.var_1053;
            this.var_844.y += param1.positionDelta.y / this.var_1053;
         }
         if(param1.rect != null)
         {
            if(this.var_29 == null)
            {
               return;
            }
            this.var_42.width = _loc2_.width;
            this.var_42.height = this.var_242 + this.var_29.pulldownBarHeight;
            this.var_401.width = this.var_42.width - this.var_29.scrollbarWidth;
            this.var_401.height = this.var_242;
            this.var_401.x = this.var_42.x;
            this.var_401.y = this.var_42.y;
            this.var_129.width = this.var_42.width - this.var_29.scrollbarWidth;
            this.var_129.height = this.var_242;
            if(this.historyViewerActive())
            {
               this.reAlignItemsToHistoryContent();
            }
            this.var_29.containerResized(this.var_42.rectangle,true);
         }
         this.alignItems();
      }
      
      private function processBuffer() : void
      {
         if(this.var_945)
         {
            return;
         }
         if(this.var_76.length == 0)
         {
            return;
         }
         while(this.var_76.length > const_1582 || this.historyViewerActive() && this.var_76.length > 0)
         {
            this.activateItemFromBuffer();
         }
         var _loc1_:Boolean = false;
         if(this._itemList.length == 0)
         {
            _loc1_ = true;
         }
         else
         {
            _loc1_ = this.checkLastItemAllowsAdding(this.var_76[0]);
         }
         if(_loc1_)
         {
            this.activateItemFromBuffer();
            this.var_1295 = getTimer() + const_1103;
         }
         else
         {
            if(this._itemList.length > 0 && this.var_76.length > 0)
            {
               this.var_1054 = this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_76[0]);
            }
            else
            {
               this.var_1054 = const_119;
            }
            this.animationStart();
         }
      }
      
      private function activateItemFromBuffer() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:int = 0;
         if(this.var_76.length == 0)
         {
            return;
         }
         if(this.historyViewerMinimized())
         {
            this.resetArea();
            this.hideHistoryViewer();
         }
         if(!this.checkLastItemAllowsAdding(this.var_76[0]))
         {
            this.selectItemsToMove();
            this.moveItemsUp(this.getItemSpacing(this._itemList[this._itemList.length - 1],this.var_76[0]));
            if(!this.checkLastItemAllowsAdding(this.var_76[0]))
            {
               this.var_129.height += const_119;
               if(this.var_29 != null)
               {
                  this.var_29.containerResized(this.var_42.rectangle);
               }
            }
         }
         _loc1_ = this.var_76.shift();
         if(_loc1_ != null)
         {
            _loc1_.renderView();
            _loc2_ = _loc1_.view;
            if(_loc2_ != null)
            {
               this.var_129.addChild(_loc2_);
               _loc1_.timeStamp = new Date().time;
               this._itemList.push(_loc1_);
               _loc3_ = 0;
               if(this._itemList.length > 1)
               {
                  _loc3_ = this._itemList[this._itemList.length - 2].screenLevel;
                  if(this.historyViewerActive())
                  {
                     _loc1_.screenLevel = _loc3_ + 1;
                  }
                  else
                  {
                     _loc1_.screenLevel = _loc3_ + Math.max(this.var_843,1);
                  }
               }
               else
               {
                  _loc1_.screenLevel = 100;
               }
               _loc1_.aboveLevels = this.var_843;
               if(_loc1_.aboveLevels > const_684 + const_468 + 2)
               {
                  _loc1_.aboveLevels = const_684 + const_468 + 2;
               }
               this.var_843 = 0;
               this.setChatItemLocHorizontal(_loc1_);
               this.setChatItemLocVertical(_loc1_);
               this.setChatItemRenderable(_loc1_);
            }
         }
      }
      
      private function checkLastItemAllowsAdding(param1:RoomChatItem) : Boolean
      {
         if(this._itemList.length == 0)
         {
            return true;
         }
         var _loc2_:RoomChatItem = this._itemList[this._itemList.length - 1];
         if(param1 == null || _loc2_ == null)
         {
            return false;
         }
         if(_loc2_.view == null)
         {
            return true;
         }
         if(this.var_129.rectangle.bottom - (this.var_129.y + _loc2_.y + _loc2_.height) <= this.getItemSpacing(_loc2_,param1))
         {
            return false;
         }
         return true;
      }
      
      private function alignItems() : void
      {
         var _loc1_:int = 0;
         var _loc2_:* = null;
         if(this.var_29 == null)
         {
            return;
         }
         _loc1_ = this._itemList.length - 1;
         while(_loc1_ >= 0)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
               this.setChatItemLocVertical(_loc2_);
            }
            _loc1_--;
         }
         _loc1_ = 0;
         while(_loc1_ < this._itemList.length)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemRenderable(_loc2_);
            }
            _loc1_++;
         }
         _loc1_ = 0;
         while(_loc1_ < this.var_76.length)
         {
            _loc2_ = this.var_76[_loc1_];
            if(_loc2_ != null)
            {
               this.setChatItemLocHorizontal(_loc2_);
            }
            _loc1_++;
         }
      }
      
      private function animationStart() : void
      {
         if(this.var_945)
         {
            return;
         }
         this.selectItemsToMove();
         this.var_945 = true;
      }
      
      private function animationStop() : void
      {
         this.var_945 = false;
      }
      
      private function selectItemsToMove() : void
      {
         var _loc4_:* = null;
         if(this.var_945)
         {
            return;
         }
         this.purgeItems();
         this.var_284 = new Array();
         var _loc1_:int = new Date().time;
         var _loc2_:int = 0;
         if(this._itemList.length == 0)
         {
            this.var_843 = 1;
            return;
         }
         if(this.historyViewerActive())
         {
            return;
         }
         ++this.var_843;
         var _loc3_:int = this._itemList.length - 1;
         while(_loc3_ >= 0)
         {
            _loc4_ = this._itemList[_loc3_];
            if(_loc4_.view != null)
            {
               if(_loc4_.screenLevel > const_468 || _loc4_.screenLevel == _loc2_ - 1 || _loc1_ - _loc4_.timeStamp >= const_1583)
               {
                  _loc4_.timeStamp = _loc1_;
                  _loc2_ = _loc4_.screenLevel;
                  --_loc4_.screenLevel;
                  this.var_284.push(_loc4_);
               }
            }
            _loc3_--;
         }
      }
      
      private function moveItemsUp(param1:int) : void
      {
         var _loc3_:Boolean = false;
         if(this.var_284 == null)
         {
            return;
         }
         if(this.var_284.length == 0)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc4_:int = -1;
         var _loc5_:int = this.var_284.length - 1;
         while(_loc5_ >= 0)
         {
            _loc2_ = this.var_284[_loc5_];
            if(_loc2_ != null)
            {
               if(_loc4_ == -1)
               {
                  _loc4_ = this._itemList.indexOf(_loc2_);
               }
               else
               {
                  _loc4_++;
               }
               _loc3_ = true;
               if(this.historyViewerActive())
               {
                  if(_loc2_.y - param1 + _loc2_.height < 0)
                  {
                     _loc3_ = false;
                  }
               }
               if(_loc4_ > 0)
               {
                  if(this._itemList[_loc4_ - 1].view != null)
                  {
                     if(_loc2_.y - param1 - this._itemList[_loc4_ - 1].y < this.getItemSpacing(this._itemList[_loc4_ - 1],_loc2_))
                     {
                        _loc3_ = false;
                     }
                  }
               }
               if(_loc3_)
               {
                  _loc2_.y -= param1;
               }
            }
            _loc5_--;
         }
      }
      
      private function setChatItemLocHorizontal(param1:RoomChatItem) : void
      {
         var _loc9_:Number = NaN;
         var _loc10_:Number = NaN;
         if(param1 == null || this.var_29 == null)
         {
            return;
         }
         if(this._questEngine)
         {
            this.var_2755 = !!this._questEngine.isTrackerVisible() ? int(const_1584) : 0;
         }
         var _loc2_:Number = (param1.senderX + this.var_844.x) * this.var_1053;
         var _loc3_:Number = _loc2_ - param1.width / 2;
         var _loc4_:Number = _loc3_ + param1.width;
         var _loc5_:Number = -this.var_42.width / 2 - const_1101 + this.var_3018;
         var _loc6_:Number = this.var_42.width / 2 + const_1101 - this.var_29.scrollbarWidth - this.var_2755;
         var _loc7_:Boolean = _loc3_ >= _loc5_ && _loc3_ <= _loc6_;
         var _loc8_:Boolean = _loc4_ >= _loc5_ && _loc4_ <= _loc6_;
         if(_loc7_ && _loc8_)
         {
            _loc9_ = _loc3_;
            _loc10_ = _loc9_;
         }
         else if(_loc2_ >= 0)
         {
            _loc9_ = _loc6_ - param1.width;
         }
         else
         {
            _loc9_ = _loc5_;
         }
         param1.x = _loc9_ + this.var_42.width / 2 + this.var_42.x;
         if(_loc2_ < _loc5_ || _loc2_ > _loc6_)
         {
            param1.hidePointer();
         }
         else
         {
            param1.setPointerOffset(_loc3_ - _loc9_);
         }
      }
      
      private function setChatItemLocVertical(param1:RoomChatItem) : void
      {
         var _loc2_:int = 0;
         var _loc3_:Number = NaN;
         var _loc4_:Number = NaN;
         if(param1 != null)
         {
            _loc2_ = this._itemList.indexOf(param1);
            _loc3_ = !!this.historyViewerActive() ? 0 : Number(this.var_843);
            if(_loc2_ == this._itemList.length - 1)
            {
               param1.y = this.getAreaBottom() - (_loc3_ + 1) * const_119 - const_467;
            }
            else
            {
               _loc4_ = this._itemList[_loc2_ + 1].aboveLevels;
               if(_loc4_ < 2)
               {
                  param1.y = this._itemList[_loc2_ + 1].y - this.getItemSpacing(param1,this._itemList[_loc2_ + 1]);
               }
               else
               {
                  param1.y = this._itemList[_loc2_ + 1].y - _loc4_ * const_119;
               }
            }
         }
      }
      
      private function setChatItemRenderable(param1:RoomChatItem) : void
      {
         if(param1 != null)
         {
            if(param1.y < -const_683)
            {
               if(param1.view != null)
               {
                  this.var_129.removeChild(param1.view);
                  param1.hideView();
               }
            }
            else if(param1.view == null)
            {
               param1.renderView();
               if(param1.view != null)
               {
                  this.var_129.addChild(param1.view);
               }
            }
         }
      }
      
      public function getTotalContentHeight() : int
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         while(_loc3_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc3_];
            if(_loc1_ != null)
            {
               if(_loc3_ == 0)
               {
                  _loc2_ += const_119;
               }
               else
               {
                  _loc2_ += this.getItemSpacing(this._itemList[_loc3_ - 1],_loc1_);
               }
               _loc2_ += (_loc1_.aboveLevels - 1) * const_119;
            }
            _loc3_++;
         }
         return _loc2_;
      }
      
      private function getAreaBottom() : Number
      {
         if(this.historyViewerActive())
         {
            return this.var_129.height;
         }
         return this.var_242 + this.var_42.y;
      }
      
      private function getItemSpacing(param1:RoomChatItem, param2:RoomChatItem) : Number
      {
         if(param1.checkOverlap(param2.x,param1.y,param2.width,param2.height))
         {
            return const_119;
         }
         return const_1580;
      }
      
      private function purgeItems() : void
      {
         var _loc2_:* = null;
         if(this.historyViewerActive())
         {
            return;
         }
         var _loc1_:int = 0;
         var _loc3_:int = 0;
         while(this._itemList.length > this.var_2754)
         {
            _loc2_ = this._itemList.shift();
            _loc3_ = this.var_284.indexOf(_loc2_);
            if(_loc3_ > -1)
            {
               this.var_284.splice(_loc3_,1);
            }
            if(_loc2_.view != null)
            {
               this.var_129.removeChild(_loc2_.view);
               _loc2_.hideView();
            }
            _loc2_.dispose();
            _loc2_ = null;
         }
         var _loc4_:Boolean = false;
         _loc1_ = 0;
         for(; _loc1_ < this._itemList.length; _loc1_++)
         {
            _loc2_ = this._itemList[_loc1_];
            if(_loc2_ != null)
            {
               if(_loc2_.y > -const_683)
               {
                  _loc4_ = true;
               }
               _loc2_.aboveLevels = 1;
               if(_loc2_.view != null)
               {
                  _loc3_ = this.var_284.indexOf(_loc2_);
                  if(_loc3_ > -1)
                  {
                     this.var_284.splice(_loc3_,1);
                  }
                  this.var_129.removeChild(_loc2_.view);
                  _loc2_.hideView();
               }
               continue;
               break;
            }
         }
         if(this.var_76.length > 0)
         {
            _loc4_ = true;
         }
         if(this.getTotalContentHeight() > const_119 && !_loc4_ && !this.historyViewerActive())
         {
            if(this.var_29 != null)
            {
               this.stretchAreaBottomTo(this.var_42.y);
               this.alignItems();
               if(!this.historyViewerActive())
               {
                  this.var_29.showHistoryViewer();
               }
               if(!this.historyViewerVisible())
               {
                  this.var_29.visible = true;
               }
            }
         }
         else if(this.historyViewerVisible())
         {
            this.var_29.visible = false;
         }
      }
      
      private function getFreeItemId() : String
      {
         return "chat_" + this.var_2757.toString() + "_item_" + (this.var_2756++).toString();
      }
      
      public function onItemMouseClick(param1:int, param2:String, param3:int, param4:int, param5:int, param6:WindowMouseEvent) : void
      {
         if(param6.shiftKey)
         {
            if(this.var_29 != null)
            {
               this.var_29.toggleHistoryViewer();
            }
            return;
         }
         var _loc7_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_514,param1,param3);
         messageListener.processWidgetMessage(_loc7_);
         var _loc8_:RoomWidgetChatSelectAvatarMessage = new RoomWidgetChatSelectAvatarMessage(RoomWidgetChatSelectAvatarMessage.const_723,param1,param2,param4,param5);
         messageListener.processWidgetMessage(_loc8_);
      }
      
      public function onItemMouseDown(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
         if(this.historyViewerVisible())
         {
            return;
         }
         if(this.var_29 != null)
         {
            this.var_29.beginDrag(param5.stageY);
         }
      }
      
      public function onItemMouseOver(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onItemMouseOut(param1:int, param2:int, param3:int, param4:int, param5:WindowMouseEvent) : void
      {
      }
      
      public function onPulldownMouseDown(param1:WindowMouseEvent) : void
      {
         if(this.var_29 != null)
         {
            this.var_29.beginDrag(param1.stageY,true);
         }
      }
      
      public function onPulldownCloseButtonClicked(param1:WindowMouseEvent) : void
      {
         if(this.var_29 != null)
         {
            this.var_29.hideHistoryViewer();
         }
      }
      
      public function stretchAreaBottomBy(param1:Number) : void
      {
         var _loc2_:Number = this.var_42.rectangle.bottom + param1 - 0;
         this.stretchAreaBottomTo(_loc2_);
      }
      
      public function stretchAreaBottomTo(param1:Number) : void
      {
         var _loc2_:int = this.var_42.context.getDesktopWindow().height - 0 - const_1585;
         param1 = Math.min(param1,_loc2_);
         this.var_242 = param1 - this.var_42.y;
         this.var_42.height = this.var_242 + RoomChatHistoryPulldown.const_90;
         if(this.var_29 != null)
         {
            this.var_29.containerResized(this.var_42.rectangle);
         }
      }
      
      public function resetArea() : void
      {
         if(this.var_29 == null)
         {
            return;
         }
         this.animationStop();
         this.var_242 = const_1102 + const_467;
         this.var_42.height = this.var_242 + this.var_29.pulldownBarHeight;
         this.var_401.width = this.var_42.width - this.var_29.scrollbarWidth;
         this.var_401.height = this.var_242;
         this.var_129.width = this.var_42.width - this.var_29.scrollbarWidth;
         if(this.historyViewerActive())
         {
            this.var_129.height = this.getTotalContentHeight() + const_467;
         }
         else
         {
            this.var_129.height = this.var_242;
         }
         this.var_401.scrollV = 1;
         if(!this.historyViewerActive())
         {
            this.var_29.containerResized(this.var_42.rectangle);
         }
         this.purgeItems();
         this.alignItems();
      }
      
      private function historyViewerActive() : Boolean
      {
         return this.var_29 == null ? false : Boolean(this.var_29.active);
      }
      
      private function historyViewerVisible() : Boolean
      {
         return this.var_29 == null ? false : Boolean(this.var_29.visible);
      }
      
      public function hideHistoryViewer() : void
      {
         if(this.var_29 != null)
         {
            this.var_29.hideHistoryViewer();
         }
      }
      
      private function historyViewerMinimized() : Boolean
      {
         return this.var_401.height <= 1;
      }
      
      public function resizeContainerToLowestItem() : void
      {
         var _loc4_:* = null;
         var _loc1_:int = 0;
         var _loc2_:int = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_76.length)
         {
            _loc4_ = this.var_76[_loc2_];
            if(_loc4_.y > _loc1_)
            {
               _loc1_ = _loc4_.y;
            }
            _loc2_++;
         }
         _loc1_ += const_683;
         _loc1_ = _loc1_ < 0 ? 0 : int(_loc1_);
         var _loc3_:int = this.var_42.rectangle.bottom;
         this.stretchAreaBottomTo(this.var_42.rectangle.top + _loc1_);
         _loc3_ -= this.var_42.rectangle.bottom;
         if(Math.abs(_loc3_) < RoomChatHistoryViewer.const_1302)
         {
            this.resetArea();
            return;
         }
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc4_ = this._itemList[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_76.length)
         {
            _loc4_ = this.var_76[_loc2_];
            _loc4_.y += _loc3_;
            _loc2_++;
         }
         this.var_1997 = true;
      }
      
      public function mouseUp() : void
      {
         var _loc1_:Number = this.var_42.rectangle.bottom - 0;
         if(_loc1_ < const_1102)
         {
            if(_loc1_ <= this.var_242 + this.var_42.y)
            {
               if(this.historyViewerActive())
               {
                  this.hideHistoryViewer();
               }
               this.resetArea();
               return;
            }
         }
         if(this.var_1997 && !this.historyViewerActive())
         {
            this.resetArea();
            this.var_1997 = false;
         }
      }
      
      public function reAlignItemsToHistoryContent() : void
      {
         if(this.historyViewerActive())
         {
            this.var_129.height = this.getTotalContentHeight() + const_467;
            this.alignItems();
         }
      }
      
      public function enableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_76.length)
         {
            _loc1_ = this.var_76[_loc2_];
            _loc1_.enableTooltip();
            _loc2_++;
         }
      }
      
      public function disableDragTooltips() : void
      {
         var _loc2_:int = 0;
         var _loc1_:* = null;
         _loc2_ = 0;
         while(_loc2_ < this._itemList.length)
         {
            _loc1_ = this._itemList[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_76.length)
         {
            _loc1_ = this.var_76[_loc2_];
            _loc1_.disableTooltip();
            _loc2_++;
         }
      }
   }
}
