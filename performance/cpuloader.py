##############################CPU LOADER################################
#
# This script can be used to hog cpu on the linux node
#######################################################################
import sys
import threading
import time
import commands
import os

class CPULoader:
        def __init__(self, load, duration_secs):
                self.load = load
                self.duration_secs = duration_secs
                self.quit = 0
                self.pid = os.fork()
                if self.pid == 0:
                        self.run()
        def run(self):
                start_time = time.time()
                while time.time() < start_time + self.duration_secs and self.quit == 0:
                        busy_cycle_start = time.time()
                        i = 0
                        while i < 100000:
                                i += 1
                        busy_cycle_end = time.time()
                        # Now calculate how long we need to be idle.
                        # load = busy_time/(busy_time + idle_time)
                        # therefore idle_time = busy_time(1 - load)/load
                        idle_time = (busy_cycle_end - busy_cycle_start) * \
                                (1-self.load)/self.load
                        #print (busy_cycle_end - busy_cycle_start), idle_time
                        time.sleep(idle_time)
                sys.exit()
        def stop(self):
                self.quit = 1

def generate_cpu_load(percentage, duration):
        # Check number of processors on the system.
        processors = commands.getoutput\
                ("cat /proc/cpuinfo | grep '^processor' | wc -l")
        processors = int(processors)
        # Launch threads to generate the required load.
        print processors,"processors detected on system."
        loaders = []
        print "Starting CPU Load"
        try:
                for i in range(processors):
                        cpu_loader = CPULoader(percentage/100.0, duration)
                        loaders.append(cpu_loader)
                os.wait()
                print "CPU Load ended"
        except KeyboardInterrupt:
                print "Interrupted. Stopping loaders."
                for loader in loaders:
                        os.system('kill -9 %d' % loader.pid)

if __name__ == "__main__":
        usage = """
    Usage:
        python %s <load-percentage> <duration-in-seconds>
    Example:
        python %s 30 120
        Loads the system with 30%% CPU usage for 2 minutes (120s)
    """ % (sys.argv[0],sys.argv[0])
        if len(sys.argv) != 3:
                print usage
                sys.exit()
        try:
                load_percentage = float(sys.argv[1])
                load_duration_secs = int(sys.argv[2])
        except:
                print usage
                sys.exit()
        generate_cpu_load(load_percentage, load_duration_secs)

