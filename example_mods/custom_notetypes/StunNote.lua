local glitchNoise = nil
local caolwer = {'de5f5f','7878E8','ffd359','505099','fc9c5b','7878E8'}
local sprites = {'ready','set','go'}
local um = 1
-- um is the random color value
function onCreate()
	countDuration = (1 / ((bpm) / 60))
	orginalbfDuration = getProperty('boyfriend.holdTimer')
	tweenDuration = countDuration/3
	--had to speed it up, otherwise it would be unfair
	-- make the countdown sprites
	for countdown = 1,3 do
		makeLuaSprite(sprites[countdown], sprites[countdown], 0, 0);
		setScrollFactor(sprites[countdown], 0.9, 0.9);
		screenCenter(sprites[countdown], 'xy')
		setProperty(sprites[countdown]..'.alpha',0)
		addLuaSprite(sprites[countdown], true);
		setObjectCamera(sprites[countdown], 'other')
	end
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'StunNote' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'StunNote'); --Change texture
			setPropertyFromGroup('unspawnNotes', i, 'noAnimation', true)
			setPropertyFromGroup('unspawnNotes', i, 'hitCausesMiss', true);

		--	if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then --Doesn't let Dad/Opponent notes get ignored
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true); --Miss has no penalties
		--	end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == 'StunNote' then
		characterPlayAnim('boyfriend', 'dodge', true);

	end
end
--addAnimationByPrefix(tag:String, name:String, prefix:String, framerate:Int = 24, loop:Bool = true)

-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen
function noteMiss(id, noteData, noteType, isSustainNote)
	if noteType == 'StunNote' then
		characterPlayAnim('boyfriend', 'hurt', true);
		setProperty('boyfriend.specialAnim', true);
		runTimer('ready', 0, 1)
		setProperty('boyfriend.stunned',true)
		setProperty('boyfriend.holdTimer',50)
		glitchNoise = math.random(1,6)
		playSound('glitchNoise/glitchNoise'..glitchNoise, 1, 'glitchnoise')
		--random color code
		um = caolwer[getRandomInt(1, #caolwer)]
		for i = 1,7 do
			doTweenColor('bg'..i,'bg'..i,um,tweenDuration,'cubeInOut')
		end
		doTweenColor('boyfriend','boyfriend',um,tweenDuration,'cubeInOut')
		doTweenColor('gf','gf',um,tweenDuration,'cubeInOut')
		doTweenColor('dad','dad',um,tweenDuration,'cubeInOut')
		doTweenColor('hit','hit',um,tweenDuration,'cubeInOut')

		

	end
end
function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'ready' then
		setProperty('ready.alpha',1)
		runTimer('readyGobyebye', tweenDuration, 1)
	end
	if tag == 'readyGobyebye' then
		-- is there a better way to do this than copy and pasting? Definitely.
		-- will I do it? no!
		doTweenAlpha('readyGoBye', 'ready', 0,tweenDuration, 'cubeInOut')
		runTimer('set', tweenDuration, 1)

	end
	if tag == 'set' then
		setProperty('set.alpha',1)
		runTimer('setGobyebye', tweenDuration, 1)
	end
	if tag == 'setGobyebye' then
		doTweenAlpha('setGoBye', 'set', 0,tweenDuration, 'cubeInOut')
		runTimer('go', countDuration, 1)

	end
	if tag == 'go' then
		setProperty('go.alpha',1)
		runTimer('goGobyebye', tweenDuration, 1)
	end
	if tag == 'goGobyebye' then
		doTweenAlpha('goGoBye', 'go', 0,tweenDuration, 'cubeInOut')
		setProperty('boyfriend.stunned',false)
		setProperty('boyfriend.holdTimer',orginalbfDuration)
		-- make color go back to normal
		for i = 1,7 do
			doTweenColor('hhhkjhkjkj'..i,'bg'..i,'ffffff',tweenDuration,'cubeInOut')
		end		
		doTweenColor('boyfriend1','boyfriend','ffffff',tweenDuration,'cubeInOut')
		doTweenColor('gf1','gf','ffffff',tweenDuration,'cubeInOut')
		doTweenColor('dad1','dad','ffffff',tweenDuration,'cubeInOut')
		doTweenColor('hit','hit','ffffff',tweenDuration,'cubeInOut')

	end
	if tag == 'hide' then


	end
end