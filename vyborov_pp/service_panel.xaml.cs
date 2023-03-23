using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для service_panel.xaml
    /// </summary>
    public partial class service_panel : UserControl
    {
        public service_panel()
        {
            InitializeComponent();
        }

        string id_services, name_services, image = "";
        int price_services, duration_services, discount_services = 0;

        private void btn_write_Click(object sender, RoutedEventArgs e)
        {
            StaticVars.MainWnd.Content = new service_write(id_services);
        }

        private void btn_del_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                int count = 0;
                List<string> services = SQLclass.Select($"SELECT COUNT(*) FROM ClientService WHERE ServiceID = '" + id_services + "'");

                for (int i = 0; i < services.Count; i++)
                {
                    count += Convert.ToInt32(services[0]);
                }
                
                if (count > 0)
                {
                    Notification.Notify("Операция невозможна", "На данную услугу есть или были записи клиентов");
                }
                else
                {
                    SQLclass.Select($"DELETE FROM [dbo].[Service] WHERE ID = '" + id_services + "'");
                    Notification.Notify("Успешно", "Вы удалили услугу под номером " + id_services);
                    StaticVars.MainWnd.Content = new MainWindow();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btn_edit_Click(object sender, RoutedEventArgs e)
        {
            StaticVars.MainWnd.Content = new service_edit(id_services);
        }

        public service_panel(string Form_id_services, string Form_name_services, int Form_duration_services, int Form_price_services, int Form_discount_services, string Form_image)
        {
            try
            {
                InitializeComponent();
                id_services = Form_id_services;
                name_services = Form_name_services;
                duration_services = Form_duration_services;
                discount_services = Form_discount_services;
                price_services = Form_price_services;
                image = Form_image;

                if (discount_services > 0)
                {
                    back.Background = new SolidColorBrush(Color.FromRgb(231, 250, 131));
                    txt_disc.Text = price_services.ToString();
                    txt_service_price.Margin = new Thickness(45, 15, 0, 0);
                    txt_service_price.Text = ((price_services / 100) * (100 - discount_services)).ToString() + " рублей за " + duration_services.ToString() + " минут";
                    txt_name_discount.Text = "* скидка " + discount_services.ToString() + "%";
                }
                else
                {
                    txt_disc.Visibility = Visibility.Hidden;
                    txt_service_price.Margin = new Thickness(10, 15, 0, 0);
                    txt_service_price.Text = price_services.ToString() + " рублей за " + duration_services.ToString() + " минут";
                    txt_name_discount.Visibility = Visibility.Hidden;
                }

                txt_name_service.Text = name_services;
                img_service.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + image, UriKind.Absolute));

                if (StaticVars.admin_mode == false)
                {
                    btn_del.Visibility = Visibility.Hidden;
                    btn_edit.Visibility = Visibility.Hidden;
                    btn_write.Visibility = Visibility.Hidden;
                }
                else
                {
                    btn_del.Visibility = Visibility.Visible;
                    btn_edit.Visibility = Visibility.Visible;
                    btn_write.Visibility = Visibility.Visible;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }           
        }
    }
}
