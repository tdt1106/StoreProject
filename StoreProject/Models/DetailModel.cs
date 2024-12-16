namespace StoreProject.Models
{
    public class DetailModel
    {
        public Guid RowPointer { get; set; }
        public int ID { get; set; }
        public string HeaderRowFunding { get; set; }
        public string Column1 { get; set; }
        public string Column2 { get; set; }
        public string Column3 { get; set; }
        public string CreatedBy { get; set; }
        public DateTime CreatedDate { get; set; }
        public string UpdatedBy { get; set; }
        public DateTime UpdatedDate { get; set; }
    }
}
