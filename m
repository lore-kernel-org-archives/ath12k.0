Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8AC07EA4FBE
	for <ath12k@archiver.kernel.org>; Mon, 23 Feb 2026 13:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n+JBFBG1wIMlv71d+5W2rDBSGfSdhU5O9Vycp6TPccM=; b=NikcEwoqiu6pRUv12UrF3EMP+i
	Ji85OXFVzFPpCQzMFdSkB/g05Zyb/sldiJu2oZWsRP0EE0aGLxGZRhtnL/tg9tFypYBtqK5yCTlnt
	SELznMuIFgFsCpsEveC2YokDapnPwJMwRpvQcGXEg0hkARdMiN6fGpevDr3Ieis09x2fPKR+2fQzU
	TuByAVQJ1qS8uRoFFVpTX2XKq3weq0PO/c0rwUCYDODwQC8rEzyWFIVV8VUMy/eCdnH29yR2nhbpD
	jFZSiXjmmJvjpe4JoVCXM0KNOuWrilfTX6Tyz3Ib1/4wb4EjPzkDIn+aTabKPffd+ta7TFoTIdiHt
	9/rkVa9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVxx-00000000MUt-0OPA;
	Mon, 23 Feb 2026 13:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vuVxu-00000000MUW-37K4
	for ath12k@lists.infradead.org;
	Mon, 23 Feb 2026 13:27:12 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N9hF6U1195528
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 13:27:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=n+JBFBG1wIMl
	v71d+5W2rDBSGfSdhU5O9Vycp6TPccM=; b=Jv4W78+9hxZLaGaZbRXmKfB35sgF
	2dwibtmaMqlUFo5vinb38hyT5y8iRKHqYRJC+GpXmejIHVMbJVuNyO3YNgAgrGEC
	qB1P5M0GFa57MDzP8IRTu7bHLRqVn9imD7SXsKpnsOxvNihTwTcJ5JtVFkoayeMm
	ryfDpDmWSCAgIhX0NgbUUG7QmCl32jKZeP/NOcCezE/x7tQnW8BAaG8cE9NnqJui
	hYRNt/+CereeochbONzGOiDnERjN+v730eI+Ul4XBaXzNUYsL19Vy/mOFVur1mPs
	Zv0jfrubuGFooC+UFTaxeCewN9Y1SZBdq1/yh5e+KPRh9RwTZza6/wV12w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf603mvs3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 13:27:10 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2a76f2d7744so47931625ad.3
        for <ath12k@lists.infradead.org>; Mon, 23 Feb 2026 05:27:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853229; x=1772458029; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n+JBFBG1wIMlv71d+5W2rDBSGfSdhU5O9Vycp6TPccM=;
        b=NAG7zF3P0WEj6yz0CGq1t70gC3uCgxPmAynOTTsyfE51Laqb+Zp7vvzvLS4dmLi60f
         SSR3seycVp83zjeDIUTl6kSaUxWMk3s1nrLSMYE3o4uHEUTQGb1cMcxzlahv5ew7zS9N
         7DTSkBVSI4E8mv47AsGb6KekiQQilmDJCRRaNy6j9PGupnfdVpWOOVVX4uvdfA7wR3Ml
         tEnINxcsYipimus8hTTr9pwHFrt4v5GctG0ME6TIzESWgeF4yD8sy87x6/EC5GPlOTBK
         2tRlFsL01hcehAb7+c1BczD0j1XNuC4hWp4qzfeOpdtsfg9oO9VeRFLZDRtSRHZcMDYu
         Bznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853229; x=1772458029;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=n+JBFBG1wIMlv71d+5W2rDBSGfSdhU5O9Vycp6TPccM=;
        b=OhxKu6rRN3tbmPeapGHAx9vpP4nJ4mUYLAEP3Q7FydzCs51SmKDo3jwnnH0BLgdRgU
         8ReY2UbM4bP+qU5kj+xSnhj2fAqoR5me+odG1CG4swNb9XhYGRjWlKMdcuMeaObQJal3
         7sje+mm3mQcAVQGN5iCIa1zr9CzHvUgNnELasVAYZXRqgKCXKSu/sJzCJwYxhUsqIX4g
         35VsKsiMgQVpOyes21nlER8jdA4qpnrfLpycDIoRG7j8pSBRWyMdrPPxaiSkUnZR6Uga
         C6xB5H3gD3njV+33k0IFWPtYMXu93ZJ4N44+sucD6gabx7iPl/cNkSxYQTXf5wr4LrVh
         m17g==
X-Gm-Message-State: AOJu0YyA5atlW3W8CbtUrr7GbQNKN7AuKkjng5iH4lYPTgx4BxDvrVKc
	OvVWLgzEdeDwJspahNjJQpguk+XNSR3Zq241g2/JcDUofMCPCeNspMn9JckOaOKl+LLxa0uatL5
	4somjE3gaHUnS+ikf2+cbSxJ1XM18V72gA+MIpCCj2/DBsmZ8HdA3FMfKgeOd86wgqOMNUteYUc
	0=
X-Gm-Gg: ATEYQzxJYgMCDHZnvulZzlwsy4ATs5axuhMzicoG4NkkcCNWhJa+Nl1Q6fps35tcQHb
	kW9XgIuUJhINgdAJ43dOm5lmygXQV7wV79Tr3PF+0UTaMQCDmEbvzqnx0PSPn9g3qHhwoRXGzlI
	VYojlbFXx5dkqAZ7W3taRyr+liaYpzuICg/zg+es1NLT1tTkKW5RjG1WJwXamvcOeGwFUpMOMPA
	f54ZJBXa91z+Cgaf56GBBlimXkWo8u1Jdfhf/eVnAlEBgbuHanpI1D8XlozlS68CLXQ9KJIKFwl
	m7DsEl7ogORPW27aNwjhZAjKI50sbjNijCGudi/kxoDqlG+bKLfvBq0oauKfpwSO5g9III2ob5e
	PGoQUJNspsdmENYTGW+81MvgjnAZMFUkBFn6O9pfc+OriwYjc1JDulrl4FDvOQEII
X-Received: by 2002:a17:902:c952:b0:2a9:838e:8d7f with SMTP id d9443c01a7336-2ad74524453mr83320155ad.41.1771853229162;
        Mon, 23 Feb 2026 05:27:09 -0800 (PST)
X-Received: by 2002:a17:902:c952:b0:2a9:838e:8d7f with SMTP id d9443c01a7336-2ad74524453mr83319935ad.41.1771853228635;
        Mon, 23 Feb 2026 05:27:08 -0800 (PST)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ad74f5dcb4sm76958555ad.27.2026.02.23.05.27.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:27:08 -0800 (PST)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next v4] wifi: ath12k: add basic hwmon temperature reporting
Date: Mon, 23 Feb 2026 18:56:22 +0530
Message-Id: <20260223132622.43464-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=XbWEDY55 c=1 sm=1 tr=0 ts=699c55ae cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NPPaRV88JsJ7pIHLkfUA:9
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNSBTYWx0ZWRfX4J6Htqx+r1cc
 Sxyl9AB5ZyQhHGH67ueOFuIdmruzqTWhUTlX29KiiMCJ4giwfEnPLxc0hHlYw+GbvkRNFDjMZq7
 CTXhohn31he/Z6PWim5P3b4jAAroqeXF6ZjxpENK/hkbCWsCqFiHUM+CYgnn2ttfm6DUaJBO+I0
 9OZBaM7ZCjFs47FLj0z3oBOs1hQ3fvwrjVbI9Am3pwYWqM44KtHBk0W3MBR6iOgk0Or8dwS/t5D
 SdRPIpK1I6AytLSRzHUhHyuIKZXhKNh/M/ClV1NP45rq1fOZjrlJnPgbYe5hWIqgP+zyL/fQLcV
 rvP+WMJCOedj8vlGga4OPKLsNyuiM4P9mgYsMKerJzOQPlf2KOZOP2GCdgDTyEMR5gwJhPbbpJA
 QXnV0RCAYr60kNutfgP4pDLn8FSkBQ0FVo6TJbsHpDEtV7oqxI9aSSu4K6A+XKUk0jEkBn6KaPh
 F6cfkDfaPBEFRGO4t8Q==
X-Proofpoint-ORIG-GUID: k7Kdpxaj4H4lJMskIZCVRLLkj1_SYcYn
X-Proofpoint-GUID: k7Kdpxaj4H4lJMskIZCVRLLkj1_SYcYn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 phishscore=0 priorityscore=1501 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2602130000
 definitions=main-2602230115
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260223_052710_791643_1FDF2B6E 
X-CRM114-Status: GOOD (  26.37  )
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

Add initial thermal support by wiring up a per-radio (pdev) hwmon temperature
sensor backed by the existing WMI pdev temperature command and event.
When userspace reads the sysfs file temp1_input, the driver sends
WMI_PDEV_GET_TEMPERATURE_CMDID (tag WMI_TAG_PDEV_GET_TEMPERATURE_CMD) and waits
for the corresponding WMI_PDEV_TEMPERATURE_EVENTID
(tag WMI_TAG_PDEV_TEMPERATURE_EVENT) to get the temperature and pdev_id.

Export the reported value in millidegrees Celsius as required by hwmon.
The temperature reported is per-radio (pdev). In a multi-radio wiphy under a
single phy, a separate hwmon device is created for each radio.

Sample command and output:
$ cat /sys/devices/pci0000:00/.../ieee80211/phyX/hwmonY/temp1_input
$ 50000

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202602160145.YQdvbqYY-lkp@intel.com/
Co-developed-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
Signed-off-by: Aishwarya R <aishwarya.r@oss.qualcomm.com>
Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---

v4: Addressed Nicolas comment on extra mutex_lock removal.

v3: Addressed the Pablo's comment on looping the ab->pdevs in the function
    ath12k_thermal_register() while handling the failure case.
    Renamed mutex_lock to generic name from thermal.read_lock to
    thermal.lock.

v2: Fixed the kernel test robot reported build test error.

 drivers/net/wireless/ath/ath12k/Makefile  |   1 +
 drivers/net/wireless/ath/ath12k/core.c    |  13 +++
 drivers/net/wireless/ath/ath12k/core.h    |   3 +
 drivers/net/wireless/ath/ath12k/mac.c     |   4 +
 drivers/net/wireless/ath/ath12k/thermal.c | 124 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/thermal.h |  40 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c     |  57 +++++-----
 7 files changed, 211 insertions(+), 31 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.c
 create mode 100644 drivers/net/wireless/ath/ath12k/thermal.h

diff --git a/drivers/net/wireless/ath/ath12k/Makefile b/drivers/net/wireless/ath/ath12k/Makefile
index 3ba1236956cc..3b39b2c33307 100644
--- a/drivers/net/wireless/ath/ath12k/Makefile
+++ b/drivers/net/wireless/ath/ath12k/Makefile
@@ -32,6 +32,7 @@ ath12k-$(CONFIG_ATH12K_TRACING) += trace.o
 ath12k-$(CONFIG_PM) += wow.o
 ath12k-$(CONFIG_ATH12K_COREDUMP) += coredump.o
 ath12k-$(CONFIG_NL80211_TESTMODE) += testmode.o
+ath12k-$(CONFIG_THERMAL) += thermal.o
 
 # for tracing framework to find trace.h
 CFLAGS_trace.o := -I$(src)
diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 9d6c50a94e64..9dca1a0af73e 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -863,11 +863,22 @@ static int ath12k_core_pdev_create(struct ath12k_base *ab)
 		return ret;
 	}
 
+	ret = ath12k_thermal_register(ab);
+	if (ret) {
+		ath12k_err(ab, "could not register thermal device: %d\n", ret);
+		goto err_dp_pdev_free;
+	}
+
 	return 0;
+
+err_dp_pdev_free:
+	ath12k_dp_pdev_free(ab);
+	return ret;
 }
 
 static void ath12k_core_pdev_destroy(struct ath12k_base *ab)
 {
+	ath12k_thermal_unregister(ab);
 	ath12k_dp_pdev_free(ab);
 }
 
@@ -1361,6 +1372,7 @@ static int ath12k_core_reconfigure_on_crash(struct ath12k_base *ab)
 
 	mutex_lock(&ab->core_lock);
 	ath12k_link_sta_rhash_tbl_destroy(ab);
+	ath12k_thermal_unregister(ab);
 	ath12k_dp_pdev_free(ab);
 	ath12k_ce_cleanup_pipes(ab);
 	ath12k_wmi_detach(ab);
@@ -1502,6 +1514,7 @@ static void ath12k_core_pre_reconfigure_recovery(struct ath12k_base *ab)
 			complete(&ar->vdev_delete_done);
 			complete(&ar->bss_survey_done);
 			complete_all(&ar->regd_update_completed);
+			complete_all(&ar->thermal.wmi_sync);
 
 			wake_up(&ar->dp.tx_empty_waitq);
 			idr_for_each(&ar->txmgmt_idr,
diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 990934ec92fc..760c76d6f0f4 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -36,6 +36,7 @@
 #include "coredump.h"
 #include "cmn_defs.h"
 #include "dp_cmn.h"
+#include "thermal.h"
 
 #define SM(_v, _f) (((_v) << _f##_LSB) & _f##_MASK)
 
@@ -757,6 +758,8 @@ struct ath12k {
 
 	s8 max_allowed_tx_power;
 	struct ath12k_pdev_rssi_offsets rssi_info;
+
+	struct ath12k_thermal thermal;
 };
 
 struct ath12k_hw {
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 68431a0e128e..b9091f3f723f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14792,6 +14792,10 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->mlo_setup_done);
 	init_completion(&ar->completed_11d_scan);
 	init_completion(&ar->regd_update_completed);
+	init_completion(&ar->thermal.wmi_sync);
+
+	ar->thermal.temperature = 0;
+	ar->thermal.hwmon_dev = NULL;
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
new file mode 100644
index 000000000000..a764d2112a3c
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -0,0 +1,124 @@
+// SPDX-License-Identifier: BSD-3-Clause-Clear
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include <linux/device.h>
+#include <linux/hwmon.h>
+#include <linux/hwmon-sysfs.h>
+#include <linux/sysfs.h>
+#include <linux/thermal.h>
+#include "core.h"
+#include "debug.h"
+
+static ssize_t ath12k_thermal_temp_show(struct device *dev,
+					struct device_attribute *attr,
+					char *buf)
+{
+	struct ath12k *ar = dev_get_drvdata(dev);
+	unsigned long time_left;
+	int ret, temperature;
+
+	guard(wiphy)(ath12k_ar_to_hw(ar)->wiphy);
+
+	if (ar->ah->state != ATH12K_HW_STATE_ON)
+		return -ENETDOWN;
+
+	reinit_completion(&ar->thermal.wmi_sync);
+	ret = ath12k_wmi_send_pdev_temperature_cmd(ar);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to read temperature %d\n", ret);
+		return ret;
+	}
+
+	if (test_bit(ATH12K_FLAG_CRASH_FLUSH, &ar->ab->dev_flags))
+		return -ESHUTDOWN;
+
+	time_left = wait_for_completion_timeout(&ar->thermal.wmi_sync,
+						ATH12K_THERMAL_SYNC_TIMEOUT_HZ);
+	if (!time_left) {
+		ath12k_warn(ar->ab, "failed to synchronize thermal read\n");
+		return -ETIMEDOUT;
+	}
+
+	spin_lock_bh(&ar->data_lock);
+	temperature = ar->thermal.temperature;
+	spin_unlock_bh(&ar->data_lock);
+
+	/* display in millidegree celsius */
+	return sysfs_emit(buf, "%d\n", temperature * 1000);
+}
+
+void ath12k_thermal_event_temperature(struct ath12k *ar, int temperature)
+{
+	spin_lock_bh(&ar->data_lock);
+	ar->thermal.temperature = temperature;
+	spin_unlock_bh(&ar->data_lock);
+	complete_all(&ar->thermal.wmi_sync);
+}
+
+static SENSOR_DEVICE_ATTR_RO(temp1_input, ath12k_thermal_temp, 0);
+
+static struct attribute *ath12k_hwmon_attrs[] = {
+	&sensor_dev_attr_temp1_input.dev_attr.attr,
+	NULL,
+};
+ATTRIBUTE_GROUPS(ath12k_hwmon);
+
+int ath12k_thermal_register(struct ath12k_base *ab)
+{
+	struct ath12k *ar;
+	int i, j, ret;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return 0;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		if (!ar)
+			continue;
+
+		ar->thermal.hwmon_dev =
+			hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
+							  "ath12k_hwmon", ar,
+							  ath12k_hwmon_groups);
+		if (IS_ERR(ar->thermal.hwmon_dev)) {
+			ret = PTR_ERR(ar->thermal.hwmon_dev);
+			ar->thermal.hwmon_dev = NULL;
+			ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
+				   ret);
+			for (j = i - 1; j >= 0; j--) {
+				ar = ab->pdevs[j].ar;
+				if (!ar)
+					continue;
+
+				hwmon_device_unregister(ar->thermal.hwmon_dev);
+				ar->thermal.hwmon_dev = NULL;
+			}
+			return ret;
+		}
+	}
+
+	return 0;
+}
+
+void ath12k_thermal_unregister(struct ath12k_base *ab)
+{
+	struct ath12k *ar;
+	int i;
+
+	if (!IS_REACHABLE(CONFIG_HWMON))
+		return;
+
+	for (i = 0; i < ab->num_radios; i++) {
+		ar = ab->pdevs[i].ar;
+		if (!ar)
+			continue;
+
+		if (ar->thermal.hwmon_dev) {
+			hwmon_device_unregister(ar->thermal.hwmon_dev);
+			ar->thermal.hwmon_dev = NULL;
+		}
+	}
+}
diff --git a/drivers/net/wireless/ath/ath12k/thermal.h b/drivers/net/wireless/ath/ath12k/thermal.h
new file mode 100644
index 000000000000..9d84056188e1
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/thermal.h
@@ -0,0 +1,40 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_THERMAL_
+#define _ATH12K_THERMAL_
+
+#define ATH12K_THERMAL_SYNC_TIMEOUT_HZ (5 * HZ)
+
+struct ath12k_thermal {
+	struct completion wmi_sync;
+
+	/* temperature value in Celsius degree protected by data_lock. */
+	int temperature;
+	struct device *hwmon_dev;
+};
+
+#if IS_REACHABLE(CONFIG_THERMAL)
+int ath12k_thermal_register(struct ath12k_base *ab);
+void ath12k_thermal_unregister(struct ath12k_base *ab);
+void ath12k_thermal_event_temperature(struct ath12k *ar, int temperature);
+#else
+static inline int ath12k_thermal_register(struct ath12k_base *ab)
+{
+	return 0;
+}
+
+static inline void ath12k_thermal_unregister(struct ath12k_base *ab)
+{
+}
+
+static inline void ath12k_thermal_event_temperature(struct ath12k *ar,
+						    int temperature)
+{
+}
+
+#endif
+#endif /* _ATH12K_THERMAL_ */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7617fc3a2479..69f2dbcfca63 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6778,31 +6778,6 @@ static int ath12k_pull_peer_assoc_conf_ev(struct ath12k_base *ab, struct sk_buff
 	return 0;
 }
 
-static int
-ath12k_pull_pdev_temp_ev(struct ath12k_base *ab, struct sk_buff *skb,
-			 const struct wmi_pdev_temperature_event *ev)
-{
-	const void **tb;
-	int ret;
-
-	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
-	if (IS_ERR(tb)) {
-		ret = PTR_ERR(tb);
-		ath12k_warn(ab, "failed to parse tlv: %d\n", ret);
-		return ret;
-	}
-
-	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
-	if (!ev) {
-		ath12k_warn(ab, "failed to fetch pdev temp ev");
-		kfree(tb);
-		return -EPROTO;
-	}
-
-	kfree(tb);
-	return 0;
-}
-
 static void ath12k_wmi_op_ep_tx_credits(struct ath12k_base *ab)
 {
 	/* try to send pending beacons first. they take priority */
@@ -8811,25 +8786,45 @@ static void
 ath12k_wmi_pdev_temperature_event(struct ath12k_base *ab,
 				  struct sk_buff *skb)
 {
+	const struct wmi_pdev_temperature_event *ev;
 	struct ath12k *ar;
-	struct wmi_pdev_temperature_event ev = {};
+	const void **tb;
+	int temp;
+	u32 pdev_id;
+
+	tb = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);
+	if (IS_ERR(tb)) {
+		ath12k_warn(ab, "failed to parse tlv: %ld\n", PTR_ERR(tb));
+		return;
+	}
 
-	if (ath12k_pull_pdev_temp_ev(ab, skb, &ev) != 0) {
-		ath12k_warn(ab, "failed to extract pdev temperature event");
+	ev = tb[WMI_TAG_PDEV_TEMPERATURE_EVENT];
+	if (!ev) {
+		ath12k_warn(ab, "failed to fetch pdev temp ev\n");
+		kfree(tb);
 		return;
 	}
 
+	temp = a_sle32_to_cpu(ev->temp);
+	pdev_id = le32_to_cpu(ev->pdev_id);
+
+	kfree(tb);
+
 	ath12k_dbg(ab, ATH12K_DBG_WMI,
-		   "pdev temperature ev temp %d pdev_id %d\n", ev.temp, ev.pdev_id);
+		   "pdev temperature ev temp %d pdev_id %u\n",
+		   temp, pdev_id);
 
 	rcu_read_lock();
 
-	ar = ath12k_mac_get_ar_by_pdev_id(ab, le32_to_cpu(ev.pdev_id));
+	ar = ath12k_mac_get_ar_by_pdev_id(ab, pdev_id);
 	if (!ar) {
-		ath12k_warn(ab, "invalid pdev id in pdev temperature ev %d", ev.pdev_id);
+		ath12k_warn(ab, "invalid pdev id %u in pdev temperature ev\n",
+			    pdev_id);
 		goto exit;
 	}
 
+	ath12k_thermal_event_temperature(ar, temp);
+
 exit:
 	rcu_read_unlock();
 }

base-commit: 37a93dd5c49b5fda807fd204edf2547c3493319c
-- 
2.17.1


