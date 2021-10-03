package com.sulake.habbo.communication.messages.incoming.handshake
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.communication.messages.MessageEvent;
   import com.sulake.habbo.communication.messages.parser.handshake.DisconnectReasonParser;
   
   public class DisconnectReasonEvent extends MessageEvent implements IMessageEvent
   {
      
      public static const const_2072:int = 0;
      
      public static const const_1740:int = 1;
      
      public static const const_1678:int = 2;
      
      public static const const_2053:int = 3;
      
      public static const const_2119:int = 4;
      
      public static const const_2153:int = 5;
      
      public static const const_1844:int = 10;
      
      public static const const_2041:int = 11;
      
      public static const const_2146:int = 12;
      
      public static const const_2082:int = 13;
      
      public static const const_2202:int = 16;
      
      public static const const_2232:int = 17;
      
      public static const const_2183:int = 18;
      
      public static const const_2187:int = 19;
      
      public static const const_2138:int = 20;
      
      public static const const_2038:int = 22;
      
      public static const const_2220:int = 23;
      
      public static const const_2163:int = 24;
      
      public static const const_2102:int = 25;
      
      public static const const_2098:int = 26;
      
      public static const const_2239:int = 27;
      
      public static const const_2218:int = 28;
      
      public static const const_2033:int = 29;
      
      public static const const_2125:int = 100;
      
      public static const const_2048:int = 101;
      
      public static const const_2164:int = 102;
      
      public static const const_2212:int = 103;
      
      public static const const_2195:int = 104;
      
      public static const const_2231:int = 105;
      
      public static const const_2045:int = 106;
      
      public static const const_2196:int = 107;
      
      public static const const_2223:int = 108;
      
      public static const const_2062:int = 109;
      
      public static const const_2215:int = 110;
      
      public static const const_2112:int = 111;
      
      public static const const_2224:int = 112;
      
      public static const const_2129:int = 113;
      
      public static const const_2109:int = 114;
      
      public static const const_2179:int = 115;
      
      public static const const_2206:int = 116;
      
      public static const const_2085:int = 117;
      
      public static const const_2087:int = 118;
      
      public static const const_2145:int = 119;
       
      
      public function DisconnectReasonEvent(param1:Function)
      {
         super(param1,DisconnectReasonParser);
      }
      
      public function get reason() : int
      {
         return (this.var_10 as DisconnectReasonParser).reason;
      }
      
      public function get reasonString() : String
      {
         switch(this.reason)
         {
            case const_1740:
            case const_1844:
               return "banned";
            case const_1678:
               return "concurrentlogin";
            default:
               return "logout";
         }
      }
   }
}
