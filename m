Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 601F1C25B4F
	for <ath12k@archiver.kernel.org>; Mon,  6 May 2024 17:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4nA4V/k8y8pALSFkR7Vkpdnv0/U/QRAOrcwAmkRXR9k=; b=T/eovhvLvMhSUjN92Zx25+8TJR
	coHLbrI+yW0Hv5r250CAwA8rSrCUJRmztMyBpjj1W/3ItvJ8hTpWxqVu3qX1PSwKuaHbzJbCazSOe
	lCf/zRazMTCai1HUo0fUBeojxDJF4/qGo9cM2bRJAf36SXivIdLAeNz8vfMzpDkaSNYvJR+nzuY5J
	kc/WJTpQtTcQaFmqCKrNEwzvK29IDZvgTgpCkSwRU1djHMJt0nTdWLEXw8dPF+1I7yKmst1ou142I
	IR3uzseE3cU4Vmn+XNK5SDo/ukaFce2FZkhlWnzQuS55EBJkUF/HZmvjA9et0rX9FXJXaJgb0i4eL
	twdsZpag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42Ag-00000008FX8-3oGu
	for ath12k@archiver.kernel.org;
	Mon, 06 May 2024 17:30:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s42Ae-00000008FVr-0yV8
	for ath12k@lists.infradead.org;
	Mon, 06 May 2024 17:30:38 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 446DPAXN009004;
	Mon, 6 May 2024 17:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=4nA4V/k
	8y8pALSFkR7Vkpdnv0/U/QRAOrcwAmkRXR9k=; b=S6qQ2jJFoebv6I37pc2Rk8m
	rFNmoOs1AXjGsrFnlKoHk0kaFO2WmVcGUKcn++7pEcztTemKqqOd0BMmBT9o3ZCf
	SLUC0jPDhlD/dQJxqyZViI9npe5BQK0xhULjT+zFfV7y2fwMrFsqbqkM2U5yWMuU
	mGwGZQU6Njw2x54PqrKp54/XmnptzToSm588ZgrB1AlUmLRiOwoivB82+YoL/sh8
	DGXJRA1PXyDguqWkAi2eZcsJ7wpIwsgyD9UzApSJLfss2RQo940iCi7zOJx84OEp
	xGJUtlR8mC7hFviKfe9BQmeqz4bAqLyk1hpPovkXNsfaE1U2N05c6W+2YCcrBOg=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xxwqdrvp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 May 2024 17:30:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 446HUW3H030117
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 May 2024 17:30:32 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 6 May 2024 10:30:31 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH] wifi: ath12k: avoid double SW2HW_MACID conversion
Date: Mon, 6 May 2024 23:00:17 +0530
Message-ID: <20240506173017.597715-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: auPvU-PmCsMJ9c-8bJhrORiOFjfHBNP1
X-Proofpoint-GUID: auPvU-PmCsMJ9c-8bJhrORiOFjfHBNP1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-06_12,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 adultscore=0 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=778 suspectscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405060124
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240506_103036_365972_1A897CB9 
X-CRM114-Status: GOOD (  11.98  )
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

Currently, ath12k_wmi_pdev_dma_ring_cfg() fails due to an invalid pdev_id
parameter passed to the WMI_PDEV_DMA_RING_CFG_REQ_CMDID WMI command. This
invalid pdev_id is caused by a double conversion of the MAC ID. Since the
the caller of ath12k_wmi_pdev_dma_ring_cfg() already performs the MAC ID
conversion, it is unnecessary to do it again within the function. To fix
this, remove the software (SW) to hardware (HW) MAC ID conversion from
ath12k_wmi_pdev_dma_ring_cfg() to avoid this redundant conversion.

Found in code review.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 7a52d2082b79..9e9f58b5cbfb 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -3808,7 +3808,7 @@ int ath12k_wmi_pdev_dma_ring_cfg(struct ath12k *ar,
 	cmd->tlv_header = ath12k_wmi_tlv_cmd_hdr(WMI_TAG_DMA_RING_CFG_REQ,
 						 sizeof(*cmd));
 
-	cmd->pdev_id = cpu_to_le32(DP_SW2HW_MACID(arg->pdev_id));
+	cmd->pdev_id = cpu_to_le32(arg->pdev_id);
 	cmd->module_id = cpu_to_le32(arg->module_id);
 	cmd->base_paddr_lo = cpu_to_le32(arg->base_paddr_lo);
 	cmd->base_paddr_hi = cpu_to_le32(arg->base_paddr_hi);

base-commit: 2c4d8e19cf060744a9db466ffbaea13ab37f25ca
-- 
2.34.1


