using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace BetygBasårForms
{
    public partial class Form1 : Form
    {
        private static Ämne MatematikC = new Ämne("Matematik C", Betyg.F);
        private static Ämne MatematikD = new Ämne("Matematik D", Betyg.F);
        private static Ämne MatematikE = new Ämne("Matematik E", Betyg.F);
        private static Ämne FysikA = new Ämne("Fysik A", Betyg.F);
        private static Ämne FysikB = new Ämne("Fysik B", Betyg.F);
        private static Ämne KemiA = new Ämne("Kemi A", Betyg.F);

        private static Basår jh;

        public Form1()
        {
            InitializeComponent();
        }

        private void Summera()
        {
            jh = new Basår(new[] { MatematikC, MatematikD, MatematikE, FysikA, FysikB, KemiA });
            SummaPoäng.Text = Convert.ToString(jh.SummaBetyg());
        }
        private void MatematikCbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            MatematikC = new Ämne("Matematik C", (Betyg)Enum.Parse(typeof(Betyg), MatematikCbox.SelectedItem.ToString()));
            Summera();
        }

        private void MatematikDbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            MatematikD = new Ämne("Matematik D", (Betyg)Enum.Parse(typeof(Betyg), MatematikDbox.SelectedItem.ToString()));
            Summera();
        }

        private void MatematikEbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            MatematikE = new Ämne("Matematik E", (Betyg)Enum.Parse(typeof(Betyg), MatematikEbox.SelectedItem.ToString()));
            Summera();
        }

        private void FysikAbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            FysikA = new Ämne("Fysik A", (Betyg)Enum.Parse(typeof(Betyg), FysikAbox.SelectedItem.ToString()));
            Summera();
        }

        private void FysikBbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            FysikB = new Ämne("Fysik B", (Betyg)Enum.Parse(typeof(Betyg), FysikBbox.SelectedItem.ToString()));
            Summera();
        }

        private void KemiAbox_SelectedIndexChanged(object sender, EventArgs e)
        {
            KemiA = new Ämne("Kemi A", (Betyg)Enum.Parse(typeof(Betyg), KemiAbox.SelectedItem.ToString()));
            Summera();
        }

    }
}
