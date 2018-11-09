class StaticsController < ApplicationController
  def press
    add_breadcrumb 'Espace presse'
  end

  def about
    add_breadcrumb 'Qui sommes-nous ?'
  end

  def legals
    add_breadcrumb 'Conditions générales d’utilisation'
  end

  def privacy
    add_breadcrumb 'Confidentialité'
  end
end