using System;
using System.Collections.Generic;
using System.Linq;
using System.Windows.Forms;

namespace BetygBasårForms
{
    enum Betyg
    {
        A = 50, B = 45, C = 40, D = 35, E = 30, F = 0
    }

    class Ämne
    {
        String ämne;
        Betyg betyg;

        public Ämne(String ämn, Betyg bet)
        {
            betyg = bet;
            ämne = ämn;
        }

        public String toString()
        {
            return ämne;
        }
        public Betyg Betyg()
        {
            return betyg;
        }
    }

    class Basår
    {
        Ämne[] ämnen = new Ämne[6];

        public Basår(Ämne[] ämnn)
        {
            ämnen = ämnn;
        }

        public int SummaBetyg()
        {
            int sum = 0;
            foreach (Ämne ä in ämnen)
            {
                sum += (int)ä.Betyg();
            }
            return sum;
        }

        //public String toString()
        //{
        //    String lawldidineedtodotis = "";
        //    return SummaBetyg;
        //}
    }

    static class Program
    {
        /// <summary>
        /// The main entry point for the application.
        /// </summary>

        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);
            Application.Run(new Form1());
        }
    }
}
