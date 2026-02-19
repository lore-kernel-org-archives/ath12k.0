Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 953EEE9A03B
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 07:34:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vngj+bPcsT9q8cGQW7aQKCmPQjyzHumirAjRa82Dfog=; b=AVOh7uthRCmQVFuzg//E4YF3a0
	Mn4ma4bqiXx/R2iyKY6ApvDfrjMoyiwVNflk53xQKN0+G8FAcbqNIU5arpIIppW/XF2CDyGGE36K+
	X1iCB7OIOkDnW8THJCaBJ5XT7iArf438+tYjMHh5vYZPfJe7N5aYuT41sGBY/0CCfBDALrW9mas1t
	5SNstxwzh/jCovjh+UkBu3OrGKmcg68PyxdInuMh4XipW/BOZpDcAXLBvZuH+SpNByyxzUAZe2VGd
	2T8QgbN4jYmAex+3M2KFVBvCyi6fC+hNcpLdd/tL+v2cuP8JbwEh+CuMTv4Mh8by7+9mS1wR9E63G
	YuWCyw0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsyYo-0000000B3GX-1HeF;
	Thu, 19 Feb 2026 07:34:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsyYm-0000000B3FT-0nsT
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 07:34:53 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61J6DEvR421065
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 07:34:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:date:from:message-id:subject:to; s=qcppdkim1; bh=Vngj+bPcsT9q
	8cGQW7aQKCmPQjyzHumirAjRa82Dfog=; b=doZhYw1dSqMqxxFvgVmEhp1mAJNU
	hgtuBekbvz2unvWxRAjyKmDnz4VI16ySRv/GFWebU9SRrAmlxmpXr+gY4sLgICgU
	HX3h9RMKApsBJnJtHNhsS4KSlkSDMCLL7mNGSnteuXDrvM8tdscWT5mljIfYLDZ4
	e8z4DzBSe6/ZI0hmfczk2bqLLEnRKIfGnylp4zL9T7xH4PPUVVNdEyQj8Gn2cVmB
	i6KFHVuWtToVCdlW1FhOwS/fGnmBpJ4nkl5KOdiPpE/D+DBknORXWZFDHb/IGYrf
	PAczwRhVOi+hGa1CD1NJz3UuIT9oFR0iLrdABEDH8n/yM17MNcs7lh1GPw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cd76e3nw5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 07:34:50 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-354c72d23dfso3852094a91.2
        for <ath12k@lists.infradead.org>; Wed, 18 Feb 2026 23:34:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771486490; x=1772091290; darn=lists.infradead.org;
        h=message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vngj+bPcsT9q8cGQW7aQKCmPQjyzHumirAjRa82Dfog=;
        b=CbrLWmli6MbudHruWQcGdV/irzOTwtq56lOZmOZ+OwicMSU5vJhRivaXI67BNUf1xs
         wJNHQ7XwUM5F0Xv4f0bb2E2XTgKrCDNsfp7EtHmROpDXzhdWfnqvp/ABMoDh+mDP2yN0
         uVJBdpCUvaw2m72ayJPkhSKb6FJep8DW7Dlzvk9UMp7cEyTzgjr9uStvn1q8iLW6WqUE
         KFXz8Uc55di25+TaQrnET5liYQeytwHxmGzcuMSN4njgZ5uC5pfC9STcNFhZnLfLOiTr
         QwfjZker1WvUtwu23ZM/+UwYYRL2IDSJtqWvBBm6Ze6dCOB+W8v7XVTDrB6oM642jqW1
         gKlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771486490; x=1772091290;
        h=message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vngj+bPcsT9q8cGQW7aQKCmPQjyzHumirAjRa82Dfog=;
        b=tz3vzi3MQ0dmr8N4CrtSLLt8oWKeaTJ3volI9p/Kj6sALLJzbauoRNTie1pXrRA4k0
         h3krkeN1oGooPhxe949B2/2BOgcIQxwLA96JVmWT4hlJK7tLVMjBvsybK9N7/ISHhDPA
         2N3GO5UcdOiYaM/rzS1nBQQ6uYUI80xAmk2LFYNpHgsB2SM/dWy4mw4DKbeWljlQM28V
         YG9D6Zwc49aooWX9ITJc4xphKBMKsFfT8fLdUJvFoOODs51/1YYoOLk+zui3QMB8ksXW
         gOgq/ilT1Q9c/9Pkqs2m8gy6vVA7TeDxb7xUf0/qxnMB2vQPQXd+SilB/Twky6ounXdy
         c7cA==
X-Gm-Message-State: AOJu0YxLRH7Em1qsd64CGNo4GhL+xwkwtu0ixonGTO63/yu0Ey0BXJnj
	U7SbUa3dkwh8ok3KTzxgh42qmo93c0rZaVT2YDpuMLgmrlfunuLtjsxj9bFfQ1MoH0DIr0Xi0tk
	YrfXY+9h/Fmj1KNeq0AQq6UEDQicuuwZtLUtk1TsL6uHyz12HJLVHW7neoMd5Xl+Jz1dLvllx
X-Gm-Gg: AZuq6aI1t+rgaKecwAcZrSMwk+JszykWR2yupTEax8tVfqih19ja4wR9un83JB82ajq
	kkf+1SyBbHEEPzzdG+RceWT5J/ODJu+2y0GZyFs4TQTTI5UOwG7WEx/A5QaL+yGuQM07dMxMsqA
	Af65XKgY/JY1H6vTqVEn1jG5Ueopg1amLgKgRAyKcFRNIUzOKA5Z95Eia9qTYOpTq2ZXYxmf9fs
	/0b7Z3Ht3SuZX2/OTUJXzeZS1KD1WSxr6mcIlSCuz9bh0eGbkT3/jw5sUcDqIDBE12E/kRjuZYe
	kCCz35MZeGD+cSyHZVllaUGYa16M2mq+E6rgNgQkK2i7dHURVmSnc9HTpipzQSDkkaNh6+TFEfa
	HmHrkUfsWkz7FSOLR+5VxvaqqQcPfhZt1qhDzsTQoOxrEmntL+mnKPnqKw3NoPzHj
X-Received: by 2002:a17:90b:4a8a:b0:34a:b4a2:f0c8 with SMTP id 98e67ed59e1d1-358891ca7c4mr3473179a91.30.1771486489737;
        Wed, 18 Feb 2026 23:34:49 -0800 (PST)
X-Received: by 2002:a17:90b:4a8a:b0:34a:b4a2:f0c8 with SMTP id 98e67ed59e1d1-358891ca7c4mr3473125a91.30.1771486486614;
        Wed, 18 Feb 2026 23:34:46 -0800 (PST)
Received: from che-ventolnx02.qualcomm.com ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e52fd0ecasm17180269a12.7.2026.02.18.23.34.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Feb 2026 23:34:46 -0800 (PST)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        Aishwarya R <aishwarya.r@oss.qualcomm.com>
Subject: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature reporting
Date: Thu, 19 Feb 2026 13:04:40 +0530
Message-Id: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.17.1
X-Authority-Analysis: v=2.4 cv=OKsqHCaB c=1 sm=1 tr=0 ts=6996bd1a cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=VwQbUJbxAAAA:8
 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=NPPaRV88JsJ7pIHLkfUA:9
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDA2OCBTYWx0ZWRfX9lWAoc7nr8jS
 WFnMA0i6jqJNGcCgcnFVyVjDWKg1CUX+ZX76d+iYvwAud6MmtV+H+TYAUD1IpkEKGW2784tz+z/
 S4y/Pb7cmpPQrzPQMl1nXYNwlZFBQAGLh1RwEH+ahEoV8b68Tp4ZnGc48LxsTFkD6vLg9RJ32qC
 48BPvBunf+P1gQt7BFWJE/iyuIHunxazN5Pm2jJeJLxo2UsEIUrr8xH814O8ISE2QtAg3DXeeiW
 oIObNmt6g35HQwjQkFOz/sqUh6M0yhL359Yf+HIJ9U8HU3D+HIVP3Tnn56TB9YKU03xDJCB0beJ
 p6rqfwfjPlQdcytoj+psKOXhLVfQaBDuGyClwKO4iDu0kjs9arf90XgFYfNZnjuSwUT8uqDPfLw
 VKgBfTfB3VvcxOQHqiXdxj8UYD+6a4V402g1tzh/DxsCR9YVK2CZC5BBLsIvWOduvDaSCuR7VEI
 TtIM2dWiqJZrft4aXOA==
X-Proofpoint-GUID: sYu03K7_zBn1QHhkNbbdP2HrVwrqKYVA
X-Proofpoint-ORIG-GUID: sYu03K7_zBn1QHhkNbbdP2HrVwrqKYVA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_02,2026-02-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190068
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_233452_240629_1A77AC21 
X-CRM114-Status: GOOD (  25.90  )
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

v2: Fixed the kernel test robot reported build test error. 

 drivers/net/wireless/ath/ath12k/Makefile  |   1 +
 drivers/net/wireless/ath/ath12k/core.c    |  13 +++
 drivers/net/wireless/ath/ath12k/core.h    |   3 +
 drivers/net/wireless/ath/ath12k/mac.c     |   5 +
 drivers/net/wireless/ath/ath12k/thermal.c | 125 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/thermal.h |  44 ++++++++
 drivers/net/wireless/ath/ath12k/wmi.c     |  57 +++++-----
 7 files changed, 217 insertions(+), 31 deletions(-)
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
index 68431a0e128e..d1db1285449c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14792,6 +14792,11 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->mlo_setup_done);
 	init_completion(&ar->completed_11d_scan);
 	init_completion(&ar->regd_update_completed);
+	init_completion(&ar->thermal.wmi_sync);
+	mutex_init(&ar->thermal.read_lock);
+
+	ar->thermal.temperature = 0;
+	ar->thermal.hwmon_dev = NULL;
 
 	INIT_DELAYED_WORK(&ar->scan.timeout, ath12k_scan_timeout_work);
 	wiphy_work_init(&ar->scan.vdev_clean_wk, ath12k_scan_vdev_clean_work);
diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
new file mode 100644
index 000000000000..b01e03e5a357
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -0,0 +1,125 @@
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
+	guard(mutex)(&ar->thermal.read_lock);
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
+				ar = ab->pdevs[i].ar;
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
index 000000000000..a853af5f2441
--- /dev/null
+++ b/drivers/net/wireless/ath/ath12k/thermal.h
@@ -0,0 +1,44 @@
+/* SPDX-License-Identifier: BSD-3-Clause-Clear */
+/*
+ * Copyright (c) 2020 The Linux Foundation. All rights reserved.
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _ATH12K_THERMAL_
+#define _ATH12K_THERMAL_
+
+#include <linux/mutex.h>
+
+#define ATH12K_THERMAL_SYNC_TIMEOUT_HZ (5 * HZ)
+
+struct ath12k_thermal {
+	struct completion wmi_sync;
+
+	/* temperature value in Celsius degree protected by data_lock. */
+	int temperature;
+	struct device *hwmon_dev;
+	/* Serialize concurrent sysfs reads to avoid completion races */
+	struct mutex read_lock;
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


