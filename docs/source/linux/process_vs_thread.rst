Process vs thread in Linux
==========================

Process definition
~~~~~~~~~~~~~~~~~~

Processes are basically the programs that are dispatched from the ready state and are scheduled in the CPU for execution. PCB(Process Control Block) holds the concept of process.
A process can create other processes which are knowns as Child Processes.
The process takes more time to terminate and it is isolated means it does not share the momory with any other process.

The process can have the following states:

- new
- ready
- running
- waiting
- terminated
- suspended

Thread
~~~~~~

Thread is the segment od a process which means a process can have multiple threads and these multiple threads are contained within a process. 

A thread has three states:

- running
- ready
- blocked

Difference between Process and Thread
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

.. list-table::
    :widths: 10 10 10
    :header-rows: 1

    * - Process
      - Thread
      - S.NO
    * - 1
      - Process means any program is in execution
      - Thread means a segment of a process
    * - 2
      - The process takes more time to terminate
      - The thread takes less time to terminate
    * - 3
      - It takes more time for creation
      - It take less time for creation
    * - 4
      - It also takes more time for context switching
      - It takes less time for context switching
    * - 5
      - The process is less efficient in terms of communication
      - Thread is more efficient in terms of communication
    * - 6
      - Multiprogramming hold the concepts of multi-process
      - We don't need multi programs in action for multiple threads because a single process consists of multiple threads
    * - 7
      - The process is isolated
      - Threads share memory
    * - 8
      - The process is called the heacyweight process
      - A Thread is lighweight as each thread in a process shares code, data and resources
    * - 9
      - Process switching uses an interfaces in an operating system
      - Thread switching does not require calling an operating system and cause an interrupt to the kernel
    * - 10
      - If one process is blocked then it will not affect the execution of other processes
      - If a user-level thread is blocked, then all other user-level threads are blocked
    * - 11
      - The process has its own Process Control Block, Stack and Address Space
      - Thread has Parents'PCB, its own Thread Control Block, Stack and common Address Space
    * - 12
      - Changes to the parent process do not affect child processes
      - Since all threads of the same process share address space and other resources so ant changes to the main thread may affect the behaviour of the other threads of the process
    * - 13
      - A system call is involved in it
      - No system call is involved, it is created using APIs
    * - 14
      - The process does not share data with each other
      - Threads share data with each other
  
