//ABXY sampler play the Lauren Mayberry “Oh” bits.

//Left and right trigger pitch shifter: Left shifts up an octave, right shifts down.


0 => int device;


[ "/Users/andrewwhipple/Documents/Music257/ChvrchesSamps/Oh1.wav", "/Users/andrewwhipple/Documents/Music257/ChvrchesSamps/Oh2.wav", "/Users/andrewwhipple/Documents/Music257/ChvrchesSamps/Oh3.wav", "/Users/andrewwhipple/Documents/Music257/ChvrchesSamps/Oh4.wav" ] @=> string sounds[];

SndBuf s1;
SndBuf s2;
SndBuf s3;
SndBuf s4;

PitShift ps;
2 => ps.mix;
0 => ps.shift;
PitShift ps2;
2 => ps2.mix;
0 => ps2.shift;
float left;
float right;


1 => s1.channel;
sounds[0] => s1.read;
sounds[1] => s2.read;
sounds[2] => s3.read;
sounds[3] => s4.read;

<<< s1.channels() >>>;


Hid hi;
HidMsg msg;

if( !hi.openJoystick( device ) ) me.exit();
<<< "joystick ‘" + hi.name() + "’ ready…" >>>;

while( true )
{
    
    
    hi => now;
    while( hi.recv( msg ) )
    {
     
        if( msg.isButtonDown() ) {
            msg.which => int base;
            <<< base >>>;
            
            if ( base == 11 ) {
               //A kick
              s1 =< ps =< ps2 =< dac;
              s2 =< ps =< ps2 =< dac;
              s3 =< ps =< ps2 =< dac;
              s4 =< ps =< ps2 =< dac;
               0 => s1.pos;
               1 => s1.play;
               s1 => ps => ps2 => dac;
              
               
               set();
            } else if ( base == 12) {
                //B CH
              s1 =< ps =< ps2 =< dac;
              s2 =< ps =< ps2=< dac;
              s3 =< ps =< ps2 =< dac;
              s4 =< ps =< ps2 =< dac;
               0 => s2.pos;
                1 => s2.play;
               s2 => ps => ps2 => dac;
              
              
                set();
            } else if ( base == 13 ) {
                //X
              s1 =< ps =< ps2 =< dac;
              s2 =< ps =< ps2=< dac;
              s3 =< ps =< ps2 =< dac;
              s4 =< ps =< ps2 =< dac; 
              0 => s3.pos;
                1 => s3.play;
               s3 => ps => ps2 => dac;
              
               set();
            } else if ( base == 14) {
               //Y
              s1 =< ps =< ps2 =< dac;
              s2 =< ps =< ps2=< dac;
              s3 =< ps =< ps2 =< dac;
              s4 =< ps =< ps2 =< dac;
               0 => s4.pos;
               1 => s4.play;
               s4 => ps => ps2 => dac;
               
               set();
            } else if ( base == 9 ) {
               //RB, OH
               
               
           } else if ( base == 8 ) {
               //LB, snare
               //1 => s1.play;
              
           } else if ( base == 6 ) {
               //L stick
               
           } else if ( base == 7 ) {
               //R stick
           } else if ( base == 1 ) {
             //  Down d-pad
           
           } else if ( base == 2 ) {
               //L d-pad
               
           } else if ( base == 3 ) {
               //R d-pad
           } else if ( base == 0 ) {
               //Up d-pad
           } else if ( base == 4 ) {
               //Start
           } else if ( base == 5 ) {
               //Select
           } else if ( base == 10 ) {
               //Center XBOX button
           }           
           
       } else if ( msg.isAxisMotion() ) {
          
           
           if ( msg.which == 4 ) {
               msg.axisPosition => left;
               //( ( ( left + 1 ) / 2.0 ) + 1 ) => ps.shift;
               set();
           } else if ( msg.which == 5 ) {
               msg.axisPosition => right;
               set();
           }
       }
        
        
    }
    
}

fun void set() {
    ( ( ( left + 1 ) / 2.0 ) + 1 ) => ps.shift;
    -( ( ( right - 1 ) / 4.0 ) - 0.5 ) => ps2.shift;
    <<< ps2.shift() >>>;
    
}