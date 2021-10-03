package com.sulake.core.window.utils
{
   import com.sulake.core.window.enum.WindowParam;
   import flash.utils.Dictionary;
   
   public class ParamCodeTable extends WindowParam
   {
       
      
      public function ParamCodeTable()
      {
         super();
      }
      
      public static function fillTables(param1:Dictionary, param2:Dictionary = null) : void
      {
         var _loc3_:* = null;
         param1["null"] = const_179;
         param1["bound_to_parent_rect"] = const_101;
         param1["child_window"] = const_1276;
         param1["embedded_controller"] = const_1201;
         param1["resize_to_accommodate_children"] = WINDOW_PARAM_RESIZE_TO_ACCOMMODATE_CHILDREN;
         param1["input_event_processor"] = const_31;
         param1["internal_event_handling"] = const_994;
         param1["mouse_dragging_target"] = const_299;
         param1["mouse_dragging_trigger"] = const_379;
         param1["mouse_scaling_target"] = const_355;
         param1["mouse_scaling_trigger"] = const_500;
         param1["horizontal_mouse_scaling_trigger"] = const_262;
         param1["vertical_mouse_scaling_trigger"] = const_259;
         param1["observe_parent_input_events"] = const_1168;
         param1["optimize_region_to_layout_size"] = const_544;
         param1["parent_window"] = const_1347;
         param1["relative_horizontal_scale_center"] = const_223;
         param1["relative_horizontal_scale_fixed"] = const_141;
         param1["relative_horizontal_scale_move"] = const_445;
         param1["relative_horizontal_scale_strech"] = const_399;
         param1["relative_scale_center"] = const_1164;
         param1["relative_scale_fixed"] = const_789;
         param1["relative_scale_move"] = const_1307;
         param1["relative_scale_strech"] = const_1326;
         param1["relative_vertical_scale_center"] = const_227;
         param1["relative_vertical_scale_fixed"] = const_159;
         param1["relative_vertical_scale_move"] = const_252;
         param1["relative_vertical_scale_strech"] = const_313;
         param1["on_resize_align_left"] = const_875;
         param1["on_resize_align_right"] = const_535;
         param1["on_resize_align_center"] = const_480;
         param1["on_resize_align_top"] = const_781;
         param1["on_resize_align_bottom"] = const_516;
         param1["on_resize_align_middle"] = const_486;
         param1["on_accommodate_align_left"] = const_1322;
         param1["on_accommodate_align_right"] = const_587;
         param1["on_accommodate_align_center"] = const_837;
         param1["on_accommodate_align_top"] = const_1147;
         param1["on_accommodate_align_bottom"] = const_590;
         param1["on_accommodate_align_middle"] = const_963;
         param1["route_input_events_to_parent"] = const_530;
         param1["use_parent_graphic_context"] = const_34;
         param1["draggable_with_mouse"] = const_1303;
         param1["scalable_with_mouse"] = const_1246;
         param1["reflect_horizontal_resize_to_parent"] = const_507;
         param1["reflect_vertical_resize_to_parent"] = const_631;
         param1["reflect_resize_to_parent"] = const_328;
         param1["force_clipping"] = WINDOW_PARAM_FORCE_CLIPPING;
         param1["inherit_caption"] = const_1274;
         if(param2 != null)
         {
            for(param2[param1[_loc3_]] in param1)
            {
            }
         }
      }
   }
}
