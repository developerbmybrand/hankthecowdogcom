class GamesController < ApplicationController
  layout 'pages'
  
  def dogage
  end
  
  def lightsoff
  end
  
  def memory
    @cards = get_memory_game_cards
  end
  
  def reaction
  end
  
  def tictactoe
  end
  
  def whackacoyote
  end

  def closet
  end

  def seedspit
  end

  private
  
  def get_memory_game_cards
    return_cards = []
    cardtype_count = [0,0,0,0,0,0,0,0,0,0,0,0,0]
    
    (1..36).each do |i|
      card_selected = false
      
      while(!card_selected)
        
        c = Random.rand(13)
        if c > 0          
          if cardtype_count[c] < 3
            
            current_card = c
            cardtype_count[c] += 1
            card_selected = true
            
          end
        end
      end
      
      return_cards << c
      
    end
    return_cards
  end  
  
end
