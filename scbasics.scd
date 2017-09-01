//Telepresence
//OSC Basics
~justin = NetAddr("129.161.55.79", 57120);

OSCdef(\test, { |msg|
	msg.postln;
}, "/test");

~justin.sendMsg("/test", "hello");

//////////////////////////////////////////////////////////////////////
//SynthDef, Synth Basics

//SynthDef////////////////
SynthDef( \sin, { } ).add

SynthDef(\sin, {
	Out.ar( 0, SinOsc.ar() );
}).add;


//Synth - an instance of SynthDef ///////
s.boot; //boot server

a = Synth(\sin);
a.free;

//Var - internal variables
SynthDef(\sin, {
	var sig;
	sig = SinOsc.ar();
	Out.ar( 0, sig );
}).add;
a = Synth(\sin);
a.free;

//arg - External Variables & set
SynthDef(\sin, {
	arg freq;
	var sig;
	sig = SinOsc.ar(freq);
	Out.ar( 0, sig );
}).add;

a = Synth(\sin);
a.set(\freq, 330);
a.free;

//Midi Pitch, initalize Synth w/args, multiple instances
SynthDef(\sin, {
	arg pitch, amp =0.2;
	var sig, freq;
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar( 0, sig*amp );
}).add;

a = Synth( \sin, [\pitch,60] );
b = Synth(\sin, [\pitch, 63]);
c = Synth(\sin, [\pitch, 67] );
a.free; b.free; c.free;

//networked sins exercise
OSCdef(\mksin, {
	arg msg;
	var pitch = msg[1].asInteger;
	Synth(\sin, [\pitch, pitch]);
}, "/mksin");
~justin.sendMsg("/mksin", 50);

//Envelopes

SynthDef(\formlet, {
	arg t_tr = 1, pitch = 60, amp=0.2, gate=1, dur=0.1, atk = 0.01;
	var sig, freq, env;
	env = EnvGen.ar(Env.linen(0.1, 0, dur+atk),gate,doneAction:2);
	freq = pitch.midicps;
	sig = Formlet.ar(K2A.ar(t_tr), freq, atk, dur);
	Out.ar(0, sig*amp);
}).add;










