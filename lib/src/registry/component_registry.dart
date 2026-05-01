import 'package:fyarn/src/models/component_config.dart';

class ComponentRegistry {
  static final Map<String, ComponentConfig> _components = {
    'button': ComponentConfig(
      name: 'button',
      templatePath: 'ui/button',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_button.dart.tpl',
          fileName: 'ui/button/fyarn_button.dart',
        ),
      ],
    ),
    'button_group': ComponentConfig(
      name: 'button_group',
      templatePath: 'ui/button_group',
      dependencies: ['tokens', 'button'],
      files: [
        ComponentFile(
          templateName: 'fyarn_button_group.dart.tpl',
          fileName: 'ui/button_group/fyarn_button_group.dart',
        ),
      ],
    ),
    'input': ComponentConfig(
      name: 'input',
      templatePath: 'ui/input',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_input.dart.tpl',
          fileName: 'ui/input/fyarn_input.dart',
        ),
      ],
    ),
    'login': ComponentConfig(
      name: 'login',
      templatePath: 'ui/auth/login',
      dependencies: ['tokens', 'text', 'button', 'input'],
      files: [
        ComponentFile(
          templateName: 'minimal/login_minimal.dart.tpl',
          fileName: 'ui/auth/login_minimal.dart',
        ),
      ],
      variants: {
        'minimal': ComponentVariant(
          name: 'minimal',
          files: [
            ComponentFile(
              templateName: 'minimal/login_minimal.dart.tpl',
              fileName: 'ui/auth/login_minimal.dart',
            ),
          ],
        ),
        'card': ComponentVariant(
          name: 'card',
          files: [
            ComponentFile(
              templateName: 'card/login_card.dart.tpl',
              fileName: 'ui/auth/login_card.dart',
            ),
          ],
        ),
        'split': ComponentVariant(
          name: 'split',
          files: [
            ComponentFile(
              templateName: 'split/login_split.dart.tpl',
              fileName: 'ui/auth/login_split.dart',
            ),
          ],
        ),
        'immersive': ComponentVariant(
          name: 'immersive',
          files: [
            ComponentFile(
              templateName: 'immersive/login_immersive.dart.tpl',
              fileName: 'ui/auth/login_immersive.dart',
            ),
          ],
        ),
      },
    ),
    'signup': ComponentConfig(
      name: 'signup',
      templatePath: 'ui/auth/signup',
      dependencies: ['tokens', 'text', 'button', 'input'],
      files: [
        ComponentFile(
          templateName: 'minimal/signup_minimal.dart.tpl',
          fileName: 'ui/auth/signup_minimal.dart',
        ),
        ComponentFile(
          templateName: 'signup_form.dart.tpl',
          fileName: 'ui/auth/signup_form.dart',
        ),
      ],
      variants: {
        'minimal': ComponentVariant(
          name: 'minimal',
          files: [
            ComponentFile(
              templateName: 'minimal/signup_minimal.dart.tpl',
              fileName: 'ui/auth/signup_minimal.dart',
            ),
            ComponentFile(
              templateName: 'signup_form.dart.tpl',
              fileName: 'ui/auth/signup_form.dart',
            ),
          ],
        ),
        'card': ComponentVariant(
          name: 'card',
          files: [
            ComponentFile(
              templateName: 'card/signup_card.dart.tpl',
              fileName: 'ui/auth/signup_card.dart',
            ),
            ComponentFile(
              templateName: 'signup_form.dart.tpl',
              fileName: 'ui/auth/signup_form.dart',
            ),
          ],
        ),
        'split': ComponentVariant(
          name: 'split',
          files: [
            ComponentFile(
              templateName: 'split/signup_page.dart.tpl',
              fileName: 'ui/auth/signup_split.dart',
            ),
            ComponentFile(
              templateName: 'signup_form.dart.tpl',
              fileName: 'ui/auth/signup_form.dart',
            ),
          ],
        ),
        'immersive': ComponentVariant(
          name: 'immersive',
          files: [
            ComponentFile(
              templateName: 'immersive/signup_immersive.dart.tpl',
              fileName: 'ui/auth/signup_immersive.dart',
            ),
            ComponentFile(
              templateName: 'signup_form.dart.tpl',
              fileName: 'ui/auth/signup_form.dart',
            ),
          ],
        ),
      },
    ),
    'card': ComponentConfig(
      name: 'card',
      templatePath: 'ui/card',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_card.dart.tpl',
          fileName: 'ui/card/fyarn_card.dart',
        ),
      ],
    ),
    'dialog': ComponentConfig(
      name: 'dialog',
      templatePath: 'ui/dialog',
      dependencies: ['tokens', 'text', 'button'],
      files: [
        ComponentFile(
          templateName: 'fyarn_dialog.dart.tpl',
          fileName: 'ui/dialog/fyarn_dialog.dart',
        ),
      ],
    ),
    'accordion': ComponentConfig(
      name: 'accordion',
      templatePath: 'ui/accordion',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_accordion.dart.tpl',
          fileName: 'ui/accordion/fyarn_accordion.dart',
        ),
      ],
    ),
    'alert': ComponentConfig(
      name: 'alert',
      templatePath: 'ui/alert',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_alert.dart.tpl',
          fileName: 'ui/alert/fyarn_alert.dart',
        ),
      ],
    ),
    'alert_dialog': ComponentConfig(
      name: 'alert_dialog',
      templatePath: 'ui/alert_dialog',
      dependencies: ['tokens', 'text', 'button'],
      files: [
        ComponentFile(
          templateName: 'fyarn_alert_dialog.dart.tpl',
          fileName: 'ui/alert_dialog/fyarn_alert_dialog.dart',
        ),
      ],
    ),
    'aspect_ratio': ComponentConfig(
      name: 'aspect_ratio',
      templatePath: 'ui/aspect_ratio',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_aspect_ratio.dart.tpl',
          fileName: 'ui/aspect_ratio/fyarn_aspect_ratio.dart',
        ),
      ],
    ),
    'avatar': ComponentConfig(
      name: 'avatar',
      templatePath: 'ui/avatar',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_avatar.dart.tpl',
          fileName: 'ui/avatar/fyarn_avatar.dart',
        ),
      ],
    ),
    'badge': ComponentConfig(
      name: 'badge',
      templatePath: 'ui/badge',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_badge.dart.tpl',
          fileName: 'ui/badge/fyarn_badge.dart',
        ),
      ],
    ),
    'breadcrumb': ComponentConfig(
      name: 'breadcrumb',
      templatePath: 'ui/breadcrumb',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_breadcrumb.dart.tpl',
          fileName: 'ui/breadcrumb/fyarn_breadcrumb.dart',
        ),
      ],
    ),
    'calendar': ComponentConfig(
      name: 'calendar',
      templatePath: 'ui/calendar',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_calendar.dart.tpl',
          fileName: 'ui/calendar/fyarn_calendar.dart',
        ),
      ],
    ),
    'carousel': ComponentConfig(
      name: 'carousel',
      templatePath: 'ui/carousel',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_carousel.dart.tpl',
          fileName: 'ui/carousel/fyarn_carousel.dart',
        ),
      ],
    ),
    'chart': ComponentConfig(
      name: 'chart',
      templatePath: 'ui/chart',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_chart.dart.tpl',
          fileName: 'ui/chart/fyarn_chart.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_bar_chart.dart.tpl',
          fileName: 'ui/chart/fyarn_bar_chart.dart',
        ),
        ComponentFile(
          templateName: 'consumption_chart.dart.tpl',
          fileName: 'ui/chart/consumption_chart.dart',
        ),
      ],
    ),
    'checkbox': ComponentConfig(
      name: 'checkbox',
      templatePath: 'ui/checkbox',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_checkbox.dart.tpl',
          fileName: 'ui/checkbox/fyarn_checkbox.dart',
        ),
      ],
    ),
    'collapsible': ComponentConfig(
      name: 'collapsible',
      templatePath: 'ui/collapsible',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_collapsible.dart.tpl',
          fileName: 'ui/collapsible/fyarn_collapsible.dart',
        ),
      ],
    ),
    'combobox': ComponentConfig(
      name: 'combobox',
      templatePath: 'ui/combobox',
      dependencies: ['tokens', 'text', 'input'],
      files: [
        ComponentFile(
          templateName: 'fyarn_combobox.dart.tpl',
          fileName: 'ui/combobox/fyarn_combobox.dart',
        ),
      ],
    ),
    'command': ComponentConfig(
      name: 'command',
      templatePath: 'ui/command',
      dependencies: ['tokens', 'text', 'input'],
      files: [
        ComponentFile(
          templateName: 'fyarn_command.dart.tpl',
          fileName: 'ui/command/fyarn_command.dart',
        ),
      ],
    ),
    'context_menu': ComponentConfig(
      name: 'context_menu',
      templatePath: 'ui/context_menu',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_context_menu.dart.tpl',
          fileName: 'ui/context_menu/fyarn_context_menu.dart',
        ),
      ],
    ),
    'data_table': ComponentConfig(
      name: 'data_table',
      templatePath: 'ui/data_table',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_data_table.dart.tpl',
          fileName: 'ui/data_table/fyarn_data_table.dart',
        ),
      ],
    ),
    'date_picker': ComponentConfig(
      name: 'date_picker',
      templatePath: 'ui/date_picker',
      dependencies: ['tokens', 'text', 'calendar'],
      files: [
        ComponentFile(
          templateName: 'fyarn_date_picker.dart.tpl',
          fileName: 'ui/date_picker/fyarn_date_picker.dart',
        ),
      ],
    ),
    'drawer': ComponentConfig(
      name: 'drawer',
      templatePath: 'ui/drawer',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_drawer.dart.tpl',
          fileName: 'ui/drawer/fyarn_drawer.dart',
        ),
      ],
    ),
    'dropdown_menu': ComponentConfig(
      name: 'dropdown_menu',
      templatePath: 'ui/dropdown_menu',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_dropdown_menu.dart.tpl',
          fileName: 'ui/dropdown_menu/fyarn_dropdown_menu.dart',
        ),
      ],
    ),
    'empty': ComponentConfig(
      name: 'empty',
      templatePath: 'ui/empty',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_empty.dart.tpl',
          fileName: 'ui/empty/fyarn_empty.dart',
        ),
      ],
    ),
    'field': ComponentConfig(
      name: 'field',
      templatePath: 'ui/field',
      dependencies: ['tokens', 'text', 'input'],
      files: [
        ComponentFile(
          templateName: 'fyarn_field.dart.tpl',
          fileName: 'ui/field/fyarn_field.dart',
        ),
      ],
    ),
    'hover_card': ComponentConfig(
      name: 'hover_card',
      templatePath: 'ui/hover_card',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_hover_card.dart.tpl',
          fileName: 'ui/hover_card/fyarn_hover_card.dart',
        ),
      ],
    ),
    'input_otp': ComponentConfig(
      name: 'input_otp',
      templatePath: 'ui/input_otp',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_input_otp.dart.tpl',
          fileName: 'ui/input_otp/fyarn_input_otp.dart',
        ),
      ],
    ),
    'kbd': ComponentConfig(
      name: 'kbd',
      templatePath: 'ui/kbd',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_kbd.dart.tpl',
          fileName: 'ui/kbd/fyarn_kbd.dart',
        ),
      ],
    ),
    'label': ComponentConfig(
      name: 'label',
      templatePath: 'ui/label',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_label.dart.tpl',
          fileName: 'ui/label/fyarn_label.dart',
        ),
      ],
    ),
    'pagination': ComponentConfig(
      name: 'pagination',
      templatePath: 'ui/pagination',
      dependencies: ['tokens', 'button'],
      files: [
        ComponentFile(
          templateName: 'fyarn_pagination.dart.tpl',
          fileName: 'ui/pagination/fyarn_pagination.dart',
        ),
      ],
    ),
    'input_group': ComponentConfig(
      name: 'input_group',
      templatePath: 'ui/input_group',
      dependencies: ['tokens', 'input'],
      files: [
        ComponentFile(
          templateName: 'fyarn_input_group.dart.tpl',
          fileName: 'ui/input_group/fyarn_input_group.dart',
        ),
      ],
    ),
    'menubar': ComponentConfig(
      name: 'menubar',
      templatePath: 'ui/menubar',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_menubar.dart.tpl',
          fileName: 'ui/menubar/fyarn_menubar.dart',
        ),
      ],
    ),
    'progress': ComponentConfig(
      name: 'progress',
      templatePath: 'ui/progress',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_progress.dart.tpl',
          fileName: 'ui/progress/fyarn_progress.dart',
        ),
      ],
    ),
    'skeleton': ComponentConfig(
      name: 'skeleton',
      templatePath: 'ui/skeleton',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_skeleton.dart.tpl',
          fileName: 'ui/skeleton/fyarn_skeleton.dart',
        ),
      ],
    ),
    'spinner': ComponentConfig(
      name: 'spinner',
      templatePath: 'ui/spinner',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_spinner.dart.tpl',
          fileName: 'ui/spinner/fyarn_spinner.dart',
        ),
      ],
    ),
    'separator': ComponentConfig(
      name: 'separator',
      templatePath: 'ui/separator',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_separator.dart.tpl',
          fileName: 'ui/separator/fyarn_separator.dart',
        ),
      ],
    ),
    'slider': ComponentConfig(
      name: 'slider',
      templatePath: 'ui/slider',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_slider.dart.tpl',
          fileName: 'ui/slider/fyarn_slider.dart',
        ),
      ],
    ),
    'radio_group': ComponentConfig(
      name: 'radio_group',
      templatePath: 'ui/radio_group',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_radio_group.dart.tpl',
          fileName: 'ui/radio_group/fyarn_radio_group.dart',
        ),
      ],
    ),
    'sheet': ComponentConfig(
      name: 'sheet',
      templatePath: 'ui/sheet',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_sheet.dart.tpl',
          fileName: 'ui/sheet/fyarn_sheet.dart',
        ),
      ],
    ),
    'sonner': ComponentConfig(
      name: 'sonner',
      templatePath: 'ui/sonner',
      dependencies: ['tokens', 'text'],
      files: [
        ComponentFile(
          templateName: 'fyarn_sonner.dart.tpl',
          fileName: 'ui/sonner/fyarn_sonner.dart',
        ),
      ],
    ),
    'switch': ComponentConfig(
      name: 'switch',
      templatePath: 'ui/switch',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_switch.dart.tpl',
          fileName: 'ui/switch/fyarn_switch.dart',
        ),
      ],
    ),
    'tabs': ComponentConfig(
      name: 'tabs',
      templatePath: 'ui/tabs',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_tabs.dart.tpl',
          fileName: 'ui/tabs/fyarn_tabs.dart',
        ),
      ],
    ),
    'textarea': ComponentConfig(
      name: 'textarea',
      templatePath: 'ui/textarea',
      dependencies: ['tokens', 'input'],
      files: [
        ComponentFile(
          templateName: 'fyarn_textarea.dart.tpl',
          fileName: 'ui/textarea/fyarn_textarea.dart',
        ),
      ],
    ),
    'toggle': ComponentConfig(
      name: 'toggle',
      templatePath: 'ui/toggle',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_toggle.dart.tpl',
          fileName: 'ui/toggle/fyarn_toggle.dart',
        ),
      ],
    ),
    'tooltip': ComponentConfig(
      name: 'tooltip',
      templatePath: 'ui/tooltip',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_tooltip.dart.tpl',
          fileName: 'ui/tooltip/fyarn_tooltip.dart',
        ),
      ],
    ),
    'text': ComponentConfig(
      name: 'text',
      templatePath: 'ui/text',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_text.dart.tpl',
          fileName: 'ui/text/fyarn_text.dart',
        ),
      ],
    ),
    'tokens': ComponentConfig(
      name: 'tokens',
      templatePath: 'core/tokens',
      files: [
        ComponentFile(
          templateName: 'tokens.dart.tpl',
          fileName: 'core/tokens/tokens.dart',
        ),
      ],
      dependencies: ['theme'],
    ),
    'theme': ComponentConfig(
      name: 'theme',
      templatePath: 'core/theme',
      files: [
        ComponentFile(
          templateName: 'fyarn_colors.dart.tpl',
          fileName: 'core/theme/fyarn_colors.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_spacing.dart.tpl',
          fileName: 'core/theme/fyarn_spacing.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_typography.dart.tpl',
          fileName: 'core/theme/fyarn_typography.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_shapes.dart.tpl',
          fileName: 'core/theme/fyarn_shapes.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_theme.dart.tpl',
          fileName: 'core/theme/fyarn_theme.dart',
        ),
        ComponentFile(
          templateName: 'fyarn_theme_engine.dart.tpl',
          fileName: 'core/theme/fyarn_theme_engine.dart',
        ),
        ComponentFile(
          templateName: 'presets/default_colors.dart.tpl',
          fileName: 'core/theme/presets/default_colors.dart',
        ),
      ],
    ),
    'theme_default': ComponentConfig(
      name: 'theme_default',
      templatePath: 'core/theme/presets',
      files: [
        ComponentFile(
          templateName: 'default_colors.dart.tpl',
          fileName: 'core/theme/presets/default_colors.dart',
        ),
      ],
    ),
    'theme_ruby': ComponentConfig(
      name: 'theme_ruby',
      templatePath: 'core/theme/presets',
      files: [
        ComponentFile(
          templateName: 'ruby_colors.dart.tpl',
          fileName: 'core/theme/presets/ruby_colors.dart',
        ),
      ],
    ),
    'theme_emerald': ComponentConfig(
      name: 'theme_emerald',
      templatePath: 'core/theme/presets',
      files: [
        ComponentFile(
          templateName: 'emerald_colors.dart.tpl',
          fileName: 'core/theme/presets/emerald_colors.dart',
        ),
      ],
    ),
    'theme_amber': ComponentConfig(
      name: 'theme_amber',
      templatePath: 'core/theme/presets',
      files: [
        ComponentFile(
          templateName: 'amber_colors.dart.tpl',
          fileName: 'core/theme/presets/amber_colors.dart',
        ),
      ],
    ),
    'theme_rose': ComponentConfig(
      name: 'theme_rose',
      templatePath: 'core/theme/presets',
      files: [
        ComponentFile(
          templateName: 'rose_colors.dart.tpl',
          fileName: 'core/theme/presets/rose_colors.dart',
        ),
      ],
    ),
    'sidebar': ComponentConfig(
      name: 'sidebar',
      templatePath: 'ui/sidebar',
      dependencies: ['tokens'],
      files: [
        ComponentFile(
          templateName: 'fyarn_sidebar.dart.tpl',
          fileName: 'ui/sidebar/fyarn_sidebar.dart',
        ),
      ],
    ),
    'user': ComponentConfig(
      name: 'user',
      templatePath: 'ui/user',
      dependencies: ['tokens', 'text', 'avatar'],
      files: [
        ComponentFile(
          templateName: 'user_card.dart.tpl',
          fileName: 'ui/user/user_card.dart',
        ),
      ],
    ),
    'trip': ComponentConfig(
      name: 'trip',
      templatePath: 'ui/trip',
      dependencies: ['tokens', 'text', 'card'],
      files: [
        ComponentFile(
          templateName: 'overlay/trip_card.dart.tpl',
          fileName: 'ui/trip/trip_card.dart',
        ),
        ComponentFile(
          templateName: 'footer/trip_card.dart.tpl',
          fileName: 'ui/trip/trip_footer.dart',
        ),
      ],
    ),
    'memory': ComponentConfig(
      name: 'memory',
      templatePath: 'ui/memory',
      dependencies: ['tokens', 'card'],
      files: [
        ComponentFile(
          templateName: 'memory_card.dart.tpl',
          fileName: 'ui/memory/memory_card.dart',
        ),
      ],
    ),
    'trail': ComponentConfig(
      name: 'trail',
      templatePath: 'ui/trail',
      dependencies: ['tokens', 'card'],
      files: [
        ComponentFile(
          templateName: 'trail_card.dart.tpl',
          fileName: 'ui/trail/fyarn_trail.dart',
        ),
      ],
    ),
  };

  static ComponentConfig? getComponent(String name) => _components[name.toLowerCase()];

  static ComponentConfig? getComponentByPath(String path) {
    for (final config in _components.values) {
      if (config.templatePath == path) return config;
    }
    return null;
  }

  static List<String> get availableComponents =>
      _components.keys.toList()..sort();
}
