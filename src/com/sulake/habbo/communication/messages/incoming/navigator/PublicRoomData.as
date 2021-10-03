package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2794:String;
      
      private var var_2362:int;
      
      private var var_2348:int;
      
      private var var_2561:String;
      
      private var var_2916:int;
      
      private var var_2013:int;
      
      private var _disposed:Boolean;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2794 = param1.readString();
         this.var_2362 = param1.readInteger();
         this.var_2348 = param1.readInteger();
         this.var_2561 = param1.readString();
         this.var_2916 = param1.readInteger();
         this.var_2013 = param1.readInteger();
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2794;
      }
      
      public function get unitPort() : int
      {
         return this.var_2362;
      }
      
      public function get worldId() : int
      {
         return this.var_2348;
      }
      
      public function get castLibs() : String
      {
         return this.var_2561;
      }
      
      public function get maxUsers() : int
      {
         return this.var_2916;
      }
      
      public function get nodeId() : int
      {
         return this.var_2013;
      }
   }
}
