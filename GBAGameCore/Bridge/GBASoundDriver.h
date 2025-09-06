//
//  GBASoundDriver.h
//  GBADeltaCore
//

#include <stdio.h>

#include "common/SoundDriver.h"

class GBASoundDriver : public SoundDriver
{
public:
    GBASoundDriver();
    virtual ~GBASoundDriver();
    
    virtual bool init(long sampleRate);
    virtual void pause();
    virtual void reset();
    virtual void resume();
    virtual void write(uint16_t *finalWave, int length);
};
