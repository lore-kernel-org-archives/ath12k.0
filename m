Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1537C001B2
	for <ath12k@archiver.kernel.org>; Mon,  6 Nov 2023 18:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References:Message-ID
	:MIME-Version:Subject:Date:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=koLU2OKBDet5XFxN7sKYrn43gxde2t+/lm/BTC/R9S4=; b=cJ6MTkubAADifM
	aKXQ1sSxFAXquId1jfHjnLdlRD2CWiZSlCug2akDppkZbXbDQd73D8RdiMnn069OSGDz5qOuEd5OH
	aG4ObMU7rYxP9xSQSK/0vu71+QWYHXg4ri0TiV4oIITq7u7687ri72Em07Ef/QzGwqTB2Iz+ws384
	+1SAIUpFOjILqeATzU+Fb+6sXo4H7/0rY/Dro76MapJZgXDsnKddHN8Y1VAQJNbpenJgHF8/v0Rrp
	LiQvwwu5Tv7UoI28UnMIxEEZumxMg8kaQWVrnp9fLOMCD8RzjOp2weyQCSxXb6ZDJ17H1hOUx5M/W
	OdGlLEhfw3IHCanTIl0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ii-00HJha-1y
	for ath12k@archiver.kernel.org;
	Mon, 06 Nov 2023 18:26:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r04Ie-00HJer-1n;
	Mon, 06 Nov 2023 18:26:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3A6EO7jC006996;
	Mon, 6 Nov 2023 18:26:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : date :
 subject : mime-version : content-type : content-transfer-encoding :
 message-id : references : in-reply-to : to : cc; s=qcppdkim1;
 bh=zYW/lRX/4ACrNnU4krkqany9ism4ns/4E4HytwmquNo=;
 b=O8+2Ynp2aYXF5zCldMjakKImAS/XJDDpab4aZIqfvuacTWH4WylJstN5qt6E8VMkcS7c
 MRQ+0ikrw+uTXMQ9R1JvsV6pfipqfWwiLo3FNfhQ/VkRycHqMsD8y8bKxBjQHqzElYfv
 lMJ/YyRIYut16Zp2oYxbOeX6jsFCuDzEHatAd5VAGgMtXtM8R9lKH1kNCzWGJ6PiBL3U
 jPNwqjXIcYj4VniU2CQLFWBM9ZQOUJwAT/V5faYRpTOI19mctT66ZTwD0MkT7IlP9y6i
 m5xb+Fa3JNJ/xIeTMGN1SG63rSl4XFX6CgC9FQQjxutxIcGy87NvGohX5AUcs6vhxPGb cw== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3u71br8q1j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 06 Nov 2023 18:26:05 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3A6IQ4Ou029707
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 6 Nov 2023 18:26:04 GMT
Received: from hu-jjohnson-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.39; Mon, 6 Nov 2023 10:26:04 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Date: Mon, 6 Nov 2023 10:26:03 -0800
Subject: [PATCH 1/4] wifi: ath11k: Remove obsolete struct
 wmi_peer_flags_map *peer_flags
MIME-Version: 1.0
Message-ID: <20231106-ath-peer-flags-v1-1-781e83b7e8e8@quicinc.com>
References: <20231106-ath-peer-flags-v1-0-781e83b7e8e8@quicinc.com>
In-Reply-To: <20231106-ath-peer-flags-v1-0-781e83b7e8e8@quicinc.com>
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VWI64y0zi4879RfKYqigojPKGNhXCpMU
X-Proofpoint-GUID: VWI64y0zi4879RfKYqigojPKGNhXCpMU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.987,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-06_14,2023-11-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 spamscore=0 adultscore=0 suspectscore=0 bulkscore=0
 lowpriorityscore=0 mlxlogscore=656 phishscore=0 impostorscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2310240000 definitions=main-2311060149
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231106_102612_713145_3F6E6E5A 
X-CRM114-Status: GOOD (  12.28  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Currently both struct ath11k_pdev_wmi and struct ath11k_wmi_base
define:
	const struct wmi_peer_flags_map *peer_flags;

But that member is not used, and in fact, struct wmi_peer_flags_map
is not defined within ath11k; these are obsolete remnants inherited
from ath10k. So remove them.

Compile tested only.

Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
---
 drivers/net/wireless/ath/ath11k/wmi.h | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/wmi.h b/drivers/net/wireless/ath/ath11k/wmi.h
index 100bb816b592..42e4234be69b 100644
--- a/drivers/net/wireless/ath/ath11k/wmi.h
+++ b/drivers/net/wireless/ath/ath11k/wmi.h
@@ -2580,7 +2580,6 @@ struct wmi_service_available_event {
 struct ath11k_pdev_wmi {
 	struct ath11k_wmi_base *wmi_ab;
 	enum ath11k_htc_ep_id eid;
-	const struct wmi_peer_flags_map *peer_flags;
 	u32 rx_decap_mode;
 	wait_queue_head_t tx_ce_desc_wq;
 };
@@ -5754,7 +5753,6 @@ struct ath11k_wmi_base {
 	struct completion unified_ready;
 	DECLARE_BITMAP(svc_map, WMI_MAX_EXT2_SERVICE);
 	wait_queue_head_t tx_credits_wq;
-	const struct wmi_peer_flags_map *peer_flags;
 	u32 num_mem_chunks;
 	u32 rx_decap_mode;
 	struct wmi_host_mem_chunk mem_chunks[WMI_MAX_MEM_REQS];

-- 
2.42.0


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
