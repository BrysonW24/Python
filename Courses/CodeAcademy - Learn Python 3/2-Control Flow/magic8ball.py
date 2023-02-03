# Magic 8-ball Project
# 16-10-22 Bryson Walter

import random

name = 'Bryson'
question = 'Do I have the flu?'
random_question = random.randint(1,3) 
answer = ''
random_number = random.randint(1,10)
print(random_number)

# Magic 8-Ball Options
if random_number == 1:
  answer = 'Yes - definitely.'
elif random_number == 2:
  answer = 'It is decidedly so.'
elif random_number == 3:
  answer = 'Without a doubt.'
elif random_number == 4:
  answer = 'Reply hazy, try again.'
elif random_number == 5:
  answer = 'Ask again later.'
elif random_number == 6:
  answer = 'Better not tell you now.'
elif random_number == 7:
  answer = 'My sources say no.'
elif random_number == 8:
  answer = 'Outlook not so good.'
elif random_number == 9:
  answer = 'Very doubtful.'
elif random_number == 10:
  answer = 'Signs point to yes!'
else:
  print('Error')

#Printing the name and question
if name == '':
  print('Question:' + question)
else:
  print(name + ' asks: ' + question)

#Printing the Magic 8-Ball's answer
if question == '':
  print('The Magic 8-Ball cannot provide a fortune unless you ask it something.')
else:
  print(name + ' asks: ' + question)
  print('Magic 8-Balls answer: ' + answer)

#Printing the Magic 8-Ball's answer
# print('Magic 8-Balls answer: ' + answer)
