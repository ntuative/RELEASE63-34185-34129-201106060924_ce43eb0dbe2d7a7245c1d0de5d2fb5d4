package com.sulake.core.runtime
{
   import flash.utils.getQualifiedClassName;
   
   final class InterfaceStruct implements IDisposable
   {
       
      
      private var var_1613:IID;
      
      private var var_2051:String;
      
      private var var_112:IUnknown;
      
      private var var_866:uint;
      
      function InterfaceStruct(param1:IID, param2:IUnknown)
      {
         super();
         this.var_1613 = param1;
         this.var_2051 = getQualifiedClassName(this.var_1613);
         this.var_112 = param2;
         this.var_866 = 0;
      }
      
      public function get iid() : IID
      {
         return this.var_1613;
      }
      
      public function get iis() : String
      {
         return this.var_2051;
      }
      
      public function get unknown() : IUnknown
      {
         return this.var_112;
      }
      
      public function get references() : uint
      {
         return this.var_866;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_112 == null;
      }
      
      public function dispose() : void
      {
         this.var_1613 = null;
         this.var_2051 = null;
         this.var_112 = null;
         this.var_866 = 0;
      }
      
      public function reserve() : uint
      {
         return ++this.var_866;
      }
      
      public function release() : uint
      {
         return this.references > 0 ? uint(--this.var_866) : uint(0);
      }
   }
}
