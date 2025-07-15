//
//  GBA.swift
//  GBADeltaCore
//
//  Created by Riley Testut on 6/3/16.
//  Copyright © 2016 Riley Testut. All rights reserved.
//

import Foundation
import AVFoundation

import DeltaCore

public extension GBA
{
    static let didActivateGyroNotification = NSNotification.Name.__GBADidActivateGyro
    static let didDeactivateGyroNotification = NSNotification.Name.__GBADidDeactivateGyro
}

@objc public enum GBAGameInput: Int, Input
{
    case up = 64
    case down = 128
    case left = 32
    case right = 16
    case a = 1
    case b = 2
    case l = 512
    case r = 256
    case start = 8
    case select = 4
    
    public var type: InputType {
        return .game(.gba)
    }
}

@objc public enum GBCGameInput: Int, Input
{
    case up = 0x40
    case down = 0x80
    case left = 0x20
    case right = 0x10
    case a = 0x01
    case b = 0x02
    case start = 0x08
    case select = 0x04
    
    public var type: InputType {
        return .game(.gbc)
    }
}

public struct GBA_GBC: DeltaCoreProtocol
{
    public static let core = GBA_GBC()
    
    public var name: String { "GBCDeltaCore" }
    public var identifier: String { "com.rileytestut.GBCDeltaCore" }
    public var gameType: GameType { GameType.gbc }
    public var gameInputType: Input.Type { GBCGameInput.self }
    public var gameSaveFileExtension: String { "sav" }
    
    public let audioFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 32768, channels: 2, interleaved: true)!
    
    public let videoFormat = VideoFormat(format: .bitmap(.bgra8), dimensions: CGSize(width: 160, height: 144))
    
    public var supportedCheatFormats: Set<CheatFormat> {
        let gameGenieFormat = CheatFormat(name: NSLocalizedString("Game Genie", comment: ""), format: "XXX-YYY-ZZZ", type: .gameGenie)
        let gameSharkFormat = CheatFormat(name: NSLocalizedString("GameShark", comment: ""), format: "XXXXXXXX", type: .gameShark)
        return [gameGenieFormat, gameSharkFormat]
    }
    
    public let emulatorBridge: EmulatorBridging = GBAEmulatorBridge.shared
    
    private init()
    {
    }
}
 

public struct GBA: DeltaCoreProtocol
{
    public static let core = GBA()
    public static let coreGBC = GBA_GBC.core
    
    public var name: String { "GBADeltaCore" }
    public var identifier: String { "com.rileytestut.GBADeltaCore" }
    
    public var gameType: GameType { GameType.gba }
    public var gameInputType: Input.Type { GBAGameInput.self }
    public var gameSaveFileExtension: String { "sav" }
    
    public let audioFormat = AVAudioFormat(commonFormat: .pcmFormatInt16, sampleRate: 32768, channels: 2, interleaved: true)!
    
    public let videoFormat = VideoFormat(format: .bitmap(.bgra8), dimensions: CGSize(width: 240, height: 160))

    public var supportedCheatFormats: Set<CheatFormat> {
        let actionReplayFormat = CheatFormat(name: NSLocalizedString("Action Replay", comment: ""), format: "XXXXXXXX YYYYYYYY", type: .actionReplay)
        let gameSharkFormat = CheatFormat(name: NSLocalizedString("GameShark", comment: ""), format: "XXXXXXXX YYYYYYYY", type: .gameShark)
        let codeBreakerFormat = CheatFormat(name: NSLocalizedString("Code Breaker", comment: ""), format: "XXXXXXXX YYYY", type: .codeBreaker)
        return [actionReplayFormat, gameSharkFormat, codeBreakerFormat]
    }
    
    public let emulatorBridge: EmulatorBridging = GBAEmulatorBridge.shared
    
    private init()
    {
    }
}

// Expose DeltaCore properties to Objective-C.
public extension GBAEmulatorBridge
{
    @objc(gbaResources) class var __gbaResources: Bundle {
        return GBA.core.resourceBundle
    }
    
    @objc(coreDirectoryURL) class var __coreDirectoryURL: URL {
        return _coreDirectoryURL
    }
}

private let _coreDirectoryURL = GBA.core.directoryURL



