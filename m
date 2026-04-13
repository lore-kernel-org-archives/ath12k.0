Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6804FF34C63
	for <ath12k@archiver.kernel.org>; Mon, 13 Apr 2026 15:39:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YpWNMz4aKcumya9wURthP0nIkYmzkNu93gjr8BXTgq0=; b=J4aBhJtmaKdQC7T9oQ5YtlBlmz
	r9hWEPIP1vyt33SRZOJA70+4RgHdA3iZbH9X+4srs6mvRunQdSK2dFPA90iEX5zi9cF84fJlw0Bfw
	Q8DICCKButOhzyTPeNePThj4J/DAEKhl8btaReBpKnynRvzhxcuFn21iGBop7m3w6Q/i48CYQP3Bj
	ORbSo04Du9Xcv8HMfFOgMEEcx9un83vx0DgPguE+9V0+z3zHA0rYY2MA1QTbyFgA2Ok1UbIxBN3+U
	W4q7tBULJEWWLoR3Sul7MULgkUthtW/dJO4lGePjKG2PkGdmxrEJmxQiq4rG3Z01eTD6U+sG6yLqu
	vKHUUAAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJOE-0000000Fz86-0fRM;
	Mon, 13 Apr 2026 15:39:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCJOC-0000000Fz6I-0bGK
	for ath12k@lists.infradead.org;
	Mon, 13 Apr 2026 15:39:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63DCZIXs3989834
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=YpWNMz4aKcu
	mya9wURthP0nIkYmzkNu93gjr8BXTgq0=; b=WqJ/uBHp6Z/WbqCk9+wk5z1EwSL
	NruUeH2r8FwdxpeNU+vC/XbE7uCzK7LpYI9Zg8tJ7ZtCiaH13Yk2ogWDRnv86ZMR
	nke7VcUoV533quY8kDsYF42RC/LKJwAsSyyUehS28f2+mTTrjGvYWJmHogY94NV+
	hs34crQOGxAueTsqZ2oOg92C+ggIztpEGdNRYJ7tVi3XA72uRhx+IZTD877UMLBL
	LW3O/lbvc5HZfRgtNpiLZyQSlWJ5IOQnk40zE/K87iDzGs/EGYhkSa1ivyL8B8my
	MGisJEfxrumtoNy1/9mBNMTkv/jINB9CHLojcDXla3DL2uxvkpR+VzN5XOQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dh0mfrqe4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 15:39:51 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-35fbaada2f3so1920883a91.0
        for <ath12k@lists.infradead.org>; Mon, 13 Apr 2026 08:39:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1776094789; x=1776699589; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YpWNMz4aKcumya9wURthP0nIkYmzkNu93gjr8BXTgq0=;
        b=RGGwWjuBVc7vFq54rsRPTBo2HNe2yZ2Vur3ZF34N1lWttm7m47HCuLtQZrnE7Ckfne
         OITMNMv2uDCw8/DJcIOA3YCMCZQmGAOhThg5hJ1KrqasR5HbpFEBYdQxDLoyKG9XsSVw
         6gP4xXAcQ+KgW7u3n0mXBbZTS85q8FBj+trBvvg3lnuGc352mkK/BH2gNwNkk3ovEXka
         16n6nDEMUFvKBxcvz7y5cU3UZkqSKfc7xsGYP9EgCuT2v1oxgjYNCanLuIENe+2Qsc47
         UylumOht9qSZGgzE5PP2NdJ6eSMxgV6XatzO4BmNo+yyCWGipZu7gG7Eml4XZTwfF0OX
         kFZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776094789; x=1776699589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=YpWNMz4aKcumya9wURthP0nIkYmzkNu93gjr8BXTgq0=;
        b=XHyom8bX9n1ydSb3hBtz99D+7PaGmmytZMght4NP+OC5EEd/pKjPa1lGFhQnlPlmX/
         E2P6qFUw9HY16HgbT1FxX0vIXDTpVCtL3ykfq9U4ON8v+auptY7qzgjJ4Ha8U/9WqZvl
         jeNvg2N6K3BjePOqEsy/Y17iiZtRG8BPYf6re8iceY9gBuApBMj/LHewVVYiRFklqepu
         tGlTRyVyqlE63auaAqSulu8tzA2MqDfbGeRX7uvan8VwerEwW+X7IT8A/A3ggjQfiZTQ
         VmVbA4RJ+uCOmUzUh3qOWDyIN/tm7MkyKMqzgAbSfb6LTHiQPhI9f5YGOr8hJcIsnAsT
         jwYg==
X-Gm-Message-State: AOJu0YyHqYNY4DF8faNUE3mJmicnsqyE1Qu5paEkmrdc1puTF/1KD71y
	txlwvdm9FnvZ8xAuk1nkZMEcX506pmlPxw02QQcGljwTTZ7hNXYgkvVGIEYFVy5tpRa/lvkIQZT
	5H4EkadWzWva2uZoB8mcWxnArjjMpMXTWOGLg5DQGWYUoaiYQsHfgS8GiyAk1P/2hvWE2P2D1
X-Gm-Gg: AeBDievLRIFbZV5FI1Yh1PuHIYOdRQrHwIOF0QEvrp7EcXTw4tcJ+aS0mGXwfy0gpPr
	ZYHgWbptf61DeLXPolfZu2jja7qoFmZ+RfWz1HDfb8XU+fxNJ77oYYCg/SoCPbQp7SvxLg2vcaT
	yPHl5oOnvVt/vOn7Hxbto8P7tp9RSPkXj4aydTdwSXpDCZZ1ufRHvhNNI6Jdrl9vTadGlgsBQB4
	YLiq/3hSh5cYO4cnDgpMQiIUDRVq8Zi1fjiq5JC2SusIWULZ9R5cR3leGLB3kcDJVp68pnToIcK
	TsDC3N+ywYPPGWBCqovjOIP0G8vWA8mEDgh5OddeFbYfy1kPmafubG+EgXPOtqLmz41okd7FWI0
	RePmDe1XffD78J6UXAcVPk9MBLyX2eG0qmbmnCY3dEShhHTqHoL20O5bxtvP8vcgsSjwxW1JeUx
	0SxHP3J2HRCNWh0ndTy7RB6ZK3Q5X/C+5dWnc6c5xMEcgRYXoXdr8=
X-Received: by 2002:a17:90b:3a4d:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35e428412a8mr12739330a91.19.1776094788655;
        Mon, 13 Apr 2026 08:39:48 -0700 (PDT)
X-Received: by 2002:a17:90b:3a4d:b0:34c:2db6:578f with SMTP id 98e67ed59e1d1-35e428412a8mr12739305a91.19.1776094788081;
        Mon, 13 Apr 2026 08:39:48 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35e411ff4e1sm13000123a91.3.2026.04.13.08.39.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 08:39:47 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next v2 5/5] wifi: ath12k: add thermal cooling device support
Date: Mon, 13 Apr 2026 21:08:40 +0530
Message-Id: <20260413153840.1969931-6-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260413153840.1969931-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ovv_P4kPXGRv7ekXkDxn22T4p4YeuG9Q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEzMDE1MyBTYWx0ZWRfX5fujA9RFM+Cw
 1U3mG/4k4zrZzcwV9RPt/AMeeqSxrdGvpLeRFb9NuUPRsr0U61LI12noHSPpiN0C3UOmkt+VEOe
 tCajY5IohnPy5XP+jtFjRfd3PkqWeXz5aA8yRuiDzi/G2LT2cfwAr1TsLBvnGoHxBBUo50aV+n4
 1sozBK7DonDSzVy1L7PABB1qajuL/bF0W1Cgw7x9M5hSWzAxtN0CXoIrdGT7WJb7v95eGjkeTLP
 mVVgVscdb5xcBhAQYLYdU4gAZys1Xaug3GRw45ZW49voL2hJjdLzZrjS3bA56trCI+d/UAYW+LP
 EGx7G9Ri8M1h/yFFt5dfE5ufcUkUMF6oYrMl/12RvowK0GNG93rMyr3eiP4MZjmzp8l7csc/jUg
 IiFHbEm1eBL+JKWkDKjAA97mLVWuEpYYomN9oHIO+I2jQCTAZ5EQR6pi0yYB9U4Y4JlBhdo11IC
 yDOMHONhwwPgBR+7qnw==
X-Authority-Analysis: v=2.4 cv=cMvQdFeN c=1 sm=1 tr=0 ts=69dd0e47 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=mMz0IJLIata36CLxof0A:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: ovv_P4kPXGRv7ekXkDxn22T4p4YeuG9Q
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-13_03,2026-04-13_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 impostorscore=0
 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604130153
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_083952_300268_984C82C5 
X-CRM114-Status: GOOD (  25.28  )
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
index 2a221ee83cad..4718802cec50 100644
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


