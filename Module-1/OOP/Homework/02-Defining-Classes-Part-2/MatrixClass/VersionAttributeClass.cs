﻿namespace MatrixClass
{
    using System;

    [AttributeUsage(AttributeTargets.Struct |
                     AttributeTargets.Class |
                     AttributeTargets.Interface |
                     AttributeTargets.Enum |
                     AttributeTargets.Method)]
    public class VersionAttributeClass : Attribute
    {
        public VersionAttributeClass(int major, int minor)
        {
            this.Major = major;
            this.Minor = minor;
        }

        public int Major { get; set; }

        public int Minor { get; set; }

        public override string ToString()
        {
            return string.Format("Version {0}.{1}", this.Major, this.Minor);
        }
    }
}