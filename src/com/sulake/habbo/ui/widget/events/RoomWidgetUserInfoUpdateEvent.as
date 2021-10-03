package com.sulake.habbo.ui.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:String = "RWUIUE_OWN_USER";
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_153:String = "RWUIUE_PEER";
      
      public static const TRADE_REASON_OK:int = 0;
      
      public static const const_870:int = 2;
      
      public static const const_725:int = 3;
      
      public static const const_1689:String = "BOT";
       
      
      private var _name:String = "";
      
      private var var_2075:String = "";
      
      private var var_2229:int;
      
      private var var_2225:int = 0;
      
      private var var_2228:int = 0;
      
      private var var_611:String = "";
      
      private var var_46:BitmapData = null;
      
      private var var_226:Array;
      
      private var var_1533:int = 0;
      
      private var var_2891:String = "";
      
      private var var_2890:int = 0;
      
      private var var_2889:int = 0;
      
      private var var_2145:Boolean = false;
      
      private var var_2076:String = "";
      
      private var var_2197:Boolean = false;
      
      private var var_2958:Boolean = false;
      
      private var var_2956:Boolean = true;
      
      private var var_1199:int = 0;
      
      private var var_2962:Boolean = false;
      
      private var var_2961:Boolean = false;
      
      private var var_2960:Boolean = false;
      
      private var var_2959:Boolean = false;
      
      private var var_2954:Boolean = false;
      
      private var var_2955:Boolean = false;
      
      private var var_2957:int = 0;
      
      private var var_2144:Boolean = false;
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_226 = [];
         super(param1,param2,param3);
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_2075 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_2075;
      }
      
      public function set achievementScore(param1:int) : void
      {
         this.var_2229 = param1;
      }
      
      public function get achievementScore() : int
      {
         return this.var_2229;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function get webID() : int
      {
         return this.var_2225;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_2228;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_611 = param1;
      }
      
      public function get figure() : String
      {
         return this.var_611;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_46 = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_46;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_226 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_226;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1533 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1533;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2891 = param1;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2891;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2958 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2958;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this.var_1199 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this.var_1199;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2962 = param1;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2962;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2961 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2961;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2960 = param1;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2960;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2959 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2959;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2954 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2954;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2955 = param1;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2955;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2957 = param1;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2957;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2956 = param1;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2956;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_2144 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_2144;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2890 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2890;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2889 = param1;
      }
      
      public function get userRoomId() : int
      {
         return this.var_2889;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_2145 = param1;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_2145;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_2076 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_2076;
      }
      
      public function set allowNameChange(param1:Boolean) : void
      {
         this.var_2197 = param1;
      }
      
      public function get allowNameChange() : Boolean
      {
         return this.var_2197;
      }
   }
}
