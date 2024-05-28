Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B734AC25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:04:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PThX05e0onCRUDI2ppsB5pScWa50ElSFSb2Z5rSSYFE=; b=NHHCTuSrTWmrPEDXbo9s0gCUyt
	kfbSAXDXJu5AHFiMlgTMp9k+AWrBVoIQfMiLvuHcbMnon/pC9WKLGyiIMIt90g3vq/ZK7loY03gmJ
	8qV9C0naCiCArZcIu3MYVMJyXR+XntDzeDw0ySKND51EtGnQcwKNrrXWdhup/SaGYs5kHVqm+donK
	HewXq5A0egz2s8knLK5UFjBmG1RycrWW/YCRmPtHqJGUQiIied+PhZzoumOMV1MfPcdF5AEEC9wvi
	Zb9nOkJ6TIej6HoUmahvcY/XiFKWRg8KRN1DBGB4lRJyGU1phtyKl3vPSXMdZpeGIhoowJlde1Quw
	3zI2v4eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27l-00000001kJ4-0RMq
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:04:41 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27A-00000001jmO-1VnV
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:09 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-4201986d60aso8885625e9.3
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923043; x=1717527843; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PThX05e0onCRUDI2ppsB5pScWa50ElSFSb2Z5rSSYFE=;
        b=BSB4aP11yTl3gtfXwdDA89z9zr785eEHI6tdeaUxg0weJvzLggfD2eoD2t/tydnUug
         5HVRluTMFA9LEYf8/v9PquLIMwZXxvxT8O95jFpQBzca7oexghCTlXbCRTH0G9w07NyG
         IYh5sWlFhVE7iKLqncrtLieB1tRrXNuMffROFU4U36dCcbNq3TM1G6D27oq66JIGOI/T
         e96+ixe0npdRumiKvwM55L+yLR+mSdVObHD/kvSGhS+Xz0OyX8NwbGeOOy5aaRBc7fby
         uacqd29rr/PfwBkvMbcTUKTyL66kffg6Jsc3SQi8OPMXZGZpoJH1c5XDWQNqaL80YLiV
         ZFug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923043; x=1717527843;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PThX05e0onCRUDI2ppsB5pScWa50ElSFSb2Z5rSSYFE=;
        b=mcv/BzWZm3dySQ9fV0pkEkSy3IVl5IctlfcUUJ+dj8jTUpJRKvanNAfIlZSj4a5emS
         sIjSZ6xQGSSYV+aHaM2onlaKVGHpLnYvFF1XLBvf9kTKP2xJ0jD3p5gVQNqbvkQP/rl4
         WY3etXLIx3bA90a8DYomfE0duh+RTofHG6drdUKRAu996fhV2Bu4eA7WXa150Fkfl2bt
         rINIFLSfekgruUB/WDKsy2RSFF+kLEeGsii0eQsvRw/O452QO6ggWUEltGC5F20vXBgi
         JUE2x4FoiPrRDIVtVzl8dKDl9QaR2NZqOc7TDRjIVG3qFuCCIiuyaKjYlcd4iF9beOoF
         VBwA==
X-Forwarded-Encrypted: i=1; AJvYcCXrTrKTF81QZCnFlPXeMAuoRD8hVavYH2rslIpRZgXlukkLM33/hKOEJzzeyhxKdjlEDyB3jmlPBpGuRClsEWBNDd3lX/8yyVzsOw==
X-Gm-Message-State: AOJu0YxyOfYRxDKNfuRdmVBKPdVF94NorJ0706CXSqk4A9Ozu5GJz5+8
	yoD8BrFSRQNFNSsT6vFI3wfig+Vojtna8rdg7NSIsZP6GBg/XBoXiPi/upoElno=
X-Google-Smtp-Source: AGHT+IFpoXv7JorC2vTGqWNHK6g6+zlkSpic0MX9ZzGWibakpIDlfQJPr1zxcWJkA/TKU4S3H+Am8g==
X-Received: by 2002:a1c:7902:0:b0:41b:c024:8e88 with SMTP id 5b1f17b1804b1-42108a0dc79mr83136375e9.33.1716923042886;
        Tue, 28 May 2024 12:04:02 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:02 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:19 +0200
Subject: [PATCH v8 11/17] power: pwrseq: add a driver for the PMU module on
 the QCom WCN chipsets
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-11-d354d52b763c@linaro.org>
References: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
In-Reply-To: <20240528-pwrseq-v8-0-d354d52b763c@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Marcel Holtmann <marcel@holtmann.org>, 
 Luiz Augusto von Dentz <luiz.dentz@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Balakrishna Godavarthi <quic_bgodavar@quicinc.com>, 
 Rocky Liao <quic_rjliao@quicinc.com>, Kalle Valo <kvalo@kernel.org>, 
 Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Bjorn Helgaas <bhelgaas@google.com>, 
 Srini Kandagatla <srinivas.kandagatla@linaro.org>, 
 Elliot Berman <quic_eberman@quicinc.com>, 
 Caleb Connolly <caleb.connolly@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Alex Elder <elder@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-bluetooth@vger.kernel.org, 
 netdev@vger.kernel.org, linux-wireless@vger.kernel.org, 
 ath11k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>, 
 ath12k@lists.infradead.org, linux-pm@vger.kernel.org, 
 linux-pci@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>, kernel@quicinc.com, 
 Amit Pundir <amit.pundir@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=11550;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jLEALkdDV1rMFyF3hb6prlpC46U0AXMWBYqXGRzvM60=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqPZHnQ6znFCNA9zNL4I2daI5VJTNDumNKK3
 jsLc8+T6T+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqjwAKCRARpy6gFHHX
 ckEkEACc6cecRaH2U1qD2v7W+Cm8zYrg+VJFjDkbD8dDq90jdku2XGxTWb6MVdekiSdmbAqhhOe
 DcaQYnchSI+VPfJQScGNKlROVDF4eRi74lKfuq8jzRdBSjHcef4ogfo0pWrzuONXUXjYyzr6r85
 PNhpIxEyTaVLDvVgYThfM6GkMn5EU0d92lV0zQEBzwzNpM35ERkgBHBQx41odITrImjSX0F3YnX
 wxmob1QbxEEdbuaamXxvwYjhWAmXY8R1Q+cB1w+zM90YilzGM5o0H1Eh1seHKOZncMzxdoLXcgc
 LrG7KhxopVBkz/x5gOcFQoMW02darZfh0ACHU+3Aq842PmZ/pF5hrqDhcT8HPUBP7lWSG9wIJfR
 MfqpVwUd6WQVek8WsIqbDXggJOPvhUWDwiXj95YF5pzbuBbJnOG61qfMXFlaktNm+v7Onhece2c
 Kut7jX6mjNCAIddlbjLQNuOvKET7YxCDch0YPc5aBXIwaTagq6xzgwZTcjo0DEOWxMAYFPLDHJX
 EjAIc05OlKc6+EWDFa8GXH+KwtNUBXHZ3cWpTGR7jQHtfRgokY+gRsKrPCj38VgiDRSMGQpDzBd
 50w/ClXU72/0a3R0BtESm0jukRvIW1tBaA+jQRDqYnBwSCOHeSWGrKil/U5xTol9K5VgHQ64Xu4
 RZRVK2jbl7Rs+gg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120404_747100_997C4D1B 
X-CRM114-Status: GOOD (  22.66  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

This adds the power sequencing driver for the PMU modules present on the
Qualcomm WCN Bluetooth and Wifi chipsets. It uses the pwrseq subsystem
and knows how to match the sequencer to the consumer device by verifying
the relevant properties and DT layout.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/power/sequencing/Kconfig           |  16 ++
 drivers/power/sequencing/Makefile          |   2 +
 drivers/power/sequencing/pwrseq-qcom-wcn.c | 336 +++++++++++++++++++++++++++++
 3 files changed, 354 insertions(+)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index ba5732b1dbf8..f969374792f5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -10,3 +10,19 @@ menuconfig POWER_SEQUENCING
 	  during power-up.
 
 	  If unsure, say no.
+
+if POWER_SEQUENCING
+
+config POWER_SEQUENCING_QCOM_WCN
+	tristate "Qualcomm WCN family PMU driver"
+	default m if ARCH_QCOM
+	help
+	  Say Y here to enable the power sequencing driver for Qualcomm
+	  WCN Bluetooth/WLAN chipsets.
+
+	  Typically, a package from the Qualcomm WCN family contains the BT
+	  and WLAN modules whose power is controlled by the PMU module. As the
+	  former two share the power-up sequence which is executed by the PMU,
+	  this driver is needed for correct power control.
+
+endif
diff --git a/drivers/power/sequencing/Makefile b/drivers/power/sequencing/Makefile
index dcdf8c0c159e..2eec2df7912d 100644
--- a/drivers/power/sequencing/Makefile
+++ b/drivers/power/sequencing/Makefile
@@ -2,3 +2,5 @@
 
 obj-$(CONFIG_POWER_SEQUENCING)		+= pwrseq-core.o
 pwrseq-core-y				:= core.o
+
+obj-$(CONFIG_POWER_SEQUENCING_QCOM_WCN)	+= pwrseq-qcom-wcn.o
diff --git a/drivers/power/sequencing/pwrseq-qcom-wcn.c b/drivers/power/sequencing/pwrseq-qcom-wcn.c
new file mode 100644
index 000000000000..7e6391e1b33f
--- /dev/null
+++ b/drivers/power/sequencing/pwrseq-qcom-wcn.c
@@ -0,0 +1,336 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/gpio/consumer.h>
+#include <linux/jiffies.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/platform_device.h>
+#include <linux/regulator/consumer.h>
+#include <linux/pwrseq/provider.h>
+#include <linux/string.h>
+#include <linux/types.h>
+
+struct pwrseq_qcom_wcn_pdata {
+	const char *const *vregs;
+	size_t num_vregs;
+	unsigned int pwup_delay_msec;
+	unsigned int gpio_enable_delay;
+};
+
+struct pwrseq_qcom_wcn_ctx {
+	struct pwrseq_device *pwrseq;
+	struct device_node *of_node;
+	const struct pwrseq_qcom_wcn_pdata *pdata;
+	struct regulator_bulk_data *regs;
+	struct gpio_desc *bt_gpio;
+	struct gpio_desc *wlan_gpio;
+	struct clk *clk;
+	unsigned long last_gpio_enable;
+};
+
+static void pwrseq_qcom_wcn_ensure_gpio_delay(struct pwrseq_qcom_wcn_ctx *ctx)
+{
+	unsigned long diff_jiffies;
+	unsigned int diff_msecs;
+
+	if (!ctx->pdata->gpio_enable_delay)
+		return;
+
+	diff_jiffies = jiffies - ctx->last_gpio_enable;
+	diff_msecs = jiffies_to_msecs(diff_jiffies);
+
+	if (diff_msecs < ctx->pdata->gpio_enable_delay)
+		msleep(ctx->pdata->gpio_enable_delay - diff_msecs);
+}
+
+static int pwrseq_qcom_wcn_vregs_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_bulk_enable(ctx->pdata->num_vregs, ctx->regs);
+}
+
+static int pwrseq_qcom_wcn_vregs_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return regulator_bulk_disable(ctx->pdata->num_vregs, ctx->regs);
+}
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn_vregs_unit_data = {
+	.name = "regulators-enable",
+	.enable = pwrseq_qcom_wcn_vregs_enable,
+	.disable = pwrseq_qcom_wcn_vregs_disable,
+};
+
+static int pwrseq_qcom_wcn_clk_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	return clk_prepare_enable(ctx->clk);
+}
+
+static int pwrseq_qcom_wcn_clk_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	clk_disable_unprepare(ctx->clk);
+
+	return 0;
+}
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn_clk_unit_data = {
+	.name = "clock-enable",
+	.enable = pwrseq_qcom_wcn_clk_enable,
+	.disable = pwrseq_qcom_wcn_clk_disable,
+};
+
+static const struct pwrseq_unit_data *pwrseq_qcom_wcn_unit_deps[] = {
+	&pwrseq_qcom_wcn_vregs_unit_data,
+	&pwrseq_qcom_wcn_clk_unit_data,
+	NULL
+};
+
+static int pwrseq_qcom_wcn_bt_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	pwrseq_qcom_wcn_ensure_gpio_delay(ctx);
+	gpiod_set_value_cansleep(ctx->bt_gpio, 1);
+	ctx->last_gpio_enable = jiffies;
+
+	return 0;
+}
+
+static int pwrseq_qcom_wcn_bt_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	gpiod_set_value_cansleep(ctx->bt_gpio, 0);
+
+	return 0;
+}
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn_bt_unit_data = {
+	.name = "bluetooth-enable",
+	.deps = pwrseq_qcom_wcn_unit_deps,
+	.enable = pwrseq_qcom_wcn_bt_enable,
+	.disable = pwrseq_qcom_wcn_bt_disable,
+};
+
+static int pwrseq_qcom_wcn_wlan_enable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	pwrseq_qcom_wcn_ensure_gpio_delay(ctx);
+	gpiod_set_value_cansleep(ctx->wlan_gpio, 1);
+	ctx->last_gpio_enable = jiffies;
+
+	return 0;
+}
+
+static int pwrseq_qcom_wcn_wlan_disable(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	gpiod_set_value_cansleep(ctx->wlan_gpio, 0);
+
+	return 0;
+}
+
+static const struct pwrseq_unit_data pwrseq_qcom_wcn_wlan_unit_data = {
+	.name = "wlan-enable",
+	.deps = pwrseq_qcom_wcn_unit_deps,
+	.enable = pwrseq_qcom_wcn_wlan_enable,
+	.disable = pwrseq_qcom_wcn_wlan_disable,
+};
+
+static int pwrseq_qcom_wcn_pwup_delay(struct pwrseq_device *pwrseq)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+
+	if (ctx->pdata->pwup_delay_msec)
+		msleep(ctx->pdata->pwup_delay_msec);
+
+	return 0;
+}
+
+static const struct pwrseq_target_data pwrseq_qcom_wcn_bt_target_data = {
+	.name = "bluetooth",
+	.unit = &pwrseq_qcom_wcn_bt_unit_data,
+	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+};
+
+static const struct pwrseq_target_data pwrseq_qcom_wcn_wlan_target_data = {
+	.name = "wlan",
+	.unit = &pwrseq_qcom_wcn_wlan_unit_data,
+	.post_enable = pwrseq_qcom_wcn_pwup_delay,
+};
+
+static const struct pwrseq_target_data *pwrseq_qcom_wcn_targets[] = {
+	&pwrseq_qcom_wcn_bt_target_data,
+	&pwrseq_qcom_wcn_wlan_target_data,
+	NULL
+};
+
+static const char *const pwrseq_qca6390_vregs[] = {
+	"vddio",
+	"vddaon",
+	"vddpmu",
+	"vddrfa0p95",
+	"vddrfa1p3",
+	"vddrfa1p9",
+	"vddpcie1p3",
+	"vddpcie1p9",
+};
+
+static const struct pwrseq_qcom_wcn_pdata pwrseq_qca6390_of_data = {
+	.vregs = pwrseq_qca6390_vregs,
+	.num_vregs = ARRAY_SIZE(pwrseq_qca6390_vregs),
+	.pwup_delay_msec = 60,
+	.gpio_enable_delay = 100,
+};
+
+static const char *const pwrseq_wcn7850_vregs[] = {
+	"vdd",
+	"vddio",
+	"vddio1p2",
+	"vddaon",
+	"vdddig",
+	"vddrfa1p2",
+	"vddrfa1p8",
+};
+
+static const struct pwrseq_qcom_wcn_pdata pwrseq_wcn7850_of_data = {
+	.vregs = pwrseq_wcn7850_vregs,
+	.num_vregs = ARRAY_SIZE(pwrseq_wcn7850_vregs),
+	.pwup_delay_msec = 50,
+};
+
+static int pwrseq_qcom_wcn_match(struct pwrseq_device *pwrseq,
+				 struct device *dev)
+{
+	struct pwrseq_qcom_wcn_ctx *ctx = pwrseq_device_get_drvdata(pwrseq);
+	struct device_node *dev_node = dev->of_node;
+
+	/*
+	 * The PMU supplies power to the Bluetooth and WLAN modules. both
+	 * consume the PMU AON output so check the presence of the
+	 * 'vddaon-supply' property and whether it leads us to the right
+	 * device.
+	 */
+	if (!of_property_present(dev_node, "vddaon-supply"))
+		return 0;
+
+	struct device_node *reg_node __free(device_node) =
+			of_parse_phandle(dev_node, "vddaon-supply", 0);
+	if (!reg_node)
+		return 0;
+
+	/*
+	 * `reg_node` is the PMU AON regulator, its parent is the `regulators`
+	 * node and finally its grandparent is the PMU device node that we're
+	 * looking for.
+	 */
+	if (!reg_node->parent || !reg_node->parent->parent ||
+	    reg_node->parent->parent != ctx->of_node)
+		return 0;
+
+	return 1;
+}
+
+static int pwrseq_qcom_wcn_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct pwrseq_qcom_wcn_ctx *ctx;
+	struct pwrseq_config config;
+	int i, ret;
+
+	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	if (!ctx)
+		return -ENOMEM;
+
+	ctx->of_node = dev->of_node;
+
+	ctx->pdata = of_device_get_match_data(dev);
+	if (!ctx->pdata)
+		return dev_err_probe(dev, -ENODEV,
+				     "Failed to obtain platform data\n");
+
+	ctx->regs = devm_kcalloc(dev, ctx->pdata->num_vregs,
+				 sizeof(*ctx->regs), GFP_KERNEL);
+	if (!ctx->regs)
+		return -ENOMEM;
+
+	for (i = 0; i < ctx->pdata->num_vregs; i++)
+		ctx->regs[i].supply = ctx->pdata->vregs[i];
+
+	ret = devm_regulator_bulk_get(dev, ctx->pdata->num_vregs, ctx->regs);
+	if (ret < 0)
+		return dev_err_probe(dev, ret,
+				     "Failed to get all regulators\n");
+
+	ctx->bt_gpio = devm_gpiod_get_optional(dev, "bt-enable", GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->bt_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->bt_gpio),
+				     "Failed to get the Bluetooth enable GPIO\n");
+
+	ctx->wlan_gpio = devm_gpiod_get_optional(dev, "wlan-enable",
+						 GPIOD_OUT_LOW);
+	if (IS_ERR(ctx->wlan_gpio))
+		return dev_err_probe(dev, PTR_ERR(ctx->wlan_gpio),
+				     "Failed to get the WLAN enable GPIO\n");
+
+	ctx->clk = devm_clk_get_optional(dev, NULL);
+	if (IS_ERR(ctx->clk))
+		return dev_err_probe(dev, PTR_ERR(ctx->clk),
+				     "Failed to get the reference clock\n");
+
+	memset(&config, 0, sizeof(config));
+
+	config.parent = dev;
+	config.owner = THIS_MODULE;
+	config.drvdata = ctx;
+	config.match = pwrseq_qcom_wcn_match;
+	config.targets = pwrseq_qcom_wcn_targets;
+
+	ctx->pwrseq = devm_pwrseq_device_register(dev, &config);
+	if (IS_ERR(ctx->pwrseq))
+		return dev_err_probe(dev, PTR_ERR(ctx->pwrseq),
+				     "Failed to register the power sequencer\n");
+
+	return 0;
+}
+
+static const struct of_device_id pwrseq_qcom_wcn_of_match[] = {
+	{
+		.compatible = "qcom,qca6390-pmu",
+		.data = &pwrseq_qca6390_of_data,
+	},
+	{
+		.compatible = "qcom,wcn7850-pmu",
+		.data = &pwrseq_wcn7850_of_data,
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pwrseq_qcom_wcn_of_match);
+
+static struct platform_driver pwrseq_qcom_wcn_driver = {
+	.driver = {
+		.name = "pwrseq-qcom_wcn",
+		.of_match_table = pwrseq_qcom_wcn_of_match,
+	},
+	.probe = pwrseq_qcom_wcn_probe,
+};
+module_platform_driver(pwrseq_qcom_wcn_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Qualcomm WCN PMU power sequencing driver");
+MODULE_LICENSE("GPL");

-- 
2.43.0


