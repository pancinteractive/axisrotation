-- simple rotation around an axis with both touch and enterFrame listeners

		local t = 1
		local r = 80
		local numPoints = 5
		local xCenter = 200
		local yCenter = 200
		local radius = 80
		local rG = 1 -- starting amount of rotation
		local rotG = 5.5 -- rate at which objects will rotate
		local angleStep = 2 * math.pi / numPoints
		local group1 = display.newGroup()
		local group = display.newGroup()
		local t = {}
		
		local circle = {}
		for i = 1, numPoints do
			circle[i] = display.newRect(0, 0, 10,10)
			circle[i].x = xCenter + radius*math.cos(i*angleStep)
			circle[i].y = yCenter + radius*math.sin(i*angleStep)
			group1:insert( circle[i] )
		end
		circle[2]:setFillColor(1,0,0)
		circle[2].width = 40
		circle[2].height = 40
		
		group:insert( group1 )
		
		group1.x = display.contentCenterX
		group1.y = display.contentCenterY
		
		local function onUpdate( event )
		
			print("event.y = "..event.y)
			for i = 1, numPoints do
				t[i] = (event.y * .014)+ (i*angleStep)
				circle[i].x = (r * math.cos(t[i]))+50 
				circle[i].y = (r * math.sin(t[i]))+200
			print("circle["..i.."].x = "..circle[i].x)
			print("circle["..i.."].y = "..circle[i].y)
			end
		end
		
		local function onSpin( )
			rG = rG+rotG
			for i = 1, numPoints do
				t[i] = ((rG) * .014)+ (i*angleStep)
				circle[i].x = (r * math.cos(t[i]))+50 
				circle[i].y = (r * math.sin(t[i]))+200
			print("circle["..i.."].x = "..circle[i].x)
			print("circle["..i.."].y = "..circle[i].y)
			end
			if rG >= 450 then
				rG = 1
			end
		end
		
		--Runtime:addEventListener( "touch", onUpdate )
		Runtime:addEventListener( "enterFrame", onSpin )

-----------------------------------------

-- staggered rotation of objects around an axis

		local r = 80
		local numPoints = 4
		local xCenter = 200
		local yCenter = 200
		local radius = 50
		local ffR = .5 -- start rotation value
		local rotG = .5 -- rotational increase increment
		local angleStep = 2 * math.pi / numPoints
		local group1 = display.newGroup()
		local t = {}
		local circle = {}
		
		for i = 1, numPoints do
			circle[i] = display.newCircle(0, 0, 10)
			circle[i].x = xCenter + radius*math.cos(i*angleStep)
			circle[i].y = yCenter + radius*math.sin(i*angleStep)
			group1:insert( circle[i] )
		end

		group:insert( group1 )
		
		group1.x = display.contentCenterX
		group1.y = display.contentCenterY
		
		
		local function onUpdate(  )
			ffR = ffR+rotG
			for i = 1, numPoints do
				t[i] = (ffR * .014)*i
				circle[i].x = (r * math.cos(t[i]))+50 
				circle[i].y = (r * math.sin(t[i]))+200
			--print("circle["..i.."].x = "..circle[i].x)
			--print("circle["..i.."].y = "..circle[i].y)
			end
		end
		
		
		Runtime:addEventListener( "enterFrame", onUpdate )

-------------------------------------------------

