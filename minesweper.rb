puts "My Minesweper"
$a=[]
$arr_2d = Array.new(5){Array.new(5,0)}
$score=0
$game_on=true
def board
i=0
j=0
k=1
while i<5
  while j<5
    $arr_2d[i][j]=k
     j+=1
     k+=1
   end
   i+=1
   j=0
 end
end

def display
  i=0
  j=0
  while i<5
    while j<5
    if  $arr_2d[i][j] <10
    print  "0#{$arr_2d[i][j]}"
  else
    print  $arr_2d[i][j]
  end
    print " "
       j+=1
     end
     puts " "
     i+=1
     j=0
   end
  end




  def making_bomb

  $bomb=[]
   j=0
  while j<7
   $bomb[j]=rand(3..23)
    j+=1
   end
 u=$bomb.uniq
 if $bomb.length > u.length
 common_rand_ele=true
 end

 if common_rand_ele==true
   making_bomb
 else
   return $bomb
 end

end

 def game(choice)
   i=0
if choice==99
  puts "Game Over /Disqualified"
 $score=0
  $game_on=false
end
   while i<$bomb.length
   if $bomb[i]==choice
   is_a_bomb=true

   end
  i+=1
end

j=0
k=0
while j<5
  while k<5
    if $arr_2d[j][k]==choice && is_a_bomb==true
      $arr_2d[j][k]=0
      $game_on=false
      puts "Game over"
    elsif $arr_2d[j][k]==choice && $game_on==true
        $arr_2d[j][k]=99
      $score+=1

    end
    k+=1
  end
  j+=1
  k=0
end
display
puts "Your Score Now #{$score}"

end

board
display
making_bomb

while $game_on==true

#print $bomb
puts "Predict a safe Number from the Matrix(Don't choose 99 as its marked as safe point,if choosed game over): "
choices=Integer(gets)
game(choices)
end
