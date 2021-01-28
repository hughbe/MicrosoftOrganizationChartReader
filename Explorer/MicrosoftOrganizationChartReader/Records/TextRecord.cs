using System.IO;
using System.Text;

namespace OrganizationChartReader
{
    public class TextRecord
    {
        public string Value{ get; set; }

        public TextRecord(BinaryReader reader)
        {
            Value = Encoding.ASCII.GetString(reader.ReadBytes((int)reader.BaseStream.Length));
        }
    }
}
