class StaticsController < ApplicationController
  def press
    add_breadcrumb t('menu.about.press')
  end

  def who
    add_breadcrumb t('menu.about.who')
  end

  def terms
    add_breadcrumb t('menu.legal.terms')
  end

  def privacy
    add_breadcrumb t('menu.legal.privacy')
  end
end