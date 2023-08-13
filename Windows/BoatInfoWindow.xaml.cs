using Boats.Entities;
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
using static Boats.Entities.AppConnect;

namespace Boats.Windows
{
    /// <summary>
    /// Interaction logic for BoatInfoWindow.xaml
    /// </summary>
    public partial class BoatInfoWindow : Window
    {
        private Boat _boat;
        public BoatInfoWindow(Boat boat)
        {
            InitializeComponent();
            DataContext = _boat = boat;
            cbxColor.ItemsSource = cont.Color.ToList();
            cbxType.ItemsSource = cont.BoatType.ToList();
            cbxWood.ItemsSource = cont.WoodType.ToList();
        }

        private void btnSave_Click(object sender, RoutedEventArgs e)
        {
            var errors = new StringBuilder();

            if (string.IsNullOrWhiteSpace(tbxModel.Text))
                errors.AppendLine("Укажите модель лодки");
            if (cbxType.SelectedItem == null)
                errors.AppendLine("Укажите тип лодки");
            if (!int.TryParse(tbxRowersAmount.Text, out _))
                errors.AppendLine("Некорректно введено количество гребцов");
            if (cbxWood.SelectedItem == null)
                errors.AppendLine("Укажите тип дерева");
            if (cbxColor.SelectedItem == null)
                errors.AppendLine("Укажите цвет");
            if (!double.TryParse(tbxCost.Text, out _))
                errors.AppendLine("Некорректно введена цена");

            if (errors.Length > 0)
            {
                MessageBox.Show(errors.ToString());
                return;
            }

            if (_boat.BoatID == 0)
                cont.Boat.Add(_boat);

            try
            {
                cont.SaveChanges();
                MessageBox.Show("Информация сохранена");
                Close();
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Ошибка сохранения\n{ex.Message}");
            }

            #region Менее подробный вариант 

            //if (_boat.BoatID == 0)
            //    cont.Boat.Add(_boat);

            //try
            //{
            //    cont.SaveChanges();
            //    MessageBox.Show("Информация сохранена");
            //    Close();
            //}
            //catch (Exception ex)
            //{
            //    MessageBox.Show($"Ошибка сохранения\n{ex.Message}");
            //    if (_boat.BoatID == 0)
            //        cont.Boat.Remove(_boat); // Убрать несохраненный объект
            //}

            #endregion
        }
    }
}
