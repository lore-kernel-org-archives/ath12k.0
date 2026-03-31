Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21084109B474
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 14:25:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s7xvJ1gB+sdl0YMJqrTMEyxnDviWTMhymbpIffHmF7c=; b=zyZdVUUhGr8VerztVp1okMnIap
	viW+OaZpVQjg4U1q5N0L8la/U4pVl7Lr22/5vMbDkDWxCF6HbKiRkOYRA/5OsdLRzSXe6MzMXt8tn
	v+663gbxwNnl6txIvq6sz58ZQuekuBqiTUx7ZjI4a4jozoHAdfSk2Hws8wylNgTjGGiGr7GaWPNZt
	frhxNI49Pr61AvKQ84t1QvaeKWUBsanxH4hll8080YrdPsYAfyPSPwfvPXROQEoB6bH66sGjjJX5G
	JP+OKSLoVdvAVvlLhx0Cqe4V3XAHKazN3hnala0IOPnVrjP/RwISeGyv2/S2jxAUYFkiGi9GL1FuZ
	Wobn/ffA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1v-0000000D5TU-3Pza;
	Tue, 31 Mar 2026 14:25:19 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7a1m-0000000D5MZ-1jfe
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 14:25:11 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62V8jtha2049398
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=s7xvJ1gB+sd
	l0YMJqrTMEyxnDviWTMhymbpIffHmF7c=; b=P0bsVUfGpfbwTpOFRus8JnbDQZD
	T/+kpGNGZc+P9HWEtfxFvxw3puqqk80WigaLf+OntrFLLofhWM7Cr+i3873mudOA
	f8TL91yiW9gKEdBkfnx22mNT8eT5RW9Fgl2/02DpzWWDFtrluMhBCu23bc47YhuO
	SGsNdwVtcmGTUI1d20TX/CQozUmPIkUjAB10y6e+7p+0lURidBimAULNuoHkSGag
	1W7NCzeZluk00iojrS/I+k5MD5ZEmnBgnK/jQcPDQO8u34cSvoUlhfglyICQ/p4L
	jpC8lxdnL4KKc3BBuSD5YXQNKQw5Fq4WCE5vHWs+31gcoM2A1/CDypoYu0g==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d8b1yscjg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 14:25:09 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2b24af7ca99so34483595ad.1
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 07:25:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774967108; x=1775571908; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7xvJ1gB+sdl0YMJqrTMEyxnDviWTMhymbpIffHmF7c=;
        b=a+MxGcgpN8ua0KbseUlp1rPskYfDWM2VOS6IxLhDeJhJw+/onUkmg4oCuVb+Fa6FxB
         XGgvvaoHsfeU+k4PbM9JGRhnXgXidilSUq1wfHjHncNvWKquyaNB5siOLNwP63iBqfb1
         9h1m8OxAyQbsMWYQoMGPXbuSJ1VEIcWoa0PmJcYwvW+Op+/mUWAHY6ZTthiiFa7AWDjg
         FSixLrzGG2BF/a62k9ST7vWtfeeL7NNkC5GAhKGb2+ZTZqMlVQ46LDwpqpk81M/K/ScW
         ME0eaHY9gEZmdACVQbhCEe06jXFJhH9GnrkkK6Qqcax/9KNUbkAaV/1utUUxmkWS/l/m
         9KDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774967108; x=1775571908;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=s7xvJ1gB+sdl0YMJqrTMEyxnDviWTMhymbpIffHmF7c=;
        b=Zx1KlSeNeS17yzhsSCupwCwu5iVLu5UIrs+Bw4tKnxNNY1z2j7QfBMsMT+DfcsfyTT
         UyEMnaFVAyhnvPC5KgjrgGN4V/PqGjIVmDudaEiPE5JWvHxolxwfJBwZIy6MbP25fRee
         Rr6rLgSYxF6gVjFCyeKK1auWkM/IqGCbxZX/HU+XdbXfdyA7vvlJxWavT3af2RNDm7gd
         L5jF7JsfC5sbkZDja/FVDRaDo120dVrw43suOaYtw9jzyCslDAEKf00Yo+WSftuUgRB2
         ssTGYKUI4LRcDOExDTLw6psC3JX04XBS4xNmeZELTMe8xYTb2Bab/ogE/nZyvtjkVsI7
         bCpQ==
X-Gm-Message-State: AOJu0YwXu5fAFbTLsckbnbTWoLvc4TtrqptbCZljTRAIOPdYA0cmrjOh
	95WLZNPP+CnBRxGKIJ4FO0KdMmSqj+A64PQe03YUayJJPUZ9gYTXSjuBdNrcSp3va1oG1eetmEP
	+NwRayTXMmI/3aEYc4zeAaVvZxa5msjlY8cCl7DswVvIqSz+8NedAc+sDEWcTDOXgCGTHvU7z
X-Gm-Gg: ATEYQzyksjrHmew4+JgUMnifG2CBxt0zlI9f2o8+wZM3itXyzJX+4NzWiHdpnAD64AK
	4YJNMLS6j8YsFegZARrtqEqhUy8Rw7iJL0cF5WvvXVYTQKGhV66x3yLvRL7t9cisqnQCssppRc8
	ZwZ3eGH3lkwxT34r/HUeWMHSymV6Wr0FrqrjSfyfOX584kXnEGNyEIQWokBNroB8+5VYJiUuaxj
	bShBubRvQbPaYMMD79iTLC49jHpMwK5cFRfE6v0nbUL6+RvWXI00FE/BP1rEpjKsUzyg+QXlRrF
	Nq3lXlhGdnmCt6TlGPO24EvXWgUUyaobSzOveHcQ+A4jPy1/+aEjYAm73NWY7wlnY95Kb7pzB1d
	y78B499Phe/q4II9AAvoTEVamEEHFQ3k7vsFYtXuRpuc0jB945epGJBY+d680981ebAhQVE/Ftf
	JrujGu4foMSp/vnSFCRNJlzOVZEWkc3yNXw11bZd8wDWBqc6I4EyU=
X-Received: by 2002:a17:902:fc85:b0:2b0:5990:cf1e with SMTP id d9443c01a7336-2b0cdcc8706mr154107655ad.33.1774967108091;
        Tue, 31 Mar 2026 07:25:08 -0700 (PDT)
X-Received: by 2002:a17:902:fc85:b0:2b0:5990:cf1e with SMTP id d9443c01a7336-2b0cdcc8706mr154107275ad.33.1774967107451;
        Tue, 31 Mar 2026 07:25:07 -0700 (PDT)
Received: from hu-mkenna-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b24276689asm112030225ad.38.2026.03.31.07.25.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 07:25:07 -0700 (PDT)
From: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
Subject: [PATCH ath-next 2/5] wifi: ath12k: configure firmware thermal throttling via WMI
Date: Tue, 31 Mar 2026 19:54:43 +0530
Message-Id: <20260331142446.2951809-3-maharaja.kennadyrajan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: V5vap35LPG0UMckYTVBnGr0fNoJutA51
X-Proofpoint-ORIG-GUID: V5vap35LPG0UMckYTVBnGr0fNoJutA51
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDEzOSBTYWx0ZWRfX7SDbpLKEb4MM
 1X+BWt52jLCLI/QNYPBQezldAMvJE7bYYhnXxM8UDvTz8U2r7++TBUVYcapEE2/6D2MJT3LKQ2w
 /QQtk0CLW+IroNng3MvizWoJCoekzg9boaxAOyS0f7YHHibGU1FZgeaDEpDHP6mlNrV8Lyjmp2C
 a7V4LQZKuGvq8rmlGPQfAad9P88B068EiFhkFde4RVmnxwmXsC26vbGi++3z2NwyZewvrPMozsT
 YvzIDs2QR9nHME3WfoKm/WVuEy279NdgcCKtcSFMLNzXZCW9fSWSzw3F7ErJOpa6iYeJBsuP0ma
 jffYAJQFCOhaC6EgTRR37/0iwUK5Hp52qUnX/01yT/gkzk/r4lQOsoNldDs+AI2wMdQPRCNbRyO
 l5L3O1u1k+KDg0OyKSpAbwLtv6axbBrdjRBSlK5gZ1CoZni0vrQl7tzynlfZTJaBC1Hr+MAflOG
 nKeq5EI5QctyP+saS9Q==
X-Authority-Analysis: v=2.4 cv=aJT9aL9m c=1 sm=1 tr=0 ts=69cbd945 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=g4SQpinvGPL0G-aSnrwA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603310139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_072510_611501_B9130263 
X-CRM114-Status: GOOD (  21.14  )
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

Ath12k firmware supports thermal-throttling but requires the host to explicitly
program throttle levels and mitigation actions via WMI. Without this configuration,
firmware-driven thermal mitigation remains inactive or relies on platform-specific
defaults.

Add host-side support to build and send thermal-throttle configuration using
WMI_THERM_THROT_SET_CONF_CMDID during MAC radio start, ensuring thermal parameters
are programmed before data traffic begins.

Maintain per-radio storage for thermal throttle levels and provide conservative
default level tables for Internal Power Amplifier Device (IPA) and External Power
Amplifier Device or External Front End Module (XFEM) targets. The appropriate
default table is selected based on firmware-advertised service bits, allowing the
host to align with target thermal mitigation capabilities. If the WMI TLV service
WMI_TLV_SERVICE_IS_TARGET_IPA bit is set, then host selects the thermal throttle
values from IPA index from the table and selects values from XFEM index from the
table if this WMI TLV service bit is not set.

Build and send the thermal throttle configuration request with either 4 or
5 levels depending on firmware capability, and populate optional fields
(pout reduction and tx chain mask) only when the corresponding service bits
are advertised.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3

Signed-off-by: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c     |  8 +++
 drivers/net/wireless/ath/ath12k/thermal.c | 64 +++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/thermal.h | 21 +++++++
 drivers/net/wireless/ath/ath12k/wmi.c     | 69 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     | 42 ++++++++++++++
 5 files changed, 204 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 553ec28b6aaa..21430a70aa7c 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9673,6 +9673,12 @@ static int ath12k_mac_start(struct ath12k *ar)
 		}
 	}
 
+	ret = ath12k_thermal_throttling_config_default(ar);
+	if (ret) {
+		ath12k_err(ab, "failed to set thermal throttle: %d\n", ret);
+		goto err;
+	}
+
 	rcu_assign_pointer(ab->pdevs_active[ar->pdev_idx],
 			   &ab->pdevs[ar->pdev_idx]);
 
@@ -14461,6 +14467,8 @@ static int ath12k_mac_setup_register(struct ath12k *ar,
 	ar->rssi_info.temp_offset = 0;
 	ar->rssi_info.noise_floor = ar->rssi_info.min_nf_dbm + ar->rssi_info.temp_offset;
 
+	ath12k_thermal_init_configs(ar);
+
 	return 0;
 }
 
diff --git a/drivers/net/wireless/ath/ath12k/thermal.c b/drivers/net/wireless/ath/ath12k/thermal.c
index a764d2112a3c..4f76622e8117 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.c
+++ b/drivers/net/wireless/ath/ath12k/thermal.c
@@ -12,6 +12,70 @@
 #include "core.h"
 #include "debug.h"
 
+static const struct ath12k_wmi_tt_level_config_param
+tt_level_configs[ATH12K_TT_CFG_IDX_MAX][ENHANCED_THERMAL_LEVELS] = {
+	[ATH12K_TT_CFG_IDX_IPA] = {
+		[0] = {	.tmplwm = -100, .tmphwm = 115, .dcoffpercent = 0,
+			.pout_reduction_db = 0 },
+		[1] = { .tmplwm = 110, .tmphwm = 120, .dcoffpercent = 0,
+			.pout_reduction_db = 12	},
+		[2] = { .tmplwm = 115, .tmphwm = 125, .dcoffpercent = 50,
+			.pout_reduction_db = 12	},
+		[3] = { .tmplwm = 120, .tmphwm = 130, .dcoffpercent = 90,
+			.pout_reduction_db = 12	},
+		[4] = { .tmplwm = 125, .tmphwm = 130, .dcoffpercent = 100,
+			.pout_reduction_db = 12	},
+	},
+	[ATH12K_TT_CFG_IDX_XFEM] = {
+		[0] = {	.tmplwm = -100,	.tmphwm = 105, .dcoffpercent = 0,
+			.pout_reduction_db = 0 },
+		[1] = { .tmplwm = 100, .tmphwm = 110, .dcoffpercent = 0,
+			.pout_reduction_db = 0 },
+		[2] = { .tmplwm = 105, .tmphwm = 115, .dcoffpercent = 50,
+			.pout_reduction_db = 0 },
+		[3] = {	.tmplwm = 110, .tmphwm = 120, .dcoffpercent = 90,
+			.pout_reduction_db = 0 },
+		[4] = { .tmplwm = 115, .tmphwm = 120, .dcoffpercent = 100,
+			.pout_reduction_db = 0 },
+	},
+};
+
+static enum ath12k_thermal_cfg_idx ath12k_thermal_cfg_index(struct ath12k *ar)
+{
+	if (test_bit(WMI_TLV_SERVICE_IS_TARGET_IPA, ar->ab->wmi_ab.svc_map))
+		return ATH12K_TT_CFG_IDX_IPA;
+
+	return ATH12K_TT_CFG_IDX_XFEM;
+}
+
+int ath12k_thermal_throttling_config_default(struct ath12k *ar)
+{
+	struct ath12k_wmi_thermal_mitigation_arg param = {};
+	int ret;
+
+	if (test_bit(WMI_TLV_SERVICE_THERM_THROT_5_LEVELS, ar->ab->wmi_ab.svc_map))
+		param.num_levels = ENHANCED_THERMAL_LEVELS;
+	else
+		param.num_levels = THERMAL_LEVELS;
+
+	param.levelconf = ar->thermal.tt_level_configs;
+
+	ret = ath12k_wmi_send_thermal_mitigation_cmd(ar, &param);
+	if (ret)
+		ath12k_warn(ar->ab,
+			    "failed to send thermal mitigation cmd for default config: %d\n",
+			    ret);
+	return ret;
+}
+
+void ath12k_thermal_init_configs(struct ath12k *ar)
+{
+	enum ath12k_thermal_cfg_idx cfg_idx;
+
+	cfg_idx = ath12k_thermal_cfg_index(ar);
+	ar->thermal.tt_level_configs = &tt_level_configs[cfg_idx][0];
+}
+
 static ssize_t ath12k_thermal_temp_show(struct device *dev,
 					struct device_attribute *attr,
 					char *buf)
diff --git a/drivers/net/wireless/ath/ath12k/thermal.h b/drivers/net/wireless/ath/ath12k/thermal.h
index 9d84056188e1..33231bb3683c 100644
--- a/drivers/net/wireless/ath/ath12k/thermal.h
+++ b/drivers/net/wireless/ath/ath12k/thermal.h
@@ -9,18 +9,31 @@
 
 #define ATH12K_THERMAL_SYNC_TIMEOUT_HZ (5 * HZ)
 
+#define ATH12K_THERMAL_DEFAULT_DUTY_CYCLE 100
+
+enum ath12k_thermal_cfg_idx {
+	/* Internal Power Amplifier Device */
+	ATH12K_TT_CFG_IDX_IPA,
+	/* External Power Amplifier Device or External Front End Module */
+	ATH12K_TT_CFG_IDX_XFEM,
+	ATH12K_TT_CFG_IDX_MAX,
+};
+
 struct ath12k_thermal {
 	struct completion wmi_sync;
 
 	/* temperature value in Celsius degree protected by data_lock. */
 	int temperature;
 	struct device *hwmon_dev;
+	const struct ath12k_wmi_tt_level_config_param *tt_level_configs;
 };
 
 #if IS_REACHABLE(CONFIG_THERMAL)
 int ath12k_thermal_register(struct ath12k_base *ab);
 void ath12k_thermal_unregister(struct ath12k_base *ab);
 void ath12k_thermal_event_temperature(struct ath12k *ar, int temperature);
+int ath12k_thermal_throttling_config_default(struct ath12k *ar);
+void ath12k_thermal_init_configs(struct ath12k *ar);
 #else
 static inline int ath12k_thermal_register(struct ath12k_base *ab)
 {
@@ -36,5 +49,13 @@ static inline void ath12k_thermal_event_temperature(struct ath12k *ar,
 {
 }
 
+static inline int ath12k_thermal_throttling_config_default(struct ath12k *ar)
+{
+	return 0;
+}
+
+static inline void ath12k_thermal_init_configs(struct ath12k *ar)
+{
+}
 #endif
 #endif /* _ATH12K_THERMAL_ */
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 34184d0d03ff..b239b436b745 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3384,6 +3384,75 @@ int ath12k_wmi_send_set_current_country_cmd(struct ath12k *ar,
 	return ret;
 }
 
+int
+ath12k_wmi_send_thermal_mitigation_cmd(struct ath12k *ar,
+				       struct ath12k_wmi_thermal_mitigation_arg *arg)
+{
+	struct ath12k_wmi_therm_throt_level_config_param *lvl_conf;
+	struct ath12k_wmi_therm_throt_config_request_cmd *cmd;
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct wmi_tlv *tlv;
+	struct sk_buff *skb;
+	int i, ret, len;
+
+	len = sizeof(*cmd) + TLV_HDR_SIZE + (arg->num_levels * sizeof(*lvl_conf));
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	cmd = (struct ath12k_wmi_therm_throt_config_request_cmd *)skb->data;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_THERM_THROT_CONFIG_REQUEST,
+						 sizeof(*cmd));
+	cmd->pdev_id = cpu_to_le32(ar->pdev->pdev_id);
+	cmd->enable = cpu_to_le32(1);
+	cmd->dc = cpu_to_le32(100);
+	cmd->dc_per_event = cpu_to_le32(0xffffffff);
+	cmd->therm_throt_levels = cpu_to_le32(arg->num_levels);
+
+	tlv = (struct wmi_tlv *)(skb->data + sizeof(*cmd));
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_STRUCT,
+					 arg->num_levels * sizeof(*lvl_conf));
+
+	lvl_conf = (struct ath12k_wmi_therm_throt_level_config_param *)tlv->value;
+
+	for (i = 0; i < arg->num_levels; i++) {
+		lvl_conf->tlv_header =
+			ath12k_wmi_tlv_cmd_hdr(WMI_TAG_THERM_THROT_LEVEL_CONFIG_INFO,
+					       sizeof(*lvl_conf));
+
+		lvl_conf->temp_lwm = a_cpu_to_sle32(arg->levelconf[i].tmplwm);
+		lvl_conf->temp_hwm = a_cpu_to_sle32(arg->levelconf[i].tmphwm);
+		lvl_conf->dc_off_percent = cpu_to_le32(arg->levelconf[i].dcoffpercent);
+
+		if (test_bit(WMI_TLV_SERVICE_THERM_THROT_POUT_REDUCTION,
+			     ar->ab->wmi_ab.svc_map))
+			lvl_conf->pout_reduction_25db =
+				cpu_to_le32(arg->levelconf[i].pout_reduction_db);
+
+		if (test_bit(WMI_TLV_SERVICE_THERM_THROT_TX_CHAIN_MASK,
+			     ar->ab->wmi_ab.svc_map))
+			lvl_conf->tx_chain_mask = cpu_to_le32(ar->cfg_tx_chainmask);
+
+		lvl_conf->duty_cycle = cpu_to_le32(ATH12K_THERMAL_DEFAULT_DUTY_CYCLE);
+		lvl_conf++;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "WMI vdev set thermal throt pdev_id %u enable dc 100 dc_per_event 0xffffffff levels %d\n",
+		   ar->pdev->pdev_id, arg->num_levels);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_THERM_THROT_SET_CONF_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to send WMI_THERM_THROT_SET_CONF cmd: %d\n",
+			    ret);
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
 int ath12k_wmi_send_11d_scan_start_cmd(struct ath12k *ar,
 				       struct wmi_11d_scan_start_arg *arg)
 {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 8539435c292d..59b2b42161e1 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2274,6 +2274,10 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_WMSK_COMPACTION_RX_TLVS = 361,
 
 	WMI_TLV_SERVICE_PEER_METADATA_V1A_V1B_SUPPORT = 365,
+	WMI_TLV_SERVICE_THERM_THROT_POUT_REDUCTION = 410,
+	WMI_TLV_SERVICE_IS_TARGET_IPA = 425,
+	WMI_TLV_SERVICE_THERM_THROT_TX_CHAIN_MASK = 426,
+	WMI_TLV_SERVICE_THERM_THROT_5_LEVELS = 429,
 	WMI_TLV_SERVICE_ETH_OFFLOAD = 461,
 
 	WMI_MAX_EXT2_SERVICE,
@@ -4128,6 +4132,42 @@ struct wmi_therm_throt_stats_event {
 	__le32 therm_throt_levels;
 } __packed;
 
+#define THERMAL_LEVELS  4
+#define ENHANCED_THERMAL_LEVELS 5
+
+struct ath12k_wmi_tt_level_config_param {
+	s32 tmplwm;
+	s32 tmphwm;
+	u32 dcoffpercent;
+	u32 pout_reduction_db;
+};
+
+struct ath12k_wmi_therm_throt_config_request_cmd {
+	__le32 tlv_header;
+	__le32 pdev_id;
+	__le32 enable;
+	__le32 dc;
+	/* After how many duty cycles the firmware sends stats to host */
+	__le32 dc_per_event;
+	__le32 therm_throt_levels;
+} __packed;
+
+struct ath12k_wmi_therm_throt_level_config_param {
+	__le32 tlv_header;
+	a_sle32 temp_lwm;
+	a_sle32 temp_hwm;
+	__le32 dc_off_percent;
+	__le32 prio;
+	__le32 pout_reduction_25db;
+	__le32 tx_chain_mask;
+	__le32 duty_cycle;
+} __packed;
+
+struct ath12k_wmi_thermal_mitigation_arg {
+	int num_levels;
+	const struct ath12k_wmi_tt_level_config_param *levelconf;
+};
+
 struct ath12k_wmi_init_country_arg {
 	union {
 		u16 country_code;
@@ -6522,6 +6562,8 @@ __le32 ath12k_wmi_tlv_hdr(u32 cmd, u32 len);
 int ath12k_wmi_send_tpc_stats_request(struct ath12k *ar,
 				      enum wmi_halphy_ctrl_path_stats_id tpc_stats_type);
 void ath12k_wmi_free_tpc_stats_mem(struct ath12k *ar);
+int ath12k_wmi_send_thermal_mitigation_cmd(struct ath12k *ar,
+					   struct ath12k_wmi_thermal_mitigation_arg *arg);
 
 static inline u32
 ath12k_wmi_caps_ext_get_pdev_id(const struct ath12k_wmi_caps_ext_params *param)
-- 
2.34.1


