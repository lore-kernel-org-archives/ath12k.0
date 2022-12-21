Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B25C10F1B
	for <ath12k@archiver.kernel.org>; Wed, 21 Dec 2022 11:03:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-ID:Date:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JALs6fxm4Uiko8CwMol89z9xiHDCCHkqYHDL3Zwz8sc=; b=OziqUhtWaz9WAM
	mCXfzMqxxN93FGtnPf3Yhlme6bsmB1SeAW9y8c16McNhVuKi6yUoq1fhRDo94ot32np0LN2CZdepZ
	wN86TYcTlvfmBJ59oEmm9n3OC4LfPu732GX+DluyVtGemcA6IvxljBK3po6IhmvblRYUCa5Y/tmos
	4m9AsFuUD2/jAbcWlru3OrCdR9YrQ8NRj8vBkmwODZnYbW57MvKuuf137c05mViyC/sC+Y4ZtjHQ7
	gbyKRSz/TjIefvUXF5pNaQszqb1gw8V1GId56xrEwMKRfIKHmPMF8MCQtkUb+5Bt0mLOBY5hiTg4A
	V1NqUxYb+qo17xQAEPxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wsL-00DxBZ-Sa
	for ath12k@archiver.kernel.org; Wed, 21 Dec 2022 11:03:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1p7wlv-00DqcM-JH
	for ath12k@lists.infradead.org; Wed, 21 Dec 2022 10:56:29 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 2BL63lUe016104;
	Wed, 21 Dec 2022 10:56:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=qcppdkim1;
 bh=+V7QXULflFlXLKTcvUar3DCET4UdTZ1AzZxVI39YnNM=;
 b=LvpB8F1Q1M29rIUu2Nt2YPzlcQ2TiGVZyDaMpPOccmqDOHwu7MmS3swPqzX6k/LiwOZ7
 PeLTXjNRzhi1ib8fJItT3N4Y3JPpZqkS6zNben9EeHv4nOoiDzBd6x3PLwvxeogUY1iA
 sdOBsWrpOlZ15+Z+65Bn5yVMlszUbsczo+6XNVI8Hf+ZUaiy2FW8MvpH4fgGw0BnuvUw
 w0HlTvGqbtZeelDhsSwxN8hgUx25X0K7rCSppll+u1KOMlXx59+WqWb3pDEjokfuwCPK
 KY13GdqBg3RES5iurMGsgvKoSldi/Rk4Dd9AMHuKktDZ+84SmSCEJ1ymoozxNUGHAIwv 4g== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3mk83xu57v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:26 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 2BLAuPQL007894
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 Dec 2022 10:56:25 GMT
Received: from tmariyap-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.986.36; Wed, 21 Dec 2022 02:56:23 -0800
From: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Thiraviyam Mariyappan
	<quic_tmariyap@quicinc.com>
Subject: [PATCH 4/4] wifi: ath12k: dp_mon: Fix uninitialized warning related to the pktlog
Date: Wed, 21 Dec 2022 16:25:29 +0530
Message-ID: <20221221105529.19345-5-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
References: <20221221105529.19345-1-quic_tmariyap@quicinc.com>
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: OFls_oW5TAQYcxOPBLbgZOlo-iVZUvIq
X-Proofpoint-GUID: OFls_oW5TAQYcxOPBLbgZOlo-iVZUvIq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2022-12-21_05,2022-12-21_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=736
 clxscore=1015 bulkscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2212070000
 definitions=main-2212210088
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221221_025627_800039_7A47F373 
X-CRM114-Status: GOOD (  15.16  )
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

Uninitialized warning in the code changes related to pktlog, which is not
completely supported in ath12k driver yet. Hence, remove the changes to
avoid the warning.

Warning:
drivers/net/wireless/ath/ath12k/dp_mon.c:2138:18: warning: variable 'rx_buf_sz' is uninitialized when used here [-Wuninitialized]

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0-03171-QCAHKSWPL_SILICONZ-1
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index f6f2e83f8f8e..a214797c96a2 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -2076,8 +2076,6 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int mac_id, int *budget,
 	bool end_of_ppdu;
 	struct hal_rx_mon_ppdu_info *ppdu_info;
 	struct ath12k_peer *peer = NULL;
-	u32 rx_buf_sz;
-	u16 log_type = 0;
 
 	ppdu_info = &pmon->mon_ppdu_info;
 	memset(ppdu_info, 0, sizeof(*ppdu_info));
@@ -2133,10 +2131,6 @@ int ath12k_dp_mon_srng_process(struct ath12k *ar, int mac_id, int *budget,
 		for (i = 0; i < dest_idx; i++) {
 			skb = pmon->dest_skb_q[i];
 
-			if (log_type)
-				trace_ath12k_htt_rxdesc(ar, skb->data,
-							log_type, rx_buf_sz);
-
 			if (monitor_mode == ATH12K_DP_RX_MONITOR_MODE)
 				ath12k_dp_mon_rx_parse_mon_status(ar, pmon, mac_id,
 								  skb, napi);
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
