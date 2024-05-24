import numpy as np
import matplotlib.pyplot as plt

# Load data
data = np.loadtxt('etot_v_cunipt.dat')
lattice_constants, energies = data[:, 0], data[:, 1]

# Find minimum energy and corresponding lattice constant
min_index = np.argmin(energies)
min_lattice, min_energy = lattice_constants[min_index], energies[min_index]

# Plot energy vs lattice constant
plt.plot(lattice_constants, energies, label='Energy vs. Lattice Constant')
plt.scatter([min_lattice], [min_energy], color='red')
plt.annotate(f'Min Energy: {min_energy:.2f} eV\nMin Lattice: {min_lattice:.2f} Å', 
             xy=(min_lattice, min_energy), 
             xytext=(min_lattice, min_energy + 0.5),
             arrowprops=dict(facecolor='red', shrink=0.05),
             ha='center', color='red')

# Labels and title
plt.xlabel('Lattice Constant (Å)')
plt.ylabel('Energy (eV)')
plt.title('Energy vs. Lattice Constant with Minimum Energy and Lattice Label')
plt.legend()

# Save and show the plot
plt.savefig('lattice_energy_plot.png')
plt.show()

