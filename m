Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91730C0219B
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 03:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9Qr74uiUYy6jVSRStow5b/VDpCtdISYLDj3LhDvUnW4=; b=s9PI/Ba0ORFlmt91XUE8mFs5L/
	YmDlGDh3/bbLGmRxToCn0qcqr8AzA0Uvptyxd4AanWQddeFxN+KoxlwSEUlo+ee7jV6uaMM59TBgo
	WpQpIBdDFBUep6f+07Q9uuAkvqhO5CUhXz28/MmMktA1EEK9winyOakBXpzchl5ysV4Ek7Wpb1Nzu
	NpTtR6k0LA/gqVYzpfo91REIiOi1HHvg8n1OGSR51lfllW0CPKN8Rj5CF/M9HX4f+Dre+7pTYMCVN
	KAKmmwofnZu/me3hvDpK8V0qxqIdD8jCQc4A6pA11sknL40Oh75+U14k6SuIrDo1Rnncb/c2Jbu0X
	T14ILj1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsyC-000000059LF-0kPI
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 03:54:28 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfsyA-000000059Kj-1dFi
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 03:54:27 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5163JnDL017510;
	Thu, 6 Feb 2025 03:54:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9Qr74uiUYy6jVSRStow5b/VDpCtdISYLDj3LhDvUnW4=; b=lIEhNfy3sN/pZsZm
	thMX7tslyGOYleHst5KAx1FZavmJCBj2QEGW56IXsOPpk19V+wo4rHHLsTKQefJJ
	zqtOS3VS66kAj1dCi6Jyw/bpDXWm5G+JzGoAStI7CnSXuHuxjOqyL3vHQCs+7Cs0
	dNQoVrovyMLA9jzP+H80GwlHB8xqrf0Jd94QFeGfhUnNd3q6m8Yo3iOcsC8KHOvK
	yZGfWPGllfi42oyNhlKdRpA/gnibtsLYmogu10dMSjcChbiSa8D8xi6b3ukA3Yyd
	ItAlf0k+owYocONrJ987oQX+3cOfgPjIgJn2nRL4iXtg8nNWIb5ldAZ7uH9qL5wk
	odrz9w==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44mn2yg248-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 03:54:25 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5163sO4w002863
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 6 Feb 2025 03:54:24 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 5 Feb 2025 19:54:22 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Hari Chandrakanthan
	<quic_haric@quicinc.com>,
        Nicolas Escande <nico.escande@gmail.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: [PATCH v5 1/7] wifi: ath12k: fix link valid field initialization in the monitor Rx
Date: Thu, 6 Feb 2025 09:23:51 +0530
Message-ID: <20250206035357.310868-2-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250206035357.310868-1-quic_periyasa@quicinc.com>
References: <20250206035357.310868-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: gOA0_1pGoDofWi0z8dzbn9-91Zw2sruE
X-Proofpoint-GUID: gOA0_1pGoDofWi0z8dzbn9-91Zw2sruE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_01,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxscore=0
 impostorscore=0 spamscore=0 mlxlogscore=795 clxscore=1015
 lowpriorityscore=0 bulkscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2501170000 definitions=main-2502060029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250205_195426_434259_1FB5C394 
X-CRM114-Status: GOOD (  10.70  )
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

From: Hari Chandrakanthan <quic_haric@quicinc.com>

Currently, the link_valid field is not initialized in the monitor Rx path.
This can result in random values for the link_valid and link_id leads to
undefined behaviour in mac80211. Therefore, initialize the link_valid
field in the monitor Rx path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Hari Chandrakanthan <quic_haric@quicinc.com>
Tested-by: Nicolas Escande <nico.escande@gmail.com>
Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_mon.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp_mon.c b/drivers/net/wireless/ath/ath12k/dp_mon.c
index 0a85b198ec7a..12224fea9801 100644
--- a/drivers/net/wireless/ath/ath12k/dp_mon.c
+++ b/drivers/net/wireless/ath/ath12k/dp_mon.c
@@ -1970,6 +1970,8 @@ static void ath12k_dp_mon_rx_deliver_msdu(struct ath12k *ar, struct napi_struct
 	bool is_mcbc = rxcb->is_mcbc;
 	bool is_eapol_tkip = rxcb->is_eapol;
 
+	status->link_valid = 0;
+
 	if ((status->encoding == RX_ENC_HE) && !(status->flag & RX_FLAG_RADIOTAP_HE) &&
 	    !(status->flag & RX_FLAG_SKIP_MONITOR)) {
 		he = skb_push(msdu, sizeof(known));
-- 
2.34.1


