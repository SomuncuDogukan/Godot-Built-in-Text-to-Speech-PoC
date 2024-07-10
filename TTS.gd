extends Node

func _ready():
	# Get the list of voices available for Turkish language
	var voices = DisplayServer.tts_get_voices_for_language("tr_TR")
	
	# Ensure there are voices available
	if voices.size() == 0:
		print("No Turkish TTS voices available.")
		return
	
	# Select the first available Turkish voice
	var voice_id = voices[0]
	
	# Say "Hello, this is the Test of RoT studio TTS"
	DisplayServer.tts_speak("Merhaba, bu RoT stüdyosunun TTS testidir.", voice_id)
	
	# Say a longer sentence, and then interrupt it
	var long_message = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur"
	DisplayServer.tts_speak(long_message, voice_id)

	# Immediately stop the current text mid-sentence and say something else
	DisplayServer.tts_stop()
	DisplayServer.tts_speak("Merhaba İbrahim, nasılsın?", voice_id)
