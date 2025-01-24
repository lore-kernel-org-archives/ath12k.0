Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 549B3C0218B
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 04:42:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=S9wIXhnONcXDt1MDShMxJnBuyLVTBFG7R8lAv0qp/xo=; b=EqENgzphTNYESiMme+/tkgjmYG
	RN3pc0I8LE/uKSKIh23jRCQIboy19RsrNFQgGh7ICwKhSv3/tBy78jjgXFUvL8BZ8PS4JR7mfO9YD
	YULbdHPVn5j+gTzUYn1KAxHhAc+BPplCXxjp+eqcvyFgfMQ/ZSzo4rDepP4rj6lfUe3p4V/ISOQ/S
	UHVngNZ5FgjDKgkZDUczWBSDf+8Nr4T07nBmCaFFwyPUXPwhUILVYHDeu0nonVzxOlRaSHVSc+ait
	W9uJno9pQVJVyBEQUul041d2YI+ywUMCYR7dZuMOzFpFHadCZ6e+fDXAad5U/l22HfjSfklpBJVGf
	EKUfXfAw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBWM-0000000Dtro-0Nd4
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 04:42:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbBWJ-0000000Dtq9-2HKA
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 04:42:16 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50NK1YYr024963;
	Fri, 24 Jan 2025 04:42:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9wIXhnONcXDt1MDShMxJnBuyLVTBFG7R8lAv0qp/xo=; b=oFH0MVXMIgH57zy9
	0xTmuKf/IoR6Nw8He4xU2b7oad47ZRUoj8Gy5e0qfutx5BZXHChEgo/yKV1+0Vhh
	7rr0SITQBgQPqp5Q/terLSQe/+gZglEJ1iNoJ+cWYOnIRqTx5elPC4DNZoloElWa
	Fmdlg8zkdY2o2CKgeCiJ/iUXOBtsrclMbo48EiCJDqEBUnHolK0nQZKghVhf/+uN
	oAlvIibkWwlBZ2oNZaPLZiyxTX6eOF+vwqpVls63epF0sdqFsc9jiTgeOb3nHxGT
	IAdqvqatFSvH+VvlctjzMHjwBsxWVACjptnb1WgVy8RJUVCMOZwlZLO3ao6K8waP
	SbbZ0g==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44bvengv46-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:42:13 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50O4gDx3031583
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 04:42:13 GMT
Received: from hu-adisi-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 23 Jan 2025 20:42:09 -0800
From: Aditya Kumar Singh <quic_adisi@quicinc.com>
Date: Fri, 24 Jan 2025 10:11:31 +0530
Subject: [PATCH v3 08/10] wifi: ath12k: handle ath12k_core_restart() with
 hardware grouping
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20250124-fix_reboot_issues_with_hw_grouping-v3-8-329030b18d9e@quicinc.com>
References: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
In-Reply-To: <20250124-fix_reboot_issues_with_hw_grouping-v3-0-329030b18d9e@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        Harshitha Prem
	<quic_hprem@quicinc.com>
CC: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Kalle Valo
	<quic_kvalo@quicinc.com>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Aditya Kumar
 Singh" <quic_adisi@quicinc.com>
X-Mailer: b4 0.14.2
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: j6n0m-gM0uAmSQqfPSM653WE8cqWN88D
X-Proofpoint-ORIG-GUID: j6n0m-gM0uAmSQqfPSM653WE8cqWN88D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_01,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 adultscore=0 spamscore=0 priorityscore=1501 impostorscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_204215_606598_71B7F780 
X-CRM114-Status: GOOD (  14.72  )
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

Currently, when ath12k_core_restart() is called and the ab->is_reset flag
is set, it invokes ieee80211_restart_hw() for all hardware in the same
group. However, other hardware might still be in the recovery process,
making this call inappropriate with grouping into picture.

To address this, add a condition to check if the group is ready. If the
group is not ready, do not call ieee80211_restart_hw().

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1

Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.c b/drivers/net/wireless/ath/ath12k/core.c
index 25a5beb79e0120af2c9183ad787818572a41476a..95478b69af25448428d1621b163da794520672eb 100644
--- a/drivers/net/wireless/ath/ath12k/core.c
+++ b/drivers/net/wireless/ath/ath12k/core.c
@@ -1410,12 +1410,22 @@ static void ath12k_core_restart(struct work_struct *work)
 			ath12k_dbg(ab, ATH12K_DBG_BOOT, "reset success\n");
 		}
 
+		mutex_lock(&ag->mutex);
+
+		if (!ath12k_core_hw_group_start_ready(ag)) {
+			mutex_unlock(&ag->mutex);
+			goto exit_restart;
+		}
+
 		for (i = 0; i < ag->num_hw; i++) {
-			ah = ath12k_ag_to_ah(ab->ag, i);
+			ah = ath12k_ag_to_ah(ag, i);
 			ieee80211_restart_hw(ah->hw);
 		}
+
+		mutex_unlock(&ag->mutex);
 	}
 
+exit_restart:
 	complete(&ab->restart_completed);
 }
 

-- 
2.34.1


