class AuthenticationController < ApplicationController
    def signup
        render json: { token: 'ok' }
    end
end