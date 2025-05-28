Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 793F0C5B552
	for <ath12k@archiver.kernel.org>; Wed, 28 May 2025 11:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XvXVrbB9uCBsREJVHQePUtbTeQk8uumQSbPwvo6V9AQ=; b=eQHM0ARW8JZhUKJp9enV+cvARQ
	yufzOE8n/UFL9ZBpYnofV0pimPNG7Bi1NQgpBseu4Jr8AJ/FCebn8a55WVQcULkafD7zFD4X/TA6B
	xoWUxe6LqEBp13FFTabHPf5XLMp0gxdiuUU+7jiD5aQrJOsR+j3TsOigZ4oI0ZYap81UhHlEh6n0B
	F3jTStRJf5vjUqe7BJjaZdvKJoKi8RXxyaUEcHj622cD+34PGaG6YQa3fl8b1sEiN2l7WCOSI2Vp+
	twTxABVLSEQfSwiqpjbjxrgbdN9S7o2bqIExu/mf13OIXTFKtTN4LlQ9sLrK8ZPpEkKoqQ+F+WOqP
	3dLLKZEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEtn-0000000CyI0-0qyo;
	Wed, 28 May 2025 11:24:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKEtZ-0000000CyFB-19MG
	for ath12k@lists.infradead.org;
	Wed, 28 May 2025 11:24:30 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S800wE003699
	for <ath12k@lists.infradead.org>; Wed, 28 May 2025 11:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XvXVrbB9uCBsREJVHQePUtbTeQk8uumQSbPwvo6V9AQ=; b=IeKhaX1NNWkAKW68
	OpWiXPpGYaJ1L27xXREghqeNO/SEV7mQS4gJoOfN7E8E1t5P5LScOs6zxYnFg1BZ
	/wHnrgkb9Rka10WE5wLFjrHT5EopT2yRegROSQHKe7ZkaUW8ygCbU7/4ryZM7jbk
	MEd7m54AsbMbNhw6ha8Tfj5izB1F+A2UPOsjFobg8VbvMphr+Due+RQtNX/t99TL
	wdaSytHoatrlM4BReoaljBCEMHzXfLVJ1mlb5uwllzrULuZLvZzZWFJMImWy0SSM
	x1wiAK1Z7TBrXPw+BNTIWqA67eyeqdXGh7Cg4McYkw6DVKREqY5WkENPCMJmMls6
	YJNAeQ==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u3fqa7dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 28 May 2025 11:24:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-311ef4fb5fdso408275a91.1
        for <ath12k@lists.infradead.org>; Wed, 28 May 2025 04:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748431467; x=1749036267;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XvXVrbB9uCBsREJVHQePUtbTeQk8uumQSbPwvo6V9AQ=;
        b=JNUI89Pb16moxuYEHAHGgbNpeCIiJv2ruGIMYDkQKJ3SMknBXN+fwgcs5vhRdu7Qv2
         5OwWvJI5htWFWYUTBOMFpQagC3Rf5CFAn6f6ABA674SJxWxaHqtBzhiN1E1LFmpJja70
         MXGk6/YZwYpT5jYXTDZf/vkk3BdvaBfpkuNEfJKkov9/UzEasGOzrvxVh5AfvppqEEMQ
         BDQ0lCTe9APXJS3byenygeWNfN5iEzXbp/A5f5p6MyosJfPiJL5BnnvH/WAQh2OLsBwI
         EjUyHqiuKUqphsQvlyEA5P/HqCKxVJfITQ6ZLRHzHwRyv0FcxVxEXyIMTp3r6BYkbS4s
         oDKw==
X-Forwarded-Encrypted: i=1; AJvYcCU4LmX7p1zeTzdj1Pw0M0ItOQk1K6AjndN4Ssi44IH/BTBuWpz0ikddHYt/JpwpoNNASgAkrsE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyt+MiF5s7/X8PhsOhrrxl5j16cRbGR7EXw79hrCU6ek/vBDmhg
	vQwStT1praOLsxXWqPp4CktI9cLDy4Y7lY+4ghnbVwTYiFn3Ip6vSMGJBXSEUQZWKZxosaaXIWS
	jj+EL6WDuuCxKU89/EyHu25i795VOOOydhogcbSNsFFlp+dpjSQmTtRfGL9nrQ/J+
X-Gm-Gg: ASbGnctgQbsx6mbAIDY0UmqTFcV3IWpcgQc0UHdFsBi8nhoeCrd2BLyTOM+eLBZK6Id
	HXYKmQaMgwMt3e27sKzehIvPOOVlsurIvYxigRMW1pz9qYSSE71GIOZqBk6x9KqLGVx4D72Izym
	59DusbYtxWG/AVM/5QE5ZLNwRgSWh5IwI4ROhuLYmRap6P2o3qqQDrPphz47fu7nOXt59xKYQWt
	FhW5pYHKVVw4V2Y8x9lyWZG3zPavsTj2m7bGQ6yDRYesF8P/8zDH0yEPLoEp2uhHXZ2pXDIzfEZ
	g71BvdUOPfr5JPhwJ7t4sWjYZEix3WjDFu5/a5bgZTkCyBW4ldwqzjBLmisEMEcmaVSEPkIz+yd
	FuGO5EeLFiDE2sLdSQDisG8ZITvvp/w39Sies
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919852a91.4.1748431466952;
        Wed, 28 May 2025 04:24:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxrSxa32P/OBuY6Gyr562LgyJoCpcIkhZC7dFxORGWAL6m6RyIoGAXyay4CRbLtlLjYQKkYw==
X-Received: by 2002:a17:90b:3911:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-311f30b0ff9mr1919815a91.4.1748431466513;
        Wed, 28 May 2025 04:24:26 -0700 (PDT)
Received: from hu-adisi-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-311e9b668ffsm954665a91.20.2025.05.28.04.24.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 04:24:26 -0700 (PDT)
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Date: Wed, 28 May 2025 16:54:01 +0530
Subject: [PATCH ath-next 2/2] wifi: ath12k: use real noise floor instead of
 default value
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250528-support_real_noise_floor-v1-2-04507bd3bc76@oss.qualcomm.com>
References: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
In-Reply-To: <20250528-support_real_noise_floor-v1-0-04507bd3bc76@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: k5XY13cZhA_YHyDZo_snQUJeget0zxy-
X-Proofpoint-ORIG-GUID: k5XY13cZhA_YHyDZo_snQUJeget0zxy-
X-Authority-Analysis: v=2.4 cv=X8FSKHTe c=1 sm=1 tr=0 ts=6836f26c cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=14mRfNIsjSzQyU8rJgwA:9 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDEwMCBTYWx0ZWRfXxmzyoZQykT4S
 0cpSy4teDUPwUTATaki0MxdAuQjkJednUop1JkTUnRaTSkX7FX5KuRZNI+Q3eDWXVDQPHMU6EFn
 9ZZrw/Qv9uzPZT9ILujk5y0T4S0EEVQsiaj4woeuNljKpY/tfjCSuBwtgyzWMFbSQH0dKkj3JzI
 U7V6qAWslvDQtDP+fXbFdef8vd6qgDstep2Nd6je5FeE/vOAwIFwvnSFB3NvCkM3kH02yb8thVu
 ObemMbJ0ZEcphI7T7WEjwyQAwNZfg5MY5wWIGJ0MGbVOjhDKLOYobC6EOiWSs8ULrZgLJv8yvDP
 xMNozgAdLV0JZ6eVnftz0TeFVl/r4fBAI66x/E2pnmJQlj+hJQKIaWJ7xeJyPrXsGwop7mR+s8/
 CNvq60B0ztzy91xWRy98Bdvb1NyLYwrjRXgwDlg4Y1T+sR8jiuQm2y6UrCksE16nwqWaWJpp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_05,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 bulkscore=0 mlxlogscore=999
 mlxscore=0 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_042429_449590_00671ED9 
X-CRM114-Status: GOOD (  16.63  )
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

From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

ATH12K_DEFAULT_NOISE_FLOOR represents the approximate noise floor value
which is used for RSSI calculation. Commit "wifi: ath12k: handle WMI event
for real noise floor calculation" added support to get the real noise floor
value from the firmware. Add changes to use the real value now instead of
the default one.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Co-developed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c |  7 ++++++-
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 20 ++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.c    | 10 +++++++---
 drivers/net/wireless/ath/ath12k/wmi.c    |  7 ++++++-
 4 files changed, 35 insertions(+), 9 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 28cadc4167f7875e56eb80407b35cb97d4b19ad2..326bcc94ffee6dbdd8e88d0cc63561e379b95690 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2146,10 +2146,15 @@ static void ath12k_dp_mon_update_radiotap(struct ath12k *ar,
 					  struct ieee80211_rx_status *rxs)
 {
 	struct ieee80211_supported_band *sband;
+	s32 noise_floor;
 	u8 *ptr = NULL;
 
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
 	rxs->flag |= RX_FLAG_MACTIME_START;
-	rxs->signal = ppduinfo->rssi_comb + ATH12K_DEFAULT_NOISE_FLOOR;
+	rxs->signal = ppduinfo->rssi_comb + noise_floor;
 	rxs->nss = ppduinfo->nss + 1;
 
 	if (ppduinfo->userstats[ppduinfo->userid].ampdu_present) {
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index b6816b6c2c0400ea8a027ef4527eea307346bc1f..2d4867668d8c53333da41837a0c9ff9dd282ed73 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -554,6 +554,7 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 	struct ath12k_vif *ahvif;
 	struct ath12k *ar;
 	struct sk_buff *msdu = desc_params->skb;
+	s32 noise_floor;
 
 	skb_cb = ATH12K_SKB_CB(msdu);
 	info = IEEE80211_SKB_CB(msdu);
@@ -592,8 +593,13 @@ ath12k_dp_tx_htt_tx_complete_buf(struct ath12k_base *ab,
 			info->status.ack_signal = ts->ack_rssi;
 
 			if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
-				      ab->wmi_ab.svc_map))
-				info->status.ack_signal += ATH12K_DEFAULT_NOISE_FLOOR;
+				      ab->wmi_ab.svc_map)) {
+				spin_lock_bh(&ar->data_lock);
+				noise_floor = ath12k_pdev_get_noise_floor(ar);
+				spin_unlock_bh(&ar->data_lock);
+
+				info->status.ack_signal += noise_floor;
+			}
 
 			info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 		} else {
@@ -775,6 +781,7 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 	struct ieee80211_vif *vif;
 	struct ath12k_vif *ahvif;
 	struct sk_buff *msdu = desc_params->skb;
+	s32 noise_floor;
 
 	if (WARN_ON_ONCE(ts->buf_rel_source != HAL_WBM_REL_SRC_MODULE_TQM)) {
 		/* Must not happen */
@@ -827,8 +834,13 @@ static void ath12k_dp_tx_complete_msdu(struct ath12k *ar,
 			info->status.ack_signal = ts->ack_rssi;
 
 			if (!test_bit(WMI_TLV_SERVICE_HW_DB2DBM_CONVERSION_SUPPORT,
-				      ab->wmi_ab.svc_map))
-				info->status.ack_signal += ATH12K_DEFAULT_NOISE_FLOOR;
+				      ab->wmi_ab.svc_map)) {
+				spin_lock_bh(&ar->data_lock);
+				noise_floor = ath12k_pdev_get_noise_floor(ar);
+				spin_unlock_bh(&ar->data_lock);
+
+				info->status.ack_signal += noise_floor;
+			}
 
 			info->status.flags = IEEE80211_TX_STATUS_ACK_SIGNAL_VALID;
 		}
diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8ff470749f14545d1c726cc1dc26880e129277fa..e52de62c38e1ce46d3afd6493f1b51587dd3036f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -11042,8 +11042,8 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
 	struct ath12k_fw_stats_req_params params = {};
 	struct ath12k_link_sta *arsta;
+	s8 signal, noise_floor;
 	struct ath12k *ar;
-	s8 signal;
 	bool db2dbm;
 
 	lockdep_assert_wiphy(hw->wiphy);
@@ -11091,15 +11091,19 @@ static void ath12k_mac_op_sta_statistics(struct ieee80211_hw *hw,
 	    !(ath12k_mac_get_fw_stats(ar, &params)))
 		signal = arsta->rssi_beacon;
 
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
 	if (signal) {
-		sinfo->signal = db2dbm ? signal : signal + ATH12K_DEFAULT_NOISE_FLOOR;
+		sinfo->signal = db2dbm ? signal : signal + noise_floor;
 		sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL);
 	}
 
 	sinfo->signal_avg = ewma_avg_rssi_read(&arsta->avg_rssi);
 
 	if (!db2dbm)
-		sinfo->signal_avg += ATH12K_DEFAULT_NOISE_FLOOR;
+		sinfo->signal_avg += noise_floor;
 
 	sinfo->filled |= BIT_ULL(NL80211_STA_INFO_SIGNAL_AVG);
 }
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index e07f1e46ba418a0583a0feaa711ada7b6cd193e2..1287755d6df0c1269f61d91ea06ed9024e975cf6 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -6427,6 +6427,7 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 	struct ieee80211_hdr *hdr;
 	u16 fc;
 	struct ieee80211_supported_band *sband;
+	s32 noise_floor;
 
 	if (ath12k_pull_mgmt_rx_params_tlv(ab, skb, &rx_ev) != 0) {
 		ath12k_warn(ab, "failed to extract mgmt rx event");
@@ -6488,7 +6489,11 @@ static void ath12k_mgmt_rx_event(struct ath12k_base *ab, struct sk_buff *skb)
 		status->freq = ieee80211_channel_to_frequency(rx_ev.channel,
 							      status->band);
 
-	status->signal = rx_ev.snr + ATH12K_DEFAULT_NOISE_FLOOR;
+	spin_lock_bh(&ar->data_lock);
+	noise_floor = ath12k_pdev_get_noise_floor(ar);
+	spin_unlock_bh(&ar->data_lock);
+
+	status->signal = rx_ev.snr + noise_floor;
 	status->rate_idx = ath12k_mac_bitrate_to_idx(sband, rx_ev.rate / 100);
 
 	hdr = (struct ieee80211_hdr *)skb->data;

-- 
2.34.1


