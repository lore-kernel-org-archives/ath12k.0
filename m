Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 590F8C25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 19:05:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+ytTEWiXKbIuQ8DpZG6ZoIYYrAybeCYmHd6/M4lW1Rs=; b=IXAZg1RcLM/CfYNhFPhNqnIkgk
	EuxxW/AQj0up34/mEmjiU85wXNdzkOImwDf1/HvB/Ts6QX2nncVwm6KNIazo+yChqrD2qD5Mf/91o
	c5UK45ambiZ7t5xPoghpd8HVQYBmmsK4NymKkuHLmfOLjT/8nVqTsARrVq4INjS6Nh/lHfESsS0Og
	N7FpO8LQZP79Yp8P/YLxSwpemM4tY7631MaZgrPwNWdMwqIu19FDffWfM479QVLaP5Nr2ClYz4NEb
	vxfrwyMH4UVtHrw1pp/EeGSMZMbVPaEVJ0Yf/401pON56QMnImhJJjpzG2zmoRBlA4W8ChN0yvGvP
	QavQ1dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC28I-00000001kid-0I8J
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 19:05:14 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC27I-00000001ju0-2Q9j
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 19:04:24 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-42121d27861so2548765e9.0
        for <ath12k@lists.infradead.org>; Tue, 28 May 2024 12:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1716923051; x=1717527851; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+ytTEWiXKbIuQ8DpZG6ZoIYYrAybeCYmHd6/M4lW1Rs=;
        b=l9oiSA35zOxC6G8oKUXBfm8gqQon7np1tj9ad4oudUUaDv5azTvmNByIHRASpNOz1P
         U0Z1+Mcezxcb3l7hh+Esk5xnw+HJvAnMoK+0qID/Fn2IWTDAlFW4aj2NoSqGFeGtJfxw
         izAphLLQjn9YNfJas6VN+xZB5+B/R2zEGJ9gbn1cbgAW5CUN8guI5DM26W3tOO0x3aJK
         G+Zx+WGnR8Iny+misOBWfSFuH5duse0fohkNGvzeiFy2fvhvqrWj9eUOnpuSbkBuXVac
         2ekyY+ovISukUAx10uD8I3lEFicnKAwpFMuiUbvM1/rIxXI45/A0R8qMoN3ShkJh/UG4
         Sd3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716923051; x=1717527851;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+ytTEWiXKbIuQ8DpZG6ZoIYYrAybeCYmHd6/M4lW1Rs=;
        b=a/bVHITIDTiTZQvJr/XW+rdLSjbecwL49zd8Xd1YO9C+IL7n1JlM7cSUAwbwPYyErU
         2vGpBHB+I7yiPLhe2AG+bjVBeCWbei1o8yLwWB0uB2rD9bKkjEaIkX83pba20XjRX+Hi
         kYcy4zlWsTc2BnH1gQgAM4XSJHaARBxfVpWN6ulvDQxrMYf3lUNfvzHmFDxfkpbw2Yip
         1vG1zMVMXONuwi+IFvdjcO+TgrabzuTCaOPGtM7WndK8OqzL4znfZIQguPvO4STHJVxw
         VnFzdp2fWeBwkBm4x3+/oEFuq1XcMtw7EDxA3oXizgTqFgJhwT2/VNuYO2QCtZweJIK1
         ZJhw==
X-Forwarded-Encrypted: i=1; AJvYcCVX5QETTfKsUyvm72i2xlX1LY5c1ikAy4SBZrk5AlDH+twdw9g1nljAWtP+GJmC1UWKTJaJGWX+wWqRGM5xtxiTvnvQjL6H2jGBQg==
X-Gm-Message-State: AOJu0Ywe+y7vrkJf5qhjmytJovfB7PUH9C0De2Y4uOsQsOLaTwqTdEYD
	wkGqkOn11DFIzuDgyzfeFe3c3DtxIdlibhU+h7nPHGS1yF8c+9PdA5aNzOMzKRc=
X-Google-Smtp-Source: AGHT+IGr9Ojgwytm4iX9gfeC7HKGDwhCWclljkq1atIIKWkwjLAAGni1lUy44ltShGgL2ph8z+vsKQ==
X-Received: by 2002:a05:600c:3646:b0:418:f991:713f with SMTP id 5b1f17b1804b1-421089ffb20mr103408325e9.23.1716923050945;
        Tue, 28 May 2024 12:04:10 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:75a:e000:93eb:927a:e851:8a2f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-42100ee954bsm183895415e9.4.2024.05.28.12.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 May 2024 12:04:10 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 28 May 2024 21:03:25 +0200
Subject: [PATCH v8 17/17] Bluetooth: qca: use the power sequencer for
 QCA6390
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240528-pwrseq-v8-17-d354d52b763c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4086;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=Avu9/iVEa5ctX7rSEGjhhAJegGiSsgTxVFrmV4sVK2k=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBmViqRYDzteYvAvkaLJmNfsrKlAel2gGnpKi/5k
 H2AxTd99D2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZlYqkQAKCRARpy6gFHHX
 ckx9D/sF6bFK+4+MkxmVs/T0n/IO5FL1tM3ik55oKT13+sSCJ4etW/LbZ5eF91APL859kZG3Y6W
 aFAaNVzjgQTfd/2Q+bdlYL+X9emJuU0T7CXKFlN/N2HrbLlQT9AXmeC4FOi3biUJQK4LOyyDetH
 ojSyoma/VJrnHuurJaQOl80ddoFm5gfzDPJvGzvqwbLTPLLtj1jiwOBhDtMIcPhnFrwueBx9UO3
 0mCe4phl3MBCwVXmAfnsptIIOSJfilhDsFBdQrHCjqwoBcx+anp9JSJZqfjgEr5ahSNdF4R2bTN
 UBOPXXy9xT0LF+knaYZmBYhqglZ+3VRgdLhCsZm9ffXWTB1Q870+0/dbQCo/ny+7lserGXAXNw3
 z9TJDLJTlOiBiFGdpckN/3ewdubjN8H5JUcDLp/YdaFA3mFZzlDtMzlsmHulkqwPScyE8TTm4VD
 SNcmx60s52eJ43l2F5+keL0lTvd9gDdsDA/RZOspWAcBiibzNVTl24eV24FslRKfGV2Sw0rPuKy
 3U1FMSrCoUNY1Hv6Tolz1jvLmUxbHQJhGngh0qcq1QPhqF95guvxrjzM8CxlguFHCq9Da+tbOyv
 hxD4fuyfxGNL8/BKI4Tnpm5PbytBKdCT8UyZMGhabSscZmYqkeInoWiGFptllVdWGU4qH/HMDTh
 QySNU7YTsh9KDsw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_120414_085576_47B728F5 
X-CRM114-Status: GOOD (  17.22  )
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

Use the pwrseq subsystem's consumer API to run the power-up sequence for
the Bluetooth module of the QCA6390 package.

Tested-by: Amit Pundir <amit.pundir@linaro.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/bluetooth/hci_qca.c | 74 ++++++++++++++++++++++++++++++++++++---------
 1 file changed, 59 insertions(+), 15 deletions(-)

diff --git a/drivers/bluetooth/hci_qca.c b/drivers/bluetooth/hci_qca.c
index 384a2bbbf303..de4f88d835cb 100644
--- a/drivers/bluetooth/hci_qca.c
+++ b/drivers/bluetooth/hci_qca.c
@@ -28,6 +28,7 @@
 #include <linux/of.h>
 #include <linux/acpi.h>
 #include <linux/platform_device.h>
+#include <linux/pwrseq/consumer.h>
 #include <linux/regulator/consumer.h>
 #include <linux/serdev.h>
 #include <linux/mutex.h>
@@ -214,6 +215,7 @@ struct qca_power {
 	struct regulator_bulk_data *vreg_bulk;
 	int num_vregs;
 	bool vregs_on;
+	struct pwrseq_desc *pwrseq;
 };
 
 struct qca_serdev {
@@ -1684,6 +1686,27 @@ static bool qca_wakeup(struct hci_dev *hdev)
 	return wakeup;
 }
 
+static int qca_port_reopen(struct hci_uart *hu)
+{
+	int ret;
+
+	/* Now the device is in ready state to communicate with host.
+	 * To sync host with device we need to reopen port.
+	 * Without this, we will have RTS and CTS synchronization
+	 * issues.
+	 */
+	serdev_device_close(hu->serdev);
+	ret = serdev_device_open(hu->serdev);
+	if (ret) {
+		bt_dev_err(hu->hdev, "failed to open port");
+		return ret;
+	}
+
+	hci_uart_set_flow_control(hu, false);
+
+	return 0;
+}
+
 static int qca_regulator_init(struct hci_uart *hu)
 {
 	enum qca_btsoc_type soc_type = qca_soc_type(hu);
@@ -1752,21 +1775,7 @@ static int qca_regulator_init(struct hci_uart *hu)
 		break;
 	}
 
-	/* Now the device is in ready state to communicate with host.
-	 * To sync host with device we need to reopen port.
-	 * Without this, we will have RTS and CTS synchronization
-	 * issues.
-	 */
-	serdev_device_close(hu->serdev);
-	ret = serdev_device_open(hu->serdev);
-	if (ret) {
-		bt_dev_err(hu->hdev, "failed to open port");
-		return ret;
-	}
-
-	hci_uart_set_flow_control(hu, false);
-
-	return 0;
+	return qca_port_reopen(hu);
 }
 
 static int qca_power_on(struct hci_dev *hdev)
@@ -1794,6 +1803,17 @@ static int qca_power_on(struct hci_dev *hdev)
 		ret = qca_regulator_init(hu);
 		break;
 
+	case QCA_QCA6390:
+		qcadev = serdev_device_get_drvdata(hu->serdev);
+		ret = pwrseq_power_on(qcadev->bt_power->pwrseq);
+		if (ret)
+			return ret;
+
+		ret = qca_port_reopen(hu);
+		if (ret)
+			return ret;
+		break;
+
 	default:
 		qcadev = serdev_device_get_drvdata(hu->serdev);
 		if (qcadev->bt_en) {
@@ -2168,6 +2188,10 @@ static void qca_power_shutdown(struct hci_uart *hu)
 		}
 		break;
 
+	case QCA_QCA6390:
+		pwrseq_power_off(qcadev->bt_power->pwrseq);
+		break;
+
 	default:
 		gpiod_set_value_cansleep(qcadev->bt_en, 0);
 	}
@@ -2309,12 +2333,25 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 	case QCA_WCN6750:
 	case QCA_WCN6855:
 	case QCA_WCN7850:
+	case QCA_QCA6390:
 		qcadev->bt_power = devm_kzalloc(&serdev->dev,
 						sizeof(struct qca_power),
 						GFP_KERNEL);
 		if (!qcadev->bt_power)
 			return -ENOMEM;
+		break;
+	default:
+		break;
+	}
 
+	switch (qcadev->btsoc_type) {
+	case QCA_WCN3988:
+	case QCA_WCN3990:
+	case QCA_WCN3991:
+	case QCA_WCN3998:
+	case QCA_WCN6750:
+	case QCA_WCN6855:
+	case QCA_WCN7850:
 		qcadev->bt_power->dev = &serdev->dev;
 		err = qca_init_regulators(qcadev->bt_power, data->vregs,
 					  data->num_vregs);
@@ -2360,6 +2397,13 @@ static int qca_serdev_probe(struct serdev_device *serdev)
 		}
 		break;
 
+	case QCA_QCA6390:
+		qcadev->bt_power->pwrseq = devm_pwrseq_get(&serdev->dev,
+							   "bluetooth");
+		if (IS_ERR(qcadev->bt_power->pwrseq))
+			return PTR_ERR(qcadev->bt_power->pwrseq);
+		fallthrough;
+
 	default:
 		qcadev->bt_en = devm_gpiod_get_optional(&serdev->dev, "enable",
 					       GPIOD_OUT_LOW);

-- 
2.43.0


