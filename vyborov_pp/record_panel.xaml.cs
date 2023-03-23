using System;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Controls;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для record_panel.xaml
    /// </summary>
    public partial class record_panel : Page
    {
        public record_panel()
        {
            InitializeComponent();
        }

        System.Windows.Threading.DispatcherTimer timer = new System.Windows.Threading.DispatcherTimer();

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                SQLclass.OpenConnection();
                UpdateData();
            
                timer.Tick += new EventHandler(timerTick);
                timer.Interval = new TimeSpan(0, 0, 30);
                timer.Start();
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);
            }
        }

        private void timerTick(object sender, EventArgs e)
        {
            UpdateData();
        }

        public void UpdateData()
        {
            SqlCommand query = new SqlCommand($"SELECT Service.Description AS 'Услуга', CONCAT(Client.FirstName, ' ', Client.LastName, ' ', Client.Patronymic) AS 'Клиент', Client.Email AS 'Email', Client.Phone AS 'Phone', ClientService.StartTime AS 'Время' FROM ClientService INNER JOIN Client ON Client.ID = ClientService.ClientID INNER JOIN Service ON Service.ID = ClientService.ServiceID WHERE ClientService.StartTime >= GETDATE() AND ClientService.StartTime <= GETDATE()+2 ORDER BY (ClientService.StartTime)", SQLclass.conn); 
            query.ExecuteNonQuery();

            SqlDataAdapter dataAdp = new SqlDataAdapter(query);
            DataTable dt = new DataTable();
            dataAdp.Fill(dt);
            data.ItemsSource = dt.DefaultView;           
        }
    }
}
