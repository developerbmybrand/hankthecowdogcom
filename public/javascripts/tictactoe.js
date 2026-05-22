/* this code was written by William Ganucheau 2010 - @WillyG3 */

$(document).ready(function () {
		
		altTurn = 0;
		userScore = 0;
		compScore = 0;
		
		//changing the level resets the game
		$("input[name='level']").click(function () {
			$(".square").text("");
			userScore = 0;
			compScore = 0;
			$(".user-score").text("Won: " + userScore);
			$(".comp-score").text("Lost: " + compScore);
			$("#winlose").hide();
		});
		
		$("input[id='impossible']").click(function () {
			$(".user-score").text("You: won't win");
		});
		
		//Clicking "play again" resets the board, but not the scores
		$("#play-again").click( function() {
			$(".square").text("");
			$("#winlose").hide();
			++altTurn
			if(altTurn % 2 !== 0) {
				all = ["#one", "#two", "#three", "#four", "#five", "#six", "#seven", "#eight", "#nine"];
				random = Math.floor(Math.random()*11);
				random -= 1;
				$(all[random]).append('<span class="red">O</span>').addClass("picked");
				
			} 
		});
		
		
		win = 0;
		
		//start the main code on click of a square
		$(".square").click(function() {	  
			 
			placed = 0;
			//get the selected level
			lvl = $("input[name='level']:checked").val();
			 
			// if the square is empty, place an "X", otherwise do nothing		 
			if($(this).text() == "") {
				$(this).append('<span class="blue">X</span>').addClass("picked");
			} else { return false; }
			
			//get the ID of the selected element
			userPick = $(this).attr("id");
			
			//select all possible wins that include the user's square
			switch(userPick) {
			
				case "one":
				plays = ["#one #two #three", "#one #four #seven", "#one #five #nine"];
				break;
				
				case 'two':
				plays = ["#one #two #three", "#two #five #eight"];
				break;
				
				case 'three':
				plays = ["#one #two #three", "#three #six #nine", "#three #five #seven"];
				break;
				
				case 'four':
				plays = ["#four #five #six", "#one #four #seven"];
				break;
				
				case 'five':
				plays = ["#four #five #six", "#two #five #eight", "#one #five #nine", "#three #five #seven"];
				break;
				
				case 'six':
				plays = ["#four #five #six", "#three #six #nine"];
				break;
				
				case 'seven':
				plays = ["#seven #eight #nine", "#one #four #seven", "#three #five #seven"];
				break;
				
				case 'eight':
				plays = ["#seven #eight #nine", "#two #five #eight"];
				break;
				
				case 'nine':
				plays = ["#seven #eight #nine", "#three #six #nine", "#one #five #nine"];
				break;
				
			}
			
			switch(lvl) {
			
			//"Impossible" dificulty
			case "Impossible":
				
				//all possible wins assigned to winPlays
				winPlays = ["#one #two #three", "#four #five #six", "#seven #eight #nine", "#one #four #seven", "#two #five #eight", "#three #six #nine", "#one #five #nine", "#three #five #seven"];	
				
				//loop through each possible play
				$.each(winPlays, function(index, value) {
					
					//initiate counter
					i = 0;
					
					//assign each square in the play to squares
					squares = value.split(" ");
					
					//loop through each individual square
					$.each(squares, function(index, sValue) {
						
						//if there is an "O" in the given square, count it
						if($(sValue).text() == "O") {
							++i;
						
						//if there is an "X" bloking, stop looping	
						} else if($(sValue).text() == "X") {
							return false;
						}				
					});
					
					//if 2 "O"'s are found...
					if(i == 2) {
					
						//loop through each individual square unti lyou find an empty one
						$.each(squares, function(index, sValue) {
							if($(sValue).text() == "") {
								
								//and place an "O" on it
								$(sValue).append('<span class="red">O</span>').addClass("picked");
								
								//the computer has made its move for this turn
								placed = 1;
								return false;
							}						
						});
						
						//if the computer has made a move, stop looping
						if(placed == 1) {
							return false;
						}	
					}
				});	
				
				//if computer has not made a move...
				if(placed == 0) {
				
					//cycle through each play
					$.each(plays, function(index, value) {
						
						//initiate counter
						i = 0;
						
						//asssign each individual square to squares
						squares = value.split(" ");
						
						//loop through each individual square
						$.each(squares, function(index, sValue) {
							
							//if an "X" is found, count it
							if($(sValue).text() == "X") {
								++i;
							}
						
						});
						
						//if 2 "X"'s are found
						if(i == 2) {
						
							//loop through each individual square
							$.each(squares, function(index, sValue) {
								
								//if one is found that is empty, place an "O" there
								if($(sValue).text() == "") {
									$(sValue).append('<span class="red">O</span>').addClass("picked");
									
									//the computer has made its move for this turn
									placed = 1;
									return false;
								}
							
							});
							
							//if the computer has played, stop looping
							if(placed == 1) {
								return false;
							}	
						}
						
						
						});
						}
						
						//if the computer has not played, yet
						if(placed == 0) {
						
							//if the users plays in the middle
							if(userPick == "five") {
								
								//force the computer to play on a corner
								plays = ["#one", "#three", "#seven", "#nine"];
								
								//loop through each corner square
								$.each(plays, function(index, value) {
									
									//if one is empty, play it
									if($(value).text() == "") {
										$(value).append('<span class="red">O</span>').addClass("picked");
										
										//the computer has made its move for this turn
										placed = 1;
										return false;
									}
								});
								
							//if the user plays on a corner...
							} else if(userPick == "one" || userPick == "three" || userPick == "seven" || userPick == "nine") {
								
								if($("#five").text() == "") {
								
									//play in the middle
									$("#five").append('<span class="red">O</span>').addClass("picked");
									
									//the computer has made its move for this turn
									placed = 1;
								} else {
								
									plays = ["#two", "#four", "#six", "#eight"];
									
									$.each(plays, function(index, value) {
																				
										if($(value).text() == "") {
											
											//play there
											$(value).append('<span class="red">O</span>').addClass("picked");
											
											//the computer has made its move for this turn
											placed = 1;
											return false;
										}
									});
								
								
								}
							//otherwise
							} else {
								
								//loop through each play
								$.each(plays, function(index, value) {
									
									//assign each individual square to squares
									squares = value.split(" ");
									
									//loop through each individual square
									$.each(squares, function(index, sValue) {
										
										//is given square is empty, play on it
										if($(sValue).text() == "") {
											$(sValue).append('<span class="red">O</span>').addClass("picked");
											
											//the computer has made its move for this turn
											placed = 1;
											return false;
										}
									});	
								
								//if the computer has played, stop looping
								if(placed == 1) {
									return false;
								}
										
								});
							}
						}
				
				
				
			break;
			
			case "Easy":
			
				//initiate an empty string
				string = "";
				
				//assign all possible plays to a string
				$.each(plays, function(index, value) {
					string += value + " ";
				});
				
				//create an array that contains all squares that COULD be involved in a play with the user's square 
				complete = string.split(" ");
				
				//create an array that contains ALL squares on board
				all = ["#one", "#two", "#three", "#four", "#five", "#six", "#seven", "#eight", "#nine"];
				
				//loop through each square in "all"
				$.each(all, function(index, value) {
									
					//if this square could NOT be involved in a play with user's square (if it's not in the ocmplete array)...
					if(jQuery.inArray(value, complete) == -1 && $(value).text() == "") {
					
						//place an "O" there
						$(value).append('<span class="red">O</span>').addClass("picked");
						
						//computer has placed a piece for this turn
						placed = 1;
						return false;
					}
				});
				
				//if the computer has not made a move for his turn....
				if(placed == 0) {
					
					//place an "O" on the first empty square
					$.each(all, function(index, value) {
						if($(value).text() == "") {
							$(value).append('<span class="red">O</span>').addClass("picked");
							return false;
						}
					});
				}
				
			break;	
			
			case "Medium":
				
				//all possible wins assigned to winPlays
				winPlays = ["#one #two #three", "#four #five #six", "#seven #eight #nine", "#one #four #seven", "#two #five #eight", "#three #six #nine", "#one #five #nine", "#three #five #seven"];		
				
				//loop through each possible play
				$.each(winPlays, function(index, value) {
					
					//initiate counter
					i = 0;
					
					//assign each square in the play to squares
					squares = value.split(" ");
					
					//loop through each individual square
					$.each(squares, function(index, sValue) {
						
						//if there is an "O" in the given square, count it
						if($(sValue).text() == "O") {
							++i;
						
						//if there is an "X" bloking, stop looping	
						} else if($(sValue).text() == "X") {
							return false;
						}				
					});
					
					//if 2 "O"'s are found...
					if(i == 2) {
					
						//loop through each individual square unti lyou find an empty one
						$.each(squares, function(index, sValue) {
							if($(sValue).text() == "") {
								
								//and place an "O" on it
								$(sValue).append('<span class="red">O</span>').addClass("picked");
								
								//the computer has made its move for this turn
								placed = 1;
								return false;
							}						
						});
						
						//if the computer has made a move, stop looping
						if(placed == 1) {
							return false;
						}	
					}
				});	
				
				//if computer has not made a move...
				if(placed == 0) {
				
					//cycle through each play
					$.each(plays, function(index, value) {
						
						//initiate counter
						i = 0;
						
						//asssign each individual square to squares
						squares = value.split(" ");
						
						//loop through each individual square
						$.each(squares, function(index, sValue) {
							
							//if an "X" is found, count it
							if($(sValue).text() == "X") {
								++i;
								
							//if an "O" is blocking, stop looping	
							} else if($(sValue).text() == "O") {
								return false;
							}
						
						});
						
						//if 2 "X"'s are found
						if(i == 2) {
						
							//loop through each individual square
							$.each(squares, function(index, sValue) {
								
								//if one is found that is empty, place an "O" there
								if($(sValue).text() == "") {
									$(sValue).append('<span class="red">O</span>').addClass("picked");
									
									//the computer has made its move for this turn
									placed = 1;
									return false;
								}
							
							});
							
							if(placed == 1) {
								return false;
							}	
						}
						
					
					});
					
					//if the computer has not made it's move...
					if(placed == 0) {
					
						all = ["#one", "#two", "#three", "#four", "#five", "#six", "#seven", "#eight", "#nine"];
						
						//place an "O" on the first empty square
						$.each(all, function(index, value) {
							if($(value).text() == "") {
								$(value).append('<span class="red">O</span>').addClass("picked");
								return false;
							}
						});
						
					}
					}
		
				
			break;
			}
			
			win = 0;
			 		
			winPlays = ["#one #two #three", "#four #five #six", "#seven #eight #nine", "#one #four #seven", "#two #five #eight", "#three #six #nine", "#one #five #nine", "#three #five #seven"];	
			 		
			
			 
			 $.each(winPlays, function(index, value) {
			 	squares = value.split(" ");
			 	
			 	x = 0;
			 	
			 	$.each(squares, function(index, sValue) {
			 		if($(sValue).text() == "X") {
			 			++x;
			 		} else { return false; }
			 		
			 	});
			 	
			 	if(x == 3) {
			 		win = 1;
			 		++userScore;
			 		$(".user-score").text("You: " + userScore);
			 		
			 		$(".red").fadeOut();
			 		$("#winlose").removeClass("red").removeClass("green").addClass("blue").hide().fadeIn().text("YOU WIN!");
			 		
			 		return false;
			 	} 
			 	
			 });
			 
			 if(win == 0) {
				 $.each(winPlays, function(index, value) {
				 	squares = value.split(" ");
				 	
				 	o = 0;
				 	
				 	$.each(squares, function(index, sValue) {
				 		 if($(sValue).text() == "O") {
				 			++o;
				 		} else { return false; }
				 		
				 	});
				 	
				 	
				 	if(o == 3) {
				 		win = 1;
				 		++compScore;
				 		$(".comp-score").text("Lost: " + compScore);
				 		
				 		$(".blue").fadeOut();
				 		$("#winlose").removeClass("blue").removeClass("green").addClass("red").hide().fadeIn().text("YOU LOSE! TRY AGAIN.");
				 		
				 		return false;
				 	}
				 });
			}
			
			if(win == 0) {	 
			 				
				tie = 0;
				all = ["#one", "#two", "#three", "#four", "#five", "#six", "#seven", "#eight", "#nine"];
				
				$.each(all, function(index, value) {
					if($(value).text() == "") {
						return false;
					} else {
					 ++tie;
					}
				});
				
				if(tie == 9) {
					$("#winlose").removeClass("blue").removeClass("red").addClass("green").hide().fadeIn().text("STALEMATE!");
				}
			}		
		});	
		
	});