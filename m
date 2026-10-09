Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6A69CA6019
	for <ath12k@archiver.kernel.org>; Fri,  9 Oct 2026 09:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6kyBbhVI0aFnvZ+fhobKvUuLqPpG3VNsDxhNg/2+xIc=; b=d3fwSe5vNsEJ6SSWi5kKCaNJ2+
	AL4PC4n3L9IfWKGqYD7DxrrtXrWfjQMcqtgMBfQPkyepXN6s1WLRPLVl6GZuCORmCO5SL5v71gpU1
	pbQJ2V/7rpXBTujiQr0ngcg9SSeV4k2qFExeEHo6EqHQ1UZYdE51drxP9nGQEGdYYsuUOXEWIsYoR
	SXmRfGHrct6wQKE1D/ZlYZyeQZjWOiCdvjSuutP8z//z1qfl3hjPN3hrhRbJTuSgiyRs+LoVfWte8
	mTYZHLeQYs1jXHbSwfezthp/dDWYvIsZBMQD7yg6WK3yFiEADvyRuUPkvT0X5y9PlrjdpYU2iV6Be
	RZB+N1XQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7KR-00000005xX3-1GIZ;
	Fri, 09 Oct 2026 09:55:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7KM-00000005xWd-31lH
	for ath12k@lists.infradead.org;
	Fri, 09 Oct 2026 09:55:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6998KL132369617
	for <ath12k@lists.infradead.org>; Fri, 9 Oct 2026 09:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=6kyBbhVI0aFnvZ+fhobKvUuLqPpG3VNsDxh
	Ng/2+xIc=; b=ikkLQRZVgvtnLWpgh+IOfNYp1bTk14EFVFvKStYQ7OUMoitBUOP
	/G7vspCJAGQgKHVt7PbkGKZU6dDhznQyZ1NzmnPWhjyN4eW474j9bodo2o1YdN/C
	MkMZAsgzedrZWvtAPKJO1nknAOae+1iAnzU1fosM9HFAjgssR6Yxo0zbj/RAARUA
	NqsSfLau5KDHmz3B5KOfkoOu6aXW0SLCvFxiDJ15pukjNzmNFcn0paAxRETmg76o
	/JDRO76c09YLKBEaqa6b7klvXvUkcEOliJt356hjXzPNN/EOCqSiqQGHNKaInFB4
	3TEx3XvE/A0KPwqtWLneMAAC37YNMa1DU+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h6fxwb0kb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 09:55:45 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30bcb065bfdso11959313eec.0
        for <ath12k@lists.infradead.org>; Fri, 09 Oct 2026 02:55:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791539745; x=1792144545; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=6kyBbhVI0aFnvZ+fhobKvUuLqPpG3VNsDxhNg/2+xIc=;
        b=eswA2c6bGNsY6KaKsl9BmXhELcRifMojFOm1UVzaIrc86gkRAZFCh5gm7sBM5Ki3Yb
         y2P+HMuTvo9iE7RC2hLOODaAW70t9pq5YqiOu6yquKrNOMuJqo/dqkPV4IFPu4OfcaOX
         7N6aaxUy6/xPDzHlEivUHK5rbV4mloatW7AcwYvnTOd6dC9e95X9kJVeRc2flVH/pJLm
         fdJyHGA1ZizqQRuJfLcVfrPH49hq16HIaXcr0Wwf2u7gJEgBndfuCo+nNPq1ECGRWQFf
         r19wiy8NLYPQKXM8TpejP8PwsZvudch/wqk0s4tQEx+/dzk03xZE/YpMDsJdB65beN7o
         1DYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791539745; x=1792144545;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kyBbhVI0aFnvZ+fhobKvUuLqPpG3VNsDxhNg/2+xIc=;
        b=psBBeRWGF2vl7a+QC+v63szEjQgvCpz61CsGVG4B7sV5EJ3WKacwyxhgoIyrXpkjkU
         9Mv5CPpIShtXTV78fV8dVgl/m5ltraDGb/dctHTB4BpRKKL1jPpKhfij4guNshEzoyqU
         dRpskaWPZIcH3k3nki4jNgro6exTDtQfyoqdpZwEwYM3b94BBPuCex8VTz3I9mXqfl8p
         ZCIlbB7B8M3znedP9555kIcZcghq+kcBoU2UGOU8GWtdtuoowEnKWiuaNLIhr30WhzDF
         srbr9C5gpvYK8kISsLYSbUcQn4bRI5DME7vzWPBj1b46sN7lXhJ7Y49J40bNTuifRs3t
         YoMw==
X-Gm-Message-State: AFuF++nXMIWI+SOWSp3kiLHwko9J7WJtDT+wOffWEwxVdxJHzPysvI2g
	Bwzzln6jaKix/Hjwa1qwdxGdAIyIk6zalDGFprjkQb4cjVFofqCLz1QTjZ8gyu16KlO3HEpiAZ5
	JlnpCtquy7J9nVwMgkaTQuKuT0c7Ln6ebNTHPQupi0jBfOsfEtGQ2nSHlr8EB0QtgFBq+angr
X-Gm-Gg: AYBFou2oAs5kjMRsC6KJeWWv7Yay9vYn8hotjmTpB7vxL2lqlzOeoxyd4akKbXsdnXc
	eQhX36k9+NLEqZoz96LlBVGlkoGsmQIyh5Yafs4qa8desJw/J6/eTH4HjtIMfruF+5wJx1POihR
	LzRxvESmToo9Ls3+nZt6rgXkKK285V7Y0NbNGl3q469HlJE2AZQUeTIgWnvjNZzs/M18D168dV1
	Xp+g0HfhzT9cR5duoLj1UR0+fIvb3NuRYlkwxbn6V6pRRRwuYWPoazcIhZGK0ZSKTtGVSzM8ve+
	V0AFAEipTgLzLz42PhBld0sBStLYEv99EaXkTB/ioQ3dBnscor4ils0XYV88uwqbikbZrw5UaP4
	ABc7ZZX4TodzH1FzU6WN1IdZKWrJ9GxDOdkd6FwpTYa4sulLq7F7dVVDC
X-Received: by 2002:a05:7022:1581:b0:14a:583a:8ddb with SMTP id a92af1059eb24-16a6043cbf1mr2238659c88.31.1791539744540;
        Fri, 09 Oct 2026 02:55:44 -0700 (PDT)
X-Received: by 2002:a05:7022:1581:b0:14a:583a:8ddb with SMTP id a92af1059eb24-16a6043cbf1mr2238612c88.31.1791539743734;
        Fri, 09 Oct 2026 02:55:43 -0700 (PDT)
Received: from sdciot-sh03-lnx.qualcomm.com (i-global052.qualcomm.com. [199.106.103.52])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-169a32eb7ebsm6479076c88.12.2026.10.09.02.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 02:55:43 -0700 (PDT)
From: Gaole Zhang <gaole.zhang@oss.qualcomm.com>
To: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        jeff.johnson@oss.qualcomm.com, baochen.qiang@oss.qualcomm.com,
        rameshkumar.sundaram@oss.qualcomm.com
Cc: gaole.zhang@oss.qualcomm.com, gaolez@qti.qualcomm.com,
        miaoqing.pan@oss.qualcomm.com, hangtian.zhu@oss.qualcomm.com
Subject: [PATCH v3 ath-next] wifi: ath12k: Add EHT capabilities to scan probe frame
Date: Fri,  9 Oct 2026 17:55:38 +0800
Message-Id: <20261009095538.2718979-1-gaole.zhang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfXz8VjYoggSF3P
 yfzgYP017kS1/hS9m5X0Cd/vHgP4F4vOnDByt2RaFXjVJ7gPmIVC8GiVxEQZ3n8WBD9sZ0ZaK+M
 y07ayEG2MQg0yA7WdFqDtHUdbLI2ewKRnscN9Vzu0QR+e7LdfxcB+K4s0x6yYpnl2uRwoOcVeLA
 5vh+/nwHJUzjhdnTFJWsYty/jDxO3+KhxY6fsBVppZAvdPWd9RE/kgLUH3zHjRW5kl4K/1j/5A1
 3H1wI9yBAuLkHuAuq8rjSli0QdZy5HC5uinyGbk5UfascfPSUVXyHkVBJIEHFHMOzBcxR8TOJeo
 z+HI1rn0hMll1ot0nURuS53tDmf6yOHfDDdHnqQehZvXfgGycQeB5H339A/Mg3kvhoVBslRjt9+
 6DMWTGYS/XeGioGNpI+abWxldvggQYM3MWuCNZngWfjVUpFAwJbfLl8CtysGr9QCCcKzdMZEoW6
 fywKf34nf+VEs6zP9mA==
X-Proofpoint-GUID: Rw56Thn8n6DLo9SFEEsR7OJ1TvwxgUYo
X-Authority-Analysis: v=2.4 cv=cMB1IVeN c=1 sm=1 tr=0 ts=6ac8ba21 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=b9+bayejhc3NMeqCNyeLQQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=VPXuAqNVT2ewv9QJR4oA:9 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDAzOSBTYWx0ZWRfX1+juX1+lZs6s
 cf7Q7l8JDow694lLQAskQx1jfNd+zI0ZpGLVtA5bKQHMpTqBkNRyZaThovT1IUtMGZRtkOezk00
 Q9lBcQou8axTSvB/wrvk2QD4qsth3Lo=
X-Proofpoint-ORIG-GUID: Rw56Thn8n6DLo9SFEEsR7OJ1TvwxgUYo
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 lowpriorityscore=0
 malwarescore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090039
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_025546_776279_1BB30B47 
X-CRM114-Status: GOOD (  22.20  )
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
v3:
 - Make EHT Capabilities IE programming best-effort during hardware scan
   setup. Log WMI_VDEV_SET_IE_CMDID failures and continue the scan instead
   of aborting it.
 - Move allow_eht next to the other allow_* channel capability flags in
   struct ath12k_wmi_channel_arg.

v2:
 - Clarify the firmware requirements for adding the EHT Capabilities
   element to scan Probe Request frames.
 - Explain why the EHT Capabilities element is configured before each
   hardware scan, covering both reused vdevs and temporary scan vdevs.
 - No code changes.

 drivers/net/wireless/ath/ath12k/core.h |  6 ++++
 drivers/net/wireless/ath/ath12k/mac.c  | 27 ++++++++++++--
 drivers/net/wireless/ath/ath12k/reg.c  |  4 +++
 drivers/net/wireless/ath/ath12k/wmi.c  | 50 ++++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h  | 21 +++++++++++
 5 files changed, 106 insertions(+), 2 deletions(-)

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
index d4116ba0da08..37293083babe 100644
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
@@ -5718,6 +5737,11 @@ static int ath12k_mac_initiate_hw_scan(struct ieee80211_hw *hw,
 			goto exit;
 		}
 		arg->extraie.len = req->ie_len;
+		ret = ath12k_mac_set_scan_eht_cap_ie(ar, arvif, req->ie,
+						     req->ie_len);
+		if (ret)
+			ath12k_dbg(ar->ab, ATH12K_DBG_MAC,
+				   "failed to set eht cap ie, ret %d\n", ret);
 	}
 
 	if (req->n_ssids) {
@@ -8983,8 +9007,7 @@ static void ath12k_mac_copy_eht_cap(struct ath12k *ar,
 
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
index b508aa759bd8..5d0afbf0bd0c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3074,6 +3074,7 @@ struct ath12k_wmi_channel_arg {
 	    allow_ht:1,
 	    allow_vht:1,
 	    allow_he:1,
+	    allow_eht:1,
 	    set_agile:1,
 	    psc_channel:1;
 	u32 phy_mode;
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

