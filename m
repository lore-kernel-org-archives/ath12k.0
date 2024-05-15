Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DA48C25B75
	for <ath12k@archiver.kernel.org>; Wed, 15 May 2024 16:52:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KqgwSud5LHDNcWKkbiosVTYgiYJzP/tgDysaaypB+gg=; b=RUjwe1penHu3HA13kZzPxeAQ7H
	fyGBOI1959DwU3k2SCJ7CWhqWlsMVdDSKwaLBxnQEVQ3EOU5IVRgRXnPY4InA/NhKRg2hRn39rL8s
	uaExd4kmtU7kGJiqI44JUktC7+Oiegm1KhzvEYgEAgzInNZ8RWA66SIvXEyEDz1OG1us7YWdii4yk
	7n0O46HglxmHEhc7uRBhHFr4dugjCX9heP/pFMERs1Og8mqpZrMUilS/RSLY9VUQJpW1khndt/7ON
	FOImaBI3kYfI0TrKn6asCplK2A1p3m7qvaWMnqXAd4doCNQ4LmoeidHWvUBHfiLRTf4UUeQ7FnipV
	rpUAq1fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hs4-00000002BHC-1fjc
	for ath12k@archiver.kernel.org;
	Wed, 15 May 2024 16:52:52 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s7Hrz-00000002BCY-2gDI
	for ath12k@lists.infradead.org;
	Wed, 15 May 2024 16:52:49 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44F90Ynm024005;
	Wed, 15 May 2024 16:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=KqgwSud5LHDNcWKkbios
	VTYgiYJzP/tgDysaaypB+gg=; b=T/yo9jw7QV2tys/Jzf7Uuf/0sAW1Tq/jxYQX
	9j522pW4rSfCdDaGWxoHko8QjEHzV+TPEnRmvOpHbtez41bINCVCGNPWLNdicPC/
	AR7FFVCX6T5ZOBVlImTPPLvAgkzDDzri2plK9JvJ7ooSERibubEwGCmtSjrI0/qS
	WFt8FWxwAddED1XYoSCkyaBsHofMVfDhY21ItVPzbsM0OHHBK4K7df+jYClrDyRH
	yfsQ01+FLUcochrXpd3UWuz8d9tRTMX6OZ8MMz4LyEy3JKHYqj66SC0BjhbRQJdl
	k9IeQb2cUc9f81LDWkujXQsd4juCIXT1ppU8xThWgGYD4qhf2w==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y49ft331w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:52:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44FGqg1B015781
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 15 May 2024 16:52:42 GMT
Received: from pradeepc-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 15 May 2024 09:52:42 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>
Subject: [PATCH V5 04/10] wifi: ath12k: move HE MCS mapper to a separate function
Date: Wed, 15 May 2024 09:52:25 -0700
Message-ID: <20240515165231.12114-5-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240515165231.12114-1-quic_pradeepc@quicinc.com>
References: <20240515165231.12114-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: GYRQD-6UonF7Im6hstHoCQ47UXcIqSSK
X-Proofpoint-GUID: GYRQD-6UonF7Im6hstHoCQ47UXcIqSSK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-15_10,2024-05-15_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 clxscore=1015 phishscore=0
 bulkscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405150119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240515_095248_222723_BC4EF5C2 
X-CRM114-Status: GOOD (  12.80  )
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

Refactor the HE MCS mapper functionality in
ath12k_mac_copy_he_cap() into a new function.

This helps improve readability, extensibility and will be used
when adding support for 160 MHz bandwidth in subsequent patches.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 22 ++++++++++++++--------
 1 file changed, 14 insertions(+), 8 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index f58558a52eef..e60da45b9c7f 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -5162,12 +5162,24 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
 	return cpu_to_le16(bcap->he_6ghz_capa);
 }
 
+static void ath12k_mac_set_hemcsmap(struct ath12k_band_cap *band_cap,
+				    struct ieee80211_sta_he_cap *he_cap)
+{
+	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
+
+	mcs_nss->rx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
+	mcs_nss->tx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
+	mcs_nss->rx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->tx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->rx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+	mcs_nss->tx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
+}
+
 static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 				   int iftype, u8 num_tx_chains,
 				   struct ieee80211_sta_he_cap *he_cap)
 {
 	struct ieee80211_he_cap_elem *he_cap_elem = &he_cap->he_cap_elem;
-	struct ieee80211_he_mcs_nss_supp *mcs_nss = &he_cap->he_mcs_nss_supp;
 
 	he_cap->has_he = true;
 	memcpy(he_cap_elem->mac_cap_info, band_cap->he_cap_info,
@@ -5205,13 +5217,7 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
 		break;
 	}
 
-	mcs_nss->rx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
-	mcs_nss->tx_mcs_80 = cpu_to_le16(band_cap->he_mcs & 0xffff);
-	mcs_nss->rx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->tx_mcs_160 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->rx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-	mcs_nss->tx_mcs_80p80 = cpu_to_le16((band_cap->he_mcs >> 16) & 0xffff);
-
+	ath12k_mac_set_hemcsmap(band_cap, he_cap);
 	memset(he_cap->ppe_thres, 0, sizeof(he_cap->ppe_thres));
 	if (he_cap_elem->phy_cap_info[6] &
 	    IEEE80211_HE_PHY_CAP6_PPE_THRESHOLD_PRESENT)
-- 
2.17.1


