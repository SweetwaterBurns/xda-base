/*
 * mms_ts.h - Platform data for Melfas MMS-series touch driver
 *
 * Copyright (C) 2011 Google Inc.
 * Author: Dima Zavin <dima@android.com>
 *
 *
 * This program is free software; you can redistribute  it and/or modify it
 * under  the terms of  the GNU General  Public License as published by the
 * Free Software Foundation;  either version 2 of the  License, or (at your
 * option) any later version.
 *
 */

#ifndef _LINUX_MMS_TOUCH_H
#define _LINUX_MMS_TOUCH_H
#define MELFAS_TS_NAME "melfas-ts"

struct melfas_tsi_platform_data {
	int	max_x;
	int	max_y;

	bool	invert_x;
	bool	invert_y;

	int gpio_int;
	int	gpio_sda;
	int	gpio_scl;
	int	(*mux_fw_flash)(bool to_gpios);
	int (*power)(int on);
	int (*is_vdd_on)(void);
	const char	*fw_name;
	bool	use_touchkey;
	const u8	*touchkey_keycode;
	const u8	*config_fw_version;
#ifdef CONFIG_INPUT_FBSUSPEND
	struct notifier_block fb_notif;
#endif
	void (*input_event)(void *data);
	int (*lcd_type)(void);
};
extern struct class *sec_class;
//extern unsigned char LCD_Get_Value(void);

#endif /* _LINUX_MMS_TOUCH_H */
