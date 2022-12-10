# Swedish Housing Market Statistics

In this git repository you will find scripts that I've created to analyse the swedish housing market using data from Booli using their API.

*BooliToJSON.py* is a script that takes a search parameter and forwarding it to Booli. Booli returns a search result that contains sold objects. This is then saved to file in JSON format.

*JSONtoCSV.py* is used to convert the data created by BooliToJSON.py to CSV. The reason behind creating this is that it is easy to import CSV data to MATLAB. However, this script was written in a hurry and probably needs a rewrite with e.g. the python library Pandas.


## License
The code created to generate the data is licensed with GNU General Public License 3.0. Please read the COPYING file for more information.

This code is powered by Booli.
![alt text](booli_logo.png "Booli")
