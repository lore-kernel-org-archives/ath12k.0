Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 892F8C54E65
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tYXOeicncMlFjsw5kmnB5kxC/Nrj/HibF1jgO4m8lhM=; b=mTQAnPnA4mIyQk8egTDeqe3mEl
	7UdhC/3EvHV88IEoeWJriLhj513u+h5zsSX3ZBobwYJwQCBiTYiR2tgaNBwqHfipHIW7A+8K7ORoQ
	XO8GGMIkFAEBEMgRwRooZdOYIS8p+wek+Co8GET1WQEDBqHZMSWK4LPFAxmouzCa+5Ti0tbDGQrF4
	RD8Tp8Tba0LkAr/+VsIh6QToMhLkllANuU7f8wU0kDayMUrQQ7Bdv5zL3SGJVQRWC/2z1pNT7iz0x
	8Q87IwCGU16gRRPgpbFgX4vVMp/3zI1V43YJO7eMhqH5HyXHBPye887+o0ynDIkqOeIkFUFw8qooS
	S5xNKQBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCC-0000000GxlG-0kLy;
	Wed, 21 May 2025 22:45:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCA-0000000Gxja-115Z
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 22:45:55 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LIDlKw013406;
	Wed, 21 May 2025 22:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tYXOeicncMlFjsw5kmnB5kxC/Nrj/HibF1jgO4m8lhM=; b=UqUMYAcWWQ07Z79h
	GESSroshxr6zIUBw3jr/ESGDCO554RYWZZh9PXJxjTRM3ceCrNHNpCAT+mqXXiWy
	eb+l7G0W+s1l/MStBq7B43CSdKxljZtlkC/JsHk6DQjBacQzVB8qAiq3ShbR/vn7
	ud3kzjHtYsfLvIpi+8wLTkE1in8E/CUFZ4bea866xldnrcOVEa7EuxKwKXj3sLhE
	8n3IsPUIYGLKnEFkmWFZTXTqlEOV9lVYdTxeDAUBxII8PQIKu+dlB/UWffTFTSOd
	aQDPK5N6y8x29E2fugyy2XBSEFskz50Jb60+kJhHFGTgl5cQw+NfymuC9SQJBWaE
	HFZu+w==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5cfg1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMjqn9020293
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:52 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 15:45:52 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>,
        Muna Sinada <quic_msinada@quicinc.com>,
        "Jeff
 Johnson" <quic_jjohnson@quicinc.com>
Subject: [PATCH ath-next V14 3/9] wifi: ath12k: move HE MCS mapper to a separate function
Date: Wed, 21 May 2025 15:45:33 -0700
Message-ID: <20250521224539.355985-4-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
References: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyNiBTYWx0ZWRfX0c42ymLt+PTP
 1OuRw1LMafhFmBy7Y+zhs50WttVxoryUfqamicOcfcFB1N0ReYFgzeQ7geC/w54E8E6mzQDYeie
 WWkPGvuIyvtCjzhBcBwz1A7W/LdsI7Od6+VlXyCuAp4pbCASB7kqVnI7Neak6mvdIQIW5khVLX7
 r/364Kop8/BPQzOVUZf5snfx4TBCgWauiHZQBTJupIn1Tf8+NctUXB8H3QNfu8zJTLVrBA3rtt1
 +yjeNOHom4U/t0u5Vzxu+8XctXsWHoYytfluXbsRo7WNut0MwPSY8GCm7RQ2wDQp0CzdactGb6t
 KCMvNcpkDRjEtOdkNtf2BeVHF1yJKxuibe6qssobLjTadJRkC33xnz5E+hzF6sEZlg7JWok01h4
 OxWFUldQYnF/eQjZYTQcgLyH91h9gWkvz0YJWKGCrg0PlxqeIFS/SQvVNs7qMnsX0qrXb7NV
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682e57a1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=4Pgy4kl5F6fn7-PMLAkA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: CVZHk1FyIP3eCYHbVaXVp1fjSAGIjnVJ
X-Proofpoint-ORIG-GUID: CVZHk1FyIP3eCYHbVaXVp1fjSAGIjnVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_154554_305305_8A32360A 
X-CRM114-Status: GOOD (  13.20  )
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
index 18bf6ad13b5f..5b431444f7f5 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -6994,12 +6994,24 @@ static __le16 ath12k_mac_setup_he_6ghz_cap(struct ath12k_pdev_cap *pcap,
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
@@ -7039,13 +7051,7 @@ static void ath12k_mac_copy_he_cap(struct ath12k_band_cap *band_cap,
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
2.43.0


