using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public class ShadowRecord
    {
        public ushort Size { get; set; }

        public ShadowType Type { get; set; }

        public short Height { get; set; }

        public short Width { get; set; }

        public Color FillColor { get; set; }

        public Color Color { get; set; }

        public ShadowRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Type = (ShadowType)reader.ReadUInt16();
            Height = reader.ReadInt16();
            Width = reader.ReadInt16();
            FillColor = reader.ReadOrganizationChartColor();
            Color = reader.ReadOrganizationChartColor();
        }

        public enum ShadowType
        {
            None,
            SideAndBottom = 0x01,
            SideAndBottomBevel = 0x02,
            TopOrBottom = 0x03,
            LeftBottomRight = 0x04
        }
    }
}
