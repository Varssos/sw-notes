.. warning::
    This page has been migrated to varssos-mkdocs (docs/cmake/cmake_tips.md). This copy is outdated and no longer maintained.

Short tips about CMake
======================

.. note:: 
    1. Assignment of variable ``set( TEST_CFG_PATH "${CMAKE_CURRENT_LIST_DIR}/tests/test_cfg/" )``
    2. Execute shell command::
   
        execute_process(
            COMMAND sed "s#\"modbus-tcp\": \".*\"#\"modbus-tcp\": \"${TEST_CFG_PATH}tcp/di-modbus-tcp-test.cfg\"#g" "${TEST_CFG_PATH}/modbus_test.cfg"
        )

