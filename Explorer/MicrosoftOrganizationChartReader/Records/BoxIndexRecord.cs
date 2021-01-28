using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class BoxIndexRecord
    {
        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Index { get; set; }
       
        public BoxIndexRecord(BinaryReader reader)
        {
            Index = reader.ReadUInt16();
        }
    }
}
