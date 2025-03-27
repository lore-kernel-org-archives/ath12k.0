Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46C94C36012
	for <ath12k@archiver.kernel.org>; Thu, 27 Mar 2025 05:14:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2r0Um5xO8gzO+oVruCcQjq9bKDlrDLIuqpD4RX1BCfo=; b=QV/s8J0eqeUgKZSQTx7fmfq4lt
	guDIWQHT984L0neFdxKRVG7kZQuuR82IMdOl86Phc++KDqO19SIfe6/UthX5xM1ValbwFO2oueAqj
	OiCO/VDkkcc71NfnZ93UppbkFIhqilYfDV6g5V4Azocj1Q0luwqKzP4gBFd5TyvsT/572YhzE+Ae3
	qFo44oM/Kcb/0vFX1I/fLmw7nk8MPesxztSr/MASlF0PPOsgRx9dI4K4CaqawgkhLNZIUeaS2uWaW
	wVx1kt6b9F0uIcG4Z/S+6FeWGiQWOTFjox2SJuIV65o6zaxN30RvBdgvRx56f45cJk8M+MrxuDeXn
	NchgHjww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZa-0000000ACld-07as
	for ath12k@archiver.kernel.org;
	Thu, 27 Mar 2025 05:14:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZX-0000000ACjv-37Zl
	for ath12k@bombadil.infradead.org;
	Thu, 27 Mar 2025 05:14:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=2r0Um5xO8gzO+oVruCcQjq9bKDlrDLIuqpD4RX1BCfo=; b=n1y9slZ8FfrR9vDo4eoJ0Zx3BK
	7FUaPqEFpvaQ5zvSJpMxkFIEPxPTclhMDu5bzB8CDfZAeiLh1lAypbbm/t8XPNM9aBNRdF4hd9X1i
	oXW+T5ilTR3E+Ct2RsUpj1Zj8vWJCq7jyrnDsGIGF3vtBXuCrhhqnXjCDMLG8a0a8Q18qgyUvmOHZ
	8L0oWj+29ziffoyQa7v2i4Wx0Bd1fAEhE8WWv1jAHZFzxGRwcfmNtyRf6giZxUj5MbWYKiGuJH9YL
	e2RvjnT98WPR2DOtd6Jn8HjBv7ksdI6bCtfNBfGCRDe3yNmphN2ot0TRU0ylz33km1WrLC5XEV3YT
	/iH5pXLw==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txfZT-00000005uxH-1O4m
	for ath12k@lists.infradead.org;
	Thu, 27 Mar 2025 05:14:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52R3oupl009017;
	Thu, 27 Mar 2025 05:14:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2r0Um5xO8gzO+oVruCcQjq9bKDlrDLIuqpD4RX1BCfo=; b=cmQ3tCIUoRMfUbrn
	f/TP1UMAnBIA0jZ+ZYJvKlP3YsEzS3N71JHSWXczdjUIWmAxDjehC4C9AH4BQibR
	+69wTdqRCJL3A3n+oNHC9o3I6odATW5zsaFQ1Qp73LvjgdCXNmK2PcbznI+naP6a
	YxvGP1LRrFh7qncfAueeErJQ0kOG8+GkDI+SuJqo6+YSh/i2xWo9Ax0RQK9fMU4d
	Dk7aMHMLCktjzQvyJD9g2VBL3nwKIXxSiljEXkwkpT+W4xhTeGC2RsCUpoFiB6Kx
	4DsPSBBvFc7kBB7zA8Qft9O9BB1kmkXQCTweF9iSWbjne3Bzt0dllJrPPwQAY7Qu
	23kWXQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45kmd4qcfx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:21 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52R5EKh1024338
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 27 Mar 2025 05:14:20 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 26 Mar 2025 22:13:58 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <johannes@sipsolutions.net>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Ramasamy Kaliappan
	<quic_rkaliapp@quicinc.com>,
        Rameshkumar Sundaram <quic_ramess@quicinc.com>
Subject: [PATCH wireless-next v5 4/4] wifi: ath12k: update EMLSR capabilities of ML Station
Date: Thu, 27 Mar 2025 10:43:20 +0530
Message-ID: <20250327051320.3253783-5-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250327051320.3253783-1-quic_ramess@quicinc.com>
References: <20250327051320.3253783-1-quic_ramess@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: yak0ZCweVjIA__9mQEF8pdtKeogxK0WK
X-Proofpoint-GUID: yak0ZCweVjIA__9mQEF8pdtKeogxK0WK
X-Authority-Analysis: v=2.4 cv=QLZoRhLL c=1 sm=1 tr=0 ts=67e4dead cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=COk6AnOGAAAA:8 a=jWNxWQEV0SOUQj2Pb8EA:9 a=0bXxn9q0MV6snEgNplNhOjQmxlI=:19
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-26_09,2025-03-26_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 phishscore=0
 mlxlogscore=999 mlxscore=0 clxscore=1015 lowpriorityscore=0 suspectscore=0
 bulkscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503270031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_051427_801788_26996709 
X-CRM114-Status: GOOD (  15.18  )
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
 drivers/net/wireless/ath/ath12k/wmi.c | 23 +++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h |  1 +
 3 files changed, 23 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index dfa05f0ee6c9..b2f8cc426c4b 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -3139,6 +3139,7 @@ static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
 	ml->ml_peer_id = ahsta->ml_peer_id;
 	ml->ieee_link_id = arsta->link_id;
 	ml->num_partner_links = 0;
+	ml->eml_cap = sta->eml_cap;
 	links = ahsta->links_map;
 
 	rcu_read_lock();
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 6d1ea5f3a791..a75ff048dc9e 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2166,9 +2166,10 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	struct sk_buff *skb;
 	struct wmi_tlv *tlv;
 	void *ptr;
-	u32 peer_legacy_rates_align;
-	u32 peer_ht_rates_align;
+	u32 peer_legacy_rates_align, eml_pad_delay, eml_trans_delay;
+	u32 peer_ht_rates_align, eml_trans_timeout;
 	int i, ret, len;
+	u16 eml_cap;
 	__le32 v;
 
 	peer_legacy_rates_align = roundup(arg->peer_legacy_rates.num_rates,
@@ -2340,6 +2341,24 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 	ml_params->logical_link_idx = cpu_to_le32(arg->ml.logical_link_idx);
 	ml_params->ml_peer_id = cpu_to_le32(arg->ml.ml_peer_id);
 	ml_params->ieee_link_id = cpu_to_le32(arg->ml.ieee_link_id);
+
+	eml_cap = arg->ml.eml_cap;
+	if (u16_get_bits(eml_cap, IEEE80211_EML_CAP_EMLSR_SUPP)) {
+		/* Padding delay */
+		eml_pad_delay = ieee80211_emlsr_pad_delay_in_us(eml_cap);
+		ml_params->emlsr_padding_delay_us = cpu_to_le32(eml_pad_delay);
+		/* Transition delay */
+		eml_trans_delay = ieee80211_emlsr_trans_delay_in_us(eml_cap);
+		ml_params->emlsr_trans_delay_us = cpu_to_le32(eml_trans_delay);
+		/* Transition timeout */
+		eml_trans_timeout = ieee80211_eml_trans_timeout_in_us(eml_cap);
+		ml_params->emlsr_trans_timeout_us =
+					cpu_to_le32(eml_trans_timeout);
+		ath12k_dbg(ar->ab, ATH12K_DBG_WMI, "wmi peer %pM emlsr padding delay %u, trans delay %u trans timeout %u",
+			   arg->peer_mac, eml_pad_delay, eml_trans_delay,
+			   eml_trans_timeout);
+	}
+
 	ptr += sizeof(*ml_params);
 
 skip_ml_params:
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 1ba33e30ddd2..c74e65d6a224 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3754,6 +3754,7 @@ struct peer_assoc_mlo_params {
 	u32 ieee_link_id;
 	u8 num_partner_links;
 	struct wmi_ml_partner_info partner_info[ATH12K_WMI_MLO_MAX_LINKS];
+	u16 eml_cap;
 };
 
 struct wmi_rate_set_arg {
-- 
2.34.1


