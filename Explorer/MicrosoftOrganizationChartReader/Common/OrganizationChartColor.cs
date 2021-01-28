﻿using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public static class OrganizationChartColor
    {
        public static Color ReadOrganizationChartColor(this BinaryReader reader)
        {
            byte red = reader.ReadByte();
            byte blue = reader.ReadByte();
            byte green = reader.ReadByte();
            byte _ = reader.ReadByte();

            return Color.FromArgb(red, green, blue);
        }
    }
}
