class PostcodeZonesHooks < Spree::ThemeSupport::HookListener

  insert_after :admin_configurations_menu do
    "<%= configurations_menu_item(I18n.t('postcode_lists'), admin_postcode_lists_url, I18n.t('manage_postcodes')) %>"
  end

end
