using Spire.Doc;
using System.ComponentModel;
using System.Net.Http;
using System.Net.Http.Json;
using System.Runtime.CompilerServices;
using System.Text;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace InVariativ
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window, INotifyPropertyChanged
    {
        public string Data { get; set; }
        public string Result { get; set; }

        public MainWindow()
        {
            InitializeComponent();

            DataContext = this;

            GenerateTabe();
        }

        public event PropertyChangedEventHandler? PropertyChanged;
        public void Signal([CallerMemberName] string prop = null)
            => PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));


        private void GetData(object sender, RoutedEventArgs e)
        {
            HttpClient httpClient = new HttpClient();
            httpClient.BaseAddress = new Uri("http://localhost:4444/TransferSimulator/");

            var data = httpClient.GetFromJsonAsync<DTO>("fullName").Result;
            if (data is null || string.IsNullOrWhiteSpace(data.Value))
                return;

            Data = data.Value;
            Signal(nameof(Data));
            Result = "";
            Signal(nameof(Result));

        }

        private void CheckResult(object sender, RoutedEventArgs e)
        {
            Document doc = new Document();
            doc.LoadFromFile(System.IO.Path.Combine(Environment.CurrentDirectory, "Test" + ".docx"));

            Dictionary<string, string> replacement = new Dictionary<string, string>();

            if (Regex.IsMatch(Data, @"[-_!?&@#$/\\\.;^:|%^*+()=0-9a-zA-Z]"))
            {
                //Result = "ФИО содержит запрещенные символы";
                //replacement.Add( new Dictionary<string, string>() { 
                
                //    {"", "" }
                //}
                //);
            }

            else
            {
                Result = "ФИО не содержит запрещённых символов";
            }
                

            Signal(nameof(Result));
        }
        void GenerateTabe()
        {
            Document  doc = new Document();
            Spire.Doc.Section section = doc.AddSection();

            Spire.Doc.Table table = section.AddTable(true);
            table.ResetCells(4, 3);

            Spire.Doc.TableRow headerRow = table.Rows[0];
            headerRow.IsHeader = true;

            headerRow.Cells[0].AddParagraph().AppendText("Действие");
            headerRow.Cells[1].AddParagraph().AppendText("Ожидаемый результат");
            headerRow.Cells[2].AddParagraph().AppendText("Результат (Успешно/Не успешно)");

            string path = System.IO.Path.Combine(Environment.CurrentDirectory, "Test" + ".docx");
            if(System.IO.File.Exists(path))
                System.IO.File.Delete(path);

            doc.SaveToFile(path, FileFormat.Docx);
        }
    }
}