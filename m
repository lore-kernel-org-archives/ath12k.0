Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E241EC369CA
	for <ath12k@archiver.kernel.org>; Thu, 17 Apr 2025 04:57:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZCj09mrhYiWP/ICVXwbfcaxFOd2mlq2OOC0j5V0N5C8=; b=TSHYslflCilR8FqdPVVFbHxH2v
	/K5lKfmxLF1YZnfu+NJHjvJa+RHtvUpATM8GxQp9fkJ5gFUILzAln3Ff1zltmVRMmblTqnUJJUVwl
	Aqp6qE3gWtVgwMiUdYQEVqNPzSTw2Ky9Tsewf4qyc6+KVrioCpKLPEDmKZu7vMXn0AlF+Svq3lABD
	yV36YVjJUuX+LQkUfRLx8zGSBg4twQJWT/rwU+HzVkCT9AHV2i/80qJxFJphvFF6R3e8n/feQ8twV
	vzMFuqatccXsKY+vOXBP9yk9pis65XnSe/hAD6kPaWnDqOs2nbIB4NjnETfaYDAh0+/7owQTKZzv2
	fTQD0oZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJh-0000000BijG-2WJ8;
	Thu, 17 Apr 2025 04:57:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5HJe-0000000Bihc-3gwp
	for ath12k@lists.infradead.org;
	Thu, 17 Apr 2025 04:57:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMK2b3022364;
	Thu, 17 Apr 2025 04:57:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZCj09mrhYiWP/ICVXwbfcaxFOd2mlq2OOC0j5V0N5C8=; b=lF3Ra/NfVR1u+545
	eNd6+b6V2AG0KP3sA2a6RYexA5cVyCSJd7EM9nDVfcVRbzWbp8zC6mT1nEqaVm8A
	/xyuompV5b65UHqnmqrktpWQeNmzQXzWhnBtISgydyDgcYHbZAsgaTwCNvgRBgKh
	zQnwTM7Z+3HxjRsGhFXpwpbUufmAxFstf7gtoL+eGCyyFnlnadOZjQVu7hdg2fTP
	Q8YbbW0NgTsPAPDcMUJiHWz6fOMIASgO1pHY75IbLFF4jozJgncnwHTK1O/T7rX1
	HcH8EYPKdydlCW1h7/vReleoD95SnI+lL+fmlscyPIz00SNyzueid+uZLVyD6v1B
	QbbvlA==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygj9dn6v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:33 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 53H4vXEd008893
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Apr 2025 04:57:33 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 16 Apr 2025 21:57:31 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v5 2/6] wifi: ath12k: correctly fetch arsta for MLO
Date: Thu, 17 Apr 2025 10:27:05 +0530
Message-ID: <20250417045709.770219-3-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250417045709.770219-1-quic_sarishar@quicinc.com>
References: <20250417045709.770219-1-quic_sarishar@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 2S4osqTd_W0lK1n4r5WEFKb1TWhhZEYq
X-Authority-Analysis: v=2.4 cv=PruTbxM3 c=1 sm=1 tr=0 ts=68008a3d cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=W7lknK8chBWqx2lQqA8A:9 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 2S4osqTd_W0lK1n4r5WEFKb1TWhhZEYq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-17_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 priorityscore=1501 malwarescore=0 adultscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 spamscore=0 mlxscore=0 mlxlogscore=649
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504170036
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_215735_039131_42306461 
X-CRM114-Status: GOOD (  13.02  )
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

Currently in ath12k_mac_op_sta_statistics(), link sinfo structure
is filled from arsta structure and arsta is fetched from ahsta->deflink.
For both non-ML and multi-link operation (MLO), deflink is used. While
this is correct for non-ML, but the corresponding link_id should be
used for MLO.

Therefore, add support for MLO by taking the link_id from the
link_sinfo structure, fetching arsta from ahsta->link[link_id], and
filling the link_sinfo structure if valid_links.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1

Signed-off-by: Sarika Sharma <quic_sarishar@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index 10d4a2166915..30643f8db487 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -10503,13 +10503,21 @@ static void ath12k_mac_op_link_sta_statistics(struct ieee80211_hw *hw,
 	struct ath12k_sta *ahsta = ath12k_sta_to_ahsta(sta);
 	struct ath12k_fw_stats_req_params params = {};
 	struct ath12k_link_sta *arsta;
+	int link_id = sinfo->link_id;
 	struct ath12k *ar;
 	s8 signal;
 	bool db2dbm;
 
 	lockdep_assert_wiphy(hw->wiphy);
 
-	arsta = &ahsta->deflink;
+	if (link_id < 0)
+		arsta = &ahsta->deflink;
+	else
+		arsta = wiphy_dereference(hw->wiphy, ahsta->link[link_id]);
+
+	if (!arsta)
+		return;
+
 	ar = ath12k_get_ar_by_vif(hw, vif, arsta->link_id);
 	if (!ar)
 		return;
-- 
2.34.1


