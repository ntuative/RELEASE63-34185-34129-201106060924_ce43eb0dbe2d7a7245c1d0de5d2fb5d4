package com.sulake.core.communication.handshake
{
   import com.hurlant.math.BigInteger;
   import com.sulake.core.utils.ErrorReportStorage;
   
   public class DiffieHellman implements IKeyExchange
   {
       
      
      private var var_1005:BigInteger;
      
      private var var_2389:BigInteger;
      
      private var var_1982:BigInteger;
      
      private var var_2733:BigInteger;
      
      private var var_1591:BigInteger;
      
      private var var_1983:BigInteger;
      
      public function DiffieHellman(param1:BigInteger, param2:BigInteger)
      {
         super();
         this.var_1591 = param1;
         this.var_1983 = param2;
      }
      
      public function init(param1:String, param2:uint = 16) : Boolean
      {
         ErrorReportStorage.addDebugData("DiffieHellman","Prime: " + this.var_1591.toString() + ",generator: " + this.var_1983.toString() + ",secret: " + param1);
         this.var_1005 = new BigInteger();
         this.var_1005.fromRadix(param1,param2);
         this.var_2389 = this.var_1983.modPow(this.var_1005,this.var_1591);
         return true;
      }
      
      public function generateSharedKey(param1:String, param2:uint = 16) : String
      {
         this.var_1982 = new BigInteger();
         this.var_1982.fromRadix(param1,param2);
         this.var_2733 = this.var_1982.modPow(this.var_1005,this.var_1591);
         return this.getSharedKey(param2);
      }
      
      public function getPublicKey(param1:uint = 16) : String
      {
         return this.var_2389.toRadix(param1);
      }
      
      public function getSharedKey(param1:uint = 16) : String
      {
         return this.var_2733.toRadix(param1);
      }
   }
}
