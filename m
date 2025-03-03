Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35E31C282C6
	for <ath12k@archiver.kernel.org>; Mon,  3 Mar 2025 22:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYVAsJHEWpGl0mKEZdYbpJvkvhFY5YzccQe4/deTjJY=; b=D+07vX1kOFPl2L+my518L/Cd7w
	p7MtikhmKxuX0CCD5YGCmZRfErioW2q6eykKgpVoWG29XkmgIHie4s8FG+5jf+V54JklXfuxH4Cuj
	1tCIj+kpBCe5cifFapSzLdvCmQydNt82MjXJDjsmHbxsfWf6Q4gNlqKv7e+Q5oA42Sa8YcVW3tkc8
	DDyPR13hQzmCss8czR/go4scj7TaowqBFXKxrKCRlUYQdiRe/maYKYA/UDUm3yZmjIoU4pcHTw/4C
	6e9QawqzDP+E9KiyLiGhs2qT7F85v7D0cFD1lvLoYkSsO52RuDW2LEMWTlA+xNAOGYsd32I9dczgd
	+Hj3sJBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE81-00000002SEy-49W9
	for ath12k@archiver.kernel.org;
	Mon, 03 Mar 2025 22:19:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpE7z-00000002SD4-37zp
	for ath12k@lists.infradead.org;
	Mon, 03 Mar 2025 22:19:12 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 523K1tKs028371;
	Mon, 3 Mar 2025 22:19:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BYVAsJHEWpGl0mKEZdYbpJvkvhFY5YzccQe4/deTjJY=; b=oH1iT5VutcjAlogH
	ZRKcl/iyrp6WJ5nsG5s/5M9R83mI/lEaxGWbBMCDrsI+RqIJFOFUL/YtLP1GLq/j
	Y75KcePuD3zvLrpgoaCDT+k/rMj2PCdKssn7uabYKzSu1xpouod4WTHr8FRqCmxA
	P5zpoSRqhi3JB2QEyNpJV37miHAap4/Aoyahq+KZguHJFZ8hpDskypWNMTapQo6g
	SM47cGk+1nu+Qt8CgSNSHt121N18nx9zX5KZEMt2OJ7QAUzbwzPe7Xbxxp53D522
	P+v5vxqK079tx90RrO8iBjH+6/+U7pKNHTDJKKSEmVCOBBQ4wMCx7/beyjZUF1kb
	PAj36A==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 453tm5p9cs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 03 Mar 2025 22:19:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 523MJ9ln015942
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 3 Mar 2025 22:19:09 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Mar 2025 14:19:07 -0800
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>, <ath12k@lists.infradead.org>,
        "Ramasamy
 Kaliappan" <quic_rkaliapp@quicinc.com>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v3 4/4] wifi: ath12k: update EMLSR capabilities of ML Station
Date: Tue, 4 Mar 2025 03:48:43 +0530
Message-ID: <20250303221843.1809753-5-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250303221843.1809753-1-quic_ramess@quicinc.com>
References: <20250303221843.1809753-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 0r8wXD-0FJjMF5Ili3rOmjF_C5EEOoOD
X-Proofpoint-GUID: 0r8wXD-0FJjMF5Ili3rOmjF_C5EEOoOD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-03_11,2025-03-03_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 mlxlogscore=999 suspectscore=0
 priorityscore=1501 adultscore=0 clxscore=1015 bulkscore=0 mlxscore=0
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2503030171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_141911_908036_F44CD28A 
X-CRM114-Status: GOOD (  15.37  )
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

From: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>

When EMLSR operation is enabled for an ML Station, EMLSR transition
timeout, padding delay and transition delay should be updated to
Firmware. Above parameters will be used by Firmware to do EMLSR operation
such as sending EML operation mode notification frame, initial control
frame etc.
Obtain above parameters from EML capabilities information present in
ieee80211_sta object and update the same to Firmware in peer assoc WMI
command sent for ML station.
MLO is not enabled in WCN7850 and hence this change is not applicable to
it as of now. This can be a leverage once it is enabled in future.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Signed-off-by: Ramasamy Kaliappan <quic_rkaliapp@quicinc.com>
Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c |  1 +
 drivers/net/wireless/ath/ath12k/wmi.c | 21 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 3 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 2d062b5904a8..91aca62e3589 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3057,6 +3057,7 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	ml->ml_peer_id = ahsta->ml_peer_id;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
+	ml->eml_cap = sta->eml_cap;
 	links = ahsta->links_map;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 4dd6cdf84571..625d5a0c9453 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2107,8 +2107,9 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	struct wmi_tlv *tlv;
 	void *ptr;
 	u32 peer_legacy_rates_align;
-	u32 peer_ht_rates_align;
+	u32 peer_ht_rates_align, eml_delay, eml_trans_timeout;
 	int i, ret, len;
+	u16 eml_cap;
 	__le32 v;
 
 	peer_legacy_rates_align = roundup(arg->peer_legacy_rates.num_rates,
@@ -2280,6 +2281,24 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	ml_params->logical_link_idx = cpu_to_le32(arg->ml.logical_link_idx);
 	ml_params->ml_peer_id = cpu_to_le32(arg->ml.ml_peer_id);
 	ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
+
+	eml_cap = arg->ml.eml_cap;
+	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
+		/* Padding delay */
+		eml_delay = ieee80211_emlsr_pad_delay_in_us(eml_cap);
+		ml_params->emlsr_padding_delay_us = cpu_to_le32(eml_delay);
+		/* Transition delay */
+		eml_delay = ieee80211_emlsr_trans_delay_in_us(eml_cap);
+		ml_params->emlsr_trans_delay_us = cpu_to_le32(eml_delay);
+		/* Transition timeout */
+		eml_trans_timeout = ieee80211_eml_trans_timeout_in_us(eml_cap);
+		ml_params->emlsr_trans_timeout_us = cpu_to_le32(eml_trans_timeout);
+		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi peer (%pM) emlsr padding delay %u, trans delay %u trans timeout %u",
+			   arg->peer_mac, ml_params->emlsr_padding_delay_us,
+			   ml_params->emlsr_trans_delay_us,
+			   ml_params->emlsr_trans_timeout_us);
+	}
+
 	ptr += sizeof(*ml_params);
 
 skip_ml_params:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index b6a197389277..060bf097d4f5 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3718,6 +3718,7 @@ struct peer_assoc_mlo_params {
 	u32 ieee_link_id;
 	u8 num_partner_links;
 	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
+	u16 eml_cap;
 };
 
 struct wmi_rate_set_arg {
-- 
2.34.1


