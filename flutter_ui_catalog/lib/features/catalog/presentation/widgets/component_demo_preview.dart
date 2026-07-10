import 'package:flutter/material.dart';
import 'package:flutter_ui_catalog/components/animations/animated_container_demo.dart';
import 'package:flutter_ui_catalog/components/animations/animated_opacity_demo.dart';
import 'package:flutter_ui_catalog/components/animations/hero_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/adaptive_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/cupertino_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/elevated_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/filled_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/floating_action_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/icon_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/outlined_button_demo.dart';
import 'package:flutter_ui_catalog/components/buttons/text_button_demo.dart';
import 'package:flutter_ui_catalog/components/cards/card_demo.dart';
import 'package:flutter_ui_catalog/components/charts/area_chart_demo.dart';
import 'package:flutter_ui_catalog/components/charts/bar_chart_demo.dart';
import 'package:flutter_ui_catalog/components/charts/line_chart_demo.dart';
import 'package:flutter_ui_catalog/components/charts/pie_chart_demo.dart';
import 'package:flutter_ui_catalog/components/charts/radar_chart_demo.dart';
import 'package:flutter_ui_catalog/components/charts/scatter_chart_demo.dart';
import 'package:flutter_ui_catalog/components/cupertino/cupertino_alert_dialog_demo.dart';
import 'package:flutter_ui_catalog/components/cupertino/cupertino_date_picker_demo.dart';
import 'package:flutter_ui_catalog/components/cupertino/cupertino_modal_popup_route_demo.dart';
import 'package:flutter_ui_catalog/components/cupertino/cupertino_picker_demo.dart';
import 'package:flutter_ui_catalog/components/cupertino/cupertino_time_picker_demo.dart';
import 'package:flutter_ui_catalog/components/data_display/data_table_demo.dart';
import 'package:flutter_ui_catalog/components/dialogs/alert_dialog_demo.dart';
import 'package:flutter_ui_catalog/components/dialogs/bottom_sheet_demo.dart';
import 'package:flutter_ui_catalog/components/feedback/chip_demo.dart';
import 'package:flutter_ui_catalog/components/feedback/circular_progress_indicator_demo.dart';
import 'package:flutter_ui_catalog/components/feedback/linear_progress_indicator_demo.dart';
import 'package:flutter_ui_catalog/components/feedback/snack_bar_demo.dart';
import 'package:flutter_ui_catalog/components/feedback/tooltip_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/checkbox_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/cupertino_switch_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/date_picker_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/dropdown_menu_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/radio_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/slider_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/switch_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/text_field_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/text_form_field_demo.dart';
import 'package:flutter_ui_catalog/components/inputs/time_picker_demo.dart';
import 'package:flutter_ui_catalog/components/layout/align_demo.dart';
import 'package:flutter_ui_catalog/components/layout/aspect_ratio_demo.dart';
import 'package:flutter_ui_catalog/components/layout/center_demo.dart';
import 'package:flutter_ui_catalog/components/layout/column_demo.dart';
import 'package:flutter_ui_catalog/components/layout/container_demo.dart';
import 'package:flutter_ui_catalog/components/layout/custom_scroll_view_demo.dart';
import 'package:flutter_ui_catalog/components/layout/expanded_demo.dart';
import 'package:flutter_ui_catalog/components/layout/flexible_demo.dart';
import 'package:flutter_ui_catalog/components/layout/layout_builder_demo.dart';
import 'package:flutter_ui_catalog/components/layout/padding_demo.dart';
import 'package:flutter_ui_catalog/components/layout/row_demo.dart';
import 'package:flutter_ui_catalog/components/layout/safe_area_demo.dart';
import 'package:flutter_ui_catalog/components/layout/sized_box_demo.dart';
import 'package:flutter_ui_catalog/components/layout/sliver_grid_demo.dart';
import 'package:flutter_ui_catalog/components/layout/sliver_list_demo.dart';
import 'package:flutter_ui_catalog/components/layout/stack_demo.dart';
import 'package:flutter_ui_catalog/components/layout/wrap_demo.dart';
import 'package:flutter_ui_catalog/components/lists/expansion_tile_demo.dart';
import 'package:flutter_ui_catalog/components/lists/grid_view_demo.dart';
import 'package:flutter_ui_catalog/components/lists/list_tile_demo.dart';
import 'package:flutter_ui_catalog/components/lists/page_view_demo.dart';
import 'package:flutter_ui_catalog/components/media/basic_video_demo.dart';
import 'package:flutter_ui_catalog/components/media/circular_image_demo.dart';
import 'package:flutter_ui_catalog/components/media/file_selector_demo.dart';
import 'package:flutter_ui_catalog/components/media/image_error_demo.dart';
import 'package:flutter_ui_catalog/components/media/image_gallery_demo.dart';
import 'package:flutter_ui_catalog/components/media/image_placeholder_demo.dart';
import 'package:flutter_ui_catalog/components/media/image_selector_demo.dart';
import 'package:flutter_ui_catalog/components/media/local_image_demo.dart';
import 'package:flutter_ui_catalog/components/media/network_image_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/drawer_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/navigation_bar_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/navigation_rail_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/stepper_demo.dart';
import 'package:flutter_ui_catalog/components/navigation/tab_bar_demo.dart';
import 'package:flutter_ui_catalog/features/catalog/domain/models/catalog_component.dart';
import 'package:flutter_ui_catalog/features/catalog/presentation/controllers/demo_configuration_controller.dart';

class ComponentDemoPreview extends StatelessWidget {
  const ComponentDemoPreview({
    required this.component,
    required this.configuration,
    super.key,
  });

  final CatalogComponent component;
  final DemoConfiguration configuration;

  @override
  Widget build(BuildContext context) {
    return switch (component.id) {
      'filled-button' => FilledButtonDemo(configuration: configuration),
      'elevated-button' => const ElevatedButtonDemo(),
      'outlined-button' => const OutlinedButtonDemo(),
      'text-button' => const TextButtonDemo(),
      'icon-button' => const IconButtonDemo(),
      'floating-action-button' => const FloatingActionButtonDemo(),
      'cupertino-button' => const CupertinoButtonDemo(),
      'adaptive-button' => const AdaptiveButtonDemo(),
      'text-field' => TextFieldDemo(configuration: configuration),
      'text-form-field' => const TextFormFieldDemo(),
      'dropdown-menu' => const DropdownMenuDemo(),
      'checkbox' => const CheckboxDemo(),
      'radio' => const RadioDemo(),
      'switch' => const SwitchDemo(),
      'slider' => const SliderDemo(),
      'date-picker' => const DatePickerDemo(),
      'time-picker' => const TimePickerDemo(),
      'cupertino-switch' => const CupertinoSwitchDemo(),
      'card' => const CardDemo(),
      'list-tile' => const ListTileDemo(),
      'expansion-tile' => const ExpansionTileDemo(),
      'grid-view' => const GridViewDemo(),
      'page-view' => const PageViewDemo(),
      'navigation-bar' => const NavigationBarDemo(),
      'navigation-rail' => const NavigationRailDemo(),
      'drawer' => const DrawerDemo(),
      'tab-bar' => const TabBarDemo(),
      'stepper' => const StepperDemo(),
      'alert-dialog' => const AlertDialogDemo(),
      'bottom-sheet' => const BottomSheetDemo(),
      'cupertino-alert-dialog' => const CupertinoAlertDialogDemo(),
      'snack-bar' => const SnackBarDemo(),
      'tooltip' => const TooltipDemo(),
      'circular-progress-indicator' => const CircularProgressIndicatorDemo(),
      'linear-progress-indicator' => const LinearProgressIndicatorDemo(),
      'chip' => const ChipDemo(),
      'data-table' => const DataTableDemo(),
      'animated-container' => const AnimatedContainerDemo(),
      'animated-opacity' => const AnimatedOpacityDemo(),
      'hero' => const HeroDemo(),
      'row' => const RowDemo(),
      'column' => const ColumnDemo(),
      'stack' => const StackDemo(),
      'wrap' => const WrapDemo(),
      'expanded' => const ExpandedDemo(),
      'flexible' => const FlexibleDemo(),
      'align' => const AlignDemo(),
      'center' => const CenterDemo(),
      'padding' => const PaddingDemo(),
      'container' => const ContainerDemo(),
      'sized-box' => const SizedBoxDemo(),
      'aspect-ratio' => const AspectRatioDemo(),
      'layout-builder' => const LayoutBuilderDemo(),
      'safe-area' => const SafeAreaDemo(),
      'custom-scroll-view' => const CustomScrollViewDemo(),
      'sliver-list' => const SliverListDemo(),
      'sliver-grid' => const SliverGridDemo(),
      'local-image' => const LocalImageDemo(),
      'network-image' => const NetworkImageDemo(),
      'image-placeholder' => const ImagePlaceholderDemo(),
      'image-error' => const ImageErrorDemo(),
      'circular-image' => const CircularImageDemo(),
      'image-gallery' => const ImageGalleryDemo(),
      'basic-video' => const BasicVideoDemo(),
      'file-selector' => const FileSelectorDemo(),
      'image-selector' => const ImageSelectorDemo(),
      'cupertino-date-picker' => const CupertinoDatePickerDemo(),
      'cupertino-picker' => const CupertinoPickerDemo(),
      'cupertino-time-picker' => const CupertinoTimePickerDemo(),
      'cupertino-modal-popup-route' => const CupertinoModalPopupRouteDemo(),
      'bar-chart' => const BarChartDemo(),
      'pie-chart' => const PieChartDemo(),
      'line-chart' => const LineChartDemo(),
      'area-chart' => const AreaChartDemo(),
      'scatter-chart' => const ScatterChartDemo(),
      'radar-chart' => const RadarChartDemo(),
      _ => const SizedBox.shrink(),
    };
  }
}
