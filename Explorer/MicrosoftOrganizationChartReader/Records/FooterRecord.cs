using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class FooterRecord
    {
        public ushort Size { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public uint Crc { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public uint FileSize { get; set; }

        public FooterRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Crc = reader.ReadUInt32();
            FileSize = reader.ReadUInt32();
        }
    }
}
