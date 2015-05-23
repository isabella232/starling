// =================================================================================================
//
//	Starling Framework
//	Copyright 2011-2014 Gamua. All Rights Reserved.
//
//	This program is free software. You can redistribute and/or modify it
//	in accordance with the terms of the accompanying license agreement.
//
// =================================================================================================

package starling.utils;
class Execute{
/** Executes a function with the specified arguments. If the argument count does not match
 *  the function, the argument list is cropped / filled up with <code>null</code> values. */
public static function execute(func:Dynamic, args:Array<Dynamic>):Void
{
    if (func != null)
    {
        var i:Int;
        var maxNumArgs:Int = func.length;

        for(i in 0 ... maxNumArgs)
            args[i] = null;

        // In theory, the 'default' case would always work,
        // but we want to avoid the 'slice' allocations.

        switch (maxNumArgs)
        {
            case 0:  func(); break;
            case 1:  func(args[0]); break;
            case 2:  func(args[0], args[1]); break;
            case 3:  func(args[0], args[1], args[2]); break;
            case 4:  func(args[0], args[1], args[2], args[3]); break;
            case 5:  func(args[0], args[1], args[2], args[3], args[4]); break;
            case 6:  func(args[0], args[1], args[2], args[3], args[4], args[5]); break;
            case 7:  func(args[0], args[1], args[2], args[3], args[4], args[5], args[6]); break;
            default: func.apply(null, args.slice(0, maxNumArgs)); break;
        }
    }
}
}
