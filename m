Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81760C369AB
	for <ath12k@archiver.kernel.org>; Thu, 24 Apr 2025 04:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RBAUpDlzSXVpGEmX4AuF12p+JQzr74yaDP9W7EF51W4=; b=WSYpq/LwdcmZp/w6P4u/zKm4nb
	6AbFR3Z9+Y22qRsM6rWcpjUfS6JEQiEMa7lJUeGmEe+dhNM2VU6QREi5L3RptvFTlPt2EXLua02JE
	BTOzrapNyz7SU8BdoEvpiekG+S+RXEQ02clDtL913pyevmzE6veT9o4h0Kc6oRY4V9rskUFCqrRfr
	DjHvXRnBzEkYHdqyURV1zxxI/APcG18SazwZJxVOQNKIEQiYq7ZiEBE/WBbGMiJT8JKclbwgw5zsc
	kpjns/6WFigjmZpfdufF8+oHeaIEyE/hw6yT+9kzqO59gPnsAl6ElBUd9/OMegG5ZLs+cOKwWurhd
	mFStEkCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oNu-0000000Cozh-14t0;
	Thu, 24 Apr 2025 04:40:26 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7oNr-0000000Coyu-0Kpf
	for ath12k@lists.infradead.org;
	Thu, 24 Apr 2025 04:40:24 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0FAjT008922;
	Thu, 24 Apr 2025 04:40:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RBAUpDlzSXVpGEmX4AuF12
	p+JQzr74yaDP9W7EF51W4=; b=AsRBFIaShIZPF3ttPGhz1KXBvQ+xAxDtG7O5ZT
	o0NeAGfDwBQqeaWfTl5o84uVGcEFcr7V5QmJnSsYH2QLGHY2maQVt1JXAZPsFzxK
	ezpYkunEd2qFzmyrd+L1OzOcoAB+pckO8yVh59FeJHa/N7zgwNcv3ERE6tJ1qqW4
	MMtBe/MO2OVWU/TjJhMue0ABoTJ0WD8cM+feRIAOJnS3aGP8qS8GhlVO6lezMj4/
	jX54Z12e7WUSjHD7SROusTZooVCL4MKae+ubA5+HO/y2uIDVkjrQmZtBRue32HW6
	sXa6sa380AmRh66Sam7/EedLjdI4pyfwlt61QFMaRdiZouaw==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3c6nm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 04:40:19 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53O4eJOQ011928
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 24 Apr 2025 04:40:19 GMT
Received: from hu-mkumarg-blr.qualcomm.com (10.80.80.8) by
 nasanex01b.na.qualcomm.com (10.46.141.250) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 23 Apr 2025 21:40:17 -0700
From: Mohan Kumar G <quic_mkumarg@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Mohan Kumar G
	<quic_mkumarg@quicinc.com>,
        Dhanavandhana Kannan <quic_dhanavan1@quicinc.com>
Subject: [PATCH ath-next] wifi: ath12k: Send MCS15 support to firmware during peer assoc
Date: Thu, 24 Apr 2025 10:10:00 +0530
Message-ID: <20250424044000.2983913-1-quic_mkumarg@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7QJB3PcngGZKPVzrA8sVQ04Y4YoDkz8w
X-Proofpoint-GUID: 7QJB3PcngGZKPVzrA8sVQ04Y4YoDkz8w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDAyNyBTYWx0ZWRfX90PNQnkCvDmz uGEZBLTuqieF7CcSMNoAtEZ9qLOUwx/KCt//P/3cXxsZOt6DRFcvCxtOkpEDb7kxygBIi4/jSVj PQK3TCLt3UAtpZVL5JnP+rpA660QTd9r5X9p9yLYtChIGO0uD/uon7na81/CA60W44OXhKEJ/0w
 FLGIaTlKCcsqpjRLyAlvBeYvhBgZk8wJMQ3dByCHSdPKcN7molnsXQohx3ghy0KRN9fGa10kqPz AZmi9Gi0BJ70UshEr5bM2GhO7/2Ys33iOb8Winet9KM9fWgnFc88J5Q56q1G+1j6udJMi3/Q3v9 HXvvZn86nm7IUHH5AFAiJVwr3HesvnkQpbjB7/s/nhdd3XH2Vkk+geN2sSslUcUfdPeE0Bi7XyE
 4GCWLlsrIFKwVlhBvxCEm32kjaHqHfpGAwbndbwjia6r26K9HTPqQtKwb3bnicy4HuFf+e/V
X-Authority-Analysis: v=2.4 cv=Mepsu4/f c=1 sm=1 tr=0 ts=6809c0b3 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=_JNsq_4efX1U1AbLB0wA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_01,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0 malwarescore=0
 priorityscore=1501 mlxscore=0 impostorscore=0 clxscore=1011
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250423_214023_135952_31459489 
X-CRM114-Status: GOOD (  13.63  )
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

As per IEEE 802.11be-2024 - 9.4.2.321, EHT operation element
contains MCS15 Disable subfield as the sixth bit, which is set when
MCS15 support is not enabled.

During association, firmware will use this MCS15 flag to enable or
disable the reception of PPDU with EHT-MCS15 capability.

Send MCS15 support to firmware through WMI command during peer assoc.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Co-developed-by: Dhanavandhana Kannan <quic_dhanavan1@quicinc.com>
Signed-off-by: Dhanavandhana Kannan <quic_dhanavan1@quicinc.com>
Signed-off-by: Mohan Kumar G <quic_mkumarg@quicinc.com>
---

Depends-on: https://lore.kernel.org/linux-wireless/20250424043256.2982345-1-quic_mkumarg@quicinc.com/

---
 drivers/net/wireless/ath/ath12k/mac.c | 8 ++++++++
 drivers/net/wireless/ath/ath12k/wmi.c | 8 ++++++--
 drivers/net/wireless/ath/ath12k/wmi.h | 1 +
 3 files changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index d170bca72948..da5468b5a9e3 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2921,6 +2921,7 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	const struct ieee80211_sta_eht_cap *eht_cap;
 	const struct ieee80211_sta_he_cap *he_cap;
 	struct ieee80211_link_sta *link_sta;
+	struct ieee80211_bss_conf *link_conf;
 	u32 *rx_mcs, *tx_mcs;
 
 	lockdep_assert_wiphy(ath12k_ar_to_hw(ar)->wiphy);
@@ -2932,6 +2933,12 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 		return;
 	}
 
+	link_conf = ath12k_mac_get_link_bss_conf(arvif);
+	if (!link_conf) {
+		ath12k_warn(ar->ab, "unable to access link_conf in peer assoc eht set\n");
+		return;
+	}
+
 	eht_cap = &link_sta->eht_cap;
 	he_cap = &link_sta->he_cap;
 	if (!he_cap->has_he || !eht_cap->has_eht)
@@ -3003,6 +3010,7 @@ static void ath12k_peer_assoc_h_eht(struct ath12k *ar,
 	}
 
 	arg->punct_bitmap = ~arvif->punct_bitmap;
+	arg->disable_mcs15 = link_conf->disable_mcs15;
 }
 
 static void ath12k_peer_assoc_h_mlo(struct ath12k_link_sta *arsta,
diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index ea303dca38b5..4721ae346b95 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -2380,6 +2380,10 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		ptr += sizeof(*eht_mcs);
 	}
 
+	/* Update MCS15 capability */
+	if (arg->disable_mcs15)
+		cmd->peer_eht_ops = cpu_to_le32(IEEE80211_EHT_OPER_MCS15_DISABLE);
+
 	tlv = ptr;
 	len = arg->ml.enabled ? arg->ml.num_partner_links * sizeof(*partner_info) : 0;
 	/* fill ML Partner links */
@@ -2420,7 +2424,7 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 
 send:
 	ath12k_dbg(ar->ab, ATH12K_DBG_WMI,
-		   "wmi peer assoc vdev id %d assoc id %d peer mac %pM peer_flags %x rate_caps %x peer_caps %x listen_intval %d ht_caps %x max_mpdu %d nss %d phymode %d peer_mpdu_density %d vht_caps %x he cap_info %x he ops %x he cap_info_ext %x he phy %x %x %x peer_bw_rxnss_override %x peer_flags_ext %x eht mac_cap %x %x eht phy_cap %x %x %x\n",
+		   "wmi peer assoc vdev id %d assoc id %d peer mac %pM peer_flags %x rate_caps %x peer_caps %x listen_intval %d ht_caps %x max_mpdu %d nss %d phymode %d peer_mpdu_density %d vht_caps %x he cap_info %x he ops %x he cap_info_ext %x he phy %x %x %x peer_bw_rxnss_override %x peer_flags_ext %x eht mac_cap %x %x eht phy_cap %x %x %x peer_eht_ops %x\n",
 		   cmd->vdev_id, cmd->peer_associd, arg->peer_mac,
 		   cmd->peer_flags, cmd->peer_rate_caps, cmd->peer_caps,
 		   cmd->peer_listen_intval, cmd->peer_ht_caps,
@@ -2433,7 +2437,7 @@ int ath12k_wmi_send_peer_assoc_cmd(struct ath12k *ar,
 		   cmd->peer_bw_rxnss_override, cmd->peer_flags_ext,
 		   cmd->peer_eht_cap_mac[0], cmd->peer_eht_cap_mac[1],
 		   cmd->peer_eht_cap_phy[0], cmd->peer_eht_cap_phy[1],
-		   cmd->peer_eht_cap_phy[2]);
+		   cmd->peer_eht_cap_phy[2], cmd->peer_eht_ops);
 
 	ret = ath12k_wmi_cmd_send(wmi, skb, WMI_PEER_ASSOC_CMDID);
 	if (ret) {
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index 80fdbc566518..eb93ff059471 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -3833,6 +3833,7 @@ struct ath12k_wmi_peer_assoc_arg {
 	u32 punct_bitmap;
 	bool is_assoc;
 	struct peer_assoc_mlo_params ml;
+	bool disable_mcs15;
 };
 
 #define ATH12K_WMI_FLAG_MLO_ENABLED			BIT(0)

base-commit: d33705bb41ff786b537f8ed50a187a474db111c1
prerequisite-patch-id: 2e7303dfa9efc3a0304fd0d00b82b54ecf374f7b
-- 
2.34.1


