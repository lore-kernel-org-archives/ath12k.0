Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EEE2E7718E
	for <ath12k@archiver.kernel.org>; Mon, 23 Dec 2024 06:02:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=93zzcIa73zXBCi9enOq7mvVbH7Y4Eg0x2jMsDwY1iR8=; b=iPyApSzbwIPe8EADNC7QRpNToj
	R6Kw4plVXvV0Ta/5r0G3cka+5j+YgSFRejrV3YGZ9Jt5UPqMfN50CILdnjqPW3oJbIMvtDfa8rtnZ
	JeHhDLUvAzpqi8nHuroqH7XPJ9FG5aoMS0qZvXuZs4zf0XAF0g2ZNc0RnbZhaFa4ds1+scXF1svKa
	iNQHP/eXz+UWMbBL8EiShvqJamKlqHHofIKWOSO9IPXTddfOsVvsAt5xQuAPUHurj2iky+2QL44K2
	08B3dpB3J2Q/1zlCFFlmaDyISXBHOEzBleJ3ujCRaZVdckyPTYArPSwMzqVqcIS2fMhkuFryO/4ZJ
	UthjdR2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbWC-00000009NW7-0hfx
	for ath12k@archiver.kernel.org;
	Mon, 23 Dec 2024 06:02:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPbW3-00000009NMI-49zJ
	for ath12k@lists.infradead.org;
	Mon, 23 Dec 2024 06:02:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BN2rU6M024172;
	Mon, 23 Dec 2024 06:02:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	93zzcIa73zXBCi9enOq7mvVbH7Y4Eg0x2jMsDwY1iR8=; b=jZNH72zZ3FsIxZf0
	O+O6k21Zxp6AVBjpBIhMKm9T3b9gP0pX9+jB+oXyqMJyHse4fwb9zD90Yx18OlAs
	IHcKOKXOxJUEZs6+8m3Q4cteillnBj+2MmeiwbWW28rb8buqTA2L3WvGC+4iYSne
	ac65tsYInqyj5g0v4Ncnt6PX7LH3YYUgT744w836E4JtdnTER8ybho7SPWXIZqXz
	oLcfW/Uot49w2t8gqPXBq07l/KfrBU7di/stkyGtg+W9giwYHnQ9BHyBsu5Nnh79
	uzzxGoAytQ9PU4578Pg1I7BlORV9OftEHmqM7lm2HLG6GlzCxyVmYNSl4mqfZTtA
	Tue1Iw==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43pyft0k0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BN627Bj030641
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 23 Dec 2024 06:02:07 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 22 Dec 2024 22:02:05 -0800
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>
Subject: [PATCH v2 10/14] wifi: ath12k: Optimize NAPI budget by adjusting PPDU processing
Date: Mon, 23 Dec 2024 11:31:28 +0530
Message-ID: <20241223060132.3506372-11-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
References: <20241223060132.3506372-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: EMsveb6W3kEe8UaVK6R3XQiGMp5eBwaC
X-Proofpoint-GUID: EMsveb6W3kEe8UaVK6R3XQiGMp5eBwaC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999
 suspectscore=0 lowpriorityscore=0 clxscore=1015 phishscore=0 adultscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412230051
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241222_220208_051002_B0DA1691 
X-CRM114-Status: GOOD (  13.45  )
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

In the current implementation, when PPDU spans multiple ring descriptors,
leading to inefficient use of the NAPI budget. The budget counter is
decremented for each ring descriptor, causing rapid depletion of the
budget even though the processing of a single PPDU might not be complete.

To address this issue, modify the code to decrement the budget counter
only when the driver receives HAL_MON_END_OF_PPDU as the end reason. This
change ensures that the budget is decremented only once per PPDU,
resulting in more efficient utilization of the NAPI budget and better
handling of monitor destination ring.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index dbf5afd88ad5..a11b39ae3774 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2388,6 +2388,13 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int *budget,
 			goto move_next;
 		}
 
+		/* Calculate the budget when the ring descriptor with the
+		 * HAL_MON_END_OF_PPDU to ensure that one PPDU worth of data is always
+		 * reaped. This helps to efficiently utilize the NAPI budget.
+		 */
+		if (end_reason == HAL_MON_END_OF_PPDU)
+			*budget -= 1;
+
 		end_offset = u32_get_bits(info0, HAL_MON_DEST_INFO0_END_OFFSET);
 		if (likely(end_offset <= DP_RX_BUFFER_SIZE)) {
 			skb_put(skb, end_offset);
-- 
2.34.1


