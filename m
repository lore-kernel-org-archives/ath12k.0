Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2128C25B7C
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:05:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SskiqZJBjSb/IymWtXL35wytDd0XLNxhI4hRRHPfppo=; b=pixVrqaXkgZJ/azCFdATP2dOSb
	RKpcqWSCm3ccVsGCwFMMvd7Akix0ojCo7VBdrlPK59T3lTY1zzkmbsHUdtgejeURo78P7bA2R6xdb
	IdpWjWU7wl5XYkwxCMsNyTrdPJ/8YKNZTcAVGsuTfBD18nbHwL1wy1Q7LIALlwsG6zA+UslFTaXG/
	OcMNvsPUNwg8KMPN1Hd4MPzaspKjARnaxbN1d+i2SO/DBh14Cw3QxMDXkeTQ8+CpeUxsTAtBOjV8b
	yFF2YnSzd/8PUsPZNyw87j5xzsxUAQxL9gcn7YRgvtcGrdrCnJsGcMnny0tCBYMNHsAxJgKwordoq
	YegzHZOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC28O-00000001knV-18Pw
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:05:20 +0000
Received: from mail-wm1-x332.google.com ([2a00:1450:4864:20::332])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27H-00000001jrL-1YHx
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:25 +0000
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-4210c9d1df6so10137505e9.2
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923048; x=1717527848; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SskiqZJBjSb/IymWtXL35wytDd0XLNxhI4hRRHPfppo=;
        b=1o9sIQUB8jLlSTt9Bpa5/1zWZulwJ7gDqXmvEw19HU/2oTWlyZOMB4Ae9EC9GgrRey
         +h4RWeN9DioVmelGs4+t7tZEQ8SGwhGHaZtoT4TxjEW0EMPYNEPE+omoHCHg3pyNlCPL
         rbtlc0viDX5AJumHchmT6S5bb4wEuw+HkL6b4++XT18Az/Aqwz7e9kl4QWdJuS5eKPUJ
         uV9HaB+Ff7mDCamqsj1MhKW496pFPIbYyJXaNuUaDtWAFI40g3AQy9z3Jxjlxfmr8+23
         H/082JKK2tQLs0S7Uohb+4w658jHMxYmU+v31ulnwH9AGwx+yjj5TLkV2slCx+5hKvzd
         LFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923048; x=1717527848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SskiqZJBjSb/IymWtXL35wytDd0XLNxhI4hRRHPfppo=;
        b=Z7q1iuB7Urs1fczNIYZkP5kPd/DszALXvp0Z0Co8dZziOK6uIXHUQSn51JMQU09q3u
         BkmgJB5hBE9nrYeQF0xm/UcYeGlN+ECQjn4rS+ZNbb7e5lhGrev39gatdYhen0AJob9V
         Gbpv2jIaTWe9do1c8It27YbwCijXboh3/UIxaXNuer1eqXgX2mEEeMQLwkUwvMqMAVi0
         ConS7ov4iZRVBKf+/4LjGBm2qxCRaAVox30npCQXXp8aBqzLMjUQPJdTbjnL/0BCB2Hf
         I8EhZyP1W4pTt/Vb30eaRD9GaAdc6jyS/p70ZvqGuqHaDDOA61m3Kej5UpEfzb62oYXw
         OzJQ==
X-Forwarded-Encrypted: i=1; AJvYcCWBCoYujakRc7zZgI2ByxtT6OsUIIusG42LO1nDTisjh9hwlPliHuW7iBLIJ8oa72wKzmmv5wOyt6O0FvTc1X2hnATt7EwrhAV+AQ==
X-Gm-Message-State: AOJu0Yxzr5v7qcjOK+eLT/HwdT/DV8XHro6YtUpg414rAqwbSqrAfg3d
	KrRkRgj1hK61J9YYJG11NcK+tM3YfJAUccbCm7ePJZZQio2OA6bWrSIDaUSPm5M=
X-Google-Smtp-Source: AGHT+IHg/AqjUo/AF6zofkIAbE8wT1PNxU4p0oinbHqm/6O4vvk9RxPhuiThdzz+EKuN779P+srSaw==
X-Received: by 2002:a7b:c4c8:0:b0:41e:7a1a:d626 with SMTP id 5b1f17b1804b1-42108a03167mr117765855e9.31.1716923048250;
        Tue, 28 May 2024 12:04:08 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:07 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:23 +0200
Subject: [PATCH v8 15/17] PCI/pwrctl: add PCI power control core code
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-15-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8666;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=1oe7rmzutBIU08CeVSzkcO5gwtDkSUW+EiEAYxD/5fc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqR8tAGKQ+kmDRB3Na1yc3KNvA6WYUPGnMrZ
 0DP15K+8kSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqkQAKCRARpy6gFHHX
 cvSpD/4u9GU7zVG9J+WT6H3E2OrIr6a4gZTm63ke1S4vgYw80WsU1wimWQRJCQ+zOksy6p7lGsw
 uoPoRnsC5RiXNWJ3EycsWAIAQ4HqybeI3nY+7zxhwl4DUr1+2Oy2/awDq2vTM36zHtrKfCEg4MG
 Utt3f2fdNc0qnFbpuMWcs3rAu5eU+/FC5XRYm63U5oU4n9c38dB9x5ZK34/3jqUPh40FihC6cb5
 Ppk7aeCXEpv3KIqEnh3Lj1TKoB3uNWlJiWdNGikUX9DNSoKoXbjuG9lEvBi4rbyu2exO5ZMqUis
 YGAch8MHdY75serqIHomeHHhKAsxxrsTsk9IeTwbxh6vIeJUzYae72gP8Y/UtKL4p1ZhrzVRegW
 1Yju498VCTg1ui3OuUjXWLVU7Tb9slgkvDfdnIneKZ2v/wYzk0AjVCaR0h0kxgJn2otRqE/cpHG
 NKZGQxR92QCpRJWwkzVkLSF+kU+QCfrGDvCdcoVQxHUhw8sMsG6ZFhlwE10KpHmeTcPOmJBP1IE
 b246iLuyB/DXOgz+bSBwSxfUQWuAYB0jNamPTJ0shh9yVhg4sOtXUapyHdd6YfBY6pY7bALBXU0
 o5lPKx6m4QJ+eM+hf9RtsPStEAz8mvc9E1SPWR0trQPbc/i15xufQehk9w2do4aqMvKVKwEAIz3
 XRxTKy6Xw0cns+Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120411_865587_84669E71 
X-CRM114-Status: GOOD (  30.25  )
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

Some PCI devices must be powered-on before they can be detected on the
bus. Introduce a simple framework reusing the existing PCI OF
infrastructure.

The way this works is: a DT node representing a PCI device connected to
the port can be matched against its power control platform driver. If
the match succeeds, the driver is responsible for powering-up the device
and calling pcie_pwrctl_device_set_ready() which will trigger a PCI bus
rescan as well as subscribe to PCI bus notifications.

When the device is detected and created, we'll make it consume the same
DT node that the platform device did. When the device is bound, we'll
create a device link between it and the parent power control device.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/Kconfig         |   1 +
 drivers/pci/Makefile        |   1 +
 drivers/pci/pwrctl/Kconfig  |   8 +++
 drivers/pci/pwrctl/Makefile |   4 ++
 drivers/pci/pwrctl/core.c   | 137 ++++++++++++++++++++++++++++++++++++++++++++
 include/linux/pci-pwrctl.h  |  51 +++++++++++++++++
 6 files changed, 202 insertions(+)

diff --git a/drivers/pci/Kconfig b/drivers/pci/Kconfig
index d35001589d88..aa4d1833f442 100644
--- a/drivers/pci/Kconfig
+++ b/drivers/pci/Kconfig
@@ -296,5 +296,6 @@ source "drivers/pci/hotplug/Kconfig"
 source "drivers/pci/controller/Kconfig"
 source "drivers/pci/endpoint/Kconfig"
 source "drivers/pci/switch/Kconfig"
+source "drivers/pci/pwrctl/Kconfig"
 
 endif
diff --git a/drivers/pci/Makefile b/drivers/pci/Makefile
index 175302036890..8ddad57934a6 100644
--- a/drivers/pci/Makefile
+++ b/drivers/pci/Makefile
@@ -9,6 +9,7 @@ obj-$(CONFIG_PCI)		+= access.o bus.o probe.o host-bridge.o \
 
 obj-$(CONFIG_PCI)		+= msi/
 obj-$(CONFIG_PCI)		+= pcie/
+obj-$(CONFIG_PCI)		+= pwrctl/
 
 ifdef CONFIG_PCI
 obj-$(CONFIG_PROC_FS)		+= proc.o
diff --git a/drivers/pci/pwrctl/Kconfig b/drivers/pci/pwrctl/Kconfig
new file mode 100644
index 000000000000..96195395af69
--- /dev/null
+++ b/drivers/pci/pwrctl/Kconfig
@@ -0,0 +1,8 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+menu "PCI Power control drivers"
+
+config PCI_PWRCTL
+	tristate
+
+endmenu
diff --git a/drivers/pci/pwrctl/Makefile b/drivers/pci/pwrctl/Makefile
new file mode 100644
index 000000000000..52ae0640ef7b
--- /dev/null
+++ b/drivers/pci/pwrctl/Makefile
@@ -0,0 +1,4 @@
+# SPDX-License-Identifier: GPL-2.0-only
+
+obj-$(CONFIG_PCI_PWRCTL)		+= pci-pwrctl-core.o
+pci-pwrctl-core-y			:= core.o
diff --git a/drivers/pci/pwrctl/core.c b/drivers/pci/pwrctl/core.c
new file mode 100644
index 000000000000..feca26ad2f6a
--- /dev/null
+++ b/drivers/pci/pwrctl/core.c
@@ -0,0 +1,137 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/export.h>
+#include <linux/kernel.h>
+#include <linux/pci.h>
+#include <linux/pci-pwrctl.h>
+#include <linux/property.h>
+#include <linux/slab.h>
+
+static int pci_pwrctl_notify(struct notifier_block *nb, unsigned long action,
+			     void *data)
+{
+	struct pci_pwrctl *pwrctl = container_of(nb, struct pci_pwrctl, nb);
+	struct device *dev = data;
+
+	if (dev_fwnode(dev) != dev_fwnode(pwrctl->dev))
+		return NOTIFY_DONE;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		/*
+		 * We will have two struct device objects bound to two different
+		 * drivers on different buses but consuming the same DT node. We
+		 * must not bind the pins twice in this case but only once for
+		 * the first device to be added.
+		 *
+		 * If we got here then the PCI device is the second after the
+		 * power control platform device. Mark its OF node as reused.
+		 */
+		dev->of_node_reused = true;
+		break;
+	case BUS_NOTIFY_BOUND_DRIVER:
+		pwrctl->link = device_link_add(dev, pwrctl->dev,
+					       DL_FLAG_AUTOREMOVE_CONSUMER);
+		if (!pwrctl->link)
+			dev_err(pwrctl->dev, "Failed to add device link\n");
+		break;
+	case BUS_NOTIFY_UNBOUND_DRIVER:
+		if (pwrctl->link)
+			device_link_remove(dev, pwrctl->dev);
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+/**
+ * pci_pwrctl_device_set_ready() - Notify the pwrctl subsystem that the PCI
+ * device is powered-up and ready to be detected.
+ *
+ * @pwrctl: PCI power control data.
+ *
+ * Returns:
+ * 0 on success, negative error number on error.
+ *
+ * Note:
+ * This function returning 0 doesn't mean the device was detected. It means,
+ * that the bus rescan was successfully started. The device will get bound to
+ * its PCI driver asynchronously.
+ */
+int pci_pwrctl_device_set_ready(struct pci_pwrctl *pwrctl)
+{
+	int ret;
+
+	if (!pwrctl->dev)
+		return -ENODEV;
+
+	pwrctl->nb.notifier_call = pci_pwrctl_notify;
+	ret = bus_register_notifier(&pci_bus_type, &pwrctl->nb);
+	if (ret)
+		return ret;
+
+	pci_lock_rescan_remove();
+	pci_rescan_bus(to_pci_dev(pwrctl->dev->parent)->bus);
+	pci_unlock_rescan_remove();
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(pci_pwrctl_device_set_ready);
+
+/**
+ * pci_pwrctl_device_unset_ready() - Notify the pwrctl subsystem that the PCI
+ * device is about to be powered-down.
+ *
+ * @pwrctl: PCI power control data.
+ */
+void pci_pwrctl_device_unset_ready(struct pci_pwrctl *pwrctl)
+{
+	/*
+	 * We don't have to delete the link here. Typically, this function
+	 * is only called when the power control device is being detached. If
+	 * it is being detached then the child PCI device must have already
+	 * been unbound too or the device core wouldn't let us unbind.
+	 */
+	bus_unregister_notifier(&pci_bus_type, &pwrctl->nb);
+}
+EXPORT_SYMBOL_GPL(pci_pwrctl_device_unset_ready);
+
+static void devm_pci_pwrctl_device_unset_ready(void *data)
+{
+	struct pci_pwrctl *pwrctl = data;
+
+	pci_pwrctl_device_unset_ready(pwrctl);
+}
+
+/**
+ * devm_pci_pwrctl_device_set_ready - Managed variant of
+ * pci_pwrctl_device_set_ready().
+ *
+ * @dev: Device managing this pwrctl provider.
+ * @pwrctl: PCI power control data.
+ *
+ * Returns:
+ * 0 on success, negative error number on error.
+ */
+int devm_pci_pwrctl_device_set_ready(struct device *dev,
+				     struct pci_pwrctl *pwrctl)
+{
+	int ret;
+
+	ret = pci_pwrctl_device_set_ready(pwrctl);
+	if (ret)
+		return ret;
+
+	return devm_add_action_or_reset(dev,
+					devm_pci_pwrctl_device_unset_ready,
+					pwrctl);
+}
+EXPORT_SYMBOL_GPL(devm_pci_pwrctl_device_set_ready);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("PCI Device Power Control core driver");
+MODULE_LICENSE("GPL");
diff --git a/include/linux/pci-pwrctl.h b/include/linux/pci-pwrctl.h
new file mode 100644
index 000000000000..45e9cfe740e4
--- /dev/null
+++ b/include/linux/pci-pwrctl.h
@@ -0,0 +1,51 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#ifndef __PCI_PWRCTL_H__
+#define __PCI_PWRCTL_H__
+
+#include <linux/notifier.h>
+
+struct device;
+struct device_link;
+
+/*
+ * This is a simple framework for solving the issue of PCI devices that require
+ * certain resources (regulators, GPIOs, clocks) to be enabled before the
+ * device can actually be detected on the PCI bus.
+ *
+ * The idea is to reuse the platform bus to populate OF nodes describing the
+ * PCI device and its resources, let these platform devices probe and enable
+ * relevant resources and then trigger a rescan of the PCI bus allowing for the
+ * same device (with a second associated struct device) to be registered with
+ * the PCI subsystem.
+ *
+ * To preserve a correct hierarchy for PCI power management and device reset,
+ * we create a device link between the power control platform device (parent)
+ * and the supplied PCI device (child).
+ */
+
+/**
+ * struct pci_pwrctl - PCI device power control context.
+ * @dev: Address of the power controlling device.
+ *
+ * An object of this type must be allocated by the PCI power control device and
+ * passed to the pwrctl subsystem to trigger a bus rescan and setup a device
+ * link with the device once it's up.
+ */
+struct pci_pwrctl {
+	struct device *dev;
+
+	/* Private: don't use. */
+	struct notifier_block nb;
+	struct device_link *link;
+};
+
+int pci_pwrctl_device_set_ready(struct pci_pwrctl *pwrctl);
+void pci_pwrctl_device_unset_ready(struct pci_pwrctl *pwrctl);
+int devm_pci_pwrctl_device_set_ready(struct device *dev,
+				     struct pci_pwrctl *pwrctl);
+
+#endif /* __PCI_PWRCTL_H__ */

-- 
2.43.0


