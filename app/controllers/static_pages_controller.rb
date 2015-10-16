class StaticPagesController < ApplicationController

  def landing 
  end 

  def mission_statement_pdf
    pdf_filename = File.join(Rails.root, "assets/pdfs/mission.pdf")
    send_file(File.join(Rails.root, 'app/assets/pdfs/mission.pdf'), :disposition => 'inline')
  end 

  def team 
  end
  
end
