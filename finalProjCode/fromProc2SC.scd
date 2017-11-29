

OSCdef( \sensor1, { arg msg;
	var val = msg[1].asFloat;
	// val.postln;
	~mVal = val.linlin(0.0, 1.0, 60.0, 72.0);
	 ~mVal.postln;
}, "/sensor1" );

SynthDef( \siney, { arg pitch=60;
	var freq = pitch.midicps;
	var freq1 = (pitch+0.25).midicps;
	var sig = SinOsc.ar( [freq, freq1] );
	Out.ar(0, sig);
}).add;

a = Synth(\siney);
a.set(\pitch, ~mVal);