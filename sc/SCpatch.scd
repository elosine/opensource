(s.waitForBoot{ fork{

	//Sample Buffers
	~b1 = Buffer.read(s, "/home/jyang/Documents/opensource/match.wav" );
	~b2 = Buffer.read(s, "/home/jyang/Documents/opensource/shutter.wav" );

	//Sampler
	SynthDef(\samp, {
		arg buf, amp=1;
		var sig;
		sig = PlayBuf.ar(2, buf, doneAction:2);
		Out.ar(0, sig*amp);
	}).add;

	//Subtractive Synth
	SynthDef(\subsyn, {
		arg pitch = 60, tune=0, gate=1, atk=0.01, rel=0.5, amp=1 , pos=0;
		var osc1, osc2, freq1, freq2, sig, env;
		env = EnvGen.ar(Env.asr(atk, 1, rel),gate,doneAction:2);
		freq1 = pitch.midicps;
		freq2 = (pitch+tune).midicps;
		osc1 = SinOsc.ar(freq1);
		osc2 = SinOsc.ar(freq2);
		sig = Mix.ar([osc1,osc2]);
		sig = Pan2.ar(sig,pos);
		Out.ar(0,sig*env*amp);
	}).add;

	//formlet
	SynthDef(\formlet, {
		arg t_tr = 0, pitch = 60, amp=0.2, atk = 0.01, dur=0.25,pos=0;
		var sig, freq;
		freq = pitch.midicps;
		sig = Formlet.ar(K2A.ar(t_tr), freq, atk, dur);
		sig = Pan2.ar(sig,pos);
		Out.ar(0, sig*amp);
	}).add;

	~gb1 = Buffer.read(s, "/home/jyang/Documents/opensource/sitar.wav" );
	SynthDef(\grain, {
		arg rate=5, dur = 0.1, amp = 1, buf, envbuf = -1, pitch=1, pan=0, gate=1;
		var sig, env;
		env = EnvGen.ar(Env.asr(0.01, 1, 0.3), gate, doneAction:2);
		sig = GrainBuf.ar(2, Dust.ar(rate), dur, buf, pitch, LFNoise2.kr(0.1).range(0, 1), 2, pan, envbuf);
		Out.ar(0, sig*env*amp);
	}).add;

}})

Server.default.makeGui; //make a gui with record button

//SAMPLES
~s1 = Synth(\samp, [\buf, ~b1, \amp, 1, \pan, -1]);
~s2 = Synth(\samp, [\buf, ~b2, \amp, 0.85, \pan, 1]);

//SUB SYNTH
~sb1 = Synth(\subsyn, [\pitch, 60, \tune, 0.05, \atk, 0.01, \rel, 0.5, \amp, 0.5, \pos, -1]);
~sb1.set(\pitch, 60, \tune, 0, \amp, 0.05);
~sb1.set(\rel, 0.5, \gate, 0);

~sb2 = Synth(\subsyn, [\pitch, 62, \tune, 0.05, \atk, 0.01, \rel, 0.5, \amp, 0.5, \pos, 1]);
~sb2.set(\pitch, 64, \tune, 0.3, \amp, 0.05);
~sb2.set(\rel, 0.5, \gate, 0);

//FORMLET
~f1 = Synth(\formlet); //Only evaluate this line once
~f1.set(\t_tr, 1, \pitch, 40, \amp, 0.2, \atk, 0.1, \dur, 1, \pos, 1); //use set to play
~f1.free;

//GRANULAR
~g1 = Synth (\grain, [\buf, ~gb1]); //Only evaluate this line once
~g1.set(\buf, ~gb1, \rate, 50, \dur, 0.0, \amp, 1.0, \pitch, 0.4, \pan, 0); //use set to play

