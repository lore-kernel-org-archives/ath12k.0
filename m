Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B201FC5478C
	for <ath12k@archiver.kernel.org>; Fri,  1 Mar 2024 09:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mqrA/FEteD5aizcdbYN8KUPQeHydd8N7yBQigBnz1+E=; b=KScGx76xxN0OEkbRoPPd2BNyMr
	/oEHn262siCNGwys6In5EO6VgOwProB9iIHXDOdg4rbGY411iGYCCy2EBp8crF2jsSTyMPPPYgJwo
	ncp/Fti6I9f+bIBesL4YwaPhT8z67dtW2WRarF/AnCVYdEbgJvmEq278O9qsIKJ3/ISxYYuQafz3E
	UZjBtsmuFZqS7gtoAcxMD7jw052k/y6UIeYk2VvCY/IgxIB+aUrLKEXh1czqcuLPU0haqj9PqNs0N
	3gKF/aMdrhi1tTlmBbL5sh/7TXnpOFzNMD0B3/5QEdBAkMJzPwpamQZO/m8LFz7Qa2qC3eZvrJPwS
	mOiXn9Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz3c-0000000H6pD-3pRR
	for ath12k@archiver.kernel.org;
	Fri, 01 Mar 2024 09:19:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rfz3Q-0000000H6gD-2YW9
	for ath12k@lists.infradead.org;
	Fri, 01 Mar 2024 09:19:53 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4216dKtt007913;
	Fri, 1 Mar 2024 09:19:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id; s=qcppdkim1; bh=mqrA/FEteD5a
	izcdbYN8KUPQeHydd8N7yBQigBnz1+E=; b=ZT+8MUOa4OXVKM068e30ZoqODKRc
	4VjOUgkHoKhJuBv5gz7p2wMYm8MuNpcRNYNDPGOHJDjCufu7q5dt8W4LdkX16whO
	qseLXqWdraN7DtUBpKggk6W3xln1PGs9zTg63ggSrq6ViCw8m+UYJxrk0POqCryQ
	8jBB/mIhIq6/zErBplUtHuA2J74xpHeWGkKJNxOPVrI9XfVWE5URpZbMmAToGyuh
	en+2pFWmkgV3rCltMJWMEAFgYCUApIef7UcqpgbGs9CFxsVLHsun7ay+NBhK2MIh
	qa4JXmhUlcSNO3hMs9s27NOV88s0eAkM2ieGeod2qPoFWFW0/zC66Hwq2g==
Received: from apblrppmta01.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com [103.229.18.19])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wk5brs0c8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 01 Mar 2024 09:19:41 +0000 (GMT)
Received: from hu-maiyas18a-blr.qualcomm.com (hu-tmariyap-blr.qualcomm.com [10.131.36.89])
	by APBLRPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 4219JboB031767;
	Fri, 1 Mar 2024 09:19:37 GMT
Received: by hu-maiyas18a-blr.qualcomm.com (Postfix, from userid 0)
	id 61292A0053C; Fri,  1 Mar 2024 14:49:36 +0530 (+0530)
From: quic_tmariyap@quicinc.com
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
Subject: [PATCH] wifi: ath12k: remove reserve member of wbm completion structure
Date: Fri,  1 Mar 2024 14:49:36 +0530
Message-Id: <20240301091936.12054-1-quic_tmariyap@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: -t__FcW58jZvyHW2sCAXuRQZh3VItyO4
X-Proofpoint-ORIG-GUID: -t__FcW58jZvyHW2sCAXuRQZh3VItyO4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-01_05,2024-03-01_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 clxscore=1011 spamscore=0 mlxscore=0 impostorscore=0
 adultscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2402120000 definitions=main-2403010078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240301_011945_120601_71D4E919 
X-CRM114-Status: GOOD (  10.43  )
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

In tx completion, status desc obtained from offsetting the address
from wbm ring. Having reserved 8 bytes in status desc offsets the
address twice and read the values from the incorrect address.
So, removing the reserved 8 bytes from wbm completion structure.

Also this patch is applicable for WCN7850.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index eb2dd408e081..d01fc0b0c9a5 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -387,7 +387,6 @@ struct ath12k_dp {
 #define HTT_TX_WBM_COMP_INFO2_ACK_RSSI		GENMASK(31, 24)
 
 struct htt_tx_wbm_completion {
-	__le32 rsvd0[2];
 	__le32 info0;
 	__le32 info1;
 	__le32 info2;
-- 
2.17.1


