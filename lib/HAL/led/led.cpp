#include "led.h"
#include "MemoryMap.h"

#ifdef LED_VEC

/**
 * @brief   Default constructor
 * @note    Initializes the led vector to all turned off
 */
LedVector::LedVector(uint32_t addr)
{
    led = (led_t*) addr;
    set(0);
    turnOn();
}

/**
 * @brief   Constructor with initial state
 */
LedVector::LedVector(uint32_t addr, uint16_t init)
{
    led = (led_t*) addr;
    set(init);
    turnOn();
}

/**
 * @brief   Default deconstructor
 */
LedVector::~LedVector()
{
    set(0);
    turnOff();
}

/**
 * @brief   Turn on the led's
 */
void LedVector::turnOn()
{
    led->config |= 0x01;
}

/**
 * @brief   Turn off the led's
 */
void LedVector::turnOff()
{
    led->config &= ~0x01;
}

/**
 * @brief   Sets the state of the 16 led's
 * 
 * @param[in] state         a bit representation of the wanted state
 */
void LedVector::set(uint16_t state)
{
    led->data = state;
}

/**
 * @brief   Increases the binary number shown by the led's by one
 * 
 * @return                  the new state of the led's
 */
uint16_t LedVector::inc()
{
    return led->data++;
}

/**
 * @brief   Shifts the led state once to the left
 * 
 * @return                  the new state of the led's
 */
uint16_t LedVector::shiftLeft()
{
    return led->data <<= 1;
}

/**
 * @brief   Shifts the led state once to the right
 * 
 * @return                  the new state of the led's
 */
uint16_t LedVector::shiftRight()
{
    return led->data >>= 1;
}

/**
 * @brief   Rotates the led state once to the left
 * 
 * @return                  the new state of the led's
 */
uint16_t LedVector::rotLeft()
{
    led->data = (led->data << 1) | ((led->data >> 15) & 0x01);
    return led->data;
}

/**
 * @brief   Rotates the led state once to the right
 * 
 * @return                  the new state of the led's
 */
uint16_t LedVector::rotRight()
{
    led->data = (led->data >> 1) | ((led->data & 0x01) << 15);
    return led->data;
}

#endif