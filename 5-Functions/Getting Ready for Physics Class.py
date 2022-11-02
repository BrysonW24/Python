# Functions Project - Getting Ready for Physics Class
# Bryson Walter 
# 02-11-22

# https://www.codecademy.com/courses/learn-python-3/projects/physics-class

Getting Ready for Physics Class
You are a physics teacher preparing for the upcoming semester. 
You want to provide your students with some functions that will help them calculate some fundamental physical properties.
If you get stuck during this project or would like to see an experienced developer work through it, click “Get Unstuck“ to see a project walkthrough video.

----------------------

#CODE

# Write your code below: 

# Uncomment this when you reach the "Use the Force" section
train_mass = 22680
train_acceleration = 10
train_distance = 100
bomb_mass = 1


# Write your code below: 
def f_to_c(f_temp, c_temp):
  c_temp = (f_temp - 32) * 5/9
  return c_temp

# def f_to_c(f_temp):
#   return (f_temp - 32) * 5/9

f100_in_celsius = f_to_c(100, 0)
print(f100_in_celsius)

def c_to_f(c_temp, f_temp):
  f_temp = c_temp * (9/5) + 32
  return f_temp

# def c_to_f(c_temp):
#   return (c_temp - 32) * 5/9

c0_in_fahrenheit = c_to_f(0, 100)
print(c0_in_fahrenheit)

def get_force(mass, acceleration):
  return mass * acceleration

train_force = get_force(train_mass, train_acceleration)
print(train_force)

print('The GE train supplies ' + str(train_force) + ' Newtons of force')

def get_energy(mass, c = 3*10**8): # c = 3 x 10^8
  return mass * c**2

bomb_energy = get_energy(bomb_mass)
print(bomb_energy)

print('A 1kg bomb supplies ' + str(bomb_energy) + ' Joules')

def get_work(mass, acceleration, distance):
  return get_force(train_mass, train_acceleration) * distance

train_work = get_work(train_mass, train_acceleration, train_distance)
print(train_work)

print('The GE train does ' + str(train_work) + ' Joules of work over ' + str(train_distance) + ' meters')

--------------------------------

**OUTPUT**

37.77777777777778
32.0
226800
The GE train supplies 226800 Newtons of force
90000000000000000
A 1kg bomb supplies 90000000000000000 Joules
22680000
The GE train does 22680000 Joules of work over 100 meters
