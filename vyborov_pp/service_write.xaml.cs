using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Input;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для service_write.xaml
    /// </summary>
    public partial class service_write : Page
    {
        string id_services = "";
        public service_write(string form_id_services)
        {
            InitializeComponent();

            id_services = form_id_services; 
        }

        private void duration_time_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            e.Handled = "0123456789:".IndexOf(e.Text) < 0;
        }

        private void btn_save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (client_list.SelectedIndex >= 0 && date_start.Text != "" && duration.Text != "")
                {
                    string current_time = duration.Text;
                    string date_time = date_start.Text;
                    DateTime date = Convert.ToDateTime(date_time.Replace("00:00:0000", ""));
                    string normal_date = Convert.ToString(date); 
                    string rez_date = normal_date[6] + "" + normal_date[7] + "" + normal_date[8] + "" + normal_date[9] + "-" + normal_date[0] + "" + normal_date[1] + "-" + normal_date[3] + "" + normal_date[4] + " " + duration.Text + ":00";
                    if (Convert.ToInt32(current_time[0] + "" + current_time[1]) < 24 && Convert.ToString(current_time[2]) == ":" && Convert.ToInt32(current_time[3] + "" + current_time[4]) < 60)
                    {
                        if (comment.Text == "")
                        {
                            comment.Text = "NULL";
                        }
                        SQLclass.Select($"INSERT INTO [dbo].[ClientService] (ClientID, ServiceID, StartTime, Comment) VALUES (N'" + (client_list.SelectedIndex+1) + "',N'" + id_services + "',N'" + (rez_date + ".000") + "',N'" + comment.Text + "')");
                        Notification.Notify("Успешно", "Вы записали клиента на услугу");
                        StaticVars.MainWnd.Content = new record_panel();
                    }
                    else
                        Notification.Notify("Ошибка", "Пожалуйста укажите реальное время начала сеанса");
                }
                else
                {
                    Notification.Notify("Ошибка", "Пожалуйста заполните все данные");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                List<string> service_info = SQLclass.Select($"SELECT Description, DurationInSeconds FROM [dbo].[Service] WHERE ID = '" + id_services + "'");

                name_service.Text = service_info[0];
                duration_time.Text = service_info[1] + " мин.";

                SqlDataAdapter a = new SqlDataAdapter("SELECT CONCAT(FirstName, ' ', LastName, ' ', Patronymic) as 'name', id as 'id' FROM Client", SQLclass.conn); 

                DataTable table_p = new DataTable();
                a.Fill(table_p);

                client_list.DisplayMemberPath = "name";
                client_list.ItemsSource = table_p.AsDataView();
                client_list.SelectedIndex = -1;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }
    }
}
