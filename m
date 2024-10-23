Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07EB5D2E016
	for <ath12k@archiver.kernel.org>; Wed, 23 Oct 2024 06:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9F5+3SyJi3HXysrmFef3nEPWLR39X3yDiSrjaO+fm7w=; b=AgLCI3ZSqCINZqIcR1AHvZamyf
	wXG9C6NJTOjXH+5uFcA1B05BAZANagdrmY3d/YGesdF4ARmgPN5ccVaU2hO1LMgZwlsT0uvpjwxrS
	zBWMZAc38CSkvjPPp14F0COEN9drlZdXu7nst6Fj4CNP7lA8YG3NA3CqR9rHgZT3rLQnS+/n5dEP1
	BVwD+Mt30MTE9FnLGTcQeLzSP9dlf0p2TinLCtoUk94kQk7QGMKb84dw4J/JVkygK/OLsZB4FVFsX
	+QmycKHcCNdvdVvh4T9RKs2l8mqw1qWzDDtiBgqd67L/3zZDM9dUBBC+rYyxHtFJdyOOpk7V0MlCR
	dTuxOxNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UUI-0000000D8U7-1xSC
	for ath12k@archiver.kernel.org;
	Wed, 23 Oct 2024 06:04:54 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3UUF-0000000D8S4-3Yql
	for ath12k@lists.infradead.org;
	Wed, 23 Oct 2024 06:04:53 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49MLaD9R027445;
	Wed, 23 Oct 2024 06:04:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9F5+3SyJi3HXysrmFef3nEPWLR39X3yDiSrjaO+fm7w=; b=m8SRo0RXscw9nYp+
	2AUDwDN50dhjyajM6fzRAT8f/DELgIV9/7Dn4+IEYhtFgXoS5cOS5c0Fe/VB0zQ7
	dR67dyKY0z9AMtBfR6YpUIXnH9szlggcfUf7LDKKxmeBW7XoWlVxEyhQBasKmY1u
	vbTjLGsv6HFJTwFPhLRb0bZ3Xk8h8vKIOvUK4WnKCPFow8GIXyReEusYqnw509Mu
	dWW6y53XMOXgrIFn5/8JFIimKa7k4dcBTE71QEV9DyStZcDBMYDpWbPEDgbDo0rJ
	bjjAcAR4nfGffcRtGXHHUpeBT5gCURzFSAxi1WLHKu6h1qO6lDeS9vjN+/CQI61s
	8i8ecg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42em41s0q4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49N64eve016789
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 23 Oct 2024 06:04:40 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 23:04:35 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Kalle Valo <kvalo@kernel.org>,
        "Rob
 Herring" <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        "Conor
 Dooley" <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>,
        "Bjorn
 Andersson" <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-arm-msm@vger.kernel.org>,
        Aditya Kumar Singh <quic_adisi@quicinc.com>,
        Kalle Valo <quic_kvalo@quicinc.com>
Subject: [RFC PATCH 5/6] wifi: ath12k: assign unique hardware link IDs during QMI host cap
Date: Wed, 23 Oct 2024 11:33:51 +0530
Message-ID: <20241023060352.605019-6-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
References: <20241023060352.605019-1-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: rpXHHXZlA3lf6xD1Fl7u6nVa-CP7cpIh
X-Proofpoint-ORIG-GUID: rpXHHXZlA3lf6xD1Fl7u6nVa-CP7cpIh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 impostorscore=0
 adultscore=0 bulkscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410230035
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_230452_033124_D37878C5 
X-CRM114-Status: GOOD (  16.47  )
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

From: Aditya Kumar Singh <quic_adisi@quicinc.com>

Currently, in the QMI host capability, the device index, the number of
local links, and the corresponding hardware link IDs are sent. The hardware
link ID assignment is based on the local variable hw_link_id, which starts
from 0 and ranges up to num_local_links in the device. Starting from 0 is
not ideal because it can result in the same link ID being assigned to
different devices in certain scenarios (for example split mac). Hence, for
MLO to function seamlessly, the hardware link IDs across devices need to
be unique.

To address this, a previous change already read the device ID from the
Device Tree (DT) and stored it. This device ID will now be used as the
starting index for the hardware link IDs. This ensures that the hardware
link IDs assigned are unique across all devices.

While at it, add debug prints to clearly show the MLO capability
advertisement sent during QMI host capability exchange.

Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 18 +++++++++++++++---
 1 file changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 689171b7b19f..24aa74fa1c85 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2060,6 +2060,12 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	req->mlo_num_chips_valid = 1;
 	req->mlo_num_chips = ag->num_devices;
 
+	ath12k_dbg(ab, ATH12K_DBG_QMI, "MLO Capability advertisement:");
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * device_id: %d", req->mlo_chip_id);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * group_id: %d", req->mlo_group_id);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * num_devices: %d", req->mlo_num_chips);
+	ath12k_dbg(ab, ATH12K_DBG_QMI, " * Devices info:");
+
 	mutex_lock(&ag->mutex_lock);
 	for (i = 0; i < ag->num_devices; i++) {
 		info = &req->mlo_chip_info[i];
@@ -2074,13 +2080,19 @@ static int ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 		info->chip_id = partner_ab->device_id;
 		info->num_local_links = partner_ab->qmi.num_radios;
 
-		ath12k_dbg(ab, ATH12K_DBG_QMI, "MLO device id %d num_link %d\n",
-			   info->chip_id, info->num_local_links);
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "   * device_id: %d",
+			   info->chip_id);
+		ath12k_dbg(ab, ATH12K_DBG_QMI, "     * num_links: %d",
+			   info->num_local_links);
 
 		for (j = 0; j < info->num_local_links; j++) {
-			info->hw_link_id[j] = hw_link_id;
+			info->hw_link_id[j] = partner_ab->wsi_index + j;
 			info->valid_mlo_link_id[j] = 1;
 
+			ath12k_dbg(ab, ATH12K_DBG_QMI,
+				   "       * hw_link_id: %d\n",
+				   info->hw_link_id[j]);
+
 			hw_link_id++;
 		}
 	}
-- 
2.34.1


