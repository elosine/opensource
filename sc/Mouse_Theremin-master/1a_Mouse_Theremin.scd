//PLACE MOUSE CURSOR ON EACH OF THE NUMBERS IN ORDER AND HIT CMD-RETURN

(
// 1):
// Initialize
var currMidiNum, noteNames, octaves, screenRes, yres;
~pitchLo = \a0;
~pitchHi = \c8;

//MIDI NOTE DICTIONARY
////Allows you to input a symbol and get out the midi note number
////Use only these symbols:
//// \c, \cs, \d, \eb, \e, \f, \fs, \g, \gs, \a, \bb, \b

~mnd = ();
currMidiNum = 0;
noteNames = [\c, \cs, \d, \eb, \e, \f, \fs, \g, \gs, \a, \bb, \b];
octaves = [-1, 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
octaves.do{ |it ix|
	noteNames.do{ |it2 ix2|
		~mnd.put((it2 ++ it).asSymbol, currMidiNum);
		currMidiNum = currMidiNum+1;
	}
};

//FUNCTION TO LOOK UP Y-LOCATION FOR A PITCH

screenRes = "system_profiler SPDisplaysDataType | grep Resolution".unixCmdGetStdOut.findRegexp("(?<!@ )[0-9]{3,}").collect({|item| item[1].asInteger}).clump(2);
~yres = screenRes[0][1];

~midiToY = {
	arg midinote;
	~mnd[midinote].linlin(~mnd[~pitchLo].asFloat, ~mnd[~pitchHi].asFloat, ~yres, 0.0).round;
};

//SYNTHDEF
SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0;
	var osc, freq, env, envgate, pitch, amp;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	osc = SinOsc.ar( freq );
	Out.ar(0, osc*env*amp);
}).add;

) ///////////////////////////////////////////////////////////

(
// 2):
// Boot Server
s.boot;
)

(
// 3):
// Start Synth
~mt = Synth(\mouseTheremin, [\pitchLo, ~mnd[~pitchLo], \pitchHi, ~mnd[~pitchHi]]);
)


// TO STOP SYNTH OR USE CMD-.
~mt.free;



//UTILITIES

//EXAMPLE OF MIDI NOTE TO Y COORDINATE TO LOOK UP VALUES FOR YOUR PROCESSING PATCH:
////Use only these symbols:
//// \c, \cs, \d, \eb, \e, \f, \fs, \g, \gs, \a, \bb, \b
~midiToY.value(\g5);
~midiToY.value(\fs4);
//Look @ Post Window


//USE THESE TO 'PLAY ALONG' AND THEN FIND MIDI PITCH
~mspoll = {MouseY.kr(~mnd[~pitchHi], ~mnd[~pitchLo]).round.poll}.play;
~mnd.findKeyForValue(66);

~mspoll.free;

/*
//GANGSTER'S PARADISE, MAIN RIFF
84 - C6 - 298
83 - B5 - 310
79 - G5 - 360
*/

