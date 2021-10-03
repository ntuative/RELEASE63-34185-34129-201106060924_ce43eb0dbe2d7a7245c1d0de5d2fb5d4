package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1233:String = "M";
      
      public static const const_1968:String = "F";
       
      
      private var _id:int = 0;
      
      private var _x:Number = 0;
      
      private var var_166:Number = 0;
      
      private var var_167:Number = 0;
      
      private var var_478:int = 0;
      
      private var _name:String = "";
      
      private var var_1662:int = 0;
      
      private var var_959:String = "";
      
      private var var_611:String = "";
      
      private var var_2224:String = "";
      
      private var var_2229:int;
      
      private var var_2225:int = 0;
      
      private var var_2226:String = "";
      
      private var var_2227:int = 0;
      
      private var var_2228:int = 0;
      
      private var var_2775:String = "";
      
      private var var_194:Boolean = false;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function setReadOnly() : void
      {
         this.var_194 = true;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_194)
         {
            this._x = param1;
         }
      }
      
      public function get y() : Number
      {
         return this.var_166;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_166 = param1;
         }
      }
      
      public function get z() : Number
      {
         return this.var_167;
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_194)
         {
            this.var_167 = param1;
         }
      }
      
      public function get dir() : int
      {
         return this.var_478;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_478 = param1;
         }
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_194)
         {
            this._name = param1;
         }
      }
      
      public function get userType() : int
      {
         return this.var_1662;
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_1662 = param1;
         }
      }
      
      public function get sex() : String
      {
         return this.var_959;
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_959 = param1;
         }
      }
      
      public function get figure() : String
      {
         return this.var_611;
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_611 = param1;
         }
      }
      
      public function get custom() : String
      {
         return this.var_2224;
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2224 = param1;
         }
      }
      
      public function get achievementScore() : int
      {
         return this.var_2229;
      }
      
      public function set achievementScore(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2229 = param1;
         }
      }
      
      public function get webID() : int
      {
         return this.var_2225;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2225 = param1;
         }
      }
      
      public function get groupID() : String
      {
         return this.var_2226;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2226 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_2227;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2227 = param1;
         }
      }
      
      public function get xp() : int
      {
         return this.var_2228;
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_194)
         {
            this.var_2228 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_2775;
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_194)
         {
            this.var_2775 = param1;
         }
      }
   }
}
