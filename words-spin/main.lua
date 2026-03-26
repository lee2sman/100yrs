require 'L5'

points = {}
numPoints = 8
tree = {}
visited = {}

local words = {'sneaking','along','path','doorway','desire','deliver','domain','dense','deconstruct','delve','damp','roots','wander','echo'}

function setup()
  size(800, 600)
  windowTitle('100 years postcard - edition')
  imageMode(CENTER)

  -- Background image
  img = loadImage('radio.jpg')

  -- Generate random points
  for i = 1, numPoints do
    points[i] = {
      x = random(0, width),
      y = random(0, height)
    }
  end

  buildMST()
  frameRate(0.3)
end

function buildMST()
  visited[1] = true
  local numVisited = 1

  while numVisited < numPoints do
    local minDist = math.huge
    local minEdge = nil

    for i = 1, numPoints do
      if visited[i] then
        for j = 1, numPoints do
          if not visited[j] then
            local d = dist(points[i].x, points[i].y, points[j].x, points[j].y)
            if d < minDist then
              minDist = d
              minEdge = {from = i, to = j, dist = d}
            end
          end
        end
      end
    end

    if minEdge then
      table.insert(tree, minEdge)
      visited[minEdge.to] = true
      numVisited = numVisited + 1
    else
      break
    end
  end
end

function draw()
  --background('skyblue')
  if random()<0.1 then
    background(0,0,random(255))
  end
  -- Generate random points
  for i = 1, numPoints do
    points[i] = {
      x = random(0, width),
      y = random(0, height)
    }
  end

  buildMST()

  -- img
  push()
    translate(random(width),random(height))
    image(img, 0, 0, width, height)
    tint(255,255)
    for i=1,8 do
      translate(random(-50,50),random(-50,50))
      image(img, 0, 0, width, height)
      tint(255,127)
    end
  pop()

  -- Draw MST edges
  stroke(255, 255, 255, 160)
  strokeWeight(2)
  for _, edge in ipairs(tree) do
    local p1 = points[edge.from]
    local p2 = points[edge.to]
    line(p1.x, p1.y, p2.x, p2.y)
  end

  -- Draw words at each point
  local f = loadFont('xxqueen.ttf')
  textFont(f)
  textSize(68)
  noStroke()

  for i, point in ipairs(points) do
    push()
    translate(point.x, point.y)
    rotate(radians(random(360)))
    fill(floor(random(2))*255)
    text(words[i] or words[1], 0, 0)
    pop()
  end

  -- Draw nodes
  noStroke()
  fill(255, 255, 255, 180)
  for _, point in ipairs(points) do
    circle(point.x, point.y, 8)
  end
  --noLoop()
end
