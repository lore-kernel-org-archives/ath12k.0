Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C534C982F1
	for <ath12k@archiver.kernel.org>; Mon, 21 Sep 2026 04:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5pwQIWAooP0jTG+iZIqONUdlOsPJuWCK/ETO/3qbK0c=; b=m3LxJ4NYsx6DQCfrr8oYL9BM9w
	B3TF5T8O5rcCq93LAG4bHDdSigIYdVhRjBGnR3j0U+ozTa2eJKdKhsQnfCTYEgJKNusv9o/zW+Yiw
	zLJh8iopiuZem5sgNne0u9i+6tvO+5cfTySvaY7k1w7wuQ+Fu5E/FO1i1S63P5DOkAcmC6iRPPoxx
	m6nBu1dKAolkyDrLrLmqbvcvmBdN1sixY8ThDiMvsFhiccqOoFlN38l1j1uKYHExJUCnfU6xLK4sb
	R+RSSJfeiySm4nuCMuBUnISAXmF1uABIAgtHIIbK2lLg6a44soXzHJUuf27cI0J+PFWWFRLQOvuyY
	MWIbKEJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vh8-00000000qMU-3bna;
	Mon, 21 Sep 2026 04:31:58 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Vh6-00000000qLv-0mq0
	for ath12k@lists.infradead.org;
	Mon, 21 Sep 2026 04:31:57 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68L3ZQOd3490655
	for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 04:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=5pwQIWAooP0jTG+iZIqONUdlOsPJuWCK/ET
	O/3qbK0c=; b=C8a5s9Fddp8Cb1sGZ5OYZAKDk7KkLX3Z8DqpkldyZjskKKl7AY8
	d3PXapyMccr5C4FYJmkZRZ/Q2uSPx9Qfl2zNWoEhVoiUcBUs3eYU417rsL5Ce8aI
	k8ug5Ty6gkkqmUAsoSh+BDYvDLF9YDndM9Z5LWAxEHlYXQpvsBAQhFvHB1k9GHMG
	dBb0KgaZTZXYtumIDp9xNpBdggboZQ1zah3/kS7hzcwAUzOqcZAQ0DeuxIhgyH56
	WHH+vsCto1ikjdTQnlSATUNhS0pjycjECCbpV5riXX9phu7TiEInGFOQThDVkUF1
	xQoYMHol295Z8qxouk4aXIt2bGbxbFrjOYQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gskp9vhkf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 21 Sep 2026 04:31:54 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2d6df0a1e18so50336875ad.1
        for <ath12k@lists.infradead.org>; Sun, 20 Sep 2026 21:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789965114; x=1790569914; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5pwQIWAooP0jTG+iZIqONUdlOsPJuWCK/ETO/3qbK0c=;
        b=H6LP8zIgb0uu/f//dYPOWj6EHpCALYZJJERfoGrEKar3J6TfIED/KyMHoYaEPukEHY
         5a+R/G/wk0FnEqdDgcJ43tRFgm9NH2ujtgDoigNKkJF/gBMrI9renx/Aq9OxawIxKbkY
         O7+rTLuxuZ8Ug1rK8gPPoMl9B2Xcl37Kn3PLPsgGmPDk6D9Xr8puogVp0s374U53g/A0
         3IKwZu9JBCKh25KWu1DMHRIvZ1DfHRuSIJq4A9XNdOMOnx2mvWAyRhMXxWTvhq6QL/G/
         agiz2Z1z+ubSkw3P7W6bQ0BUXqgYcoxBNqPFd63+ggZO3lwo13gPACMFWW3BdZZyuOGc
         SoCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789965114; x=1790569914;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5pwQIWAooP0jTG+iZIqONUdlOsPJuWCK/ETO/3qbK0c=;
        b=a2HeoQuMyKoMnp3inCQXUudSegBE5xc/FRY+VdgQSyzQXET9msCvc/V1rN582aKKvz
         gAWDMRZhhjhhEu8qbR/vksE38d2wVwe9kG4IsVov5DQ9f6dnxCQcHxTPVDqu+MiOHXqw
         3GOoleZGleEYYZN/y3WlqzBFgI9C741PSkePAX87dS2Obs9T8bFc2ULXGpE1OQHSrFk4
         DOrF3k4f+kwj8lA5wZHHidYfpsGSQwKOa3nhCZXWdoRjMmE2ZGXX49p/gz9RyMuEMEFv
         XKHAzn0bRPFTYE//MQtUowtJUk/KigDcO2NE7kUH/8bMvG9gbKYR5YP2kXaEhXZtLGU3
         AUCA==
X-Gm-Message-State: AFuF++k9ME16K0mvPgnareps3J4YRdjVOXUD9xJsGPcqp58vfz/eKViK
	pVg7hv3gu23rXVdJj/nTMEeTZNTwJpwKnXzIrI/PxrBPA9K5te3F92F6YtbkQWKNkjyOpp5CtcE
	nkSNK1kJ5nPhNm472wNf/MBYgWoKAgMJ2g4y7AbnCKSJFeUnex+F+Ydq0hKqNU1FEevzMd9Q2
X-Gm-Gg: AYBFou2liNPoGZa6GDjJnMd4scCnmm6tWeo/IfvN3xnaGRgOCxdBZpu9z35wzI5buOU
	B3YhoLFu4k3tybL6EuQw0OP0X5UnFHRVmk+hMAByyfmrH/Qah7r0LS4igr3SmPCziF8X+eI9vt7
	AxmS30lplsuDJohg+OT5PZ1CE8y9DP1a/OPb612WmjUMtJ9gBeoNriE6DJLdNU87GujOC4yQ1Tg
	UZWUC09nFXRbczj/Xi2dWKpBdLNysFO2BLj85rh269HhKdoDS4Eyqt9lptLLE3E8VmH2SMQpeIq
	iGDRU3A1ZFHF69nojJEmo/I/jd54mpgLY3Qi+WFZ+7ROy4NT85Wss+DUtXwdGNavcdPmGhWrMkP
	/a6xXR9aBjaLNmiZ12OogblKdE7UVZl9V+mhm5bPtYNZ+ooajUb2W0ysmAQ==
X-Received: by 2002:a17:903:1b2d:b0:2dd:ad73:5b6e with SMTP id d9443c01a7336-2ddb1c45e55mr136405485ad.30.1789965114052;
        Sun, 20 Sep 2026 21:31:54 -0700 (PDT)
X-Received: by 2002:a17:903:1b2d:b0:2dd:ad73:5b6e with SMTP id d9443c01a7336-2ddb1c45e55mr136405335ad.30.1789965113618;
        Sun, 20 Sep 2026 21:31:53 -0700 (PDT)
Received: from sdciot-sh03-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33c32da4960sm18768935eec.0.2026.09.20.21.31.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 21:31:53 -0700 (PDT)
From: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaole.zhang@oss.qualcomm.com, gaolez@qti.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
Subject: [PATCH ath-next] wifi: ath12k: Add EHT capabilities to scan probe frame
Date: Mon, 21 Sep 2026 12:31:48 +0800
Message-Id: <20260921043148.3071142-1-gaole.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: vFbwYnY2Y0DHbKhCnVPM9NZBQsrjRrm_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIxMDA2MiBTYWx0ZWRfXxNe50srqhA39
 Zp6I3aDUb8KS2m0fHAf/mOsqglR6h2ebXGBv40XslhNvDGzcql2XJTcOfUFFi45zCtR+ifqJuVE
 9LIYVX0Jrdg8DzPvKlkrD0z0PL1Xvn0BgqM4F4JtlqyISNnXM0M5Yq6kxsN9tEMNAYCZ2Tq12YT
 JGvI6ZRTrUpDLcMgcTFY05kU0Z6lBLfuRuYOp9t6gK2XlVmoL1EMssHYh5TnOSeRIwn1bcdgdAE
 PVpxsntNtHXcWa6oy+6rJyJ38C53BZU0xasG2BVfzCEsj9fpiaE0abAwekgPq2KPv8nqEMGERvQ
 EahWTlFMo9XjR0RbsZgJ+DZX6CnLSHCbPhtENmDvqC9AkoF65nwfLTWLZfL60kOWSRuQVjHpJCT
 wBMP/1b1/KVX3w8VTkGQtQ+Sa0jc9pN2CKZAnK/5+GwGk4RpBA7gj+KFtoRSFvw5mJItLAlcUiP
 6fpiFmHQTnXdnj/Lf2Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIxMDA2MiBTYWx0ZWRfX/oPhEYV9afS4
 fvWp22KecU8v0j1lzRuJJlmjlWLvg0yxIL98WHxV0Shz1aYSZ4tHJ5x7v3fJCP579xRjcopplP3
 vz/tJI1zYZpF5vrw2G8ksF+dV2KPHr8=
X-Authority-Analysis: v=2.4 cv=BKAmP1QG c=1 sm=1 tr=0 ts=6ab0b33a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=U_iYt0Z2j1ABiE-NJdYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: vFbwYnY2Y0DHbKhCnVPM9NZBQsrjRrm_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-21_02,2026-09-16_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 priorityscore=1501 suspectscore=0 impostorscore=0 spamscore=0
 malwarescore=0 bulkscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609210062
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_213156_250516_A9FD3F44 
X-CRM114-Status: GOOD (  19.42  )
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

Currently, ath12k does not set the EHT flag in scan channel
information and does not send WMI_VDEV_SET_IE_CMDID with the EHT
Capabilities element configuration. As a result, EHT-capable STA
Probe Requests do not contain the EHT Capabilities element.

Without this element, AP can't identify the STA as EHT-capable
during active scanning and may omit EHT-related information from its
Probe Response. This can result in incomplete scan information and
prevent userspace from correctly determining the AP's EHT capabilities.

Set the EHT scan flag and configure the EHT Capabilities element so
that ath12k includes it in STA Probe Request frames.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/core.h |  6 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 29 +++++++++++++--
 drivers/net/wireless/ath/ath12k/reg.c  |  4 +++
 drivers/net/wireless/ath/ath12k/wmi.c  | 50 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  | 23 +++++++++++-
 5 files changed, 109 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index a98fc6e0699d..e7373a523dc3 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -1394,6 +1394,12 @@ static inline struct ath12k *ath12k_ah_to_ar(struct ath12k_hw *ah, u8 radio_idx)
 	return &ah->radio[radio_idx];
 }
 
+static inline bool ath12k_is_11be_enabled(struct ath12k_base *ab)
+{
+	return test_bit(WMI_TLV_SERVICE_11BE, ab->wmi_ab.svc_map) &&
+	       !ath12k_acpi_get_disable_11be(ab);
+}
+
 static inline struct ath12k_hw *ath12k_ar_to_ah(struct ath12k *ar)
 {
 	return ar->ah;
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d4116ba0da08..f353af63c5eb 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5602,6 +5602,25 @@ ath12k_mac_find_link_id_by_ar(struct ath12k_vif *ahvif, struct ath12k *ar)
 	return ATH12K_FIRST_SCAN_LINK;
 }
 
+static int ath12k_mac_set_scan_eht_cap_ie(struct ath12k *ar,
+					  struct ath12k_link_vif *arvif,
+					  const u8 *ies, size_t ies_len)
+{
+	const struct element *eht_cap;
+
+	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
+
+	eht_cap = cfg80211_find_ext_elem(WLAN_EID_EXT_EHT_CAPABILITY, ies,
+					 ies_len);
+	if (!eht_cap || eht_cap->datalen <= 1)
+		return 0;
+
+	return ath12k_wmi_vdev_set_ie(ar, arvif->vdev_id,
+				      WLAN_EID_EXTENSION,
+				      eht_cap->data, eht_cap->datalen,
+				      WMI_SET_VDEV_IE_BAND_ALL);
+}
+
 static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 				       struct ieee80211_vif *vif,
 				       struct ieee80211_scan_request *hw_req,
@@ -5718,6 +5737,13 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 			goto exit;
 		}
 		arg->extraie.len = req->ie_len;
+		ret = ath12k_mac_set_scan_eht_cap_ie(ar, arvif, req->ie,
+						     req->ie_len);
+		if (ret) {
+			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+				   "failed to set eht cap ie, ret %d\n", ret);
+			goto exit;
+		}
 	}
 
 	if (req->n_ssids) {
@@ -8983,8 +9009,7 @@ static void ath12k_mac_copy_eht_cap(struct ath12k *ar,
 
 	memset(eht_cap, 0, sizeof(struct ieee80211_sta_eht_cap));
 
-	if (!(test_bit(WMI_TLV_SERVICE_11BE, ar->ab->wmi_ab.svc_map)) ||
-	    ath12k_acpi_get_disable_11be(ar->ab))
+	if (!ath12k_is_11be_enabled(ar->ab))
 		return;
 
 	eht_cap->has_eht = true;
diff --git a/drivers/net/wireless/ath/ath12k/reg.c b/drivers/net/wireless/ath/ath12k/reg.c
index 89abf2e87ad1..0aba1e74a3e9 100644
--- a/drivers/net/wireless/ath/ath12k/reg.c
+++ b/drivers/net/wireless/ath/ath12k/reg.c
@@ -140,6 +140,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 	enum nl80211_band band;
 	int num_channels = 0;
 	int i, ret = 0;
+	bool has_eht;
 
 	if (ar->ah->state == ATH12K_HW_STATE_RESTARTING)
 		return 0;
@@ -180,6 +181,8 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 
 	ch = arg->channel;
 
+	has_eht = ath12k_is_11be_enabled(ar->ab);
+
 	for (band = 0; band < NUM_NL80211_BANDS; band++) {
 		if (!(ar->mac.sbands[band].channels && bands[band]))
 			continue;
@@ -201,6 +204,7 @@ int ath12k_reg_update_chan_list(struct ath12k *ar, bool wait)
 			ch->allow_ht = true;
 			ch->allow_vht = true;
 			ch->allow_he = true;
+			ch->allow_eht = has_eht;
 
 			ch->dfs_set =
 				!!(channel->flags & IEEE80211_CHAN_RADAR);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index a63bbda0219c..5fe7af731a4e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2005,6 +2005,54 @@ int ath12k_wmi_p2p_go_bcn_ie(struct ath12k *ar, u32 vdev_id,
 	return ret;
 }
 
+int ath12k_wmi_vdev_set_ie(struct ath12k *ar, u32 vdev_id, u32 ie_id,
+			   const u8 *ie, size_t ie_len, u32 band)
+{
+	struct ath12k_wmi_pdev *wmi = ar->wmi;
+	struct wmi_vdev_set_ie_cmd *cmd;
+	struct sk_buff *skb;
+	struct wmi_tlv *tlv;
+	size_t aligned_len;
+	int ret, len;
+	void *ptr;
+
+	aligned_len = roundup(ie_len, sizeof(u32));
+	len = sizeof(*cmd) + TLV_HDR_SIZE + aligned_len;
+
+	skb = ath12k_wmi_alloc_skb(wmi->wmi_ab, len);
+	if (!skb)
+		return -ENOMEM;
+
+	ptr = skb->data;
+	cmd = ptr;
+	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_VDEV_SET_IE_CMD,
+						 sizeof(*cmd));
+	cmd->vdev_id = cpu_to_le32(vdev_id);
+	cmd->ie_id = cpu_to_le32(ie_id);
+	cmd->ie_len = cpu_to_le32(ie_len);
+	cmd->ie_source = cpu_to_le32(WMI_SET_VDEV_IE_SOURCE_HOST);
+	cmd->band = cpu_to_le32(band);
+
+	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
+		   "WMI set ie vdev_id %u ie_id %u ie_len %zu band %u\n",
+		   vdev_id, ie_id, ie_len, band);
+
+	ptr += sizeof(*cmd);
+	tlv = ptr;
+	tlv->header = ath12k_wmi_tlv_hdr(WMI_TAG_ARRAY_BYTE, aligned_len);
+	memcpy(tlv->value, ie, ie_len);
+
+	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_VDEV_SET_IE_CMDID);
+	if (ret) {
+		ath12k_warn(ar->ab,
+			    "failed to send WMI_VDEV_SET_IE_CMDID for vdev %u ie %u: %d\n",
+			    vdev_id, ie_id, ret);
+		dev_kfree_skb(skb);
+	}
+
+	return ret;
+}
+
 int ath12k_wmi_bcn_tmpl(struct ath12k_link_vif *arvif,
 			struct ieee80211_mutable_offsets *offs,
 			struct sk_buff *bcn,
@@ -2946,6 +2994,8 @@ int ath12k_wmi_send_scan_chan_list_cmd(struct ath12k *ar,
 				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_VHT);
 			else if (channel_arg->allow_ht)
 				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_HT);
+			if (channel_arg->allow_eht)
+				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_ALLOW_EHT);
 			if (channel_arg->half_rate)
 				chan_info->info |= cpu_to_le32(WMI_CHAN_INFO_HALF_RATE);
 			if (channel_arg->quarter_rate)
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b508aa759bd8..e51b3bdab77b 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3075,7 +3075,8 @@ struct ath12k_wmi_channel_arg {
 	    allow_vht:1,
 	    allow_he:1,
 	    set_agile:1,
-	    psc_channel:1;
+	    psc_channel:1,
+	    allow_eht:1;
 	u32 phy_mode;
 	u32 cfreq1;
 	u32 cfreq2;
@@ -3694,6 +3695,7 @@ struct ath12k_wmi_scan_cancel_arg {
 #define WMI_CHAN_INFO_DFS_FREQ2		BIT(16)
 #define WMI_CHAN_INFO_ALLOW_HE		BIT(17)
 #define WMI_CHAN_INFO_PSC		BIT(18)
+#define WMI_CHAN_INFO_ALLOW_EHT		BIT(21)
 
 #define WMI_CHAN_REG_INFO1_MIN_PWR	GENMASK(7, 0)
 #define WMI_CHAN_REG_INFO1_MAX_PWR	GENMASK(15, 8)
@@ -3845,6 +3847,23 @@ struct wmi_p2p_go_set_beacon_ie_cmd {
 	__le32 ie_buf_len;
 } __packed;
 
+#define WMI_SET_VDEV_IE_SOURCE_HOST	0
+
+enum wmi_set_vdev_ie_band {
+	WMI_SET_VDEV_IE_BAND_ALL,
+	WMI_SET_VDEV_IE_BAND_2_4GHZ,
+	WMI_SET_VDEV_IE_BAND_5GHZ,
+};
+
+struct wmi_vdev_set_ie_cmd {
+	__le32 tlv_header;
+	__le32 vdev_id;
+	__le32 ie_id;
+	__le32 ie_len;
+	__le32 ie_source;
+	__le32 band;
+} __packed;
+
 struct wmi_vdev_install_key_cmd {
 	__le32 tlv_header;
 	__le32 vdev_id;
@@ -6583,6 +6602,8 @@ int ath12k_wmi_pdev_resume(struct ath12k *ar, u32 pdev_id);
 
 int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 				   struct ath12k_wmi_peer_assoc_arg *arg);
+int ath12k_wmi_vdev_set_ie(struct ath12k *ar, u32 vdev_id, u32 ie_id,
+			   const u8 *ie, size_t ie_len, u32 band);
 int ath12k_wmi_vdev_install_key(struct ath12k *ar,
 				struct wmi_vdev_install_key_arg *arg);
 int ath12k_wmi_pdev_bss_chan_info_request(struct ath12k *ar,

base-commit: c3bace8584ca707e34ba837f65c2e9d566af4c2c
-- 
2.34.1


