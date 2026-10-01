Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B23FCA5FB3
	for <ath12k@archiver.kernel.org>; Thu,  1 Oct 2026 08:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bRQ3k+nW+Npo9QlflQkoUYD6pGHgSJoCtnkYceAyjUA=; b=DSxKbiL+NlciOdj00awLyFI6SZ
	H9Iys6fOsEhxrALezxBlIjnmWA5y7tYHYhvONJCoB7JC8As/iTXTEirAX6KhcFT6iQPLL9WUuwBPT
	rhlnJyCGAxGu/fESJLStZmzd3mdzCW9sPee4GJiGDaW1Mc0aG9LJkin1whQO1DkglC3IdYA7v2uVD
	6sahyH3k0EMFIGRJrVesvuxS1l2UUeCcpHieJWJLDY4WaALF3PhO6itBT3T3OEyTFTWZl3Zm/XDTh
	siqmlDumqh2r0jJEeDgUdsCUp10NImT0hjYEZr+58rvfQ+yucJDNFGWAhFqnjEZz9vpG9d3pkFp+w
	bA5Q348w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCKV-00000008CRI-11LQ;
	Thu, 01 Oct 2026 08:39:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCCKS-00000008CQ6-2tWT
	for ath12k@lists.infradead.org;
	Thu, 01 Oct 2026 08:39:49 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6916xPpS2887719
	for <ath12k@lists.infradead.org>; Thu, 1 Oct 2026 08:39:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bRQ3k+nW+Npo9QlflQkoUYD6pGHgSJoCtnk
	YceAyjUA=; b=BB97+R5gLiwDRhMLU0TBpaBkHH22mNtEY2LxEdk39j3AFI1uMUV
	fcmXEht7iQfTIIjfGdk7etjauCLeMtAVFZ58gTwcb2NMNyZ8CTFwFFAcgnwRo5sU
	3BoaMEh8n3O9oE2SDy0GU33/kRVko58x8WHmWqkWGgh9jM+slvylTs1ppxV2owd8
	obaSjWJ93O3GWN91jH1WOgdD3farD4Zm0SQca+yFcpeMeRCjHPu1/3knU3lqfQgU
	QUVzJDHYKJ0NZKGjcWnZBcOKJETiyVypVk+wdA8CuWVVK3UlvITGTrd5epz5BhqI
	nTjjTZeO/FEL1cZloZZnuZoPjgwun/i1RPg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h136tm6tj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 01 Oct 2026 08:39:47 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38dbf293831so9732211a91.3
        for <ath12k@lists.infradead.org>; Thu, 01 Oct 2026 01:39:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790843987; x=1791448787; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bRQ3k+nW+Npo9QlflQkoUYD6pGHgSJoCtnkYceAyjUA=;
        b=ewCPKNfEVM7j5vjjn0HP9/fYUAr3naknikR4xpwhlTbF+d09Hb10b1tm5mPps5pojE
         hGCXS/iU8SBnLcwUfHHClm6CADFenCdzeRwiiR0XHv3E7CASqo8jzrhH8VagqD7y6Iaw
         WUn1m4QPOA80MyQxFMT/yewkeUnmrh7NLm3c8jFCuEPcekaSXIQRSOD0PAV7TUJFJdq5
         za7CQLCg/i9MEbXR8d1d4SKwU+MDtltmnJrkR6V66xb9EDsIuTWF7jMXYMOT++WB6jEX
         CMmQwbIeIdZcluwy2khg+T0M0Ma/q4fHEASn1I3r3Su8b8VWIt7QU5xPV07pXa58t96y
         M5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790843987; x=1791448787;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bRQ3k+nW+Npo9QlflQkoUYD6pGHgSJoCtnkYceAyjUA=;
        b=ZN7TZDL9XYCWXyUfDDvlYCY3bjx6VCpbCmOCqpmPqlCXfMvlzXKcUx8z2TQjotan/a
         E8yuwZObyK7F9yhncgkHKC7/AJxCXYM+DdZiYwnKlbDZjkWVdln8tWJFPzatopKnYVk8
         5DsngzYkleizVe8hdSsqXzotyaQbQeBjx0xR75rOP2QDi+IIf0tO98Iri0Okd8CaQ+Al
         RcF4XUYR7E5O3ycJ7aAASJWjhtxAfBE6FHkAQGLszP+ZV2d/kQ5C6eYOSNsmW8nzL9wP
         Fk20mWibyVcdwHFLDJmcwn/I16TPH8gGRPc4PvoFRGM/Un7Z0ab24zWbF6nxtXGbYiva
         yZxA==
X-Gm-Message-State: AFq9FYLmk3j1GYoFbVoofKwV7F8AO7EcAEjPhrgAKF5BUfPCYC4vqV/Q
	xRKB5apW79E+UxZUewBN/s4c5iKBhhXX4bhejyOo9GOiVKWjnRIj9vZF0E6p4/0Q3hOqco/jdMy
	OBYmTCcl1BLHQXZNBmYfFt94f7fSIECM2x7kPAcVlC4BwwLyqi6d8X/Bv6R1dflv9EAs/bR+/
X-Gm-Gg: AYBFou2WlT+W0dfciI/44N42Rt89DzmB/igJFnlE/hIV3outRR0JoAWoNUJfamZfWyN
	bfNk1iEfjgxRLx//qeYNkKXbu0aToGNRbNcxW+iqDqOG4AQ8Vn9Wq48cAD9KG/4r2x9eo5HShaO
	2CYMcf/dcJwIlaKpqyC1WoP1jVq//TBICDDHdn/9hslfwH7iwrsSl/AQHSMruiILUnQKC6ss9Xe
	4hHr2dkfNnTzepSmoVX2JyEZicD/3RRQnFNjNEgYsOGwU+O3igrj15ThNl2UuLmhwcBF5WF/gV0
	aZLj1jIBoo1wc2w/TVE2SDGaperLrR5OyNmPy09JFatgqmHa5OPXlDRCQti+LimPFnOeE3gW7zh
	jFQ9MQnHnClZWQ5V0AqjWdSaBrZVph4ityw+P9ZnutM14Z4OlGGDtqClD
X-Received: by 2002:a17:90b:3cc5:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a4d1526e57mr3371707a91.11.1790843986972;
        Thu, 01 Oct 2026 01:39:46 -0700 (PDT)
X-Received: by 2002:a17:90b:3cc5:b0:39e:21a7:5dff with SMTP id 98e67ed59e1d1-3a4d1526e57mr3371677a91.11.1790843985666;
        Thu, 01 Oct 2026 01:39:45 -0700 (PDT)
Received: from sdciot-sh03-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4f478e750sm3423362a91.13.2026.10.01.01.39.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 01:39:45 -0700 (PDT)
From: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaole.zhang@oss.qualcomm.com, gaolez@qti.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
Subject: [PATCH v2 ath-next] wifi: ath12k: Add EHT capabilities to scan probe frame
Date: Thu,  1 Oct 2026 16:39:40 +0800
Message-Id: <20261001083940.3051840-1-gaole.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX+DLzJ8H445VQ
 +Phjnz/m+HSlWptFcd6Q+VFS7/THJfQ62nQO1ApLvI7AAVpTahyWmIvmodPhRq0UjbuImkicw9p
 b+th7GednwQuCTQ312XG8DpPfiN2GYg=
X-Authority-Analysis: v=2.4 cv=aPFlOr9m c=1 sm=1 tr=0 ts=6abe1c53 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VPXuAqNVT2ewv9QJR4oA:9 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: RQXBL5-mQgMoDDPMj3L1fNTJM9nMDof8
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAzNCBTYWx0ZWRfX4zN0ahBVmOj+
 VzxBo0qEo9iwgT2hPri/6dVhCcZhtIZGaMQh8OC/BSTq/HkMosYVQ6nCJ28+u2qtGFKdhcZSQFg
 aKajaU9Tq5dH4rJ+8xoo4X2Dd7XkT+Fs6GNPOdSAZZztAnB6UrNUVkbaskbX6YVjjJK+KPSPfWP
 isKqcR+ckSrRrFDE22bMTBFAkXgrYlm+jcxRBUEowQEdtN3vsIaDwXZ/hFt+f8gv/IsUdmc+UJn
 G3B8inNrezbmsN458Z3Ah70BB/GG+bs3MSFghuYX3sGpwBF6x+UAZV+2BvFWqr5FLXJEsYqxkCf
 2/YlG66U/u5s7SxKP9+QZCc+HhTmxvht39jbZ9gfF2TVudUlN9+C/85yx/rAwKjMlApPsSn30XR
 xmH+8LNNnMo8ODyC/g8lvP90ABpQuOvXqLC+n4VvbSNW9dUQjOxfitDhSzNPJG/JgTPhjtRbrDh
 esiyLPxHH7J97gp3Q+w==
X-Proofpoint-GUID: RQXBL5-mQgMoDDPMj3L1fNTJM9nMDof8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010034
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_013948_741942_4645D995 
X-CRM114-Status: GOOD (  22.11  )
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

ath12k hardware scan Probe Request frames do not include the EHT
Capabilities element. Without this element, an AP cannot identify the
STA as EHT-capable during active scanning and may omit EHT-related
information from its Probe Response. This can result in incomplete scan
information and prevent userspace from correctly determining the AP's
EHT capabilities.

For firmware to include the EHT Capabilities element in scan Probe
Request frames, two conditions are required:

  - The scan channel must have WMI_CHAN_INFO_ALLOW_EHT set, which allows
    firmware to add the EHT Capabilities element to Probe Request frames.
  - The EHT Capabilities element must be configured on the vdev through
    WMI_VDEV_SET_IE_CMDID, so firmware can use it when building Probe
    Request frames.

Set WMI_CHAN_INFO_ALLOW_EHT for channels when 11be is supported by
firmware and not disabled by ACPI. Also configure the EHT Capabilities
element before each hardware scan when the element is present in the
mac80211 scan IE buffer.

Firmware retains the configured element in the vdev context until it is
replaced or the vdev is deleted. However, ath12k scans may either reuse
an already started vdev or create a temporary scan vdev that is cleaned
up after scan completion. Sending WMI_VDEV_SET_IE_CMDID for each scan
request ensures correct behavior in both cases.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3

Signed-off-by: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
---
v2:
 - Clarify the firmware requirements for adding the EHT Capabilities
   element to scan Probe Request frames.
 - Explain why the EHT Capabilities element is configured before each
   hardware scan, covering both reused vdevs and temporary scan vdevs.
 - No code changes.

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


