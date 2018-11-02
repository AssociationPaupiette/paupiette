class ApplicationController < ActionController::Base
  include DevisePermittedParams
  add_breadcrumb 'Paupiette', :root_path
end
