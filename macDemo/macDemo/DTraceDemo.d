#!/usr/sbin/dtrace -s

#pragma D option quiet

BEGIN
{
	trace("Begin trace malloc!\n");
}

DTraceDemo*:::malloc_log
{
	printf("malloc ptr:0x%p size:%lld thread:%lu\n", arg0, arg1, tid);
}

END
{
	printf("End trace!");
}

// dtrace -h -o DTraceDemo.h -s DTraceDemo.probe
// dtrace -s DTraceDemo.d
