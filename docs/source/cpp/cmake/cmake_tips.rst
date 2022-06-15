Short tips about CMake
======================

.. note:: 
    1. Assignment of variable ``set( TEST_CFG_PATH "${CMAKE_CURRENT_LIST_DIR}/tests/test_cfg/" )``
    2. Execute shell command::
   
        execute_process(
            COMMAND sed "s#\"modbus-tcp\": \".*\"#\"modbus-tcp\": \"${TEST_CFG_PATH}tcp/di-modbus-tcp-test.cfg\"#g" "${TEST_CFG_PATH}/modbus_test.cfg"
        )

