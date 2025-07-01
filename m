Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F9C7C8303B
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 01:06:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FSWxuG/VxPWZ03ViteTJIevi5YvnZOjqTjT+uaZm8Ug=; b=0tx+yeSpT6JT28Gd8OMzUJfU2P
	qbSOzsZH+6FOOlefMIJ0zK1ACtGJ9+RbP0oLz8NRaVH53Hkn0PvYdePXkdmWDdABGRNc30xg9UHOT
	Gwb+QL/ZHh9E3Em4OqDaZGBJiBtMj78g1nV03WvkOGepOLR+/NrQwB20C4e/1vmcnZWKb2/8cT+gE
	kVVZkI+dQy6O8zMRGdrHPvQvL99VMEwvqIf63kxgjZ4AQxXwX6Ph3ywasDl3r/SuRFHPyhQF9+vxB
	bIuOhnk8rC5+NWLPfdAqGKgZxqC8tHoUswNPp5qtG5TgljvSPiK3VBP+ijx8m/6BdQScXD2EZOUtF
	T3Gk93rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPRg-00000003mqg-3aXV;
	Tue, 01 Jul 2025 01:06:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPQB-00000003mc2-09xZ
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 01:04:28 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UG0LA2024769;
	Tue, 1 Jul 2025 01:04:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FSWxuG/VxPWZ03ViteTJIevi5YvnZOjqTjT+uaZm8Ug=; b=YA6VLgoS1db9hgSE
	LsWebVAiY7vFrKvsNv9udyH7a/qxO0t5s3wfRiZTEbAC0GZcpoz1Azm8/LdvwB8i
	ow3J9vt2kL76bhkATThb2wtzHI4OYhl6W30NDrZE6CLVzUTwHjilNKn+JIKdJHLr
	vXZeMyP1cErfzBX7YhsQoU3ZLmpwUlN9qoP+I0nOBbbENThbDy222BpSrnACqqW4
	SpjGeiRXcb8oMSo2+tFwNQjBgkhqCV6liQWd/HKoKabM+xO0K7A5QceCgVQ8CIyA
	p1WY178GfxlT2ZabFYBWdTh4bpWLvzJqG5dqZakC/97dFA/Ca4+0gaZBBnrrgOlh
	ApIfcg==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9ehd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 01:04:25 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56114O47012902
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 01:04:24 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 18:04:24 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH ath-next V15 9/9] wifi: ath12k: add extended NSS bandwidth support for 160 MHz
Date: Mon, 30 Jun 2025 18:04:08 -0700
Message-ID: <20250701010408.1257201-10-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
References: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68633419 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=COk6AnOGAAAA:8 a=Opr4SxZhII4Vei-TI5AA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: fhNo0xxQdaQ0y-utqMA8VKM3me_GcyQY
X-Proofpoint-GUID: fhNo0xxQdaQ0y-utqMA8VKM3me_GcyQY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMyBTYWx0ZWRfX6LzuJ7I3p6P/
 K1WOwDEGBpI3rVFbOuNtyKTPN/jZYqtFYArKHy2vsV/affBzlmNpOS9G04/wO4+OYye5pPLw/T5
 CP0hkxvMVAIR1jGrfHrwhKDb4ofiGejXtw7ueqZvGUiZhCdP8AN1RtHmlrgILsEMSRw375p77Fu
 Z9vfSU+CoZhzlJ4VQn5Tf2KlXsxiROMLqh9pqsu/0Cat057sj2yLqV4LBL5bJA+QAe6mrr2FydS
 q0CG6UW89lT8XUoVsYYjMpEQx9J7wQciuy1mgNdNy60YwUKkvHocCW+6RWY6m9O/s2+j54vtNkO
 CDymrkkL94dBjES9rKLXmDOvhmYB0IdMR7bCW6Q3ttnljWHMYdPMOPhcuzpTQBkAfsO1S4b/jsW
 4lqJnq5oA88b1IAAK01xBpA3oMopkV344zRLFcTYONjimutc1ASD5LwQuR1H0QxOd13f+H5L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=999
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_180427_194979_D700A74E 
X-CRM114-Status: GOOD (  17.32  )
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

Currently rx and tx MCS map for 160 MHz under HE capabilities
are not updating properly, when 160 MHz is configured with NSS
lesser than max NSS support. Fix this by utilizing
nss_ratio_enabled and nss_ratio_info fields sent by firmware
in service ready event.

However, if firmware advertises EXT NSS BW support in VHT caps
as 1(1x2) and when nss_ratio_info indicates 1:1, reset the EXT
NSS BW Support in VHT caps to 0 which indicates 1x1. This is
to avoid incorrectly choosing 1:2 NSS ratio when using the
default VHT caps advertised by firmware.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 33 ++++++++++++++++++++++-----
 1 file changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index c0d58a587d6a..6dd4441ce9a0 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2662,8 +2662,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	arg->peer_nss = min(link_sta->rx_nss, max_nss);
 
 	if (arg->peer_phymode == MODE_11AX_HE160) {
-		tx_nss = ath12k_get_nss_160mhz(ar, max_nss);
+		tx_nss = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
 		rx_nss = min(arg->peer_nss, tx_nss);
+
+		arg->peer_nss = min(link_sta->rx_nss, ar->num_rx_chains);
 		arg->peer_bw_rxnss_override = ATH12K_BW_NSS_MAP_ENABLE;
 
 		if (!rx_nss) {
@@ -7661,6 +7663,12 @@ ath12k_create_vht_cap(struct ath12k *ar, u32 rate_cap_tx_chainmask,
 	vht_cap.vht_mcs.rx_mcs_map = cpu_to_le16(rxmcs_map);
 	vht_cap.vht_mcs.tx_mcs_map = cpu_to_le16(txmcs_map);
 
+	/* Check if the HW supports 1:1 NSS ratio and reset
+	 * EXT NSS BW Support field to 0 to indicate 1:1 ratio
+	 */
+	if (ar->pdev->cap.nss_ratio_info == WMI_NSS_RATIO_1_NSS)
+		vht_cap.cap &= ~IEEE80211_VHT_CAP_EXT_NSS_BW_MASK;
+
 	return vht_cap;
 }
 
@@ -7843,11 +7851,12 @@ static void ath12k_mac_set_hemcsmap(struct ath12k *ar,
 				    struct ieee80211_sta_he_cap *he_cap)
 {
 	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
-	u16 txmcs_map, rxmcs_map;
+	u8 maxtxnss_160 = ath12k_get_nss_160mhz(ar, ar->num_tx_chains);
+	u8 maxrxnss_160 = ath12k_get_nss_160mhz(ar, ar->num_rx_chains);
+	u16 txmcs_map_160 = 0, rxmcs_map_160 = 0;
+	u16 txmcs_map = 0, rxmcs_map = 0;
 	u32 i;
 
-	rxmcs_map = 0;
-	txmcs_map = 0;
 	for (i = 0; i < 8; i++) {
 		if (i < ar->num_tx_chains &&
 		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
@@ -7860,12 +7869,24 @@ static void ath12k_mac_set_hemcsmap(struct ath12k *ar,
 			rxmcs_map |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
 		else
 			rxmcs_map |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+
+		if (i < maxtxnss_160 &&
+		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			txmcs_map_160 |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			txmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
+
+		if (i < maxrxnss_160 &&
+		    (ar->cfg_tx_chainmask >> cap->tx_chain_mask_shift) & BIT(i))
+			rxmcs_map_160 |= IEEE80211_HE_MCS_SUPPORT_0_11 << (i * 2);
+		else
+			rxmcs_map_160 |= IEEE80211_HE_MCS_NOT_SUPPORTED << (i * 2);
 	}
 
 	mcs_nss->rx_mcs_80 = cpu_to_le16(rxmcs_map & 0xffff);
 	mcs_nss->tx_mcs_80 = cpu_to_le16(txmcs_map & 0xffff);
-	mcs_nss->rx_mcs_160 = cpu_to_le16(rxmcs_map & 0xffff);
-	mcs_nss->tx_mcs_160 = cpu_to_le16(txmcs_map & 0xffff);
+	mcs_nss->rx_mcs_160 = cpu_to_le16(rxmcs_map_160 & 0xffff);
+	mcs_nss->tx_mcs_160 = cpu_to_le16(txmcs_map_160 & 0xffff);
 }
 
 static void ath12k_mac_copy_he_cap(struct ath12k *ar,
-- 
2.43.0


