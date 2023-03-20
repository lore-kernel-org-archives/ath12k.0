Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9C6C7618D
	for <ath12k@archiver.kernel.org>; Mon, 20 Mar 2023 09:12:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:MIME-Version:List-Subscribe:List-Help:
	List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:Subject:Cc:To
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aDlUU2kQqvoNE2GZuIOZQvR1tbXssmz+cl6PXvP/QqQ=; b=U0Ig5HgmthT8yT
	KGZfoi9A6LvAnPtRi0gcEfkqakiydmbgCNTkH0gE47ErBwyki5b/ZHAdTc4lcfnSOcw3Dbbf8VxYi
	oaix+VUT+Ywwv3xOrKCa76LU92Orx1fHO5NLRlz13fiK3TOdiq3tWBv+oL0Y13W7DYyc/KkyTgQNZ
	2K+9yT4T2lX4Tb+b1BJ4tw5qSQrHl6OAcU6dKcxwvV1FPa49MvXNz4bKogLTOGvVaL+lbxvTwcYHz
	3WVO4m6j1ZK0ywwNYALdoDj3doUO/cB1Tm1d4Qcxf69i4BcHtki2spIOSUu8Az50NObdbcdFtDe36
	qLp0EjDCgJni9PrzgWDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1peBYy-008RMy-0T
	for ath12k@archiver.kernel.org;
	Mon, 20 Mar 2023 09:12:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1peBYv-008RLi-0V
	for ath12k@lists.infradead.org;
	Mon, 20 Mar 2023 09:12:18 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 32K8OZFA008798;
	Mon, 20 Mar 2023 09:12:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id; s=qcppdkim1;
 bh=eKIzTpVAmS+Uy++yOtS/LTojfn/8gh26HkFPOGaud9s=;
 b=kd5Ch88M3N8yN8a9rsDwixfHrMcYbXv0Wphk4+m519HvnORbs8ptEX448EU2cId+yMVt
 bQ2D68d+U+D7y2Y5iZcS3ZKKg809T3Rfn15LBS/UOz0PrU9oGbnMOYAPPrp+bxeo17Eu
 3s5Nlgl4t3G9sgyBGnLTN6B7YnbGDuO7Rcy5Z1bo3Wc9TIyJTwyG7ze+1qvs6EodQMyb
 qTn7aeED33ScmY4qVNRCh0ogXLyt/vAejc/Fx/Qp1GNJNMVpriiUA/ToywPlcYrOwceq
 RhSaQPMz/v3/TXqcQPmZ05fXCYiHD4BpJddAdFRUh2LSqqWto+xPyFHlNMkrd22c73fR WQ== 
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3pd5ha4ar9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 20 Mar 2023 09:12:12 +0000
Received: from pps.filterd (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTP id 32K932jr029363;
	Mon, 20 Mar 2023 09:12:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 3pd6cm7fa1-1;
	Mon, 20 Mar 2023 09:12:12 +0000
Received: from NASANPPMTA02.qualcomm.com (NASANPPMTA02.qualcomm.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 32K9CCos010480;
	Mon, 20 Mar 2023 09:12:12 GMT
Received: from hprem-linux.qualcomm.com (hprem-linux.qualcomm.com [10.201.162.248])
	by NASANPPMTA02.qualcomm.com (PPS) with ESMTP id 32K9CB1E010473;
	Mon, 20 Mar 2023 09:12:12 +0000
Received: by hprem-linux.qualcomm.com (Postfix, from userid 4146166)
	id 94B47B003A2; Mon, 20 Mar 2023 14:42:09 +0530 (IST)
From: Harshitha Prem <quic_hprem@quicinc.com>
To: ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Harshitha Prem <quic_hprem@quicinc.com>
Subject: [PATCH] wifi: ath12k: incorrect channel survey dump
Date: Mon, 20 Mar 2023 14:42:08 +0530
Message-Id: <20230320091208.25535-1-quic_hprem@quicinc.com>
X-Mailer: git-send-email 2.17.1
X-QCInternal: smtphost
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fR0IrmwUSDgKqMMBxce3a5Pw5U7nUa7X
X-Proofpoint-ORIG-GUID: fR0IrmwUSDgKqMMBxce3a5Pw5U7nUa7X
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.942,Hydra:6.0.573,FMLib:17.11.170.22
 definitions=2023-03-20_06,2023-03-16_02,2023-02-09_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 phishscore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 mlxlogscore=999
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2303150002
 definitions=main-2303200078
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230320_021217_201142_3DEA366E 
X-CRM114-Status: GOOD (  13.95  )
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

When underlying hardware supports more than one band, then wiphy
is aware of all the frequency bands present. Example, say
wiphy0 is aware of 2 GHz, 5 GHz and 6 GHz band information.
Hence, when an virtual AP interface is brought up in auto channel
selection on each band. Survey is initiated from the userspace application
for all the virtual AP interfaces simultaneously.

For survey dump collection, freq_to_idx() api is used to map the index of
particular frequency to populate its survey. When the dump was collected,
the index fetched was incorrect. Example, in case of multi-hardware,
the index of channel 36 was reported as 14, because wiphy0 had index 0-13
for 2 GHz channels, instead of 0 for that ar which resulted in invalid
survey sent to userspace application.

The incorrect index was because of the mapping did not consider whether
the freq band is present in its radio structure (ar) or not.

To handle this, the freq_to_idx() api should map index for the
particular band in the ar structure.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/wmi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/wmi.c b/drivers/net/wireless/ath/ath12k/wmi.c
index 3e6991120e53..f37b5c3a3ceb 100644
--- a/drivers/net/wireless/ath/ath12k/wmi.c
+++ b/drivers/net/wireless/ath/ath12k/wmi.c
@@ -4934,6 +4934,9 @@ static int freq_to_idx(struct ath12k *ar, int freq)
 	int band, ch, idx = 0;
 
 	for (band = NL80211_BAND_2GHZ; band < NUM_NL80211_BANDS; band++) {
+		if (!ar->mac.sbands[band].channels)
+			continue;
+
 		sband = ar->hw->wiphy->bands[band];
 		if (!sband)
 			continue;
-- 
2.17.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
