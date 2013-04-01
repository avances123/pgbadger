#!/bin/bash
LOGS_DIR="logs"
REPORTS_DIR="reports"
for i in $(ls $LOGS_DIR);do
    if [ -d $LOGS_DIR/$i ];then
	mkdir -p $REPORTS_DIR/$i
	LAST_LOG=$(ls -rt1 $LOGS_DIR/$i/*.log 2>/dev/null| tail -n 1)
	if [ ! -z $LAST_LOG ];then
	    perl ./pgbadger $LAST_LOG -o $REPORTS_DIR/$i/`basename $LAST_LOG`.html
	    mv $LAST_LOG $LOGS_DIR/$i/`basename $LAST_LOG`.done
	fi
    fi
done
