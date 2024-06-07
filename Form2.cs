using Bunifu.UI.WinForms;
using Bunifu.UI.WinForms.Renderers.Snackbar;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace GeleceğeNOTProje
{   //CEMİLCEM OKTAY 222523015
    public partial class Form2 : Form
    {
        public Form2()
        {
            InitializeComponent();
            Control[] controls = panel2.Controls.Cast<Control>().ToArray();
            bunifuFormDock1.SubscribeControlsToDragEvents(controls);
        }

        private void bunifuImageButton1_Click(object sender, EventArgs e)
        {
            // Kullanıcı adı ve şifreyi alır ve tabloda karşılaştırır eğer uyuşursa formu kapatım diğer formu açar uyuşmaz ise uyarı verir.
            string kullaniciAdi = bunifuTextBox1.Text;
            string sifre = bunifuTextBox2.Text;
            string connectionString = "Data Source=DESKTOP-242E7PH\\SQLEXPRESS;Initial Catalog=tbl_GelecegeNot;Integrated Security=True";
            string query = "SELECT * FROM kullanici WHERE kullaniciAdi = @kullaniciAdi AND sifre = @sifre";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                command.Parameters.AddWithValue("@sifre", sifre);

                try
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.Read())
                    {
                        Form1 FrmAna = new Form1();
                        FrmAna.kullanici = kullaniciAdi;

                        FrmAna.Show();
                        this.Hide();
                    }
                    else
                    {
                        MessageBox.Show("Kullanıcı adı veya şifre hatalı.", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                    reader.Close();
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Bir hata oluştu: " + ex.Message, "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        private void bunifuShadowPanel1_ControlAdded(object sender, ControlEventArgs e)
        {
           
        }

        private void bunifuImageButton2_Click(object sender, EventArgs e)
        {
            //Kayıt olma ekranını açar. Girişi sağlayan araçları gizler ve kayıt araçlarını gösterir. Tekrar tıklandığında ise işlemin tersini yapar.
            bunifuPictureBox1.Visible = !bunifuPictureBox1.Visible;
            bunifuTextBox3.Visible = !bunifuTextBox3.Visible;
            bunifuPictureBox4.Visible = !bunifuPictureBox4.Visible;
            bunifuTextBox4.Visible = !bunifuTextBox4.Visible;
            label5.Visible = !label5.Visible;
            label4.Visible = !label4.Visible;
            label2.Visible = !label2.Visible;
            label3.Visible = !label3.Visible;
            bunifuImageButton1.Visible = !bunifuImageButton1.Visible;
            bunifuImageButton3.Visible = !bunifuImageButton3.Visible;
            bunifuImageButton4.Visible = !bunifuImageButton4.Visible;
        }

        private void bunifuImageButton3_Click(object sender, EventArgs e)
        {
            // Kullanıcı kaydını yapar. Kullanıcı adı ve şifrenin boş olurp olup olamdığına bakar ve uygunsa tabloya yeni kullanıcıyı kaydeder ve giriş ekranına yönlendirir.
            string kullaniciAdi = bunifuTextBox3.Text;
            string sifre = bunifuTextBox4.Text;

            if (string.IsNullOrWhiteSpace(kullaniciAdi) || string.IsNullOrWhiteSpace(sifre))
            {
                MessageBox.Show("Kullanıcı adı veya şifre boş bırakılamaz.", "Uyarı", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                return;
            }

            string connectionString = "Data Source=DESKTOP-242E7PH\\SQLEXPRESS;Initial Catalog=tbl_GelecegeNot;Integrated Security=True";
            string insertUserQuery = "INSERT INTO kullanici (kullaniciAdi, sifre) VALUES (@kullaniciAdi, @sifre)";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand insertUserCommand = new SqlCommand(insertUserQuery, connection);
                insertUserCommand.Parameters.AddWithValue("@kullaniciAdi", kullaniciAdi);
                insertUserCommand.Parameters.AddWithValue("@sifre", sifre);

                try
                {
                    connection.Open();
                    int rowsAffected = insertUserCommand.ExecuteNonQuery();

                    if (rowsAffected > 0)
                    {
                        MessageBox.Show("Kullanıcı başarıyla eklendi.", "Bilgi", MessageBoxButtons.OK, MessageBoxIcon.Information);
                        bunifuImageButton4_Click(sender, e);
                        bunifuTextBox3.Text = string.Empty;
                        bunifuTextBox4.Text = string.Empty;
                    }
                    else
                    {
                        MessageBox.Show("Kullanıcı eklenemedi. Lütfen tekrar deneyin.", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Bir hata oluştu: " + ex.Message, "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
                }
                finally
                {
                    connection.Close();
                }
            }
        }

        private void label6_Click(object sender, EventArgs e)
        {
            dataGridView1.Visible = true;
            string connectionString = "Data Source=DESKTOP-242E7PH\\SQLEXPRESS;Initial Catalog=tbl_GelecegeNot;Integrated Security=True";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = "SELECT id, kullaniciAdi, sifre FROM kullanici";
                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    SqlDataAdapter dataAdapter = new SqlDataAdapter(command);
                    DataTable dataTable = new DataTable();
                    dataAdapter.Fill(dataTable);
                    dataGridView1.DataSource = dataTable;
                }

                MessageBox.Show("Kullanıcı tablosu başarıyla yüklendi.", "Başarı", MessageBoxButtons.OK, MessageBoxIcon.Information);
            }
            catch (Exception ex)
            {
                MessageBox.Show($"Bir hata oluştu: {ex.Message}", "Hata", MessageBoxButtons.OK, MessageBoxIcon.Error);
            }
        }

        private void bunifuImageButton4_Click(object sender, EventArgs e)
        {
            //Giriş ekranını açar. Girişi sağlayan araçları gösterir ve kayıt araçlarını gizler. Tekrar tıklandığında ise işlemin tersini yapar.
            bunifuPictureBox1.Visible = !bunifuPictureBox1.Visible;
            bunifuTextBox3.Visible = !bunifuTextBox3.Visible;
            bunifuPictureBox4.Visible = !bunifuPictureBox4.Visible;
            bunifuTextBox4.Visible = !bunifuTextBox4.Visible;
            label5.Visible = !label5.Visible;
            label4.Visible = !label4.Visible;
            label2.Visible = !label2.Visible;
            label3.Visible = !label3.Visible;
            bunifuImageButton1.Visible = !bunifuImageButton1.Visible;
            bunifuImageButton3.Visible = !bunifuImageButton3.Visible;
            bunifuImageButton4.Visible = !bunifuImageButton4.Visible;
        }

        private void Form2_Load(object sender, EventArgs e)
        {
            // TODO: Bu kod satırı 'tbl_GelecegeNotDataSet6.kullanici' tablosuna veri yükler. Bunu gerektiği şekilde taşıyabilir, veya kaldırabilirsiniz.
            this.kullaniciTableAdapter.Fill(this.tbl_GelecegeNotDataSet6.kullanici);

        }

        private void label7_Click(object sender, EventArgs e)
        {
            label6.Enabled = true;
        }
    }
}
