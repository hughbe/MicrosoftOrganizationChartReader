using System.IO;

namespace OrganizationChartReader
{
    public class BoxTextPartCountRecord
    {
        public ushort Count { get; set; }

        public BoxTextPartCountRecord(BinaryReader reader)
        {
            Count = reader.ReadUInt16();
        }
    }
}
