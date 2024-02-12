#!/usr/bin/env python3

# from the python-constraint package
import constraint
from pprint import pprint
import getopt,sys

# Valores por defecto iniciales que serán sustituidos por los especificados
# All frequencies in MHz
platform = 'xilinx-mmcm'
fin     = 50
fout    = 6.25
error_threshold = 0.1
no_limit_results = False
results_limit = 10

run = 1

if (len(sys.argv) > 1):
    argumentList = sys.argv[1:]

    # Opciones cortas: p = platform; i = fin; o = fout; e = error_threshold; h = help
    options = 'p:i:o:e:hn'

    # Opciones largas: platform, fin, fout, error_threshold, help
    long_options = ['platform=', 'fin=', 'fout=', 'error_threshold=', 'no_limit_results', 'help']

    try:
        # Parsing
        arguments, values = getopt.getopt(argumentList, options, long_options)

        # Localizando opciones indicadas por línea de comandos
        for currentArgument, currentValue in arguments:
            if currentArgument in ("-p", "--platform"):
                platform = str(currentValue)
            elif currentArgument in ("-i", "--fin"):
                fin = float(currentValue)
            elif currentArgument in ("-o", "--fout"):
                fout = float(currentValue)
            elif currentArgument in ("-e", "--error_threshold"):
                error_threshold = float(currentValue)
            elif currentArgument in ("-n", "--no_limit_results"):
                no_limit_results = True
            elif currentArgument in ("-h", "--help"):
                print("This script helps with calculating the best multiplication / division factors for Altera/Xilinx FPGA PLLs.")
                print("https://github.com/hansfbaier/pll-calculator\n")
                print("python3 pll-calc_xilinx.py [-p][--platform] [-i][--fin] [-o][--fout] [-e][--error_threshold] [-n][--no_limit_results] [-h][--help]\n")
                print("\t-p\t\tDestination platform: altera, xilinx, xilinx-mmcm (default: xilinx)")
                print("\t-i\t\tInput frequency (default: 50)")
                print("\t-o\t\tOutput frequency (default: 6.25)")
                print("\t-e\t\tError threshold (default: 0.2)")
                print("\t-n\t\tNo results limit (default: 10)")
                print("\t-h\t\tHelp: Show this help message")
                run = 0
                            
    except getopt.error as err:
        print(str(err))
else:
    print("Arguments example: ./pll-calc.py -i 50 -o 21.48")
    print("No arguments, using default values")
if (run==1):
    print(f"platform: {platform} fin: {fin}MHz fout: {fout}MHz, error_threshold: {error_threshold}, results limit: ", end='')
    if (no_limit_results):
        print("none")
    else:
        print(results_limit)

    if platform == 'altera':
        vco_min  = 600
        vco_max  = 1300
        max_mult = 200
        max_div  = 400
    elif platform == 'xilinx':
        vco_min = 800
        vco_max = 1866
        max_mult = 64
        max_div = 128
    elif platform == 'xilinx-mmcm':
        vco_min = 600
        vco_max = 1200
        max_mult = 64
        max_div = 128 * 128

    problem = constraint.Problem()
    problem.addVariable('mult', range(1, max_mult))
    problem.addVariable('div', range(1, max_div))

    def vco_range(mult):
        vco_freq = fin * mult
        return vco_min <= vco_freq and vco_freq <= vco_max

    def relative_error(mult, div):
        return abs((fin * mult / div - fout)) / fout

    def is_precise(mult, div):
        return relative_error(mult, div) < error_threshold

    problem.addConstraint(vco_range, ['mult'])
    problem.addConstraint(is_precise, ['mult', 'div'])
    solutions = problem.getSolutions()
    errors = [relative_error(s['mult'], s['div']) for s in solutions]
    solutions_by_error = list(zip(errors, solutions))

    def sort_by_error(tuple):
        return tuple[0]

    solutions_by_error.sort(key=sort_by_error)

    if (no_limit_results):
        pprint(solutions_by_error)
    else:
        pprint(solutions_by_error[slice(results_limit)])  
