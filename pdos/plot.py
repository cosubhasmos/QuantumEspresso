import numpy as np
import matplotlib.pyplot as plt

file1 = np.loadtxt('si-pdos.dat.pdos_atm#1(Si)_wfc#1(s)')
file2 = np.loadtxt('si-pdos.dat.pdos_atm#1(Si)_wfc#2(p)')
energy1, pdos1 = file1[:,0], file1[:,1]
energy2, pdos2 = file2[:,0], file2[:,1]

plt.ylabel("PDOS")
plt.xlabel("Energy (eV)")
plt.plot(energy1,pdos1,color='red',label="si-pdos.dat.pdos_atm#1(Si)_wfc#1(s)")
plt.plot(energy2,pdos2,color='blue',label="si-pdos.dat.pdos_atm#1(Si)_wfc#2(p)")
plt.legend()

plt.savefig('pdos_sp.png')
plt.show()
