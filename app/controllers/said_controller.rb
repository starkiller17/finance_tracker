class SaidController < ApplicationController
    def test_index

    end

    def check_params
        puts "*" * 100
        puts params[:test_filter]["message"]
        message = params[:test_filter]["message"]
        redirect_to test_index_path(message: message)
    end

end
