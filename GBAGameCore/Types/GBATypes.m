//
//  GBAGameCore.m
//  GBADeltaCore
//

#import "GBATypes.h"

GameType const GameTypeGBA = @"com.rileytestut.delta.game.gba";
GameType const GameTypeGBC = @"com.rileytestut.delta.game.gbc";

CheatType const CheatTypeActionReplay = @"ActionReplay";
CheatType const CheatTypeGameShark = @"GameShark";
CheatType const CheatTypeCodeBreaker = @"CodeBreaker";

CheatType const CheatTypeGameGenie = @"GameGenie";

NSNotificationName const GBADidActivateGyroNotification = @"GBADidActivateGyroNotification";
NSNotificationName const GBADidDeactivateGyroNotification = @"GBADidDeactivateGyroNotification";
