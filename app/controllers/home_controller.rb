class HomeController < ApplicationController

    require 'rest-client'
    require 'json'
  
    URI = "https://servicepros-test-api.herokuapp.com/api/v1/books"


    def index      
        @filtered_books = get_all_books
    end

    def search_books     
        @filtered_books = []
        puts params

        if !params["search_field"].empty?
            search_by_title(params["search_option"],params["search_field"])           
        else
            @filtered_books = get_all_books
        end

        render "index"
    end

    private
    def get_all_books
        response = RestClient.get URI
        JSON.parse(response)
    end

    def search_by_title(option, keyword)
        books = get_all_books
        @filtered_books = books.filter {|book| book[option].downcase.include? keyword.downcase }   
        puts @filtered_books     
    end


end
