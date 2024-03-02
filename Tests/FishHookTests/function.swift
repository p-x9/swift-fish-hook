//
//  function.swift
//
//
//  Created by p-x9 on 2024/02/03.
//  
//

import Foundation

@_silgen_name ("setjmp")
func setjump(_: UnsafeMutablePointer<jmp_buf>) -> Int32

@_silgen_name ("longjmp")
func longjump(_: UnsafeMutablePointer<jmp_buf>, _: Int32) -> Never

func new_empty_buf() -> jmp_buf {
    let buf = Data(count: MemoryLayout<jmp_buf>.size)
    return buf.withUnsafeBytes { buf in
        guard let baseAddress = buf.baseAddress else {
            fatalError()
        }
        return baseAddress
            .bindMemory(to: jmp_buf.self, capacity: 1)
            .pointee
    }
}

var buf: jmp_buf = new_empty_buf()

public func hook_assertionFailure(
    _ prefix: StaticString,
    _ message: String,
    file: StaticString = #file,
    line: UInt = #line,
    flags: UInt32
) -> Never {
    print("😃", "hook", message, file, line)
    return longjump(&buf, 1)
}

public func hook_assertionFailure(
    _ prefix: StaticString,
    _ message: StaticString,
    file: StaticString = #file,
    line: UInt = #line,
    flags: UInt32
) -> Never {
    print("😃", "hook", message, file, line)
    return longjump(&buf, 1)
}

public func XXXXhook_assertionFailure(
    _ prefix: StaticString,
    _ message: String,
    file: StaticString = #file,
    line: UInt = #line,
    flags: UInt32
) -> Never {
    print( "😃", "XXXhook", message, file, line)
    return longjump(&buf, 1)
}

public func XXXXhook_assertionFailure(
    _ prefix: StaticString,
    _ message: StaticString,
    file: StaticString = #file,
    line: UInt = #line,
    flags: UInt32
) -> Never {
    print( "😃", "XXXhook", message, file, line)
    return longjump(&buf, 1)
}
