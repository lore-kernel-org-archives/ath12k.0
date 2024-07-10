Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A30A3C3DA41
	for <ath12k@archiver.kernel.org>; Wed, 10 Jul 2024 02:18:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=74zCitBFb9ZjqhxUh6FLuePgb223C7VIcVMrRZVNv9Y=; b=e089blEgEjkLhoCmWpCZIJI6Cf
	J31Zw3waQZPW4w7V1AgJkyzq/K2i+FWZL+i4JFrZh4lbZHHG+rQ5Uu9ZzB+RWjmQZKvcuqYVG3Szv
	6PY/MDFq1mhzYVfLl/JXuQplt/gAGZU7QL9YOiojso1K/PGrow1xH0N9srm7FLR4kLcY+eYNYl2Ya
	lAVBsK7RbQY07GRGYXTiBLwZQDYIvhFeEVkg+gX32X8bEdQvACM2eOVkNH7lapAyjQE03EGHjJtJE
	SPVRwSvJdBXz3nv/v2WtANLjpWdFVAr8Wgye3Fz6hF15C2dCYxgyX7at0T5ZE5w7t56QPewGNos+l
	JO3h4sFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRMuv-00000009AIe-1RZC
	for ath12k@archiver.kernel.org;
	Wed, 10 Jul 2024 02:18:49 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sRMus-00000009AHh-18X6
	for ath12k@lists.infradead.org;
	Wed, 10 Jul 2024 02:18:47 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46A1nhgo017547;
	Wed, 10 Jul 2024 02:18:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=74zCitBFb9ZjqhxUh6FLue
	Pgb223C7VIcVMrRZVNv9Y=; b=XW5eNj9cNzR7zRuGkRNcl9ogvhbG5M9XlTWDCx
	/TCGu7Wi0w1ws4eOl8jfwk9qgU6zYX46+0RGn3BQxBwmPTgzBdjJsI8e2eKkfM4N
	7/FMPefmAKM3YEkPRsStTURDYVhOvdHt+ArfrURIkGYA9++uAZpSafOFzmvGC6ON
	djicKLfh1gZPYwCc2c13Sbl1mAkwPza3lZ0HNu3glPRWdoHAkR1OY/ZCuMNYiwK7
	SJ9LRaYY79vshgzZelbXP+t7Gyw34cMynXzXmisAOTbrwDVFD3Sy3yTpH0u+VW9m
	BSWnBF/ZHfwNItfYLtUQAHxfvvWmfXrvk52b2UtUE/X31Cjg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406wg407k2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 02:18:44 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46A2IhHa022120
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 10 Jul 2024 02:18:43 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 19:18:42 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH] wifi: ath12k: fix invalid AMPDU factor calculation in ath12k_peer_assoc_h_he()
Date: Wed, 10 Jul 2024 10:18:19 +0800
Message-ID: <20240710021819.87216-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8mg2sFKn-IDCCw-vX9zAgxe2KWhWtQgx
X-Proofpoint-GUID: 8mg2sFKn-IDCCw-vX9zAgxe2KWhWtQgx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_12,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 clxscore=1011 impostorscore=0 malwarescore=0 mlxscore=0
 bulkscore=0 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2406140001 definitions=main-2407100016
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_191846_334787_32F1C00B 
X-CRM114-Status: GOOD (  11.37  )
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

Currently ampdu_factor is wrongly calculated in
ath12k_peer_assoc_h_he(), fix it.

This is found during code review.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 8106297f0bc1..a7b86e6a2655 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -2196,9 +2196,8 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
 	 * request, then use MAX_AMPDU_LEN_FACTOR as 16 to calculate max_ampdu
 	 * length.
 	 */
-	ampdu_factor = (he_cap->he_cap_elem.mac_cap_info[3] &
-			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK) >>
-			IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK;
+	ampdu_factor = u8_get_bits(he_cap->he_cap_elem.mac_cap_info[3],
+				   IEEE80211_HE_MAC_CAP3_MAX_AMPDU_LEN_EXP_MASK);
 
 	if (ampdu_factor) {
 		if (sta->deflink.vht_cap.vht_supported)

base-commit: 9fddbf081f2da3a20fecda0b58adacbf1379e304
-- 
2.25.1


