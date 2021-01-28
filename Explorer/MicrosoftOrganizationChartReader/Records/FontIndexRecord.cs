using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class FontIndexRecord
    {
        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Index { get; set; }

        public FontIndexRecord(BinaryReader reader)
        {
            Index = reader.ReadUInt16();
        }
    }
}
