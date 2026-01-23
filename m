Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13EDED46952
	for <ath12k@archiver.kernel.org>; Fri, 23 Jan 2026 06:48:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P9bWwKhaQgdcXnYyI1XdVxlZib/2TpvD9aGUnR2lTXE=; b=iqBLO2XFjO48A5LYIxbFgYjMbH
	0owqBRBRnyrWqeSyGh2K5DTm2yhVi5fGbWS+XOgo+IFeWQZfgZH+n/vRaI22ae0qHYaReIgSpsoIO
	FJV0yGJJRzv689UZ+SWf6Ac3kFPphuGURaKfWDcc1VXUJBzrB/hYa8wTX9xztma3Xmo867Ot0AHvi
	tNZAuhIou/936xmUb3WiX+saoHp2Nv/dASuYpDEk65Lxieuo4NcU6NruTOrHYfZytFogz+dh8QYkD
	nRuhflo7n+6IAWFTCg+8K+ZB+2clEf7aXxZkERRmrGWasa/pXk2ncCsO0VTp5SRzFJqAvkL9U3NaK
	vTF94FVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAyB-00000008JwL-3SH3;
	Fri, 23 Jan 2026 06:48:35 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjAy9-00000008JvD-2DtL
	for ath12k@lists.infradead.org;
	Fri, 23 Jan 2026 06:48:34 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60N59pLT3810692
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=P9bWwKhaQgd
	cXnYyI1XdVxlZib/2TpvD9aGUnR2lTXE=; b=GtMo1rO2z3He2BFsULvQbsg72Ym
	bLE5W99efwX7xwbo5Umm2xMmkBooBMZyX+3HPCFb07ZW3YCdFZ2o274CyvD7kmm+
	cTI3dTS6jirnNguyDaSGrYIdDvNulmLc0HMhKV+/p3h8x5PzurJ8FGKZpw0/n5NR
	TbwkXn6sUuy5YzQy5+fCewbEipcfECQVdKPk2s4OThHAnrqt9cBBDJO3JG5c7rYO
	y3Emm55+q9JE8ZzfZ88w2n749bffQyompzNxEUTB4nXgU2M/KaQxwLWX6ciuj/dM
	jxqnCq6/9cgHKHjPBsFhRLnp5QyWu7PYtshCkE9DAmconx3ayqlA/cCGfbA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bujq1brma-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Jan 2026 06:48:32 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-124627fc58dso3411422c88.1
        for <ath12k@lists.infradead.org>; Thu, 22 Jan 2026 22:48:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769150912; x=1769755712; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P9bWwKhaQgdcXnYyI1XdVxlZib/2TpvD9aGUnR2lTXE=;
        b=PtxwCrgHwV6UsTQe8qc4qD7cl49q2QXZ4TA+3wqf60qpSCjTq4JvM444Mxaw8ScUKU
         6SNggn4rPD8bUKLwp58MtV+gwlHL5VedB2jO5dk5vvIXrTs1bJgubLjydA+oz1JHGSdi
         7K3KXHlYHRtIllTMT9+MJ8V/Grf4RRzlc7HZVW8iqUXYcGiI6HdO11Nm5Xn5Erv4w9P8
         PZ6WaC2Sf4nFE86oC0Qnb0kMM8kk/lsnAh2Ub1l7ykcxlmrA+yFFk/9oynoiuhEDRcpY
         /e439S98FSue+/HkFd0g3hmNnuEBo+iwnvtIHD7Qnk3en6832CiFweS9eiBU1OP3umSa
         aquA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769150912; x=1769755712;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P9bWwKhaQgdcXnYyI1XdVxlZib/2TpvD9aGUnR2lTXE=;
        b=B9QJbALxscKzDe0GyEMopX9K1NzKFe1vNJFUKZrdnSV52a+oC/ZBqkiDxnYtPhGhAN
         iCJADC3yYrhJsQB1lcU1J0KTTU04BE2v0F5HTmndQvSgVfuaDX111mKlswiiX9JoFu5t
         2X4GwmPQBuGoJUfztXKpxgIA0X0DNJWmIF+BhTdjYGhABFFUOjv0nI5GXh+87m93zZad
         JdXYokiMZgtCnA/EYZrycaugVftN53PwST7Ngj34cHdzOtLuuN26ADycZdksVv2oRwOM
         D3eMX6Nyt7Jcoq4hAVg72uFiIQ9ljdqLv7Z8wYwgT0C8r5/tfXLi/v9hDgz4xje8yzgo
         LHlw==
X-Gm-Message-State: AOJu0Yz3H4/t/GjD2pICiNiOgd+BoXhvcBU5F+ZtQr079eeMczDzutny
	LhePCz7KdoO9CRGrqTJfn6UnX9ZuAYZ5rXwlIRmjlETr4/3Xg4E5O8FHZDtHG8Wxki67bkDgK6+
	DV23fnpoH1HQ9s4Yp24r/U1OQVJUNJSpy2a3EQZ1LAsk707LZbMVX7KAOGUy08Tj9
X-Gm-Gg: AZuq6aLumTL38TmPb1S/XtpW2N7L2N7VuIeGfAkOOfjNbLk0YQCjrOawFTo3vUcoF3b
	NJmS1qHJ5kVYU288vdleBVB2wbqLZWYNTfZH1iFtn9J/k06cIsmePnG6YekEgjj4WFmDBTahFLF
	LDOluLZdD/TDnD2G2mB0QsQLLdHl7X15uqAuKRqcSTY8Tt6Q3Mp2VKs6+N4ECiaV6mME7CaO4JS
	Tq0/DKLTIKSyYe15EvvO9TGfGQp/lsA19v3/j7uyZXfJiIwuGTEdy22GehYiLPF0dOOUyNsqQtv
	NuFnghqLeX8a7//fE/UXc3X9m7KAaE/RzwgTzu7EaM+46FqA603gPj5GLKDjMhZSUTwenS1r5/c
	7GOgUL0H8sKDftvpSjs6pZOV49lG7T+4vf7aP0DVnByHszj7GxAz6CAt+qwF8RTdOqg==
X-Received: by 2002:a05:7022:f94:b0:123:2d9d:a90d with SMTP id a92af1059eb24-1247dbbbd43mr896855c88.17.1769150912148;
        Thu, 22 Jan 2026 22:48:32 -0800 (PST)
X-Received: by 2002:a05:7022:f94:b0:123:2d9d:a90d with SMTP id a92af1059eb24-1247dbbbd43mr896842c88.17.1769150911523;
        Thu, 22 Jan 2026 22:48:31 -0800 (PST)
Received: from san-w175-na3-01.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1247d90d13esm2819484c88.2.2026.01.22.22.48.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 22:48:31 -0800 (PST)
From: Wei Zhang <wei.zhang@oss.qualcomm.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        wei.zhang@oss.qualcomm.com
Subject: [PATCH ath-next 2/2] wifi: ath12k: support OBSS PD configuration for AP mode
Date: Thu, 22 Jan 2026 22:48:17 -0800
Message-ID: <20260123064817.364047-3-wei.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
References: <20260123064817.364047-1-wei.zhang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zCDwmOmjp9gEnykO1sPpuiljYdsY18w3
X-Authority-Analysis: v=2.4 cv=O480fR9W c=1 sm=1 tr=0 ts=697319c1 cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=_f8bPs4Hj4x37lDDkkEA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: zCDwmOmjp9gEnykO1sPpuiljYdsY18w3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDA1MCBTYWx0ZWRfX6QwvbNu+xLy9
 0e19lqJRYWe4RqygvKLE3raSkMVAUvZ5BhT25lgb39LlgUibPBcixy3dyZ8Df3fOViunjd9NIyM
 5Ps8GDy+sMQ0palrFgoHOcmOl/Sl6ISmU7zb+j5JzTSpPnB0KlgknxioIZhpW0dFCzuJ7/Wb0Bp
 3wfzi7vIsDcmZiZ14ksGMDBQEedm+vUGeKG8RWMtE05vxzTQ/Q+SMJYbNWJaQC2NwcOdR9HZWqc
 IwamLJ2+3B2ZntBIYcPYN8vExWFFBOk7Ho7BV2CL+/mw2vyqwgcGkIItGHOD6hzBGUb4DVvRq8U
 RjsxMJCzara5gmxux+NPCegN7KLZhD6iAIOgVWC846/IrCbtBSfqa3czBcWK9qE+1WbD21L4OWR
 aqlfEV6B/II3QvNHpD94A5jK5UHIz+QgHglTpWXlXoKbIQIg/pzHJxCfxO5COdeudmTn70Rt45w
 cN7g9WbPEv8Q+KEyCoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-22_06,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 bulkscore=0 spamscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 impostorscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2601230050
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_224833_588324_20E6F103 
X-CRM114-Status: GOOD (  18.62  )
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

Configure HE OBSS PD for spatial reuse in ath12k based on mac80211
HE SPR parameters in AP mode. This adds a pdev-level helper that
programs SRG/non-SRG OBSS PD thresholds, per-AC enablement, SR prohibit
control, and SRG/non-SRG BSS color and partial BSSID bitmaps via WMI.

Replace the previous vdev-level OBSS SPR command usage with the new
pdev-level configuration path, allowing firmware to apply HE spatial
reuse behavior according to the HE SPR/OBSS PD settings provided by
mac80211.

Tested-on: WCN7850 hw2.0 PCI WLAN.IOE_HMT.1.1-00011-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1
Tested-on: QCN9274 hw2.0 WLAN.WBE.1.5-01651-QCAHKSWPL_SILICONZ-1

Signed-off-by: Wei Zhang <wei.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 170 +++++++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h |   3 +
 drivers/net/wireless/ath/ath12k/wmi.h |   1 +
 3 files changed, 171 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index cdb72439dcf4..8b66a6b58abd 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -4505,6 +4505,166 @@ static void ath12k_wmi_vdev_params_up(struct ath12k *ar,
 			    arvif->vdev_id, ret);
 }
 
+static int ath12k_mac_config_obss_pd(struct ath12k_link_vif *arvif,
+				     const struct ieee80211_he_obss_pd *he_obss_pd)
+{
+	struct ath12k_wmi_obss_pd_arg obss_pd_arg = {};
+	u32 srg_bitmap[2], non_srg_bitmap[2];
+	struct ath12k *ar = arvif->ar;
+	u32 param_id, pdev_id;
+	u32 param_val;
+	int ret;
+
+	if (ar->ab->hw_params->single_pdev_only)
+		pdev_id = ath12k_mac_get_target_pdev_id_from_vif(arvif);
+	else
+		pdev_id = ar->pdev->pdev_id;
+
+	/* Set and enable SRG/non-SRG OBSS PD threshold */
+	param_id = WMI_PDEV_PARAM_SET_CMD_OBSS_PD_THRESHOLD;
+	if (ar->monitor_started || !he_obss_pd->enable) {
+		ret = ath12k_wmi_pdev_set_param(ar, param_id, 0, pdev_id);
+		if (ret)
+			ath12k_warn(ar->ab,
+				    "failed to set OBSS PD threshold for pdev %u: %d\n",
+				    pdev_id, ret);
+		return ret;
+	}
+
+	/*
+	 * This service flag indicates firmware support for SRG/SRP-based
+	 * spatial reuse. It also specifies whether OBSS PD threshold values
+	 * should be interpreted as dB (offset) or dBm (absolute) units.
+	 */
+	obss_pd_arg.srp_support = test_bit(WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT,
+					   ar->ab->wmi_ab.svc_map);
+
+	if (!(he_obss_pd->sr_ctrl &
+	      IEEE80211_HE_SPR_NON_SRG_OBSS_PD_SR_DISALLOWED)) {
+		if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_NON_SRG_OFFSET_PRESENT)
+			obss_pd_arg.non_srg_th = ATH12K_OBSS_PD_MAX_THRESHOLD +
+						 he_obss_pd->non_srg_max_offset;
+		else
+			obss_pd_arg.non_srg_th = ATH12K_OBSS_PD_NON_SRG_MAX_THRESHOLD;
+
+		if (!obss_pd_arg.srp_support)
+			obss_pd_arg.non_srg_th -= ATH12K_DEFAULT_NOISE_FLOOR;
+
+		obss_pd_arg.non_srg_enabled = true;
+	}
+
+	if (he_obss_pd->sr_ctrl & IEEE80211_HE_SPR_SRG_INFORMATION_PRESENT) {
+		obss_pd_arg.srg_th = ATH12K_OBSS_PD_MAX_THRESHOLD +
+				     he_obss_pd->max_offset;
+		obss_pd_arg.srg_enabled = true;
+	}
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+		   "pdev %u OBSS PD sr_ctrl 0x%x srg_th %d dBm non_srg_th %d dBm\n",
+		   pdev_id, he_obss_pd->sr_ctrl,
+		   obss_pd_arg.srg_th, obss_pd_arg.non_srg_th);
+
+	param_val = ath12k_wmi_build_obss_pd(&obss_pd_arg);
+	ret = ath12k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to set OBSS PD threshold for pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/* Enable OBSS PD for all access category */
+	param_id  = WMI_PDEV_PARAM_SET_CMD_OBSS_PD_PER_AC;
+	param_val = 0xf;
+	ret = ath12k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to set OBSS PD per ac for pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/* Set SR prohibit */
+	param_id  = WMI_PDEV_PARAM_ENABLE_SR_PROHIBIT;
+	param_val = !!(he_obss_pd->sr_ctrl &
+		       IEEE80211_HE_SPR_HESIGA_SR_VAL15_ALLOWED);
+	ret = ath12k_wmi_pdev_set_param(ar, param_id, param_val, pdev_id);
+	if (ret) {
+		ath12k_warn(ar->ab, "failed to set SR prohibit for pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	if (!obss_pd_arg.srp_support)
+		return 0;
+
+	memcpy(srg_bitmap, he_obss_pd->bss_color_bitmap, sizeof(srg_bitmap));
+	/* Set SRG BSS color bitmap */
+	ret = ath12k_wmi_pdev_set_srg_bss_color_bitmap(ar, pdev_id, srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to set SRG bss color bitmap for pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/* Enable BSS colors for SRG */
+	ret = ath12k_wmi_pdev_srg_obss_color_enable_bitmap(ar, pdev_id, srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to enable SRG bss color bitmap pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	memcpy(srg_bitmap, he_obss_pd->partial_bssid_bitmap, sizeof(srg_bitmap));
+	/* Set SRG partial bssid bitmap */
+	ret = ath12k_wmi_pdev_set_srg_partial_bssid_bitmap(ar, pdev_id, srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to set SRG partial bssid bitmap for pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/* Enable partial bssid mask for SRG */
+	ret = ath12k_wmi_pdev_srg_obss_bssid_enable_bitmap(ar, pdev_id, srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to enable SRG bssid bitmap pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/*
+	 * No explicit non-SRG bitmap from mac80211; enable all colors/bssids
+	 * as non-SRG candidates. Actual SRG members are filtered by SRG bitmaps.
+	 */
+	memset(non_srg_bitmap, 0xff, sizeof(non_srg_bitmap));
+
+	/* Enable BSS colors for non-SRG */
+	ret = ath12k_wmi_pdev_non_srg_obss_color_enable_bitmap(ar, pdev_id,
+							       non_srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to enable non SRG color bitmap pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	/* Enable partial bssid mask for non-SRG */
+	ret = ath12k_wmi_pdev_non_srg_obss_bssid_enable_bitmap(ar, pdev_id,
+							       non_srg_bitmap);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to enable non SRG bssid bitmap pdev %u: %d\n",
+			    pdev_id, ret);
+		return ret;
+	}
+
+	return 0;
+}
+
 static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 					struct ath12k_link_vif *arvif,
 					struct ieee80211_bss_conf *info,
@@ -4796,9 +4956,13 @@ static void ath12k_mac_bss_info_changed(struct ath12k *ar,
 			ath12k_wmi_send_twt_disable_cmd(ar, ar->pdev->pdev_id);
 	}
 
-	if (changed & BSS_CHANGED_HE_OBSS_PD)
-		ath12k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
-					     &info->he_obss_pd);
+	if (changed & BSS_CHANGED_HE_OBSS_PD) {
+		if (vif->type == NL80211_IFTYPE_AP)
+			ath12k_mac_config_obss_pd(arvif, &info->he_obss_pd);
+		else
+			ath12k_wmi_send_obss_spr_cmd(ar, arvif->vdev_id,
+						     &info->he_obss_pd);
+	}
 
 	if (changed & BSS_CHANGED_HE_BSS_COLOR) {
 		if (vif->type == NL80211_IFTYPE_AP) {
diff --git a/drivers/net/wireless/ath/ath12k/mac.h b/drivers/net/wireless/ath/ath12k/mac.h
index 422bd3b095cd..7b50c5976384 100644
--- a/drivers/net/wireless/ath/ath12k/mac.h
+++ b/drivers/net/wireless/ath/ath12k/mac.h
@@ -138,6 +138,9 @@ struct ath12k_reg_tpc_power_info {
 	struct ath12k_chan_power_info chan_power_info[ATH12K_NUM_PWR_LEVELS];
 };
 
+#define ATH12K_OBSS_PD_MAX_THRESHOLD		-82
+#define ATH12K_OBSS_PD_NON_SRG_MAX_THRESHOLD	-62
+
 extern const struct htt_rx_ring_tlv_filter ath12k_mac_mon_status_filter_default;
 
 #define ATH12K_SCAN_11D_INTERVAL		600000
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 2a81819ef543..0bf0a7941cd3 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2259,6 +2259,7 @@ enum wmi_tlv_service {
 	WMI_TLV_SERVICE_FREQINFO_IN_METADATA = 219,
 	WMI_TLV_SERVICE_EXT2_MSG = 220,
 	WMI_TLV_SERVICE_BEACON_PROTECTION_SUPPORT = 244,
+	WMI_TLV_SERVICE_SRG_SRP_SPATIAL_REUSE_SUPPORT = 249,
 	WMI_TLV_SERVICE_MBSS_PARAM_IN_VDEV_START_SUPPORT = 253,
 
 	WMI_MAX_EXT_SERVICE = 256,
-- 
2.34.1


