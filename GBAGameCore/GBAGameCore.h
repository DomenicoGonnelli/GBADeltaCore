//
//  GBADeltaCore.h
//  GBADeltaCore
//
//

#import <UIKit/UIKit.h>

//! Project version number for GBADeltaCore.
FOUNDATION_EXPORT double GBADeltaCoreVersionNumber;

//! Project version string for GBADeltaCore.
FOUNDATION_EXPORT const unsigned char GBADeltaCoreVersionString[];

// In this header, you should import all the public headers of your framework using statements like #import <GBADeltaCore/PublicHeader.h>
#if !STATIC_LIBRARY
#import <GBAGameCore/GBAEmulatorBridge.h>
#import <GBAGameCore/GBATypes.h>
#endif
