Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAE77C5475B
	for <ath12k@archiver.kernel.org>; Mon, 11 Mar 2024 18:08:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ffhkJEvhkCCnVeu7Xa2ZsnIBaMqm3tt4l87ZT/SYlXY=; b=O3J/HRCzRSHG6T54kDRWoB5Q3c
	8oqbz11BOcuLqoFCabIn3DITdRinY0GiBtDEivZJ/Bv+3Bd0J8ogX9uJv0+J+VQioa7+cSY2PnqjG
	VOOVFCRWX3lRagP0c37uaPx4Q0fMl1BRWYLaJquPhCoM5vch8TSR/3zTkRIUigm2r4E8nHbnLSp8I
	QTbA4UBE7RxfU8QxjpsOmkX2RFnwqh7OjbLAV1PQYEX51SWKzBQMHubAAYfRxypOuqa3LEzXANxUu
	Njy83iWw7tokPFh15Vq+GgxWU/00fXVy9v/y69PlLy+zQFtb5SCJqBWHvG7CpWGI0Oht6V9FawoCt
	ChWH14Pg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjk4S-00000002dsx-2YZ4
	for ath12k@archiver.kernel.org;
	Mon, 11 Mar 2024 18:08:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rjk4L-00000002doW-466u
	for ath12k@lists.infradead.org;
	Mon, 11 Mar 2024 18:08:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42BHxCAn022218;
	Mon, 11 Mar 2024 18:08:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=ffhkJEvhkCCn
	Veu7Xa2ZsnIBaMqm3tt4l87ZT/SYlXY=; b=AXRs41N213CSFNoM1UpxSfT0ZmBO
	wNNsmyHTZVGAj9xgxFOVJwzJInwlcff7FVW5angeLXqX0x6GAtkfNEBErm/r2Jfp
	YkIbN6+LWS0mzcVSs105C4kD0hrx3k9PGe1UCZQw/0jH8nC1Mm3gThvgzl5KUter
	6Z2N75EmD4Mtha9n+2v8pccn08LeVO6ZwpxNLMRVPSIitIUjF0Bs7966u3PHt1cB
	StwqU42/9uNTxsUVhtt3R61h4B3ZZm3Ja0hfXhuBFPsIt23+Cch9+OX+fcvtRwq3
	b+6j1IROkgLhEkRtVkw9fCyXxIXxPEvCR5m88IRQJhDMbN9nb6RCRC6N8g==
Received: from apblrppmta02.qualcomm.com ([103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wswrssmvb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Mar 2024 18:08:00 +0000 (GMT)
Received: from hu-maiyas18a-blr.qualcomm.com (hu-tmariyap-blr.qualcomm.com [10.131.36.89])
	by APBLRPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 42BI79V9021173;
	Mon, 11 Mar 2024 18:07:09 GMT
Received: by hu-maiyas18a-blr.qualcomm.com (Postfix, from userid 0)
	id 77F3DA01944; Mon, 11 Mar 2024 23:37:08 +0530 (+0530)
From: quic_tmariyap@quicinc.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH v2] wifi: ath12k: fix desc address calculation in wbm tx completion
Date: Mon, 11 Mar 2024 23:37:08 +0530
Message-Id: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: boIj-hdxqyHbXziOGu3CzkGde7uJhL3d
X-Proofpoint-ORIG-GUID: boIj-hdxqyHbXziOGu3CzkGde7uJhL3d
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-11_10,2024-03-11_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 spamscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 adultscore=0 phishscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403110136
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240311_110814_200077_6D204519 
X-CRM114-Status: GOOD (  12.44  )
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

From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>

In tx completion, status desc is obtained from offsetting the address
from wbm ring. Having HTT_TX_WBM_COMP_STATUS_OFFSET(8) and reserved 8
bytes in status desc offsets the address twice and read the values
from the incorrect address. Hence, remove the
HTT_TX_WBM_COMP_STATUS_OFFSET from wbm completion address calculation.

Also this patch is applicable for WCN7850.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
v2:
 - removed the addition of HTT_TX_WBM_COMP_STATUS_OFFSET instead of
structure changes.
 - modified commit log and renamed subject from "wifi: ath12k: remove
reserve member of wbm completion structure".
---
 drivers/net/wireless/ath/ath12k/dp.h    | 2 --
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 2 files changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index eb2dd408e081..9b83b9230bbc 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -377,8 +377,6 @@ struct ath12k_dp {
 /* peer meta data */
 #define HTT_TCL_META_DATA_PEER_ID		GENMASK(15, 2)
 
-#define HTT_TX_WBM_COMP_STATUS_OFFSET 8
-
 /* HTT tx completion is overlaid in wbm_release_ring */
 #define HTT_TX_WBM_COMP_INFO0_STATUS		GENMASK(16, 13)
 #define HTT_TX_WBM_COMP_INFO1_REINJECT_REASON	GENMASK(3, 0)
diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 572b87153647..9b6d7d72f57c 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -414,7 +414,7 @@ ath12k_dp_tx_process_htt_tx_complete(struct ath12k_base *ab,
 	struct ath12k_dp_htt_wbm_tx_status ts = {0};
 	enum hal_wbm_htt_tx_comp_status wbm_status;
 
-	status_desc = desc + HTT_TX_WBM_COMP_STATUS_OFFSET;
+	status_desc = desc;
 
 	wbm_status = le32_get_bits(status_desc->info0,
 				   HTT_TX_WBM_COMP_INFO0_STATUS);
-- 
2.17.1


