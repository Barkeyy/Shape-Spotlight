function onStepHit()
    if curStep == 384 then
        --make everything except the characters invisible
        for i = 1,7 do
        doTweenAlpha('haha go bye'..i, 'bg'..i,0, 0.5, 'quadInOut')
    end
         -- say hi to the lights
        doTweenAlpha('hi', 'lightsThatAreActivatedLater',1, 0.5, 'quadInOut')
    end
    if curStep == 447 then
        -- say hi to the lights
        doTweenAlpha('godbye oldfriend', 'lightsThatAreActivatedLater',0, 0.5, 'quadInOut')
        doTweenAlpha('hi2', 'lights2',1, 0.5, 'quadInOut')
    end
    if curStep == 512 then
        doTweenAlpha('godbye oldfriend', 'lightsThatAreActivatedLater',0, 0.5, 'quadInOut')
        doTweenAlpha('bye', 'lights2',0, 0.5, 'quadInOut')
            --reset the spotlight
         for i = 1,7 do
            doTweenAlpha('haha go hi'..i, 'bg'..i,1, 0.5, 'quadInOut')
         end
     end
     --repeat
     if curStep == 896 then
        --make everything except the characters invisible
        for i = 1,7 do
        doTweenAlpha('haha go bye'..i, 'bg'..i,0, 0.5, 'quadInOut')
    end
         -- say hi to the lights
        doTweenAlpha('hi', 'lightsThatAreActivatedLater',1, 0.5, 'quadInOut')
    end
    if curStep == 960 then
        -- say hi to the lights
        doTweenAlpha('godbye oldfriend', 'lightsThatAreActivatedLater',0, 0.5, 'quadInOut')
        doTweenAlpha('hi2', 'lights2',1, 0.5, 'quadInOut')
    end
    if curStep == 1024 then
        doTweenAlpha('godbye oldfriend', 'lightsThatAreActivatedLater',0, 0.5, 'quadInOut')
        doTweenAlpha('bye', 'lights2',0, 0.5, 'quadInOut')
            --reset the spotlight
         for i = 1,7 do
            doTweenAlpha('haha go hi'..i, 'bg'..i,1, 0.5, 'quadInOut')
         end
     end
end
local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode  and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'intenseLoop');
	end
end
