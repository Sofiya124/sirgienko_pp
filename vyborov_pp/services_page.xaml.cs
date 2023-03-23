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
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Page
    {
        public MainWindow()
        {
            InitializeComponent();
        }

        public void SelectServices(string find, string sort, string disc)
        {
            try
            {               
                int show = 0;

                Fr.Children.Clear();
                List<string> services = SQLclass.Select($"SELECT * FROM service {find} {sort} {disc}");

                for (int i = 0; i < services.Count; i += 7)
                {
                    service_panel service_Panel = new service_panel(services[i], services[i + 4], Convert.ToInt32(services[i + 3]), Convert.ToInt32(services[i + 2]), Convert.ToInt32(services[i + 5]), services[i + 6]);
                    Fr.Children.Add(service_Panel);
                    show++;
                }

                List<string> max = SQLclass.Select($"use service_base SELECT COUNT(ID) FROM service");
                StaticVars.max_count = Convert.ToInt32(max[0]);
                StaticVars.show_count = show;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void sort_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ChangeData();
        }

        private void discount_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            ChangeData();
        }

        private void search_TextChanged(object sender, TextChangedEventArgs e)
        {
            ChangeData();
        }

        public void ChangeData()
        {
            string value_disc = "Discount >= 0 and Discount <= 100";
            if (discount.SelectedIndex == 1)
            {
                value_disc = "Discount >= 0 and Discount < 5";
            }
            else if (discount.SelectedIndex == 2)
            {
                value_disc = "Discount >= 5 and Discount < 15";
            }
            else if (discount.SelectedIndex == 3)
            {
                value_disc = "Discount >= 15 and Discount < 30";
            }
            else if (discount.SelectedIndex == 4)
            {
                value_disc = "Discount >= 30 and Discount < 70";
            }
            else if (discount.SelectedIndex == 5)
            {
                value_disc = "Discount >= 70 and Discount < 100";
            }

            ChangeData(value_disc);
        }

        public void ChangeData(string disc)
        {
            if (search.Text != "" || search.Text != null)
            {
                if (sort.SelectedIndex == 0) // без сортировки
                {
                    SelectServices("WHERE Description LIKE N'" + search.Text + "%'", "AND " + disc, "");
                }
                else if (sort.SelectedIndex == 1) // по возрастанию
                {
                    SelectServices("WHERE Description LIKE N'" + search.Text + "%'", "AND " + disc, "ORDER BY Cost DESC");
                }
                else if (sort.SelectedIndex == 2) // по убыванию
                {
                    SelectServices("WHERE Description LIKE N'" + search.Text + "%'", "AND " + disc, "ORDER BY Cost ASC");
                }
            }
            else
            {
                if (sort.SelectedIndex == 0) // без сортировки
                {
                    SelectServices("WHERE " + disc, "", "");
                }
                else if (sort.SelectedIndex == 1) // по возрастанию
                {
                    SelectServices("WHERE " + disc, "ORDER BY Cost DESC", "");
                }
                else if (sort.SelectedIndex == 2) // по убыванию
                {
                    SelectServices("WHERE " + disc, "ORDER BY Cost ASC", "");
                }
            }
            txt_count_write.Text = "Показано записей " + StaticVars.show_count + " из " + StaticVars.max_count;
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            sort.Items.Add("Без сортировки");
            sort.Items.Add("По убыванию");
            sort.Items.Add("По возрастанию");
            sort.SelectedIndex = 0;

            discount.Items.Add("Все");
            discount.Items.Add("От 0 до 5%");
            discount.Items.Add("От 5% до 15%");
            discount.Items.Add("От 15% до 30%");
            discount.Items.Add("От 30% до 70%");
            discount.Items.Add("От 70% до 100%");
            discount.SelectedIndex = 0;

            SelectServices("", "", "");
        }
    }
}
