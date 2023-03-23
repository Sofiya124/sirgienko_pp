using System;
using System.Collections.Generic;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Forms;
using System.Windows.Media;
using System.Windows.Media.Imaging;

namespace vyborov_pp
{
    /// <summary>
    /// Логика взаимодействия для service_edit.xaml
    /// </summary>
    public partial class service_edit : Page
    {
        string id_services = "", main_file = "";
        string extra_one = "", extra_two = "", extra_three = "";

        public service_edit(string form_id_services)
        {
            InitializeComponent();
            id_services = form_id_services;
        }

        private void btn_edit_photo_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                System.Windows.MessageBox.Show("Пожалуйста выберите одну картинку из представленного каталога!", "Важно", MessageBoxButton.OK, MessageBoxImage.Information);
                OpenFileDialog openFile_preview = new OpenFileDialog();
                openFile_preview.InitialDirectory = Environment.CurrentDirectory + @"\Preview\";
                openFile_preview.Filter = "All files(*.png)|*.*";
                openFile_preview.DefaultExt = ".png";
                openFile_preview.ShowDialog();

                if (openFile_preview.FileName != null || openFile_preview.FileName != "")
                {
                    ImageSource image = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + openFile_preview.SafeFileName, UriKind.Absolute));
                    main_photo.Source = image;
                    main_file = openFile_preview.SafeFileName;
                }
                else
                    System.Windows.MessageBox.Show("Вы не выбрали фото!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);
            }
        }

        private void btn_save_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                if (Convert.ToInt32(duration.Text) <= 240 && Convert.ToInt32(duration.Text) > 0)
                {
                    if (id_services != "") // редактирование
                    {
                        SQLclass.Insert("UPDATE Service SET Description = N'" + description.Text + "', DurationInSeconds = N'" + duration.Text + "', Cost = N'" + price.Text + "', Discount = N'" + discount.Text + "', MainImagePath = N'" + main_file + "' WHERE ID = N'" + id_services + "'");
                        
                        if (extra_one != "")
                        {
                            SQLclass.Insert("INSERT INTO ServicePhoto (ServiceID, PhotoPath) VALUES (N'" + id_services + "',N'" + extra_one + "')");
                        }
                        
                        if (extra_two != "")
                        {
                            SQLclass.Insert("INSERT INTO ServicePhoto (ServiceID, PhotoPath) VALUES (N'" + id_services + "',N'" + extra_two + "')");
                        }

                        if (extra_three != "")
                        {
                            SQLclass.Insert("INSERT INTO ServicePhoto (ServiceID, PhotoPath) VALUES (N'" + id_services + "',N'" + extra_three + "')");
                        }

                        Notification.Notify("Успех", "Информация об услуге успешно отредактирована");
                        StaticVars.MainWnd.Content = new MainWindow();
                    }
                    else if (id_services == "") // добавление
                    {
                        if (main_file != "")
                        {
                            SQLclass.Insert("INSERT INTO Service(Title, Cost, DurationInSeconds, Description, Discount, MainImagePath) VALUES (N'" + service_title.Text + "',N'" + price.Text + "',N'" + duration.Text + "',N'" + description.Text + "',N'" + discount.Text + "',N'" + main_file + "')");
                            Notification.Notify("Успех", "Новая услуга успешно добавлена!");
                            StaticVars.MainWnd.Content = new MainWindow();
                        }
                        else
                        {
                            System.Windows.MessageBox.Show("Вы не выбрали главное фото!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                        }
                    }
                } 
                else
                {
                    Notification.Notify("Ошибка", "Продолжительность услуги не может превышать 4 часа или быть отрицательной!");
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);
            }          
        }

        private void btn_edit_extra_photo_Click(object sender, RoutedEventArgs e)
        {
            if (id_services != "")
            {
                if (extra_one == "" && extra_two == "" && extra_three == "")
                {
                    System.Windows.MessageBox.Show("Пожалуйста выберите одну картинку из представленного каталога!", "Важно", MessageBoxButton.OK, MessageBoxImage.Information);
                    OpenFileDialog openFile_preview = new OpenFileDialog();
                    openFile_preview.InitialDirectory = Environment.CurrentDirectory + @"\Preview\";
                    openFile_preview.Filter = "All files(*.png)|*.*";
                    openFile_preview.DefaultExt = ".png";
                    openFile_preview.ShowDialog();

                    if (openFile_preview.FileName != null || openFile_preview.FileName != "")
                    {
                        ImageSource image = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + openFile_preview.SafeFileName, UriKind.Absolute));
                        extra_photo_one.Source = image;
                        extra_one = openFile_preview.SafeFileName;
                        btn_del_extra_one.Visibility = Visibility.Visible;
                    }
                    else
                        System.Windows.MessageBox.Show("Вы не выбрали фото!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                else if (extra_one != "" && extra_two == "" && extra_three == "")
                {
                    System.Windows.MessageBox.Show("Пожалуйста выберите одну картинку из представленного каталога!", "Важно", MessageBoxButton.OK, MessageBoxImage.Information);
                    OpenFileDialog openFile_preview = new OpenFileDialog();
                    openFile_preview.InitialDirectory = Environment.CurrentDirectory + @"\Preview\";
                    openFile_preview.Filter = "All files(*.png)|*.*";
                    openFile_preview.DefaultExt = ".png";
                    openFile_preview.ShowDialog();

                    if (openFile_preview.FileName != null || openFile_preview.FileName != "")
                    {
                        ImageSource image = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + openFile_preview.SafeFileName, UriKind.Absolute));
                        extra_photo_two.Source = image;
                        extra_two = openFile_preview.SafeFileName;
                        btn_del_extra_two.Visibility = Visibility.Visible;
                    }
                    else
                        System.Windows.MessageBox.Show("Вы не выбрали фото!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                else if (extra_one != "" && extra_two != "" && extra_three == "")
                {
                    System.Windows.MessageBox.Show("Пожалуйста выберите одну картинку из представленного каталога!", "Важно", MessageBoxButton.OK, MessageBoxImage.Information);
                    OpenFileDialog openFile_preview = new OpenFileDialog();
                    openFile_preview.InitialDirectory = Environment.CurrentDirectory + @"\Preview\";
                    openFile_preview.Filter = "All files(*.png)|*.*";
                    openFile_preview.DefaultExt = ".png";
                    openFile_preview.ShowDialog();

                    if (openFile_preview.FileName != null || openFile_preview.FileName != "")
                    {
                        ImageSource image = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + openFile_preview.SafeFileName, UriKind.Absolute));
                        extra_photo_three.Source = image;
                        extra_three = openFile_preview.SafeFileName;
                        btn_del_extra_three.Visibility = Visibility.Visible;
                    }
                    else
                        System.Windows.MessageBox.Show("Вы не выбрали фото!", "Ошибка", MessageBoxButton.OK, MessageBoxImage.Warning);
                }
                else if (extra_one != "" && extra_two != "" && extra_three != "")
                {
                    Notification.Notify("Ошибка", "Вы добавили максималльное количество доп. фотографий");
                }
            }
            else
            {
                Notification.Notify("Ошибка", "Добавлять фотографии можно только к существующим услугам");
            }           
        }

        public void DelExtraPhoto(string service_id, string name_photo)
        {
            try
            {
                SQLclass.Select($"DELETE FROM [dbo].[ServicePhoto] WHERE ServiceID = '" + service_id + "' AND PhotoPath = '" + name_photo + "'");
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);
            }
        }

        private void btn_del_extra_one_Click(object sender, RoutedEventArgs e)
        {
            if (extra_one != "")
            {
                DelExtraPhoto(id_services, extra_one);
                extra_photo_one.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/99906_services_icon.png", UriKind.Absolute));
                extra_one = "";
                btn_del_extra_one.Visibility = Visibility.Hidden;               
            }
        }

        private void duration_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = "0123456789".IndexOf(e.Text) < 0;
        }

        private void price_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = "0123456789".IndexOf(e.Text) < 0;
        }

        private void discount_PreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            e.Handled = "0123456789".IndexOf(e.Text) < 0;
        }

        private void btn_del_extra_two_Click(object sender, RoutedEventArgs e)
        {
            if (extra_two != "")
            {
                DelExtraPhoto(id_services, extra_two);
                extra_photo_two.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/99906_services_icon.png", UriKind.Absolute));
                extra_two = "";
                btn_del_extra_one.Visibility = Visibility.Hidden;
            }
        }

        private void btn_del_extra_three_Click(object sender, RoutedEventArgs e)
        {
            if (extra_three != "")
            {
                DelExtraPhoto(id_services, extra_three);
                extra_photo_three.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/99906_services_icon.png", UriKind.Absolute));
                extra_three = "";
                btn_del_extra_one.Visibility = Visibility.Hidden;
            }
        }

        private void Page_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {               
                if (id_services != "") // редактирование
                {
                    List<string> services = SQLclass.Select($"SELECT * FROM service WHERE ID = '" + id_services + "'");

                    description.Text = services[4];
                    duration.Text = services[3];
                    price.Text = services[2];
                    discount.Text = services[5];
                    main_file = services[6];

                    main_photo.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + services[6], UriKind.Absolute));

                    List<string> extra_photo = SQLclass.Select($"SELECT * FROM ServicePhoto WHERE ServiceID = '" + id_services + "'");

                    if (extra_photo.Count == 3)
                    {
                        extra_photo_one.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[2], UriKind.Absolute));
                        extra_one = extra_photo[2];
                        btn_del_extra_one.Visibility = Visibility.Visible;
                    }
                    else if (extra_photo.Count == 6)
                    {
                        extra_photo_one.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[2], UriKind.Absolute));
                        extra_photo_two.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[5], UriKind.Absolute));                   
                        extra_one = extra_photo[2];
                        extra_two = extra_photo[5];
                        btn_del_extra_one.Visibility = Visibility.Visible;
                        btn_del_extra_two.Visibility = Visibility.Visible;
                    }
                    else if (extra_photo.Count == 9)
                    {
                        extra_photo_one.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[2], UriKind.Absolute));
                        extra_photo_two.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[5], UriKind.Absolute));
                        extra_photo_three.Source = new BitmapImage(new Uri(Environment.CurrentDirectory + "/Preview/" + extra_photo[8], UriKind.Absolute));
                        extra_one = extra_photo[2];
                        extra_two = extra_photo[5];
                        extra_three = extra_photo[8];
                        btn_del_extra_one.Visibility = Visibility.Visible;
                        btn_del_extra_two.Visibility = Visibility.Visible;
                        btn_del_extra_three.Visibility = Visibility.Visible;
                    }
                }
            }
            catch (Exception ex)
            {
                System.Windows.MessageBox.Show(ex.Message);
            }           
        }
    }
}
