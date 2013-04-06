class SearchesController < ApplicationController
  # GET /searches
  # GET /searches.json
  def index
    @content=params[:search_text]
    ary = Array.new
    returnAry = Array.new
    if @content!=nil
      for i in 0..@content.length()
        for j in i..@content.length()
          if @content[i,j].length()>1 and !(ary.include?(@content[i,j]))
            ary.push(@content[i,j])
          end
        end
      end
    end

    file = File.new(Rails.public_path+"/dic.txt", "r")
    while (line = file.gets)
      if ary.include?(line.strip! || line)
        returnAry.push(line.strip! || line)
      end
    end
    file.close
    if(returnAry.length()!=0)
      @content = returnAry
    else
      @content = "No Matching"
    end
  end

end
