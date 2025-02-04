

#include "sl_sleeptimer.h"
#include "app_assert.h"

#include "sparkfun_mlx90640.h"
#include "sparkfun_mlx90640_config.h"

#if (defined(SLI_SI917))
#include "sl_i2c_instances.h"
#include "rsi_debug.h"

#define app_printf(...)              DEBUGOUT(__VA_ARGS__)
#define I2C_INSTANCE_USED            SL_I2C2

static sl_i2c_instance_t i2c_instance = I2C_INSTANCE_USED;
#else
#include "sl_i2cspm_instances.h"
#include "app_log.h"

#define app_printf(...) app_log(__VA_ARGS__)
#endif

#define TIMER_INTERVAL_MS 30  // Interval for timer synchronization
#define RUN_TIME_MS 5000       // Total run time (5 seconds)

int iteration_count = 0;  // Counts timer executions
int MAX_ITERATIONS = (RUN_TIME_MS / TIMER_INTERVAL_MS);  // 20 iterations
sl_sleeptimer_timer_handle_t mlx90640_timer;  // Timer handle
static mikroe_i2c_handle_t app_i2c_instance = NULL;
static float mlx90640_image[SPARKFUN_MLX90640_NUM_OF_PIXELS];
static sl_sleeptimer_timer_handle_t app_timer_handle;
static volatile bool app_timer_expire = false;

static void app_timer_cb(sl_sleeptimer_timer_handle_t *handle, void *data);

/***************************************************************************//**
 * Initialize application.
 ******************************************************************************/
void app_init(void)
{
  sl_status_t sc;
  uint16_t refrate = 0;

#if (defined(SLI_SI917))
  app_i2c_instance = &i2c_instance;
#else
  app_i2c_instance = sl_i2cspm_qwiic;
#endif

  sc = sparkfun_mlx90640_init(app_i2c_instance,
                              SPARKFUN_MLX90640_I2C_ADDRESS);

  if (sc == SL_STATUS_OK) {
    app_printf("\r\n=== MLX90640(IRsensor Data Processed) Application Started ===\n");
    sc = sparkfun_mlx90640_set_refresh_rate(0x03);
    app_assert_status(sc);

    sc = sparkfun_mlx90640_get_refresh_rate(&refrate);
    app_assert_status(sc);

    sc = sl_sleeptimer_start_periodic_timer_ms(&app_timer_handle,
                                               TIMER_INTERVAL_MS,
                                               app_timer_cb,
                                               (void *) NULL,
                                               0,
                                               0);
    app_assert_status(sc);
  } else {
    app_printf("\r\nMLX90640 initialization failed!\n");
  }
}

/***************************************************************************//**
 * App ticking function.
 ******************************************************************************/
void app_process_action(void)
{
  if (app_timer_expire == true) {
    app_timer_expire = false;
    sparkfun_mlx90640_get_image_array(mlx90640_image);

    for (int i = 0; i < SPARKFUN_MLX90640_NUM_OF_PIXELS; i++)
    {
      app_printf("%3.2f,", mlx90640_image[i]);
    }
    app_printf("\r\n---\r\n");
  }

}

static void app_timer_cb(sl_sleeptimer_timer_handle_t *handle, void *data)
{
  (void) handle;
  (void) data;

  app_timer_expire = true;

  /*if (iteration_count < MAX_ITERATIONS) {
      app_timer_expire = true;
      iteration_count++;
  } else {
      app_timer_expire = false;
  }*/
}
