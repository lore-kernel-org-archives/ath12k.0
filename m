Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4406C74A5B
	for <ath12k@archiver.kernel.org>; Fri, 17 Mar 2023 16:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=AWxfCwaIo6dpxni2b+MM8bH9dkektR1C2aLm0Vpqtcc=; b=xT2guZy8p3r0Ju
	vOoHZjQgOjE5AoLspBrITnfzbm0Sa45xmpWTJ1nQtvLZTn+5gVkMgAddfFMz93coe/ZfkZUl2q1nZ
	xMg2u4anKMpR7j2Qz7JePots1FnnvvgD2+WVXtijY0R4pooVh/TDcMBq+Kcsm0lwCualeBGPEW7C4
	FUgkJqc3XkOaXtrpzyenuNp1958LQLh24jRZr8tneT0dOMNGEbPfc8XSmZygOZisVjYci7uu/BKXA
	o/6z0fpddITo2nMux4FOgwUmz/kw6U2vst2xVKIZ/y70H7SpFHlILo9DMowUkM/aQvX0UywxCRkOz
	vhjsTvwMbGjCkpepcCGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCpy-002kCq-1h
	for ath12k@archiver.kernel.org;
	Fri, 17 Mar 2023 16:21:50 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1pdCpv-002kBZ-0T
	for ath12k@lists.infradead.org;
	Fri, 17 Mar 2023 16:21:48 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32HAuCIG022010;
	Fri, 17 Mar 2023 16:21:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=qcppdkim1;
 bh=qUSjOGLt4G/Hb7MtC6GwUnhbXCeTZKROAoxnEE1XbaU=;
 b=PBzEuIoZioomMZGmjDoapEXhCeKvLBheX90NZRu28QyDnPXDt5IUv/AxlDsh04IKBDOc
 lKB9oeJn4SNCUG/oSpDgzAsWqIPaGJZE+299GhJEpUvbBYMrN9ezEtd7WbRirjp2K2VB
 N2jXoEIE0R6mKLtHVVin1WoD4B8mYvrfbs95CzNW7m5iB53rg5j5myl4EXFogJXfOjSo
 2Qg4PuSv28y3PvGJ+3YS7ON/Wgt2nsT36IXwpmAvrnWnvgNvm5+FoEDXxu1BlIjJAwrw
 IPiKvQoI8PlQV+i+7gMir42WyabZvQtUunFIcWojW/TiKnIhR8AQenv4sTaLlU4nd3qO cg== 
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pcpvms74x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 16:21:43 +0000
Received: from nasanex01a.na.qualcomm.com (nasanex01a.na.qualcomm.com [10.52.223.231])
	by NASANPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 32HGLSma018183
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 17 Mar 2023 16:21:28 GMT
Received: from mdharane-linux.qualcomm.com (10.80.80.8) by
 nasanex01a.na.qualcomm.com (10.52.223.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.41; Fri, 17 Mar 2023 09:21:26 -0700
From: Manish Dharanenthiran <quic_mdharane@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, P Praneesh <quic_ppranees@quicinc.com>,
        Manish Dharanenthiran <quic_mdharane@quicinc.com>
Subject: [PATCH] wifi: ath12k: fill peer meta data during reo_reinject
Date: Fri, 17 Mar 2023 21:50:56 +0530
Message-ID: <20230317162056.20353-1-quic_mdharane@quicinc.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01a.na.qualcomm.com (10.52.223.231)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 3EJqJsfDx-IIH7kTvBsmfkoX-RBE0Hzx
X-Proofpoint-GUID: 3EJqJsfDx-IIH7kTvBsmfkoX-RBE0Hzx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-17_10,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 phishscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1011 priorityscore=1501 adultscore=0 mlxscore=0 mlxlogscore=999
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2303150002 definitions=main-2303170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230317_092147_324921_A8EF8199 
X-CRM114-Status: GOOD (  14.57  )
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

From: P Praneesh <quic_ppranees@quicinc.com>

Firmware expects physical address in the reo entrance ring when MLO is
enabled and peer meta data in the queue_addr_lo for the non MLO cases.
Current implementation fills the physical address for the non MLO cases
and firmware decodes it differently which leads to SOC CSR region
access which is not related to firmware/MAC operation.

Fix this by sending only peer_meta data and destination indication bit
during non MLO case. This prevents firmware from invalid decoding.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: P Praneesh <quic_ppranees@quicinc.com>
Signed-off-by: Manish Dharanenthiran <quic_mdharane@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_rx.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_rx.c b/drivers/net/wireless/ath/ath12k/dp_rx.c
index 0adcbcfa0db5..b368494071ea 100644
--- a/drivers/net/wireless/ath/ath12k/dp_rx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_rx.c
@@ -3047,10 +3047,14 @@ static int ath12k_dp_rx_h_defrag_reo_reinject(struct ath12k *ar,
 	reo_ent_ring->rx_mpdu_info.peer_meta_data =
 		reo_dest_ring->rx_mpdu_info.peer_meta_data;
 
-	reo_ent_ring->queue_addr_lo = cpu_to_le32(lower_32_bits(rx_tid->paddr));
-	reo_ent_ring->info0 = le32_encode_bits(upper_32_bits(rx_tid->paddr),
-					       HAL_REO_ENTR_RING_INFO0_QUEUE_ADDR_HI) |
-		le32_encode_bits(dst_ind, HAL_REO_ENTR_RING_INFO0_DEST_IND);
+	/* Firmware expects physical address to be filled in queue_addr_lo in
+	 * the MLO scenario and in case of non MLO peer meta data needs to be
+	 * filled.
+	 * TODO: Need to handle for MLO scenario.
+	 */
+	reo_ent_ring->queue_addr_lo = reo_dest_ring->rx_mpdu_info.peer_meta_data;
+	reo_ent_ring->info0 = le32_encode_bits(dst_ind,
+					       HAL_REO_ENTR_RING_INFO0_DEST_IND);
 
 	reo_ent_ring->info1 = le32_encode_bits(rx_tid->cur_sn,
 					       HAL_REO_ENTR_RING_INFO1_MPDU_SEQ_NUM);

base-commit: 3df3715e556027e94246b2cb30986563362a65f4
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
