function blackjack(numDeck)
%BLACKJACK is the main function. It has one input, numDeck, and no output
%This function uses the local function to deal the cards to the player and
%the dealer, asks the user to hit or stand, displays the current cards to
%the users, calculates the corresponding scores, and determines the winner

%{
Morgan Ivey

    Revision History
    -----------------------
    Date: 07/27/2017

    Version 1: This function plays the casino game Blackjack, by creating a
    main function (blackjack function) and several local functions which the
    main function uses (initdeck, shuffle, dealcard, calcscore, printcard).
    the functions use card structure(s) to create the deck(s),  deal
    cards,shuffle the cards, print cards to the user, calculate scores, and
    determine winners/losers.

    Focus:Functions, Structures

    Status:07/27/2017, Works
%}


%check input of function, ensure input is only one. If it is one, ensure
%it is a single, positive, integer value. If it is not, produce an error
if nargin <1
    error('Not enough input arguements');
elseif nargin > 1
    error('Too many input arguements')
else
    if ~(round(numDeck)==numDeck)
        error('Input must be an integer value');
    elseif (numDeck<0)
        error('Input must be positive');
    elseif ~(isscalar(numDeck))
        error('Input must be a scalar')
    end
end
%Create the deck(s), using local function initdeck, input being the number
%of decks the user created and output is the structure array of cards
numCards = initdeck(numDeck);
%Shuffle the deck(s), using local function shuffDeck, input is the
%structure array of cards to shuffle, output is the shuffled deck
shuffDeck = shuffle(numCards);
%set num_player=1, to keep track of number of cards for the player, and
%increase by one each time before you deal another card (used as the index
%for which card is being dealt
num_player =1;
%deal two cards to the player's hand
%deal first card to the player?s hand
[dealtCard_p(num_player), dealtRemoved] = dealcard(shuffDeck); %removing same card
%deal second card to player's hand, increasing number of cards by 1 for
%player
num_player = num_player +1;
[dealtCard_p(num_player), dealtRemoved] = dealcard(dealtRemoved);
%Deal two cards to the dealer?s hand, keeping track of number of cards for
%the dealer
num_dealer = 1;
[dealtCard_d(num_dealer), dealtRemoved] = dealcard(dealtRemoved);
num_dealer = num_dealer + 1;
[dealtCard_d(num_dealer), dealtRemoved] = dealcard(dealtRemoved);
%calculate player and dealers score using local function calcscore and the
%input depending on the two cards dealt to each
player_score = calcscore(dealtCard_p);
dealer_score = calcscore(dealtCard_d);
%Print the cards for the player using disp and local function printcard
disp('The player has: ');
printcard(dealtCard_p)
%Print the score for the player
disp(strcat('Player score: ', num2str(player_score)));
%Print the first card for the dealer
disp('Dealer showing: ');
printcard(dealtCard_d(1));

%determine if anyone has reached blackjack. annouce winner and use 'return'
%to end function
if (player_score == 21) && (dealer_score ~= 21)
    disp('Blackjack! Player wins! Dealer loses!');
    return
elseif (player_score < 21) && (dealer_score == 21)
    disp('Blackjack! Dealer wins! Player loses!');
    return
%determine if there was a push (if player and dealers cards add up to 21,
%which also implies that both are less than 21, or if the scores are
%equal). annouce push and use 'return' to end function
elseif ((player_score + dealer_score) == 21) || (player_score == dealer_score)
    disp('Push! No one wins!');
    return
%if no one has reached blackjack or push, ask player to hit or stand
else
    dum_hit = true;
    while dum_hit
        disp('Choose from the following:');
        disp('     1) Hit');
        disp('     2) Stand');
        hit_stand = input('Choose: ');
        %Player hits
        if hit_stand == 1 
            dum_hit = false;
            %increase # of cards in players hand by 1, and deal a card to
            %player (update # of cards player has)
            num_player = num_player + 1; 
            [dealtCard_p(num_player), dealtRemoved] = dealcard(dealtRemoved);
            %Print the card that was dealt
            fprintf('Player was dealt: %s of %s\n',...
                char(dealtCard_p(num_player).Value),...
                char(dealtCard_p(num_player).Suit));            
            %update/calculate and display players score
            player_score = calcscore(dealtCard_p);
            disp(strcat('Player score: ', num2str(player_score)));
            %If the player?s score is above 21, they lose. It is a Bust.
            %Announce the winner and end the function using return
            if player_score > 21
                disp('Bust! Dealer wins! Player loses!');
                return
            %If the player?s score is 21 or below, and they have 5 cards,
            %they win. It is a Charlie. Announce the
            %winner and end the function
            elseif (player_score <=21) && (num_player == 5)
                disp('Charlie! Player wins! Dealer loses!');
                return
                %If the player?s score is 21 or below and they have less
                %than 5 cards, ask the player to hit or stand again,
                %setting dum_hit to true to go back to the while loop
            elseif (player_score <=21) && (num_player < 5)
                dum_hit = true;
                disp('Player has: ');
                printcard(dealtCard_p)
            end
        %player stands
        elseif hit_stand == 2 
            %Print both of the dealers cards
            disp('Dealer has: ');
                 printcard(dealtCard_d);
                 %Print the dealer?s score
                 disp(strcat('Dealers score: ', num2str(dealer_score)));
            dum_hit = false;
            dum_dealer = true;
            %loop for if dealers score is less than 17, keep hitting
            while dum_dealer 
                %if dealers score is less than 17, Hit.
                if dealer_score < 17
                    dum_dealer = false;
                    %deal the dealer a card
                    num_dealer = num_dealer + 1;
                    [dealtCard_d(num_dealer), dealtRemoved] = dealcard(dealtRemoved);
                    %Print the card that was dealt
                    fprintf('Dealer was dealt: %s of %s\n',...
                        char(dealtCard_d(num_dealer).Value),...
                        char(dealtCard_d(num_dealer).Suit));
                    %calculate and display dealers new score
                    dealer_score = calcscore(dealtCard_d);
                    disp(strcat('Dealer score: ', num2str(dealer_score)));
                    %If the dealers score is above 21, they lose. Announce
                    %the winner and end the function using return
                    if dealer_score > 21
                        disp('Bust! Player wins! Dealer loses!');
                        return
                    %If the dealers score is 21 or below, and they have 5
                    %cards, they win. Announce the winner and end the function
                    elseif dealer_score <= 21 && num_dealer == 5
                        disp('Dealer wins! Player loses!');
                        return
                    %If the dealers score is 21 or below and they have
                    %less than 5 cards, then loop back to determine if
                    %dealer new score is less than 17, and repeat
                    elseif dealer_score <=21 && num_dealer < 5
                        dum_dealer = true;
                        %display what dealer has
                        disp('Dealer has: '); 
                        printcard(dealtCard_d);
                    end
                %Dealer must stand
                elseif dealer_score >= 17 
                    dum_dealer = false;
                    %if dealers and players score are 21 or under, but not
                    %equal, then the higher score wins the game. Announce
                    %winner/loser and end the function
                    if dealer_score<=21 && player_score<=21 && dealer_score~=player_score
                        if dealer_score > player_score
                            disp('Dealer wins! Player loses!');
                            return
                        elseif dealer_score < player_score
                            disp('Player wins! Dealer loses');
                            return
                        end
                    %if the dealers score equals the players score, no one
                    %wins, it is a push
                    elseif dealer_score == player_score
                        disp('Push! No one wins!');
                        return
                    end
                end                    
            end      
        else
            disp('Invalid Choice!');  
        end
    end
end
end


function numCards = initdeck(numDeck)
%INITDECK function: this function has one input and one output
%input: number of decks the function will create
%output: structure array of cards, dependent on the number of decks to
%create. 
%Function creates a card structure with correct values for suits, value,
%and number in a standard 52 card deck. Then, it replicates the deck the
%number of times the user chooses for the input in the main blackjack
%function

%check the input, check if input is one value
if nargin <1
    error('Not enough input arguements');
elseif nargin > 1
    error('Too many input arguements')
    %check if input is single, positive, integer value. return error if not
else
    if ~(round(numDeck)==numDeck)
        error('Input must be an integer value');
    elseif (numDeck<0)
        error('Input must be positive');
    elseif ~(isscalar(numDeck))
        error('Input must be a scalar')
    end
end
%create a single card structure with fields: suit, value, number
Card = struct('Suit', [], 'Value', [], 'Number', []);
%replicate card structure 'Card' 52 times to form a single deck using repmat
SingleDeck = repmat(Card, 1, 52);
%define array of all suit names and values for the card
suit_names = {'Hearts', 'Diamonds', 'Clubs', 'Spades'};
value = {'Ace','2','3','4','5','6','7','8','9','10','Jack','Queen','King'};
%fill each card with the correct values for suit, value, and number
%for the first 13 cards, fill the Suit field with the array suit_names(1), 
%which is 'Hearts'. Fill the Value with the corresponding value (from 1 to 13) of
%the array value. 
%If the index is greater than 10 (Jack-King), the Number value is 10. If
%the index is 1 (Ace) the Number value is 11, the other indices (2-10) have
%values equal to the index value (2-10)
for j = 1:13
    SingleDeck(j).Suit = suit_names(1);
    SingleDeck(j).Value = value(j);
    if j>10
        SingleDeck(j).Number = 10;
    elseif j == 1
        SingleDeck(j).Number = 11;
    else
        SingleDeck(j).Number = j;
    end
end
%Same logic applies for the next suit. cards 14-26 have Suit name
%'Diamonds'. The Value is the index minus 13.
%the Number value is 10 for indices greater than 23 (jack-king), 11 for
%index 14 (Ace), and the other indices (15-23) have values equal to the
%index minus 13.
for j = 14:26 
    SingleDeck(j).Suit = suit_names(2);
    SingleDeck(j).Value = value(j-13);
    if j>23
        SingleDeck(j).Number = 10;
    elseif j == 14
        SingleDeck(j).Number = 11;
    else 
        SingleDeck(j).Number = j-13;
    end
end
%same logic applies for the next suit. the index is from 27:39. The Value
%is the index minus 26. Indices greater than 36 are Jack-King, 27 is Ace,
%28-36 have Number values of index - 26
for j = 27:39 
    SingleDeck(j).Suit = suit_names(3);
    SingleDeck(j).Value = value(j-26);
    if j>36
        SingleDeck(j).Number = 10;
    elseif j == 27
        SingleDeck(j).Number = 11;
    else 
        SingleDeck(j).Number = j-26;
    end
end
%same logic applies. Value is index-39. Indices greater than 49 are
%Jack-King, index 40 is Ace, indices 41-49 are the index minus 39
for j = 40:52
    SingleDeck(j).Suit = suit_names(4);
    SingleDeck(j).Value = value(j-39);
    if j>49
        SingleDeck(j).Number = 10;
    elseif j == 40
        SingleDeck(j).Number = 11;
    else 
        SingleDeck(j).Number = j-39;
    end
end
%replicate the card structure array SingleDeck the number of times of
%numDeck, specified by the user in the main blackjack function, using
%repmat. this new card structure array numCards is the output
numCards = repmat(SingleDeck,1,numDeck);
end
  
  
function shuffDeck = shuffle(numCards)
%SHUFFLE function has one input and one output. It takes the the input, numCards (the
%deck(s) of cards you want to shuffle, and outputs shuffDeck, the
%shuffled deck. 

%check the input, check if input is one value
if nargin <1
    error('Not enough input arguements');
elseif nargin > 1
    error('Too many input arguements')
end
%if the input is one, check to see if the input has at least 52 elements.
%return error if not
if nargin == 1
    if length(numCards) < 52
        error('Input must be at least 52 cards');
        %check if input is structure, if not return error
    elseif isstruct(numCards) == 0
        error('Input must be a structure');
    end
end
%repeat 3000 times
    for i = 1:3000
        %create two random integers with max value equal to number of
        %elements of the card structure array numCards using length and
        %randi
        int_one = randi(length(numCards));
        int_two = randi(length(numCards));
        %swap the cards at these two random integer indexes 
        temp_val = numCards(int_one);
        numCards(int_one) = numCards(int_two);
        numCards(int_two) = temp_val;
    end
%return the output shuffDeck as the shuffled deck from numCards
shuffDeck = numCards;
end

function [dealtCard, dealtRemoved] = dealcard(shuffDeck)
%DEALCARD function takes one input, the shuffled card structure array
%(deck), and outputs the card that is dealt (dealCard) and the card
%structure array with the card dealt removed (dealtRemoved).

%check is input is only one, and if it is a structure array
if nargin == 1
    if isstruct(shuffDeck) == 0
        error('Input must be a structure');
    end
end
%create new deck (dealtRemoved) equal to the shuffled deck (shuffDeck)
dealtRemoved = shuffDeck;
%deal/get the first card by assigning dealtCard to the first row of the deck dealtRemoved 
dealtCard = dealtRemoved(1);
%delete the first card from the deck by using empty brackets, and
%dealtRemoved is the output with the dealt card removed
dealtRemoved(1) = [];
end
     
function score = calcscore(dealtCard)
%CALCSCORE function takes the input card structure array (that the dealer
%or player has), calculates the score of either the dealer or player, and
%outputs a single integer value, which is the total value of the structure
%array

%check the input, check if it is a structure array
if nargin ==1
    if ~(isstruct(dealtCard))
        error('Input must be a structure array');
    end
end
%set raw_score equal to the sum of all the numbers in the dealtCard
%structure, use sum function and [] since it is a structure, and the values
%are doubles
raw_score = sum([dealtCard.Number]);
%set number of aces equal to zero for the begining
num_aces = 0;
%calculate the number of Aces in the hand using a for loop. index is from 1
%to the how many cards there are (length of dealtCard), and if the Number
%is 11, which means it is an Ace, then increase the number of aces
%(num_ace) by 1
for i = 1:length(dealtCard)
    if dealtCard(i).Number == 11
        num_aces = num_aces + 1;
    end
end
%if the score is above 21 and number of aces is at least 1, decrease the
%raw score by 10 and number of aces by 1 until either raw score is 21 or
%below or number of aces is less than one. Use while loop to decrease raw
%score by 10 and num_aces by 1 while raw_score is greater than 21 and
%num_aces is greater or equal to 1. 
while(raw_score>21) && (num_aces>=1)
    raw_score = raw_score - 10;
    num_aces = num_aces - 1;
end
%set score equal to the raw_score with the changes above
score = raw_score;
end

function [] = printcard(dealtCard)
%PRINTCARD function takes one input, a single card structure (dealtCard), 
%and prints the card's value and suit using fprintf.
%check if input is only one and a single card structure
if nargin ~= 1
    error('Input must be a single card structure');
end
if ~(isstruct(dealtCard))
    error('Input must be a card structure');
end
%Use for loop with index from 1 to number of cards that the dealer or
%player has (using length(dealtCard)), to fprintf each card that the dealer
%has. Use fprintf with %s and convert the indexed Value and Suit to a character 
for i = 1:length(dealtCard)
    fprintf('%s of %s\n', char(dealtCard(i).Value), char(dealtCard(i).Suit));
end
end
