// Boots the server
s.boot;
s.reboot;

a = '/Users/davidtrussler/MusicProduction/Troubador/src/How-can-we-tell.aiff';

// Load a chunk into a buffer
(
f = {arg channels, startFrame, endFrame;
	Buffer.readChannel(
		s, // server
		a, // path
		startFrame, // start frame
		endFrame - startFrame, // number of frames
		channels // channels
	)
};
)

// Load whole file into buffer
// b = f.value(channels: [0, 1], startFrame: 0, length: -1);

// Load first chunk into buffer (long guitar chord)
b = f.value(channels: [1], startFrame: 474275, endFrame: 748593);

// Load second chunk into buffer (guitar twiddle)
b = f.value(channels: [1], startFrame: 1696245, endFrame: 1808704);

b.plot;
b.free;

// Play file in buffer with PlayBuf UGen on loop
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
