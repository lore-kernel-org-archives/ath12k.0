Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EC00C25B79
	for <ath12k@archiver.kernel.org>; Mon, 20 May 2024 07:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C0sVOv4nloc8Q94vG7AZzEtyHNxkhk+KHkcEVtNAOmA=; b=FMSDqCE11g4JfkTEWAPAIGHirR
	5m2zggXn5A4tx8vog6E9bXScSxlerxtMdDTpgqMS/jIe3aYa/tDGFXTMQ7mGYbPIu0wrLJpiI4GzZ
	zxg+fEAvS/rviX3iFxexYms/dYYlG1i/undGImyhj5bUhiogUrSmfCFw7P4HWBsBYspHgG7QCKSRo
	l3zmLV08nAx3ESPUXcNAJLldnM+4f0P73hn1g4BAAUzTwpPyoYNVBxgD1D2ZbV9nRwHuqe4tfpVdF
	ulf98CPYbVTBOP7pnwrO0dpOfRKqYm4kttl6oEWM5OJFH5zpBTuwW9z4Lfpxjkr72Qi35WdArxQQE
	DNh7tqrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1E-0000000DiLR-40h5
	for ath12k@archiver.kernel.org;
	Mon, 20 May 2024 07:01:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s8x1C-0000000DiKp-41Ug
	for ath12k@lists.infradead.org;
	Mon, 20 May 2024 07:01:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44JNuQNH002173;
	Mon, 20 May 2024 07:01:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=C0sVOv4nloc8Q94vG7AZzEtyHNxkhk+KHkcEVtNAOmA=; b=oD
	D09fPZ/BlMRR8E/uiptxpkGeKPlarFVI8pwlHmSDk7vU01h0l1j2/iViI0fDcOnK
	30SB7xCLihWCJeSyhUmqEbLRpsLK3AGu15dU6WrbU9ObIgSUyXfn+4eVMMgIcfs2
	ekp+roHpTOef4HrqcuqIZ+UOjUNJlTtU4UWNz/9Jcf5KBFk3zNTT+Kh5aWpJPAJY
	Tkb7hh8qwzlf8XqFzPH+MaNc8BnrNLimml8b084YaKOcmXNrCNvmJelGpZi9nIHd
	NBtc+4O+9wk/CcKd8m9aJkhe55pRgHul2oT/UQH10iWD2fbn7FSnzfgNS78Jqgm+
	YUrEYJ70+IsmLtjjZPJg==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6pr2jh96-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:10 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44K719eq023158
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 May 2024 07:01:09 GMT
Received: from hu-ppranees-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 20 May 2024 00:01:07 -0700
From: P Praneesh <quic_ppranees@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Subject: [PATCH 1/3] wifi: ath12k: change DMA direction while mapping reinjected packets
Date: Mon, 20 May 2024 12:30:43 +0530
Message-ID: <20240520070045.631029-2-quic_ppranees@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240520070045.631029-1-quic_ppranees@quicinc.com>
References: <20240520070045.631029-1-quic_ppranees@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lDrFNiwhl3tZSdeF8xBLYodBY_m5BOgR
X-Proofpoint-GUID: lDrFNiwhl3tZSdeF8xBLYodBY_m5BOgR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-20_04,2024-05-17_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=816 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 impostorscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 suspectscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405200057
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240520_000111_025447_0C19D97E 
X-CRM114-Status: GOOD (  11.66  )
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

For fragmented packets, ath12k reassembles each fragment as a normal
packet and then reinjects it into HW ring. In this case, the DMA
direction should be DMA_TO_DEVICE, not DMA_FROM_DEVICE. Otherwise,
an invalid payload may be reinjected into the HW and
subsequently delivered to the host.

Given that arbitrary memory can be allocated to the skb buffer,
knowledge about the data contained in the reinjected buffer is lacking.
Consequently, there’s a risk of private information being leaked.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00209-QCAHKSWPL_SILICONZ-1

Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
Co-developed-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 37205e894afe..2bfcc19d15ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3004,7 +3004,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 
 	buf_paddr = dma_map_single(ab->dev, defrag_skb->data,
 				   defrag_skb->len + skb_tailroom(defrag_skb),
-				   DMA_FROM_DEVICE);
+				   DMA_TO_DEVICE);
 	if (dma_mapping_error(ab->dev, buf_paddr))
 		return -ENOMEM;
 
@@ -3090,7 +3090,7 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 	spin_unlock_bh(&dp->rx_desc_lock);
 err_unmap_dma:
 	dma_unmap_single(ab->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
-			 DMA_FROM_DEVICE);
+			 DMA_TO_DEVICE);
 	return ret;
 }
 
-- 
2.25.1


