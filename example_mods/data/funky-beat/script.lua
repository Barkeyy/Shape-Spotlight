local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'happyloop');
	end
end

function onEndSong()
	setProperty('iconP1.alpha',0)
	setProperty('iconP2.alpha',0)
	setProperty('healthBarBG.alpha',0)
	setProperty('healthBar.alpha',0)
	setProperty('scoreTxt.alpha',0)
	setProperty('timeBar.visible',false)
	setProperty('timeBarBG.visible',false)
	setProperty('timeTxt.visible',false)
	if not allowEnd and isStoryMode then

		setProperty('inCutscene', true);
		startDialogue('post-dialogue', 'breakfast');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end