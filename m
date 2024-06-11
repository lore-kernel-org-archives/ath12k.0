Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED213C27C55
	for <ath12k@archiver.kernel.org>; Tue, 11 Jun 2024 03:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lSF7K0QCk2FNSq7F2Me6ONaGFhu/zqjDbTFaln5NWy4=; b=d30Cm6ptHFWQTY2nwWTI00gLxY
	qDdgoFiHj+x9s8TXMtq2m5wFSzCezQ7ys3StqISZcCVlc5fItHmk0YuHpSFaVkaW2Fqx6WQ+weDKW
	EGz2mT9/32dzepIhKiuDvFloHMWH/8OyQ+Yq1cNvtD+P5IQgATg2x+vsh25bd43bSgk7UeWq8Mmvs
	EaZAZIdyMcJkMf4wDU/t5WXk7Eb5kRIREQXkbaOKR4gPXOu80rCeYcbkE2xv694vG0vpODlCZ6/IN
	kz3cpTNV7sG9z8EQ11ET2X0/FxPRPNJ97TMh9826TX+iAFGWDyhzGEaDHXzo5wF/sovq1rh1xIa3a
	/Lfa3rLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruP-00000007ECp-0YQU
	for ath12k@archiver.kernel.org;
	Tue, 11 Jun 2024 03:10:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sGruM-00000007EAr-0aYs
	for ath12k@lists.infradead.org;
	Tue, 11 Jun 2024 03:10:51 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45ADc7BL016993;
	Tue, 11 Jun 2024 03:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lSF7K0QCk2FNSq7F2Me6ONaGFhu/zqjDbTFaln5NWy4=; b=m9VbVC9e7wVshOVq
	cgm0kIrqPfqk+Z7jrJIpgDkJXTExsDM0R6YjW3oKHkFVtKuW7f1Ak6n76gnnzydM
	0TWMHnyBUU1FVRqSuI6WRcoxX1x7TDUL+WX5N+3rzMbAHm07Lk21q4eOh58MWHbA
	+TIMPyUg+rn5BvThlKt60TgeIYPxkVhAyJOFk3tI5kHZjZKov9k8b70cHjQb962J
	MGFKYps4hJTat2OHgBGX0ZQNJufLVOdwIqrJxarb1JIKO2KmpqrujosRSqH7aAgR
	ivXHiDUWSze5meXm/59jCW64OUlA2NOVJ+3XyC97KTO4QhERM+DJJKkVtwo5CS6h
	PIDpxg==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ymcnmw3yf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:40 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45B3AdWQ029283
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 11 Jun 2024 03:10:39 GMT
Received: from hu-aarasahu-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 10 Jun 2024 20:10:37 -0700
From: Aaradhana Sahu <quic_aarasahu@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()
Date: Tue, 11 Jun 2024 08:40:17 +0530
Message-ID: <20240611031017.297927-3-quic_aarasahu@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
References: <20240611031017.297927-1-quic_aarasahu@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: Q6auLuY8fWEc4VZMY1BHnILh4iavVYqO
X-Proofpoint-ORIG-GUID: Q6auLuY8fWEc4VZMY1BHnILh4iavVYqO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-10_08,2024-06-10_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0 spamscore=0
 priorityscore=1501 malwarescore=0 mlxscore=0 mlxlogscore=999 bulkscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406110022
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240610_201050_340165_1C8A0AF3 
X-CRM114-Status: GOOD (  10.81  )
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

Smatch throws following errors

drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.
drivers/net/wireless/ath/ath12k/mac.c:1922 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_160'.
drivers/net/wireless/ath/ath12k/mac.c:1924 ath12k_peer_assoc_h_he() error: uninitialized symbol 'rx_mcs_80'.

In ath12k_peer_assoc_h_he() rx_mcs_80 and rx_mcs_160 variables
remain uninitialized in the following conditions:
1. Whenever the value of mcs_80 become equal to
   IEEE80211_HE_MCS_NOT_SUPPORTED then rx_mcs_80 remains uninitialized.
2. Whenever phy capability is not supported 160 channel width and
   value of mcs_160 become equal to IEEE80211_HE_MCS_NOT_SUPPORTED
   then rx_mcs_160 remains uninitialized.

Initialize these variables during declaration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 4fea411545bc..3f2fd32d2ed8 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2050,7 +2050,9 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 {
 	const struct ieee80211_sta_he_cap *he_cap = &sta->deflink.he_cap;
 	int i;
-	u8 ampdu_factor, rx_mcs_80, rx_mcs_160, max_nss;
+	u8 ampdu_factor, max_nss;
+	u8 rx_mcs_80 = IEEE80211_HE_MCS_NOT_SUPPORTED;
+	u8 rx_mcs_160 = IEEE80211_HE_MCS_NOT_SUPPORTED;
 	u16 mcs_160_map, mcs_80_map;
 	bool support_160;
 	u16 v;
-- 
2.34.1


