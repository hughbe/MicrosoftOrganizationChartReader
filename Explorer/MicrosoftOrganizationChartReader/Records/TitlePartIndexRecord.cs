using System.IO;

namespace OrganizationChartReader
{
    public class TitlePartIndexRecord
    {
        public ushort Index { get; set; }

        public TitlePartIndexRecord(BinaryReader reader)
        {
            Index = reader.ReadUInt16();
        }
    }
}
