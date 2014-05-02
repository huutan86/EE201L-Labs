#include <iostream>
#include <fstream>
#include <string>
using namespace std;

void convertDecimalToFBB(int* FBB, int decimal)
{

	//reset binary to all 0's
	for (int i = 0; i < 4; ++i)
	{
		FBB[i] = 0;
	}

	if (decimal >= 8)
	{
		FBB[0] = 1;
		decimal -= 8;
	}

	if (decimal >= 4)
	{
		FBB[1] = 1;
		decimal -= 4;
	}

	if (decimal >= 2)
	{
		FBB[2] = 1;
		decimal -= 2;
	}

	if (decimal >= 1)
	{
		FBB[3] = 1;
		decimal -= 1;
	}

}

void incrementEBB(int* binary)
{
	if (binary[7] == 0)
	{
		binary[7] = 1;
	}
	else
	{
		//binary[7] is 1, therefore change to 0
		binary[7] = 0;
		if (binary[6] == 0)
		{
			binary[6] = 1;
		}
		else
		{
			//binary[6] is 1, therefore change to 0
			binary[6] = 0;

			if (binary[5] == 0)
			{
				binary[5] = 1;
			}
			else
			{
				//binary[5] is 1, therefore change to 0
				binary[5] = 0;

				if (binary[4] == 0)
				{
					binary[4] = 1;
				}
				else
				{
					//binary[4] is 1, therefore change to 0
					binary[4] = 0;

					if (binary[3] == 0)
					{
						binary[3] = 1;
					}
					else
					{
						//binary[3] is 1, therefore change to 0
						binary[3] = 0;

						if (binary[2] == 0)
						{
							binary[2] = 1;
						}
						else
						{
							//binary[2] is 1, therefore change to 0
							binary[2] = 0;
						
							if (binary[1] == 0)
							{
								binary[1] = 1;
							}
							else
							{
								//binary[1] is 1, therefore change to 0
								binary[1] = 0;

								if (binary[0] == 0)
								{
									binary[0] = 1;
								}
								else
								{
									//binary[0] is 1, therefore change to 0
									binary[0] = 0;
								}
							}
						}
					}
				}
			}
		}
	}
}

string itoa(int a)
{
	if (a == 0)
	{
		return "0";		
	}
	if (a == 1)
	{
		return "1";	
	}
	if (a == 2)
	{
		return "2";	
	}
	if (a == 3)
	{
		return "3";	
	}
	if (a == 4)
	{
		return "4";	
	}
	if (a == 5)
	{
		return "5";	
	}
	if (a == 6)
	{
		return "6";	
	}
	if (a == 7)
	{
		return "7";	
	}
	if (a == 8)
	{
		return "8";	
	}
	if (a == 9)
	{
		return "9";	
	}

}

string returnBinary(int* binary, int size)
{
	string output = "";
	if (size == 8)
		output = "8'b";
	else
		output = "4'b";

	for (int i = 0; i < size; ++i)
	{
		output += itoa(binary[i]);
	}

	return output;
}

void print(int* binary)
{
	for (int i = 0; i < 8; ++i)
	{
		cout << binary[i] << " ";
	}
	cout << endl;
}

int main()
{
	int* binary = new int[8];
	for (int i = 0; i < 8; ++i)
	{
		binary[i] = 0;
	}

	ofstream fout("output.txt");

	int* tens = new int[4];
	int* ones = new int[4];
	int* hundreds = new int[4];

	//initial headers;

	fout << "always @ (posedge sys_clk) begin" << endl << endl;
	for (int i = 0; i < 256; ++i)
	{
		int decimal = i;

		fout << "\t" << "if (SSD_Output == " << returnBinary(binary, 8) << ") begin" << endl;
		fout << "\t" << "\t" << "// " << i << endl;
		//Determine hundreds place first
		if ((decimal/100) > 0)
		{
			fout << "\t" << "\t" << "triple <= 1'b1;" << "\t";
			convertDecimalToFBB(hundreds, (i/100));
			fout << "hundreds <= " << returnBinary(hundreds, 4) << ";" << "\t";

		}
		else
		{
			fout << "\t" << "\t" << "triple <= 1'b0;" << "\t";
			fout << "hundreds <= 4'b0000;" << "\t";
		}

		//done with hundreds, now move to tens
		decimal -= ((decimal / 100) * 100);

		//determine double or not
		if ( (decimal / 10) > 0)
		{
			fout << "double <= 1'b1;" << "\t";
			convertDecimalToFBB(tens, (decimal/10));
			fout << "tens <= " << returnBinary(tens, 4) << ";" << "\t";
		}
		else
		{
			fout << "double <= 1'b0;" << "\t";
			fout << "tens <= 4'b0000;" << "\t";
		}

		//and now for ones
		decimal -= ((decimal / 10) * 10);

		//determine the value of the last digit

		if ( decimal > 0)
		{
			convertDecimalToFBB(ones, decimal);
			fout << "ones <= " << returnBinary(ones, 4) << ";" << "\t";
		}
		else
		{
			fout << "ones <= 4'b0000;" << "\t";			
		}


		fout << endl;
		fout << "\t" << "end" << endl << endl;

		// cout << returnBinary(binary) << endl;
		






		incrementEBB(binary);


	}

	fout << "end" << endl;


	return 0;



}