Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C12EFCD128A
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 01:24:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EegkrLJ0Q1CME0DgtPAwFh0g+7lVxuyikd/jJD7CxZk=; b=fuz1sf9500Bx33W83Lr/rRULLr
	WsRgQ8v7sDIg+mXD0E+xdrJ2uK3Km5MgCZSiTgJyVV1ACKVJCMinbQBfPdSFZv+85rwxEM+3YLHK3
	TTk7YYyXDRjaFuQrJy27Obmcu120tgmMp2f0P2xMtyvnUESHoGk+HBmOtpH76zNQTQWrWm0ZhHQtA
	A0OAq9nkSSF46VyH1ljr3HG1hboRCIIssw22yDtoBaJKf08psRVF5gDej4rLSl1picK073fo4OmBs
	k7z5WuCkHTxHDEZWPSuttRUAQIcOdJnhfP2vcooK3zu8jOU8FwcUNTASvbAaz9eAUsCIfSYuUsNsM
	6qe/WH4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq0yk-0000000GNC8-25zG
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 01:24:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rq0yi-0000000GNAo-148v
	for ath12k@lists.infradead.org;
	Fri, 29 Mar 2024 01:24:21 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42T01cY6013914;
	Fri, 29 Mar 2024 01:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=EegkrLJ0Q1CME0DgtPAwFh0g+7lVxuyikd/jJD7CxZk=; b=K4
	U0mUBj0mP3UgCVD7YL51ZAGIGWytPd1lWgGenFSS8weCihFhoDBvGJr1MORY89mQ
	dnSLwOF4QduCAlEwcn+cOJA3nlFLK/nNtuQ4a2VqQ41xrCROPwr3zepBt2+cW2P+
	TxDlSB+AlOygU9OFGo+A1c84baLamFrzujoJZ1N37duEBfNsvDINZTZEgUQ6ZC6R
	0IE5LUpTx6W4tx62XVg4O8jvmBvzb5qNCUnGaXNlN/OMXUXkg3zgd+i6qsYxsUW1
	a51236vSzw4CG0UGX1XJewQVP9+XtyR94jrom3OeL1jy1wFVI3K/75d+JEaPX3ht
	IhL1a/KwZhPdm+Rb5aXw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5fs88emp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:24:18 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42T1OHlH011790
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 01:24:17 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 18:24:15 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 2/2] wifi: ath12k: fix link capable flags
Date: Fri, 29 Mar 2024 06:53:58 +0530
Message-ID: <20240329012358.2242354-3-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
References: <20240329012358.2242354-1-quic_periyasa@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: CWsaVf2OTbQsJ1syaufSFnLSiV8UyflY
X-Proofpoint-ORIG-GUID: CWsaVf2OTbQsJ1syaufSFnLSiV8UyflY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_19,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 mlxscore=0 adultscore=0 malwarescore=0 impostorscore=0 clxscore=1015
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403290010
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_182420_492746_43FA7DA2 
X-CRM114-Status: GOOD (  10.84  )
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

By default driver supports intra-chip SLO/MLO, the link capability flags
reflect this. When the QMI PHY capability learning fails driver not enable
the MLO parameter in the host capability QMI request message. In this case,
reset the chip link capability flags to zero (SLO/MLO not support) to
accurately represent the capabilities.

Found in code review.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1

Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/qmi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/qmi.c b/drivers/net/wireless/ath/ath12k/qmi.c
index 3f0d2b99127a..db8ba5fec2ae 100644
--- a/drivers/net/wireless/ath/ath12k/qmi.c
+++ b/drivers/net/wireless/ath/ath12k/qmi.c
@@ -2006,6 +2006,8 @@ static void ath12k_host_cap_parse_mlo(struct ath12k_base *ab,
 	int i;
 
 	if (!ab->qmi.num_radios || ab->qmi.num_radios == U8_MAX) {
+		ab->mlo_capable_flags = 0;
+
 		ath12k_dbg(ab, ATH12K_DBG_QMI,
 			   "skip QMI MLO cap due to invalid num_radio %d\n",
 			   ab->qmi.num_radios);
-- 
2.34.1


