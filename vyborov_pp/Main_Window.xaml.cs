using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для Main_Window.xaml
    /// </summary>
    public partial class Main_Window : Window
    {

        public Main_Window()
        {
            try
            {
                InitializeComponent();
                SQLclass.OpenConnection();
                Frame.Content = new MainWindow();
                StaticVars.MainWnd = Frame;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }                  
        }

        private void Window_MouseLeftButtonDown(object sender, MouseButtonEventArgs e)
        {
            this.DragMove();
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            
        }

        private void btn_services_Click(object sender, RoutedEventArgs e)
        {         
            Frame.Content = new MainWindow();
        }

        private void btn_close_Click(object sender, RoutedEventArgs e)
        {
            this.Close();
        }

        private void btn_hidden_Click(object sender, RoutedEventArgs e)
        {
            this.WindowState = WindowState.Minimized;
        }

        private void mode_TextChanged(object sender, TextChangedEventArgs e)
        {
            if (mode.Text == "0000")
            {
                StaticVars.admin_mode = true;
                btn_add_services.Visibility = Visibility.Visible;
                btn_record.Visibility = Visibility.Visible;
                Frame.Content = new MainWindow();

                Notification.Notify("Уведомление", "Включен режим администратора");
            }
            else if (StaticVars.admin_mode == true)
            {
                StaticVars.admin_mode = false;
                btn_add_services.Visibility = Visibility.Hidden;
                btn_record.Visibility = Visibility.Hidden;
                Frame.Content = new MainWindow();
            }           
        }

        private void btn_add_services_Click(object sender, RoutedEventArgs e)
        {
            Frame.Content = new service_edit("");
        }

        private void btn_record_Click(object sender, RoutedEventArgs e)
        {
            Frame.Content = new record_panel();
        }
    }
}
