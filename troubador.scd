// Boots the server
s.boot;

a = '/Users/davidtrussler/MusicProduction/Troubador/src/How-can-we-tell.aiff';

// Load a chunk into a buffer
(
f = {arg channel, startFrame, length;
	Buffer.readChannel(
		s, // server
		a, // path
		startFrame, // start frame
		length, // number of frames
		channel // channels
	)
};
)

// Load first chunk into buffer (long guitar chord)
b = f.value(channel: 1, startFrame: 474275, length: 274318);

b.plot;
b.free;

// Play file in buffer with PlayBuf UGen
(
x = SynthDef(
	'tutorial-PlayBuff', // name
	{ // ugenGraphFunc
		arg out = 0,
		bufnum;
		Out.ar(
			out,
			PlayBuf.ar(
				1, // numChannels
				bufnum, // bufnum
				loop: 1
			)
		);
	}
).play(s, [\out, 0, \bufnum, b]);
)

x.free;

// Quit the server
s.quit;
