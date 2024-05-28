Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B41C25B7C
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TT+uWe2JSf2jDh7U3q7jv7WoGknuA8VG1gE51Kt2FBY=; b=dLaeQbOJbb83EqcqaQN55w/MhA
	UqOJB0/+NbiM7RGAvhC27E7i5lsOZJmjSNHi6M4DgI52uv7LvuDW4qQflhzLTdzikTCmazXEV9Ak2
	LKns9t2c0WYDDiqDpb0qJy05RWF4Y1v0MeKGLjg7nJM5WY36+911kuP7ypOfGTTZKiNxGuFMhfUmy
	v4gL6kozvqqGLwYGj2q6OuQICTnz2IRjrpVkLf1EG5jyPfnAbWtJQ6dV/cdF4gUjzBPWvYFOEZvMF
	ECzc41r7X2KLrSlWhgyfS52sakgkx2hwHSoSEmTJ8nFOHT15tjdpqjdf8MwpYPZCF3pvWJgYmoayV
	txeOwO+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC28A-00000001kd8-1zKx
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:05:06 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27H-00000001jsa-0esm
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:19 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-42011507a54so765905e9.0
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923049; x=1717527849; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TT+uWe2JSf2jDh7U3q7jv7WoGknuA8VG1gE51Kt2FBY=;
        b=fGNxZkdRFHwQbUZyo2r1aW3WwDFkVngPNQTIur8GREVWlTnyhN8Twgvy+VhPmEdc2Z
         OAy/pCOXesUv52MWC3yC4+hND6k8S3HMsVIhrQVubv53gQjWmcKJaHZm7VraYFhcMSud
         RsSpbgyNzdvZ5AlcAZG52FM+Lk5QfO4/GhiHZMtSVIJ299j031wKyUbZJv0VtUkW7p49
         LQFRUpRJBl/bYqX7luDkqlBKbE4MlDo495ld4bvo0A1xzWwOrgmdQfB8rzBidWW0OTyU
         HpPR2JL7rTCaKgu2TA7dyrSOmreA6YaWKVKRZvUgWrlXWh+SzKQ4ANbwqb0Ai1UGeBh+
         /h1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923049; x=1717527849;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TT+uWe2JSf2jDh7U3q7jv7WoGknuA8VG1gE51Kt2FBY=;
        b=J0NBgsJM8XpaaKma7PGCycm78Z3hNqjY9Obl9Hgep8qJLYCGRLqH/jyas/ojclBgAt
         tpGZ6KP50lQejpMfBlxMZmITjOAtSO70l6bmfQeb4cxC/nL5meo0FFD3gBrM9ArqiRq0
         QEgZ0SIPFdgyOOaqW+19zZPHentwp92zSZmQOpEopjGlJLowLuECJ1PnGpPRnE3pra9i
         6bnAY2V5GfURwOkwKK0j9Q2hb93T0hVy0nzIWJu7Y8LfFswMBDhebrVcw0FeFop/T4bu
         o9L8yIT915ZNie5OAadhpP5PQcdz3/HMs+dZbDLMy8cpU6jm1DWaoDJWMvBbfkFiv1zo
         3b4w==
X-Forwarded-Encrypted: i=1; AJvYcCVAVT/TXzbUG40Wbbf6UgxpAD//N/YOr+HZiJFbE2Fk3c8UyUoGvxkcDt16UH1Zs3tNZGJ4DM5UBLuofsZyP5huP7ntAWLdXYuChQ==
X-Gm-Message-State: AOJu0YzZxPkGBWnrDw1tjDxfaqVhr7NwRrC32vk3CYNV7Z2t8sS9Ssh4
	RVU+ReRZC8/B1WaRqMDBK6B3K8lMq8O64UBtHjZbB4TYRLyYHLdh2GbHybsanpY=
X-Google-Smtp-Source: AGHT+IHZAqsOQal0J9Cr46AF9k6zMSRPrWM7uUzT+zddHO+P5fTGOXJqx/oaki60jDPLL5cf6QeUOw==
X-Received: by 2002:a05:600c:4709:b0:415:ff48:59fc with SMTP id 5b1f17b1804b1-421015af252mr145485905e9.8.1716923049605;
        Tue, 28 May 2024 12:04:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:09 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:24 +0200
Subject: [PATCH v8 16/17] PCI/pwrctl: add a PCI power control driver for
 power sequenced devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-16-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4088;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=2MLzc6c94GqxaZsUS9P5vO/f6xerHLjxxvVJICQ4DFM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqRs1SHioyT+3SUrNfYoCq3PulngfwHuEowz
 BEq+6sj74WJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqkQAKCRARpy6gFHHX
 clM/EADRsKVMvFXfHzmUW1gtOVQ8PwZr3BWTnd242bUKh6TM+9CvCcerx32jHFo4/zX2AxT+MH8
 Ibiq9XEZNdRl9Qo+z1DDe3JIQqRZDO22dEQd5/jYWabfmodwbpaAQzRbjX5L4xrbPBQuUhEizgw
 slr0jxkvmWsU8Pq1qVwtNxjch9F0E7hJgVKtMLy4sQ0fFOda8fx7jWCCrqvzMajIKlVuZ5yGS28
 M9FUuCar2PNLY/68XOVdx6+nybSXzb3vjx5rN+O4fkWh0V2hLXn+ewVzTvFaDqAlAu70TBcBT8W
 E6UcViV3sRHm1GxvwN8XQ3oJNrZhQJ4dmMen3wyfkL0cwAube7jVh7lkjc3yitJV5Uohm/sQQlV
 bkMOuxoj0PYb/W156YmXeiSwVU5n0C9bdmUjM7hhttUHLrWA2ECjVa2PvNlETqG6VUaVNXRJqCa
 XKKLlV6vjqJdGwVUqOSO4x43gxnflacfRGi/BEAlHyTbc3qBGmti8LXwoOSzzjdirnr7M70HCUL
 tyZKPJyzu7D9F1q3wvCWmBGLyWoAA//IQ5wpHMcMDGcxxq8ncDluexPdY/5pF9Gr84LMjr1hLET
 QawiupaZH+YCpMU3qqq5CnxyjA/+TrdvHfuP+PEQT7G1acN7TjEgfv9ZxFP9o6dgFDiZZgSvV7q
 1q0HuiQ2cC7nWsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120411_751561_2A72B7FC 
X-CRM114-Status: GOOD (  20.66  )
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

Add a PCI power control driver that's capable of correctly powering up
devices using the power sequencing subsystem. The first users of this
driver are the ath11k module on QCA6390 and ath12k on WCN7850.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pci/pwrctl/Kconfig             |  9 ++++
 drivers/pci/pwrctl/Makefile            |  2 +
 drivers/pci/pwrctl/pci-pwrctl-pwrseq.c | 89 ++++++++++++++++++++++++++++++++++
 3 files changed, 100 insertions(+)

diff --git a/drivers/pci/pwrctl/Kconfig b/drivers/pci/pwrctl/Kconfig
index 96195395af69..f1b824955d4b 100644
--- a/drivers/pci/pwrctl/Kconfig
+++ b/drivers/pci/pwrctl/Kconfig
@@ -5,4 +5,13 @@ menu "PCI Power control drivers"
 config PCI_PWRCTL
 	tristate
 
+config PCI_PWRCTL_PWRSEQ
+	tristate "PCI Power Control driver using the Power Sequencing subsystem"
+	select POWER_SEQUENCING
+	select PCI_PWRCTL
+	default m if ((ATH11K_PCI || ATH12K) && ARCH_QCOM)
+	help
+	  Enable support for the PCI power control driver for device
+	  drivers using the Power Sequencing subsystem.
+
 endmenu
diff --git a/drivers/pci/pwrctl/Makefile b/drivers/pci/pwrctl/Makefile
index 52ae0640ef7b..d308aae4800c 100644
--- a/drivers/pci/pwrctl/Makefile
+++ b/drivers/pci/pwrctl/Makefile
@@ -2,3 +2,5 @@
 
 obj-$(CONFIG_PCI_PWRCTL)		+= pci-pwrctl-core.o
 pci-pwrctl-core-y			:= core.o
+
+obj-$(CONFIG_PCI_PWRCTL_PWRSEQ)		+= pci-pwrctl-pwrseq.o
diff --git a/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
new file mode 100644
index 000000000000..c7a113a76c0c
--- /dev/null
+++ b/drivers/pci/pwrctl/pci-pwrctl-pwrseq.c
@@ -0,0 +1,89 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (C) 2024 Linaro Ltd.
+ */
+
+#include <linux/device.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/pci-pwrctl.h>
+#include <linux/platform_device.h>
+#include <linux/pwrseq/consumer.h>
+#include <linux/slab.h>
+#include <linux/types.h>
+
+struct pci_pwrctl_pwrseq_data {
+	struct pci_pwrctl ctx;
+	struct pwrseq_desc *pwrseq;
+};
+
+static void devm_pci_pwrctl_pwrseq_power_off(void *data)
+{
+	struct pwrseq_desc *pwrseq = data;
+
+	pwrseq_power_off(pwrseq);
+}
+
+static int pci_pwrctl_pwrseq_probe(struct platform_device *pdev)
+{
+	struct pci_pwrctl_pwrseq_data *data;
+	struct device *dev = &pdev->dev;
+	int ret;
+
+	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->pwrseq = devm_pwrseq_get(dev, of_device_get_match_data(dev));
+	if (IS_ERR(data->pwrseq))
+		return dev_err_probe(dev, PTR_ERR(data->pwrseq),
+				     "Failed to get the power sequencer\n");
+
+	ret = pwrseq_power_on(data->pwrseq);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to power-on the device\n");
+
+	ret = devm_add_action_or_reset(dev, devm_pci_pwrctl_pwrseq_power_off,
+				       data->pwrseq);
+	if (ret)
+		return ret;
+
+	data->ctx.dev = dev;
+
+	ret = devm_pci_pwrctl_device_set_ready(dev, &data->ctx);
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to register the pwrctl wrapper\n");
+
+	return 0;
+}
+
+static const struct of_device_id pci_pwrctl_pwrseq_of_match[] = {
+	{
+		/* ATH11K in QCA6390 package. */
+		.compatible = "pci17cb,1101",
+		.data = "wlan",
+	},
+	{
+		/* ATH12K in WCN7850 package. */
+		.compatible = "pci17cb,1107",
+		.data = "wlan",
+	},
+	{ }
+};
+MODULE_DEVICE_TABLE(of, pci_pwrctl_pwrseq_of_match);
+
+static struct platform_driver pci_pwrctl_pwrseq_driver = {
+	.driver = {
+		.name = "pci-pwrctl-pwrseq",
+		.of_match_table = pci_pwrctl_pwrseq_of_match,
+	},
+	.probe = pci_pwrctl_pwrseq_probe,
+};
+module_platform_driver(pci_pwrctl_pwrseq_driver);
+
+MODULE_AUTHOR("Bartosz Golaszewski <bartosz.golaszewski@linaro.org>");
+MODULE_DESCRIPTION("Generic PCI Power Control module for power sequenced devices");
+MODULE_LICENSE("GPL");

-- 
2.43.0


