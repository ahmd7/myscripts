import random
choices=['rock' , 'paper' , 'scissors']
computer=random.choice(choices)
player = input('rock or paper or scissors:  ')
print(f"you choice is {player} and computer choice is {computer} so,..." )
if computer== 'rock':
    if player == 'rock':
        print('draw!')
    elif player == 'paper':
        print('you won!')
    elif player == 'scissors':
        print('you lost!')
    else: print('enter something valid')
elif computer == 'paper':
    if player == 'rock':
        print('you lost!')
    elif player == 'paper':
        print('draw!')
    elif player == 'scissors':
        print('you won!')
    else: print('enter something valid')
else:
    if player == 'rock':
        print('you won!')
    elif player == 'paper':
        print('you lost!')
    elif player == 'scissors':
        print('draw!')
    else: print('enter something valid')