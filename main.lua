
function love.load()
  Tile = love.graphics.newImage("plainTile.png");
  Dude = love.graphics.newImage("dude.png");
  success = love.window.setMode( 64*10, 64*10);
  RoundTimer = 0;
  SkelX, SkelY = 0,0;
  MovedFlag = false;
end


function love.update(dt)
    -- We will increase the variable by 1 for every second the key is held down.
  RoundTimer = RoundTimer + dt
  if RoundTimer >= 1 then
    MovedFlag = false;
  end

  print(RoundTimer)
  if love.keyboard.isDown("up") then
      if not MovedFlag then
        SkelY = SkelY - 64;
        MovedFlag = true;
        RoundTimer = 0;
      end
  end

  if love.keyboard.isDown("down") then
      if not MovedFlag then
        SkelY = SkelY + 64;
        MovedFlag = true;
        RoundTimer = 0;
      end
  end

  if love.keyboard.isDown("left") then
      if not MovedFlag then
        SkelX = SkelX - 64;
        MovedFlag = true;
        RoundTimer = 0;
      end
  end
    if love.keyboard.isDown("right") then
        if not MovedFlag then
          SkelX = SkelX + 64
          MovedFlag = true;
          RoundTimer = 0;
        end
    end
end

function love.draw()
  for y = 0, 64*10, 64 do
    for x=0,64*10,64 do
      love.graphics.draw(Tile, x, y)
    end
  end
  love.graphics.draw(Dude, SkelX, SkelY)
  love.graphics.arc( "fill", 120, 120, 64, 0, math.pi*2-((math.pi*2)*RoundTimer), 90 )
end
