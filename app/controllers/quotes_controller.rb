class QuotesController < ApplicationController
    before_action :authenticate_user!

    def search 
    end

    def index
        #  binding.pry

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
        # def new       
        #   @topic = Topic.find_by(id: params[:topic_id]) 
        #        @entry = current_user.entries.build    
        #       end 
         # if the nested new quote for a book with book id 
        #  params[:book_id]
        # if params[:book_id]
        # @book = Book.find_by(id: params[:id])
        #   @book = Book.find_by(id: params[:book_id])
        # end
          
        #   @quote = current_user.quotes.books.find_by(id: params[:book_id].build
        #else
        
          @quote = current_user.quotes.build(book_id: params[:book_id])
      
      end
    
      def create
        # if the nested new quote for a book with book id 
        # .build for that with the connection. (Put connection in to build_book_quote or AR association for that)
        #else what I have that ya'll don't like
        # @quote = current_user.quotes.books.find_by(id: params[:book_id].build(quote_params)
        
        # def create      
        #   @topic = Topic.find_by(id: params[:topic_id])
        #     @entry = current_user.entries.build(entry_params)
        #          @entry.topic = @topic     
        #         if @entry.save
        #     redirect_to topic_entry_path(@entry.topic, @entry)      
        #    else          
        #     render :new       
        #   end     
        # end
        # @book = Book.find_by(id: params[:id])
        # if params[:book_id]
        # end
        @quote = current_user.quotes.build(quote_params)
          # binding.pry
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
