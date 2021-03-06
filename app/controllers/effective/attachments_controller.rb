module Effective
  class AttachmentsController < ApplicationController
    skip_authorization_check if defined?(CanCan)
    respond_to :json

    def show
      @asset = Effective::Asset.find(params[:id]) # This should actually search Assets

      EffectiveAssets.authorized?(self, :read, @asset)

      respond_with @asset
    end
  end
end
