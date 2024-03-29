Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7934ACD1288
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 17:40:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zHHhocOpqjPnDdHPeMG3McXCVuNvcM650SHyLS7EA1c=; b=pRQSJ1GivI2JFM/BJoSi4POACZ
	6oTS908J8cNvcC3OghNEwetGqA5G2fsRgqU8hJbxfXlWNBFYY2+Hi06bgXxNgJOACI9BImd8NHcX9
	BKWCg96wRjgTg5/GADBsdNwaBhcQc0i8y8T/vMrMKqJVU4Q2N5UXmuUXd2aP7F++8ETs9nekU2zMc
	KI+KBcAMoSWugKPdNsf6g8c0t4FY3LLnVZJUgW1RuOgmckiqyFfCqUp4/WAX0omNfe1niT7j47Bw2
	GvA0pRgWni1+eQnRVWnDZ6rayYP7pxz/H8RTgApg9DY0snfjAHfVSMOagTKIEEeTo0AJSVFsWedK8
	BX12X22Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGDJ-00000001W1n-0gIX
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 17:40:25 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqGDF-00000001W0J-2CEi
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 17:40:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42THeKcb018011;
	Fri, 29 Mar 2024 17:40:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-type; s=qcppdkim1; bh=zHHhocOpqjPnDdHPeMG3
	McXCVuNvcM650SHyLS7EA1c=; b=pJeoqz2aHeUPWIe2mIBKZccYhSowHSzQKdn5
	ff8HM02ogrNUmoCThFOnQxinEsrxqNeYkBF76+jaULWontxqqcpRteJCY8ib7zQN
	mpF5Jrd9abZXNyHa2df9PyWkh549HvfONQAI+7wdJRTA/7g28iu0ChVrAE+lFknL
	fsXDZXZ3sBUbXs45xfE2WHElQ9fzobRuNDwYYFoElAqlUJruRn0UvvvdK9Q8zWHb
	27sR2iOXOVszcpRXPfRecsY1SXhl6NNgMkiZaee6/2JAzHsd7Zoiy1DfqtYhb1aZ
	TjCrxX3byKrQ1iwUZI8cMrjW7DmfLTy4Z62alakIYNzeg+OmRg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x60wd8608-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:40:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42THdcV6025587
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 17:39:38 GMT
Received: from pradeepc2-linux.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Fri, 29 Mar 2024 10:39:37 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v2 3/6] wifi: ath12k: fix survey dump collection in 6 GHz
Date: Fri, 29 Mar 2024 10:39:23 -0700
Message-ID: <20240329173926.17741-4-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
References: <20240329173926.17741-1-quic_pradeepc@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: fxc0fkMt4NQegTnZN32VvVm_eN5Hnu12
X-Proofpoint-ORIG-GUID: fxc0fkMt4NQegTnZN32VvVm_eN5Hnu12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=808
 malwarescore=0 spamscore=0 lowpriorityscore=0 impostorscore=0 mlxscore=0
 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0 priorityscore=1501
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2403210001
 definitions=main-2403290157
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_104021_773423_2C9724E7 
X-CRM114-Status: GOOD (  11.82  )
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

When ath12k receives survey request, choose the 6 GHz band
when enabled. Without this, survey requests do not include
any 6 GHz band results, leading to failures in auto channel
selection.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/mac.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
index b91d34b602dd..6d7df18ec424 100644
--- a/drivers/net/wireless/ath/ath12k/mac.c
+++ b/drivers/net/wireless/ath/ath12k/mac.c
@@ -7419,7 +7419,13 @@ static int ath12k_mac_op_get_survey(struct ieee80211_hw *hw, int idx,
 
 	if (!sband)
 		sband = hw->wiphy->bands[NL80211_BAND_5GHZ];
+	if (sband && idx >= sband->n_channels) {
+		idx -= sband->n_channels;
+		sband = NULL;
+	}
 
+	if (!sband)
+		sband = hw->wiphy->bands[NL80211_BAND_6GHZ];
 	if (!sband || idx >= sband->n_channels) {
 		ret = -ENOENT;
 		goto exit;
-- 
2.17.1


