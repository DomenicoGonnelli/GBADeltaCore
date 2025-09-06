//
//  DeltaSoundDriver.cpp
//  GBADeltaCore
//

#import "GBASoundDriver.h"
#import "GBAEmulatorBridge.h"

#import <DeltaCore/DeltaCore.h>
#import <DeltaCore/DeltaCore-Swift.h>

GBASoundDriver::GBASoundDriver()
{
}

GBASoundDriver::~GBASoundDriver()
{
}

bool GBASoundDriver::init(long sampleRate)
{
    return true;
}

void GBASoundDriver::write(uint16_t *finalWave, int length)
{
    [GBAEmulatorBridge.sharedBridge.audioRenderer.audioBuffer writeBuffer:(uint8_t *)finalWave size:length];
}

void GBASoundDriver::pause()
{
}

void GBASoundDriver::resume()
{
}

void GBASoundDriver::reset()
{
}

