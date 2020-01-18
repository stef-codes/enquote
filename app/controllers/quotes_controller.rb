class QuotesController < ApplicationController
    before_action :authenticate_user!

    def index
        # binding.pry

        if params[:search]
          @quotes = current_user.quotes.searched(params[:search])
        elsif params[:book_id]
          book = current_user.books.find_by(id: params[:book_id])
          if book
            @quotes = book.quotes  
          else
            redirect_to books_path
          end 
        else
          @quotes = current_user.quotes
        end
    end
    
      def show
    
        @quote = current_user.quotes.find_by(id: params[:id])
      end
    
      def new
        @quote = current_user.quotes.build
      end
    
      def create
        @quote = current_user.quotes.build(quote_params)
    
        if @quote.save
          redirect_to @quote
        else
          render :new
        end
      end
    
      def edit
        @quote = current_user.quotes.find_by(id: params[:id])
      end
    
      def update
        @quote = current_user.quotes.find_by(id: params[:id])
    
        @quote.update(quote_params)
    
        if @quote.save
          redirect_to @quote
        else
          render :edit
        end
      end
    
      def destroy
        @quote = current_user.quotes.find_by(id: params[:id])
        @quote.destroy
        flash[:notice] = "quote deleted."
        redirect_to quotes_path
      end
    
      private
    
      def quote_params
        params.require(:quote).permit(:content, :user_id, :book_id, book_attributes: [:name, :author])
      end

end
