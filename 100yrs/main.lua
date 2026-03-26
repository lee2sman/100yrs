require 'L5'
places = {'here','there','home','away','heaven','hell','the desert','the sea','the fell','cradle','grave','holiday','mountain','forest','forgotten land','wasteland','the ignored','school','fallout zone','no fear','freaks','the south','nightmares','a feast','the hearth','nowhere in particular'}
function setup()
  fullscreen()
  frameRate(1)
  --background(random(255), random(255), random(255))
  background(random(127,255))
end
function draw()
  --background(random(255), random(255), random(255))
  local place1 = random(places) 
  local place2 = random(places) 

  local x1,y1,x2,y2 = random(50,width-50),random(50,height-50),random(50,width-50),random(50,height-50)

  stroke(random(255), random(255), random(255))
  strokeWeight(random(2,10))
  line(x1,y1,x2,y2)
  --fill(random(255), random(255), random(255))
  fill(0)
  textSize(random(20,50))
  text(place1,x1,y1)
  --fill(random(255), random(255), random(255))
  textSize(random(20,50))
  text(place2,x2,y2)

  if random() < 0.05 then
    background(random(127,255))
    --background(random(255), random(255), random(255))
    text('Not '..random(places),x1,y1)
  end

end
