class My::ApplicationController < ApplicationController
  add_breadcrumb I18n.t('menu.my.name'), :my_root_path

  def index
    redirect_to :my_messages
  end
end
