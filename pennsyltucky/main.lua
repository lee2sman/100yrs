require 'L5'
local description = {'wayward','between','edge','if','almost','ever','never','neither','yet','often','and','else','nowhere','somewhere','remembered','hinted','forgot','scavenged','searching','silent','stolen','stealing','explored','unknowing','event','swaying','open','elements','unarranged'}
local bgTimer = 0
local timer_change = 1000
local each_img = {}
local current_word 

function setup()
  fullscreen()
  imageMode(CENTER)
  rand_x = random(width)
  rand_y = random(height)
  bg = loadImage("bg.jpg")
  current_word = random(description)
  textAlign(CENTER,CENTER)
  textSize(68)

  img = {}
  for i = 1, 20 do
    img[i]=loadImage("assets/"..i..".png")
  end
  for i = 1,5 do
    each_img[i]={}
  end
  change_params()

  --music = love.audio.newSource("music.mp3", "stream")
  --music:setLooping(true)
  --music:play()
  fill(255,127)
end

function draw()
  --centered, spinning
  background(0)
  push()
  translate(width/2,height/2)
  rotate(radians(bgTimer + millis()/300))
  tint(255,127)
  image(bg, 0,0,2*width,2*height) 
  pop()
  tint(255,200)
  for i= 1,#each_img do

    fill(255,255,255,each_img[i].a) 
    push()
    translate(each_img[i].x,each_img[i].y)
    rotate( each_img[i].dir * radians(millis()/300 + each_img[i].t))
    image(each_img[i].n,0,0,width/2,height/2)
    pop()
  end


  fill(255)
  text(current_word, width - 350, height - 350)
  fill(0)
  text(current_word, width - 348, height - 349)

  if millis() > timer_change then
    change_params()
    timer_change=millis()+math.random(2000,5000)
  end
end

function keyPressed()
  change_params()

  if key == "escape" or key == "q" then 
    exit() 
  end
end

function change_params()
  current_word = random(description)
    
  bgTimer = random(360)
  for i = 1,#each_img do
    each_img[i].n=random(img)
    each_img[i].x=random(width)
    each_img[i].y=random(width)
    each_img[i].t=random(20,60)
    each_img[i].a=random()
    if random()<0.5 then
      each_img[i].dir=1
    else
      each_img[i].dir=-1
    end
  end
end
