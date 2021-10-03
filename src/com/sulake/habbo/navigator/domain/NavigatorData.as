package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_2009:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_210:MsgWithRequestId;
      
      private var var_648:RoomEventData;
      
      private var var_2575:Boolean;
      
      private var var_2579:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      private var var_2582:int;
      
      private var var_268:GuestRoomData;
      
      private var var_983:PublicRoomShortData;
      
      private var var_2584:int;
      
      private var var_2576:Boolean;
      
      private var var_2581:int;
      
      private var var_2586:Boolean;
      
      private var var_1871:int;
      
      private var var_2580:Boolean;
      
      private var var_1521:Array;
      
      private var var_1523:Array;
      
      private var var_2583:int;
      
      private var var_1522:int;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1221:Boolean;
      
      private var var_2577:int;
      
      private var var_2585:Boolean;
      
      private var var_2578:int = 0;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1521 = new Array();
         this.var_1523 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_268 != null && !this._currentRoomOwner;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_268 != null && this._currentRoomOwner;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_983 = null;
         this.var_268 = null;
         this._currentRoomOwner = false;
         if(param1.privateRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_983 = param1.publicSpace;
            this.var_648 = null;
         }
      }
      
      public function onRoomExit() : void
      {
         if(this.var_648 != null)
         {
            this.var_648.dispose();
            this.var_648 = null;
         }
         if(this.var_983 != null)
         {
            this.var_983.dispose();
            this.var_983 = null;
         }
         if(this.var_268 != null)
         {
            this.var_268.dispose();
            this.var_268 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_268 != null)
         {
            this.var_268.dispose();
         }
         this.var_268 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_648 != null)
         {
            this.var_648.dispose();
         }
         this.var_648 = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_210 != null && this.var_210 as PopularRoomTagsData != null;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_210 != null && this.var_210 as GuestRoomSearchResultData != null;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_210 != null && this.var_210 as OfficialRoomsData != null;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_210 = param1;
         this.var_1221 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_210 = param1;
         this.var_1221 = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_210 = param1;
         this.var_1221 = false;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_210 == null)
         {
            return;
         }
         this.var_210.dispose();
         this.var_210 = null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_210 as GuestRoomSearchResultData;
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_210 as PopularRoomTagsData;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_210 as OfficialRoomsData;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_648;
      }
      
      public function get avatarId() : int
      {
         return this.var_2582;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_2575;
      }
      
      public function get roomPicker() : Boolean
      {
         return this.var_2579;
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_268;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_983;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_2576;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_2581;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1871;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_2586;
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_2577;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_2584;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_2580;
      }
      
      public function get adIndex() : int
      {
         return this.var_2578;
      }
      
      public function get currentRoomIsStaffPick() : Boolean
      {
         return this.var_2585;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_2582 = param1;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_2581 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_2576 = param1;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_2575 = param1;
      }
      
      public function set roomPicker(param1:Boolean) : void
      {
         this.var_2579 = param1;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_2586 = param1;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1871 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_2577 = param1;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_2584 = param1;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_2580 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_2578 = param1;
      }
      
      public function set currentRoomIsStaffPick(param1:Boolean) : void
      {
         this.var_2585 = param1;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1521 = param1;
         this.var_1523 = new Array();
         for each(_loc2_ in this.var_1521)
         {
            if(_loc2_.visible)
            {
               this.var_1523.push(_loc2_);
            }
         }
      }
      
      public function get allCategories() : Array
      {
         return this.var_1521;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1523;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_2583 = param1.limit;
         this.var_1522 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1522 += !!param2 ? 1 : -1;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_268.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_268 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_268.flatId;
         return this.var_1871 == _loc1_;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1522 >= this.var_2583;
      }
      
      public function startLoading() : void
      {
         this.var_1221 = true;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_1221;
      }
   }
}
