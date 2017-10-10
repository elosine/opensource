//Ok, step 1, I am going to focus on synthesis
//Let me grab the code from 1a_Mouse_Theremin.scd
//I'm primarily interested in the SynthDef
//Here is the original code:

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

//If you looked at some of the tutorials,
//for example, MouseThereminTutorial.scd
//you might notice that this bit of code from the synthDef:

	osc = SinOsc.ar( freq );

//is the sound generator
//so let's focus here
//I'm going to try a different sound generator
//you can find various sound generators
//by going to the help system and
//going to browse, then UGens
//try out a bunch of them
//One of my favourites is:

Formant.ar

//Here is the original synthdef but now with Formant.ar
//as the sound generator


//SYNTHDEF
SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0;
	var osc, freq, env, envgate, pitch, amp;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	osc = Formant.ar( freq );
	Out.ar(0, osc*env*amp);
}).add;

//Now, it is important to note that the ugen Formant.ar
//takes different arguments than SinOsc.ar
//Let's have a look at the help file
//Highlight the word your are interested in,
//in this case Formant,and hit cmd-d

//Here is a summary of the help file:

/*ar (fundfreq: 440, formfreq: 1760, bwfreq: 880, mul: 1, add: 0)

Arguments:
fundfreq - Fundamental frequency in Hertz. (control rate)
formfreq - Formant frequency in Hertz. (control rate)
bwfreq - Pulse width frequency in Hertz. Controls the bandwidth of the formant. (control rate)
Must be greater than or equal to fundfreq.
mul
add

Discussion:
The frequency inputs are read at control rate only, so if you use an audio rate UGen as an input, it will only be sampled at the start of each audio synthesis block. */

//Here are the examples from the help file.
//I've made the arguments more explicit
//and have placed the mouse as modulator
//as well as put in a .poll so you can see the mouse values in the post window:

// modulate fundamental frequency, formant freq stays constant
{ Formant.ar(fundfreq: MouseX.kr(400, 4000).poll, formfreq:2000, bwfreq:800, mul:0.125) }.play

// modulate formant frequency, fundamental freq stays constant
{ Formant.ar(fundfreq:300, formfreq:MouseX.kr(400, 4000).poll, bwfreq:800, mul:0.125) }.play

// modulate width frequency, other freqs stay constant
{ Formant.ar(fundfreq:300, formfreq:2000, bwfreq:MouseX.kr(800, 8000).poll, mul:0.125) }.play


//So I think now we are ready to add Formant.ar
//Oh yeah, remember to load a synthdef
//to the server, highlight the entire
//synthdef and press cmd-return
//you can also use brackets
//and then have your cursor
//anywhere within the brackets

(
//SYNTHDEF
SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800;
	var osc, freq, env, envgate, pitch, amp;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	//Replacing SinOsc.ar w/Formant.ar
	//I think we'll keep the freq synthdef argument and put it as fundfreq
	//Create a new synthdef argument 'bwfreq'and set 800 as default
	//and we'll leave formfreq alone as we'll deal with that later
	osc = Formant.ar( fundfreq:freq, bwfreq:bwfreq );
	Out.ar(0, osc*env*amp);
}).add;
)

//Let's see how that sounds
a = Synth(\mouseTheremin);
//Not bad. It has a kind of
//Stevie Wonder clavinet sound
//like from Superstition

//Now let me try to change the sound
//by mixing a few more ugens in
//I'm going to add a octive doubler

(
//SYNTHDEF
SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800;
	//create a new variable to contain my doubling ugen call it doppel
	var osc, freq, env, envgate, pitch, amp, doppel, octdown;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	osc = Formant.ar( fundfreq:freq, bwfreq:bwfreq );
	//assign the variable dopple to a ugen
	//let's try a sawtooth wave
	//In order to make it an octave doubler
	//We want the pitch to be the same just one octave lower
	//Let's make another variable octdown
	//and set it to the pitch one octave below
	octdown = (pitch -12).midicps;
	//-12 because these are midi pitches
	//or semi-tones and 12 is an octave
	//use .midicps to convert to hertz
	//which is what Saw.ar takes for the freq arg
	doppel = Saw.ar(octdown);
	//Now use Mix.ar to mix the formant and the octave doubler
	osc = Mix.ar( [osc, doppel] );
	Out.ar(0, osc*env*amp);
}).add;
)

a = Synth(\mouseTheremin);

//Ok not bad but perhaps we can make
//the octive doubling quieter:

SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800;
	var osc, freq, env, envgate, pitch, amp, doppel, octdown;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	osc = Formant.ar( fundfreq:freq, bwfreq:bwfreq );
	octdown = (pitch -12).midicps;
	//I use the mul argument of Saw to bring it's level down
	doppel = Saw.ar(octdown, 0.5);
	osc = Mix.ar( [osc, doppel] );
	Out.ar(0, osc*env*amp);
}).add;

a = Synth(\mouseTheremin);
//for some reason this makes me feel like
//playing Smoke On The Water
//Remember cmd-. to stop sound


//Ok that's pretty good
//How about adding some filtering?
//First, there are some good filters
//in the SC3-Plugins
//Go to "http://sourceforge.net/projects/sc3-plugins/files/"
//Find the appropriate download and install
//You'll need to recompile SC
//Let's look at the filter, DFM1
//If you just highlight the word and press cmd-d
//You'll get the help file
//I'm going to pop it into my synthdef

SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800, filterfreq=1500;
	var osc, freq, env, envgate, pitch, amp, doppel, octdown;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	osc = Formant.ar( fundfreq:freq, bwfreq:bwfreq );
	octdown = (pitch -12).midicps;
	doppel = Saw.ar(octdown, 0.5);
	osc = Mix.ar( [osc, doppel] );
	//Just continue to eat the variable 'osc'
	//DFM1 takes an in argument, here osc,
	//and a frequency, among others
	//You can experiment with these
	//We'll make freq an argument, filterfreq
	//I'll set the default to 1500
	osc = DFM1.ar(osc, filterfreq);
	Out.ar(0, osc*env*amp);
}).add;

a = Synth(\mouseTheremin);
//let me set the filter freq to something brighter
a.set(\filterfreq, 5000);
//or duller
a.set(\filterfreq, 500);

//Beethoven's 5th seems fitting here


//Now lets add some modulation
//Remember I said hold off on the formant frequency
//or formfreq argument of Formant.ar?
//Now let's deal with it and put an
//LFO or low frequency oscillator on it


SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800, filterfreq=1500, lfofreq=3;
	var osc, freq, env, envgate, pitch, amp, doppel, octdown;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	env = EnvGen.ar( envelope:Env.asr(releaseTime:0.05), gate:envgate );
	freq = pitch.midicps;
	//I'll use a sine wave, SinOsc.kr, notice I'm using
	//it control rate
	//I'll put an argument in for the
	//LFO frequency so that I can change it later
	//I'll set its default to 3 times a second
	//and finally notice the use of .range
	//normally SinOsc generates values from -1 to 1
	//range will map these values to another range
	//Here I use 100 to 1500 as a filter frequency sweep
	osc = Formant.ar( fundfreq:freq, formfreq: SinOsc.kr(lfofreq).range(100, 1500), bwfreq:bwfreq );
	octdown = (pitch -12).midicps;
	doppel = Saw.ar(octdown, 0.5);
	osc = Mix.ar( [osc, doppel] );
	osc = DFM1.ar(osc, filterfreq);
	Out.ar(0, osc*env*amp);
}).add;

a = Synth(\mouseTheremin);
//let's set the lfo speed much slower
a.set(\lfofreq, 0.2);
//or faster
a.set(\lfofreq, 17);

//How about the Darth Vader's theme?
//Maybe JJ Abrhams will use it in the new movies

//The last mod I want to show you
//happens after creating an instance
//of the synth and uses arguments
//to give you different attack options
//by modifying the envelope
//first we need to 'argumentize'
//the envelope by adding in arguments
//instead of fixed values


SynthDef(\mouseTheremin, {
	arg pitchLo = 30, pitchHi = 80, pitchres=1.0, bwfreq=800, filterfreq=1500, lfofreq=3, atk=0.001, rel=0.5, crv = -2;
	var osc, freq, env, envgate, pitch, amp, doppel, octdown;
	amp = MouseX.kr(-40, 10).dbamp;
	pitch = MouseY.kr(minval:pitchHi, maxval:pitchLo, lag:0.0001).round(pitchres);
	envgate = MouseButton.kr(lag:0.0001);
	//Add arguments to the envelope, atk, rel, and crv and give
	//them default values
	env = EnvGen.ar( envelope:Env.asr( attackTime: atk, releaseTime:rel, curve:crv), gate:envgate );
	freq = pitch.midicps;
	osc = Formant.ar( fundfreq:freq, formfreq: SinOsc.kr(lfofreq).range(100, 1500), bwfreq:bwfreq );
	octdown = (pitch -12).midicps;
	doppel = Saw.ar(octdown, 0.5);
	osc = Mix.ar( [osc, doppel] );
	osc = DFM1.ar(osc, filterfreq);
	Out.ar(0, osc*env*amp);
}).add;

//Then once we create an instance of the synth
//And we can control the envelope w/arguments
a = Synth(\mouseTheremin);
a.set(\atk, 0.2, \rel, 1.0, \crv, -4);
a.set(\atk, 0.7, \rel, 0.01, \crv, 6);
//of course you can modify any of the arguments
a.set(\atk, 0.3, \rel, 0.01, \crv, 2, \filterfreq, 700, \lfofreq, 0.7, \bwfreq, 1500);

//How about the theme from Schubert's 8th




