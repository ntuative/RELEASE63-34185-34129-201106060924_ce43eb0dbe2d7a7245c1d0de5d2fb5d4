package com.sulake.core.runtime
{
   class ComponentInterfaceQueue implements IDisposable
   {
       
      
      private var var_1726:IID;
      
      private var var_1113:Boolean;
      
      private var var_1156:Array;
      
      function ComponentInterfaceQueue(param1:IID)
      {
         super();
         this.var_1726 = param1;
         this.var_1156 = new Array();
         this.var_1113 = false;
      }
      
      public function get identifier() : IID
      {
         return this.var_1726;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_1113;
      }
      
      public function get receivers() : Array
      {
         return this.var_1156;
      }
      
      public function dispose() : void
      {
         if(!this.var_1113)
         {
            this.var_1113 = true;
            this.var_1726 = null;
            while(this.var_1156.length > 0)
            {
               this.var_1156.pop();
            }
            this.var_1156 = null;
         }
      }
   }
}
