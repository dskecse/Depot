class ApplicationController < ActionController::Base
  self.responder = ApplicationResponder
  respond_to :html

  protect_from_forgery

  before_filter :authenticate_user!
  before_filter :set_i18n_locale_from_params

  rescue_from ActiveRecord::RecordNotFound, with: :handle_invalid_resource

  rescue_from CanCan::AccessDenied do |exception|
    redirect_to root_url, alert: exception.message
  end

  protected

    def handle_invalid_resource
      resource_name = params[:controller].singularize.split('_').join(' ')
      logger.error "Attempt to access invalid #{ resource_name } #{ params[:id] }"
      redirect_to root_url, alert: "Invalid #{ resource_name }"
    end

    def set_i18n_locale_from_params
      if params[:locale]
        if I18n.available_locales.include?(params[:locale].to_sym)
          I18n.locale = params[:locale]
        else
          flash.now[:notice] = "#{ params[:locale] } translation not available"
          logger.error flash.now[:notice]
        end
      end
    end

    def default_url_options
      { locale: I18n.locale }
    end

  private

    def current_cart
      Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
      cart = Cart.create(user: current_user)
      session[:cart_id] = cart.id
      cart
    end
end
