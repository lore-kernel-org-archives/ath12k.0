Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16D52C282EC
	for <ath12k@archiver.kernel.org>; Thu, 13 Mar 2025 17:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f8nVUMrNDHW33iOJwYoY1ObVSkQMh1Ba3jL8eUSV4KM=; b=OkufEn6dh58t4MevDd3gQku6qe
	Q0xkMPCHj40YU1/7u2rxB4UPxENaZixCG3JGx/ZaW6ND7di33HfOOzNB2cxHeGLHyfuypXHyxDXmU
	CGxPOHgMITbsBVjhHbZu108PoYdR2z+mekQaJdI/nEEwOAOQ+glF5yyB+Sy3bKu3TL/7NZWXIkLCj
	SUgNjp4iUTydRWHHuPbz9gPqnNMQMievynnVNCb947Kw5i0V61iqCF9wSwbAMMPUMYuB88PZ1cTzo
	+TIWsQWtdWCZBVYxcLcMnlEyuHsLBJjLPabP2cpDACSsMLklgF7SNHu7yYBZDOeeYw22QqA07u1lT
	UNjvfHcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsm8n-0000000BxGz-231g
	for ath12k@archiver.kernel.org;
	Thu, 13 Mar 2025 17:14:41 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tslJP-0000000BoMM-370f
	for ath12k@lists.infradead.org;
	Thu, 13 Mar 2025 16:21:36 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52DC2hho007381;
	Thu, 13 Mar 2025 16:21:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	f8nVUMrNDHW33iOJwYoY1ObVSkQMh1Ba3jL8eUSV4KM=; b=ivRbanQNpapsCIUz
	/Niw5jBsrVEUfox5vHjNo7yLOS/bKNMgavvFGT9keDAdOC8K6YRwjVgeZbECa5zr
	NgONYd4vo5ylnB5QVOwm9uw+lRddYg4bB6GrfhYNuILRZUK+0KD/ZAMpADtaMiFV
	1QkCcXSMAkTIHPLFGJMtcOnD3nCu0BHxFR6ArrFJEXn/YuZwuark2XPNuXitOVXb
	/RBIvnB/7GatJVt5qxri+/sYXqdn8PhPFpKGRWsIrxEiPg3GjWr/FARSA4aCC3A3
	Dx/39PIKAnRu7TiRhJ6ppI6f5DkKJmKZhrmQO+LyjDT25ispVSOCgzhWK6NjySH1
	0NXSbg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45bpg8a6s2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 16:21:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52DGLYSa002449
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Mar 2025 16:21:34 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 13 Mar 2025 09:21:32 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Vasanthakumar Thiagarajan
	<vasanthakumar.thiagarajan@oss.qualcomm.com>
Subject: [PATCH v9 7/9] wifi: ath12k: fix NULL access in assign channel context handler
Date: Thu, 13 Mar 2025 21:50:58 +0530
Message-ID: <20250313162100.2364049-8-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250313162100.2364049-1-quic_periyasa@quicinc.com>
References: <20250313162100.2364049-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=PtWTbxM3 c=1 sm=1 tr=0 ts=67d3060f cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=On6beQQLwNlP3L0m5AoA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: f8Dp99WRf52V1OXN1wxv2nAX8k1VLJBL
X-Proofpoint-ORIG-GUID: f8Dp99WRf52V1OXN1wxv2nAX8k1VLJBL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-13_07,2025-03-11_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 mlxlogscore=902 impostorscore=0 spamscore=0
 adultscore=0 phishscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503130127
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_092135_785687_7985EE04 
X-CRM114-Status: GOOD (  12.02  )
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

Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
(ar) gets accessed from the link VIF handle (arvif) for debug logging, This
is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
access, avoid radio handle access by moving to the hardware debug logging
helper function (ath12k_hw_warn).

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Fixes: 90570ba4610b ("wifi: ath12k: do not return invalid link id for scan link")
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 9c72cc472901..acc775960adf 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -9462,8 +9462,8 @@ ath12k_mac_op_assign_vif_chanctx(struct ieee80211_hw *hw,
 
 	ar = ath12k_mac_assign_vif_to_vdev(hw, arvif, ctx);
 	if (!ar) {
-		ath12k_warn(arvif->ar->ab, "failed to assign chanctx for vif %pM link id %u link vif is already started",
-			    vif->addr, link_id);
+		ath12k_hw_warn(ah, "failed to assign chanctx for vif %pM link id %u link vif is already started",
+			       vif->addr, link_id);
 		return -EINVAL;
 	}
 
-- 
2.34.1


