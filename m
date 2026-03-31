Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33EAF109B478
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TZTsrksisFxLaWu20Z7AaA5AMHfImBufO5srupJpSUo=; b=N16LD7mye189Vbhs8VZO0DRltg
	m5jRjc26SU3fulUbqn/SocnZqGj156Qh7Fu4ztNwscaCT9BhKEIJI9oCic4L6IAqzdmnnwWMhu7x+
	o6hsXPs6n+96/yH/oN+JYyjlHxFJtI/wS/ODLxuHu4txCEBC7gKUKX9SedhfYL5U6fn595NBWPA3Q
	ngYsoywBosR9FCBS3X3/IohwLW+D6Vhrz8cWdB2rx/o+Qgapu2Gr3PD11vQ3WYpS5B33pah1ta/8/
	KR7MYPN4FvnReuusXj5YeWLNNKO8BmOds6boltPFM+lmZ5lgysFF2+0xgtYdpDUId+ulP3D1PrKBD
	UalEFHBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1w-0000000D5UK-2zDd;
	Tue, 31 Mar 2026 14:25:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1r-0000000D5Q2-1f9U
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V9kdIS4053308
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=TZTsrksisFx
	LaWu20Z7AaA5AMHfImBufO5srupJpSUo=; b=VQGoefPYNjqCzv7zeA5uGKKaqtW
	VIJ/k4v42mZXUtbBFUsvSWIiMK0Bv4+cEiAhs9U31emVFGRWdZhHPDhrHYD9C3U+
	n8rElOKIX3ycdQfXcd2d3Jt0WRWCDnF0ymPvl235RKOdLssctVwSX78lGWFMvD+W
	laA2WxK0wHX8xHQAswzlvC5bazXwcTrd47s9L+ilMzcHL7jyopiehB9XeAh+nX9+
	PhszPEZolVBaK1lSZgk7oPVFKVxh81KFSotbHYIEW10PZxBp//VjdhPA/n/hdH/A
	ZAfQ9fq1Kx3koXdLZDQXcvczBolmEmzeByz2XnwPalTTKvBgNVonkBR94Zw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d7xx3c5ma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:14 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so6361953a91.3
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967114; x=1775571914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TZTsrksisFxLaWu20Z7AaA5AMHfImBufO5srupJpSUo=;
        b=cN5gIcHs1Gz0+3kFrwxorskYRPsVI3ccdUj5Dt+fUVcBYYdDiGijGteqZ4TvzNrdQz
         AddF6HJl/VtSbDEe1nBJxq9m/XvFsN9YKRu67+8wJAguD0j9yeC8EXYWRd/YqJ4iMDvi
         4uRZt526fxcdMbhen40EEgNlKDYy9wEkpwcu3ADc0sbsWdP3wxdNs+YnyTcOR9JwLXBI
         zG/CezcDyW9AkgK5Qmop+ByX8ftROnXGznhoNfALgI4TlAVp2flRcELcPHw9uPs4Q7LV
         a5E7mPKxVwxwXRfrLwtUgWGLoHxFF2bkpyx3tFcLIDLRBkX2ZPPYYXW29KPw9hqPVhuI
         tlLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967114; x=1775571914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TZTsrksisFxLaWu20Z7AaA5AMHfImBufO5srupJpSUo=;
        b=RHTEldIWqd55f3YWa9MiPAHXAxkJkBl0VCsXsZt5CE9Y6PGY7QmBMkN7+CUB4ooyJQ
         T5zzV4QiKwQbNuhcVhULGiFhcHlqkkqVG/QxZwPihEa6WfdHOacGcmoJpo51LE0i/jBB
         AW/XsIPIjEYQc4pMK7QjnoUObYmHUtF8Bk83Rz5DAMo0YIkLlGvJVrxn+EOn2+C6fW21
         Sk8Mfy+OD/Y9oNostHFiHDnSBIC0kN8X8vBVPPsBxwfiCE7OORXLpLXspax8yVqAcvQE
         PqW/6ctmdcMl/wkAwxvq9BzqloO4wKa64l+k39mMPZxLQlVVejpWYPcCwrI1PT7Jzvr3
         wVqA==
X-Gm-Message-State: AOJu0YxbZ3/gq89zsMdO1kZMJShp/zdJSUDTpHlhU5Odv+/+X8NGTV9F
	QHfOOZPx8+Yhd4+9hadcHJnPM/QGMrYwFZxw7S86Qk+rQCI9xENMGTMkfsQofHJDOjDpISe3dVo
	vCi+HMW4QdoiA028Ur/di5We+Mq1xCfS/5X/1kXhvZdaMjLPfPtTetgpsrFDmXzhviAsQytTt
X-Gm-Gg: ATEYQzzurp7RKRSZItyfoAPfppzfb2i0mX31wOU1aXMsl2SlCqnZ9UmgxxTsFOvICwu
	Eq7y8zTlaeUCSvFT19f5pcHPiS9PZS9btQoU13Ccl7jkTpK+5f7e9HSd/rxdrlN6ciLyl6qgjDx
	kOpfmnMLyzk25sRPr2f1IhMgnO88L+lq2sFju7qmDRLcG6iSkuxZndt0FY6ThnbHihqvovJ0eOQ
	+qCa5BN0XDAv93NVwg5keAPTSeTf4u7vI/+tiEbrqQgPOh2To9Izx9KDVGeW/aPgR/XmRqFZKlG
	OOtIvMfAC57erM20xAMXNrumAfmPiHb466/y4m2Dlw6SrG5sqcMNDUJ0DQ2z6Vp4UwWDRVYkY5M
	TWM/npSn+T8q0Sc5hhyjelPSTHMrgBtvI9A8vtuaQI2QmwcK56WbRyXdBin0MLiYS+AqddUhFBe
	kAoqvVSTcG4u3irTCSARGZq0Hlctg5D3V0GjwymdJBfjwUUUPNdMA=
X-Received: by 2002:a17:903:13d0:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b0cdd18cd6mr202046705ad.40.1774967113959;
        Tue, 31 Mar 2026 07:25:13 -0700 (PDT)
X-Received: by 2002:a17:903:13d0:b0:2b0:6df2:8cd8 with SMTP id d9443c01a7336-2b0cdd18cd6mr202046245ad.40.1774967113244;
        Tue, 31 Mar 2026 07:25:13 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:12 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 5/5] wifi: ath12k: add thermal cooling device support
Date: Tue, 31 Mar 2026 19:54:46 +0530
Message-Id: <20260331142446.2951809-6-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ErbfbCcA c=1 sm=1 tr=0 ts=69cbd94a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=mMz0IJLIata36CLxof0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ih8du4rdimsAV1DwCS9iNJ1VVDsULf9_
X-Proofpoint-GUID: ih8du4rdimsAV1DwCS9iNJ1VVDsULf9_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE0MCBTYWx0ZWRfX6NF4H8NU9cpn
 /J9AeXYzi13MNgFvJwJ30UhPp3yZIZ8LOZBem7S7IakYtbNK6f7LFeDIqM/NiVjJZukxHn7s3pa
 2OFIG+mejB0wQ3Q7eKqqWKAZfvLFD38nTbJfUmnx4VSb+Ae2oezwNsI7Y2YbTNnr7B1E3M6qQhI
 qGqYpQywN0WnWT6wrtavAt7fHE2w/ndJa3LPp+ZOYbiVK6r0sQ1mo3dVssyi1LkGl1pIRtTTgIO
 enfmn1oJk2eGiYOGNRDS2519eSHLwhOO4q6DDkC8Pv8Dq2N4v/EvKHnoxRdM7CMix8YOZ9CqQIq
 oAKvTrAwNS6zmAXeiYzAM+U1xZUD4NWYk8Caubt8nCVf/Xy/qGyBwwD+/VtXtL7NxG34lxeLQ+j
 ty9AGj6ggAPe1EwzHunXinW3WknVRhOZh8I9v5qEmecF0kAUIzjPFwlbVoXilujVLiAA7tTm7dx
 /LT7gvEhik7t20qOAvQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310140
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072516_811147_1619432B 
X-CRM114-Status: GOOD (  25.39  )
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

Add thermal cooling device support to control the temperature by throttling data
transmission. Throttling is performed by suspending data TX queues according to
a configured duty-cycle off percentage. The thermal cooling device allows users
to configure the duty-cycle off percentage and operate the device with the
selected value.

User configuration updates a single duty-cycle off percentage, which is applied
uniformly by the host and treated as only one temperature level. This value
remains in effect until updated again by the user. All other thermal throttling
parameters continue to use their default firmware provided values.

Reject invalid duty-cycle off percentage values that fall outside the supported
range. Register a cooling device to allow the thermal framework to query and set
the current throttle state, report the maximum supported state, and keep the
host state in sync with successful firmware updates. A throttle state of zero
restores the default firmware thermal configuration.

Command to set the duty-cycle off percent:
echo 40 > /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device0/cur_state

Command to read duty-cycle off percent:
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device0/cur_state

Command to read the maximum duty-cycle off percent:
cat /sys/devices/pci0000:00/0000:00:1d.1/0000:58:00.0/ieee80211/phyX/cooling_device0/max_state

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c     |   1 +
 drivers/net/wireless/ath/ath12k/thermal.c | 107 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/thermal.h |  14 +++
 3 files changed, 121 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 21430a70aa7c..40395c9a8bea 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -14821,6 +14821,7 @@ static void ath12k_mac_setup(struct ath12k *ar)
 	init_completion(&ar->completed_11d_scan);
 	init_completion(&ar->regd_update_completed);
 	init_completion(&ar->thermal.wmi_sync);
+	mutex_init(&ar->thermal.lock);
 
 	ar->thermal.temperature = 0;
 	ar->thermal.hwmon_dev = NULL;
diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index 6f70c11c1098..97fc49c40ac1 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -76,6 +76,73 @@ void ath12k_thermal_init_configs(struct ath12k *ar)
 	ar->thermal.tt_level_configs = &tt_level_configs[cfg_idx][0];
 }
 
+static int
+ath12k_thermal_get_max_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
+{
+	*state = ATH12K_THERMAL_THROTTLE_MAX;
+
+	return 0;
+}
+
+static int
+ath12k_thermal_get_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long *state)
+{
+	struct ath12k *ar = cdev->devdata;
+
+	mutex_lock(&ar->thermal.lock);
+	*state = ar->thermal.throttle_state;
+	mutex_unlock(&ar->thermal.lock);
+
+	return 0;
+}
+
+int ath12k_thermal_set_throttling(struct ath12k *ar, u32 throttle_state)
+{
+	struct ath12k_wmi_thermal_mitigation_arg param = {};
+	struct ath12k_wmi_tt_level_config_param cfg = {};
+	int ret;
+
+	param.num_levels = 1;
+	cfg.dcoffpercent = throttle_state;
+	param.levelconf = &cfg;
+
+	ret = ath12k_wmi_send_thermal_mitigation_cmd(ar, &param);
+	if (ret)
+		ath12k_warn(ar->ab, "failed to send thermal mitigation cmd: %d\n",
+			    ret);
+
+	return ret;
+}
+
+static int
+ath12k_thermal_set_cur_throttle_state(struct thermal_cooling_device *cdev,
+				      unsigned long throttle_state)
+{
+	struct ath12k *ar = cdev->devdata;
+
+	if (throttle_state > ATH12K_THERMAL_THROTTLE_MAX)
+		return -EINVAL;
+
+	scoped_guard(mutex, &ar->thermal.lock) {
+		if (ar->thermal.throttle_state == throttle_state)
+			return 0;
+		ar->thermal.throttle_state = throttle_state;
+	}
+
+	if (throttle_state == 0)
+		return ath12k_thermal_throttling_config_default(ar);
+
+	return ath12k_thermal_set_throttling(ar, throttle_state);
+}
+
+static const struct thermal_cooling_device_ops ath12k_thermal_ops = {
+	.get_max_state = ath12k_thermal_get_max_throttle_state,
+	.get_cur_state = ath12k_thermal_get_cur_throttle_state,
+	.set_cur_state = ath12k_thermal_set_cur_throttle_state,
+};
+
 static ssize_t ath12k_thermal_temp_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
@@ -132,6 +199,7 @@ ATTRIBUTE_GROUPS(ath12k_hwmon);
 
 static int ath12k_thermal_setup_radio(struct ath12k_base *ab, int i)
 {
+	char pdev_name[20];
 	struct ath12k *ar;
 	int ret;
 
@@ -139,6 +207,28 @@ static int ath12k_thermal_setup_radio(struct ath12k_base *ab, int i)
 	if (!ar)
 		return 0;
 
+	ar->thermal.cdev =
+		thermal_cooling_device_register("ath12k_thermal", ar,
+						&ath12k_thermal_ops);
+	if (IS_ERR(ar->thermal.cdev)) {
+		ret = PTR_ERR(ar->thermal.cdev);
+		ar->thermal.cdev = NULL;
+		ath12k_err(ar->ab, "failed to register cooling device: %d\n",
+			   ret);
+		return ret;
+	}
+
+	scnprintf(pdev_name, sizeof(pdev_name), "cooling_device%u",
+		  ar->hw_link_id);
+
+	ret = sysfs_create_link(&ar->ah->hw->wiphy->dev.kobj,
+				&ar->thermal.cdev->device.kobj, pdev_name);
+	if (ret) {
+		ath12k_err(ab, "failed to create cooling device symlink: %d\n",
+			   ret);
+		goto unregister_cdev;
+	}
+
 	ar->thermal.hwmon_dev =
 		hwmon_device_register_with_groups(&ar->ah->hw->wiphy->dev,
 						  "ath12k_hwmon", ar,
@@ -148,14 +238,22 @@ static int ath12k_thermal_setup_radio(struct ath12k_base *ab, int i)
 		ar->thermal.hwmon_dev = NULL;
 		ath12k_err(ar->ab, "failed to register hwmon device: %d\n",
 			   ret);
-		return ret;
+		goto remove_sysfs;
 	}
 
 	return 0;
+
+remove_sysfs:
+	sysfs_remove_link(&ar->ah->hw->wiphy->dev.kobj, pdev_name);
+unregister_cdev:
+	thermal_cooling_device_unregister(ar->thermal.cdev);
+	ar->thermal.cdev = NULL;
+	return ret;
 }
 
 static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 {
+	char pdev_name[20];
 	struct ath12k *ar;
 
 	ar = ab->pdevs[i].ar;
@@ -164,6 +262,13 @@ static void ath12k_thermal_cleanup_radio(struct ath12k_base *ab, int i)
 
 	hwmon_device_unregister(ar->thermal.hwmon_dev);
 	ar->thermal.hwmon_dev = NULL;
+
+	scnprintf(pdev_name, sizeof(pdev_name), "cooling_device%u",
+		  ar->hw_link_id);
+	sysfs_remove_link(&ar->ah->hw->wiphy->dev.kobj, pdev_name);
+
+	thermal_cooling_device_unregister(ar->thermal.cdev);
+	ar->thermal.cdev = NULL;
 }
 
 int ath12k_thermal_register(struct ath12k_base *ab)
diff --git a/drivers/net/wireless/ath/ath12k/thermal.h b/drivers/net/wireless/ath/ath12k/thermal.h
index 33231bb3683c..30e7b0880e05 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.h
+++ b/drivers/net/wireless/ath/ath12k/thermal.h
@@ -7,9 +7,12 @@
 #ifndef _ATH12K_THERMAL_
 #define _ATH12K_THERMAL_
 
+#include <linux/mutex.h>
+
 #define ATH12K_THERMAL_SYNC_TIMEOUT_HZ (5 * HZ)
 
 #define ATH12K_THERMAL_DEFAULT_DUTY_CYCLE 100
+#define ATH12K_THERMAL_THROTTLE_MAX 100
 
 enum ath12k_thermal_cfg_idx {
 	/* Internal Power Amplifier Device */
@@ -26,6 +29,10 @@ struct ath12k_thermal {
 	int temperature;
 	struct device *hwmon_dev;
 	const struct ath12k_wmi_tt_level_config_param *tt_level_configs;
+	struct thermal_cooling_device *cdev;
+	/* Serialize thermal operations and hwmon reads */
+	struct mutex lock;
+	u32 throttle_state;
 };
 
 #if IS_REACHABLE(CONFIG_THERMAL)
@@ -34,6 +41,7 @@ void ath12k_thermal_unregister(struct ath12k_base *ab);
 void ath12k_thermal_event_temperature(struct ath12k *ar, int temperature);
 int ath12k_thermal_throttling_config_default(struct ath12k *ar);
 void ath12k_thermal_init_configs(struct ath12k *ar);
+int ath12k_thermal_set_throttling(struct ath12k *ar, u32 throttle_state);
 #else
 static inline int ath12k_thermal_register(struct ath12k_base *ab)
 {
@@ -57,5 +65,11 @@ static inline int ath12k_thermal_throttling_config_default(struct ath12k *ar)
 static inline void ath12k_thermal_init_configs(struct ath12k *ar)
 {
 }
+
+static inline int ath12k_thermal_set_throttling(struct ath12k *ar,
+						u32 throttle_state)
+{
+	return 0;
+}
 #endif
 #endif /* _ATH12K_THERMAL_ */
-- 
2.34.1


