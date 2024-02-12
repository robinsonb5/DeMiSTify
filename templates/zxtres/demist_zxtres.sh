echo "command usage: demist [corename] [target] [vga_output]"
echo "[corename]: e.g. Oric"
echo "[target]: demist_zx3a200, demist_zx3a100, demist_zx3a35"
echo "[vga_output]: by default 1. 1=mist video (+DP), 2=zxtres wrapper video (+DP), 3=mist video (without DP)" 
read -p "Press Enter to continue, Crtl+C to cancel"
cd ..
sed -i 's/_byte/_word/g' project_files.rtl
make BOARD=zxtres init
sed -i 's/_word/_byte/g' project_files.rtl
cd zxtres
#export VIVADO_FLOW=1
python3 qpf2xpr.py --$2 --vga_output $3
#python3 qpf2xpr.py --$2 --vga_output $3 > "$LOG" 2>&1
source /opt/Xilinx/Vivado/2022.2/settings64.sh 
vivado -mode tcl -source generate_vivado_project.tcl
mkdir bitstreams
cp -v zxtres.runs/$2/zxtres_top.bin bitstreams/$1_$2_$(date +"%y%m%d").zx3
cp -v zxtres.runs/$2/zxtres_top.bit bitstreams/$1_$2_$(date +"%y%m%d").bit
