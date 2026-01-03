// Read the file path from command line arguments.
using OrgPlusChartReader;

var filePath = args.Length > 0 ? args[0] : throw new ArgumentException("Please provide the path to the organization chart file.");
using var stream = File.OpenRead(filePath);

var chart = new OrganizationChart(stream);

foreach (var record in chart.Records)
{
    Console.WriteLine($"{record.Id}: {GetRecordDetails((OrganizationChartRecordId)record.Id, record.Bytes)}");
}

static string GetRecordDetails(OrganizationChartRecordId id, byte[] data)
{
    using var stream = new MemoryStream(data);
    using var reader = new BinaryReader(stream);
    object obj = id switch
    {
        OrganizationChartRecordId.BoxTextPartCount => new BoxTextPartCountRecord(id, reader),
        OrganizationChartRecordId.BoxTextPartIndex => new BoxTextPartIndexRecord(id, reader),
        OrganizationChartRecordId.BoxTextPartType => new BoxTextPartTypeRecord(id, reader),
        OrganizationChartRecordId.BodyInfo => new BodyInfoRecord(id, reader),
        OrganizationChartRecordId.FontName => new FontNameRecord(id, reader),
        OrganizationChartRecordId.TitlePartIndex => new TitlePartIndexRecord(id, reader),
        OrganizationChartRecordId.Level => new LevelRecord(id, reader),
        OrganizationChartRecordId.BoxIndex => new BoxIndexRecord(id, reader),
        OrganizationChartRecordId.Border => new BorderRecord(id, reader),
        OrganizationChartRecordId.Connector => new ConnectorRecord(id, reader),
        OrganizationChartRecordId.Line => new LineRecord(id, reader),
        OrganizationChartRecordId.Text => new TextRecord(id, reader),
        OrganizationChartRecordId.Shape => new ShapeRecord(id, reader),
        OrganizationChartRecordId.ShapeColor => new ShapeColorRecord(id, reader),
        OrganizationChartRecordId.Selected => new SelectedRecord(id, reader),
        OrganizationChartRecordId.Shadow => new ShadowRecord(id, reader),
        OrganizationChartRecordId.FontIndex => new FontIndexRecord(id, reader),
        OrganizationChartRecordId.Footer => new FooterRecord(id, reader),
        OrganizationChartRecordId.GlobalInfo => new GlobalInfoRecord(id, reader),
        _ => throw new NotSupportedException($"Record ID {id} is not supported."),
    };
    return obj.ToString()!;
}
