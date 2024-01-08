Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 67044C47073
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 08:26:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xfYeYR4qHhF/T6zR5sYXJdKMruUNVBPYK+IqStBKB8w=; b=ohkL3sBSluWlwQR2CCYevgo6/x
	O/fbHk/Xxedv+gHy/btQq2QpmGsFIMw7Z7j0XNkLbsJjKevfhrBA1bGl33H0o+jAAZcNu9nTV3zXP
	hrK7/rXQELnmNKX96jm+tGvD1SM2H9H3SGMAHJH2gNCEq2nKHDvdDGfMfme5MCEbhgSuexjvuWHq+
	HwSiZUxtPBipFnABIQZgPrDjdndxNc062W0oK9K990qdw6Xa0VelxEH/L80gg6Dp/n3XWehR8CU97
	EqlmskUcy7/7krrCQGgXyNys2zBB54xEZwND1O80jW8Yr6sgsdEnIVZk/1h1u7llHN5uA9Zbx1gux
	s8DWQiVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMky0-004IWr-0W
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 08:26:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxx-004IUt-2R
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 08:26:38 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4086di76030401;
	Mon, 8 Jan 2024 08:26:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=xfYeYR4qHhF/T6zR5sYXJdKMruUNVBPYK+IqStBKB8w=; b=IX
	P2rSMq3teBGxffZPC90ws/wL+y2XQ/BfI1Jeo5K3dCUNm+pOazyeHQLVKqlxt4sk
	61FcID3ixOIUO+JgSk9ziUAF7pGVFTBvxZPxlZzicDE+jlgxSfta6OuEmVwyNhRO
	paskLZLxrVi4TmnShfbFLWkLH39kdn5hmXQ1Keudr8BCVJrdRM+3n4XmmrLsEyqL
	XDzGr3QmRlF0UQuxO68PbbhEkw6MihASfrk1jUUyenSrV1O0mWyH9w8rEpzQEhNb
	Cxvwo4KcQ4ettOSv5XHJiyygvhtCKHNWRZWHwsHU9LqE4wvvcc8FIlvHnicJNa47
	7jThs2Ye5nfT1h0FqRfA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vg8nwrh3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 08:26:37 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4088QaZT026164
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 08:26:36 GMT
Received: from yk-E5440.local (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 00:26:35 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 07/10] wifi: ath12k: fix broken structure wmi_vdev_create_cmd
Date: Mon, 8 Jan 2024 16:25:49 +0800
Message-ID: <20240108082552.7227-8-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240108082552.7227-1-quic_kangyang@quicinc.com>
References: <20240108082552.7227-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: dQBHAqrj2voEhJXQ90XDNQfzZGz0rO0p
X-Proofpoint-ORIG-GUID: dQBHAqrj2voEhJXQ90XDNQfzZGz0rO0p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=660 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=1 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002637_799177_556426EC 
X-CRM114-Status: GOOD (  10.62  )
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

Current structure wmi_vdev_create_cmd is not matched to the firmware
definition. So update it.

And update vdev_stats_id_valid for vdev_stats_id.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 5 +++++
 drivers/net/wireless/ath/ath12k/wmi.h | 3 +++
 2 files changed, 8 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 744994708d3f..8087b040620c 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -828,7 +828,12 @@ int ath12k_wmi_vdev_create(struct ath12k *ar, u8 *macaddr,
 	cmd->vdev_subtype = cpu_to_le32(args->subtype);
 	cmd->num_cfg_txrx_streams = cpu_to_le32(WMI_NUM_SUPPORTED_BAND_MAX);
 	cmd->pdev_id = cpu_to_le32(args->pdev_id);
+	if (args->if_stats_id != ATH12K_INVAL_VDEV_STATS_ID)
+		cmd->vdev_stats_id_valid = cpu_to_le32(true);
+	else
+		cmd->vdev_stats_id_valid = cpu_to_le32(false);
 	cmd->vdev_stats_id = cpu_to_le32(args->if_stats_id);
+
 	ether_addr_copy(cmd->vdev_macaddr.addr, macaddr);
 
 	ptr = skb->data + sizeof(*cmd);
diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
index f7edebb10089..c4371741f1ff 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.h
+++ b/drivers/net/wireless/ath/ath12k/wmi.h
@@ -2712,6 +2712,9 @@ struct wmi_vdev_create_cmd {
 	struct ath12k_wmi_mac_addr_params vdev_macaddr;
 	__le32 num_cfg_txrx_streams;
 	__le32 pdev_id;
+	__le32 mbssid_flags;
+	__le32 mbssid_tx_vdev_id;
+	__le32 vdev_stats_id_valid;
 	__le32 vdev_stats_id;
 } __packed;
 
-- 
2.34.1


