Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7D0AC021AA
	for <ath12k@archiver.kernel.org>; Fri, 21 Feb 2025 04:13:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=n0B6y8tkXgUcXui5Bgn6+Yt50KcL3ujZgLKZMiwbYh0=; b=rL+bcOyi5aK0yf43C5OJsXUUx6
	SsFB4cCdVMAhGxm99umu/DGg+DwHdtzwjpVqPKUdPz6e0x/m9MN2GmpUflZhgErLFwdcoVaNCDiTW
	puFUKJVnJcInzLb/LML3R0EzDl/z8h1iNFfdVSy+xhynOYgsib2ZqAEAY5DFkhvOEWPMGbBsqt/OG
	7jii7A5zdAuqlTiK/m/1SihrCANc/RHldw34chCSkKE4+Njw+jwES8EZInXvxl3/R7Yg6ORNKtw2L
	4uG6HzRoyijJcq5HvLKDcy/AkMHCQZLdCuhzDjsaM/wW4OQLObn0drLKfAdv7uUV9ylVHRmFWaqEa
	IiT/VDmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKPe-000000044Om-2YEi
	for ath12k@archiver.kernel.org;
	Fri, 21 Feb 2025 04:13:18 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlKPc-000000044NW-18ew
	for ath12k@lists.infradead.org;
	Fri, 21 Feb 2025 04:13:17 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51L42mRh031359;
	Fri, 21 Feb 2025 04:13:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=n0B6y8tkXgUcXui5Bgn6+Y
	t50KcL3ujZgLKZMiwbYh0=; b=IX1uCduenUh0HsdxgxbUhdOu7j3NJI+WFnfRO/
	ej0Dbs+x3biGrALcFRkBwOnftSV2fPO9ohHmowkNifDx8+NSqSj9Lu8/Z6Id1ptR
	P07p6ivHQs1UGewQShQkhZvDJGPZeE+nNB+kCncK3m2qE7lK9q0KJdeHPh/M7jF4
	00hniCYQG8+1j16DKBMM8qSNZDwMDbBg7qN6gD3BvWyahwDFSvvsIyB0G08gbyB+
	gWL0lGLlKwK3wThLhcYRnkkig0Quq4HdMTneKeXE8nLGOmOkXtTq33Y/6McPhYrG
	v18TteQumMjfjNFKxp7S1D/RlNWKkZoNTx/ivJkQ0DZ73Pvw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44vyy5gc0j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 04:13:13 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51L4DCGR032551
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 21 Feb 2025 04:13:12 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 20 Feb 2025 20:13:10 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH] wifi: ath12k: Add NULL check to validate tpc_stats
Date: Fri, 21 Feb 2025 09:42:50 +0530
Message-ID: <20250221041250.769491-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Gav0aiUvrpE3li-tYpB951croqOEqAIv
X-Proofpoint-GUID: Gav0aiUvrpE3li-tYpB951croqOEqAIv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-20_09,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 malwarescore=0 mlxscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502210028
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_201316_428652_6F0B23D7 
X-CRM114-Status: GOOD (  17.68  )
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

While processing TPC stats received from firmware, there are chances that
the tpc_stats might not be filled and the data is not available. This can
happen under two scenarios. First, when firmware sends a non-zero event
count before event count 0. When this happens, tpc_stats will be checked
for data before memory allocation and the tpc_stats will be unavailable.
Second, when memory allocation failed when event count received is 0 and
the firmware still sends a non-zero event. When this happens, memory will
not be allocated for tpc_stats though event count is 0, so when non-zero
event count is received, tpc_stats will be empty. There are checks to
validate if tpc_stats variable is filled that are used in two subsequent
places, but these are placed after tpc_stats is dereference without
checking if it is NULL or has valid data.

Fix this by removing the mentioned checks and adding a NULL check after
assigning tpc_stats to check if it is valid.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Closes: https://scan7.scan.coverity.com/#/project-view/52668/11354?selectedIssue=1637145
Fixes: f0c3bb78e42f ("wifi: ath12k: Add Support to Parse TPC Event from Firmware")
Signed-off-by: Roopni Devanathan <quic_rdevanat@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index f934d49acee6..1866293f7159 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -8471,6 +8471,10 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 	}
 
 	tpc_stats = ar->debug.tpc_stats;
+	if (!tpc_stats) {
+		ath12k_warn(ab, "tpc stats memory unavailable\n");
+		goto unlock;
+	}
 
 	if (!(event_count == 0)) {
 		if (event_count != tpc_stats->event_count + 1) {
@@ -8489,13 +8493,12 @@ static void ath12k_wmi_process_tpc_stats(struct ath12k_base *ab,
 				  ath12k_wmi_tpc_stats_event_parser,
 				  tpc_stats);
 	if (ret) {
-		if (tpc_stats)
-			ath12k_wmi_free_tpc_stats_mem(ar);
+		ath12k_wmi_free_tpc_stats_mem(ar);
 		ath12k_warn(ab, "failed to parse tpc_stats tlv: %d\n", ret);
 		goto unlock;
 	}
 
-	if (tpc_stats && tpc_stats->end_of_event)
+	if (tpc_stats->end_of_event)
 		complete(&ar->debug.tpc_complete);
 
 unlock:

base-commit: 2dba67975394b47249189fcf975352105306962b
-- 
2.25.1


