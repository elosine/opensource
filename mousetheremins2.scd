SynthDef( \mt,{
	var sig, freq;
	freq = MouseX.kr(100, 5000, lag:0.01);
	sig = SinOsc.ar(freq);
	Out.ar(0, sig);
}).add;

a = Synth(\mt);

SynthDef( \mt,{
	var sig, freq, env, gate;
	gate = MouseButton.kr(lag:0.01);
	env = EnvGen.ar( Env.asr(0.01, 1, 0.1), gate);
	freq = MouseX.kr(100, 5000, lag:0.01);
	sig = SinOsc.ar(freq);
	Out.ar(0, sig*env);
}).add;

a = Synth(\mt);

Env.asr( 0.1, 1, 0.3).plot;

SynthDef( \mt,{
	arg pitchlo = 30, pitchhi = 90;
	var sig, freq, env, gate, pitch;
	gate = MouseButton.kr(lag:0.01);
	env = EnvGen.ar( Env.asr(0.01, 1, 0.1), gate);
	pitch = MouseX.kr(pitchlo, pitchhi, lag:0.01);
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig*env);
}).add;

a = Synth(\mt);

SynthDef( \mt,{
	arg pitchlo = 30, pitchhi = 90;
	var sig, freq, env, gate, pitch;
	gate = MouseButton.kr(lag:0.01);
	env = EnvGen.ar( Env.asr(0.01, 1, 0.1), gate);
	pitch = MouseX.kr(pitchlo, pitchhi, lag:0.01).round(1);
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig*env);
}).add;

a = Synth(\mt);

SynthDef( \mt,{
	arg pitchlo = 30, pitchhi = 90;
	var sig, freq, env, gate, pitch, amp;
	amp = MouseY.kr();
	gate = MouseButton.kr(lag:0.01);
	env = EnvGen.ar( Env.asr(0.01, 1, 0.1), gate);
	pitch = MouseX.kr(pitchlo, pitchhi, lag:0.01).round(1).poll;
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig*env*amp);
}).add;

a = Synth(\mt);













