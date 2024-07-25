Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98D80C3DA7F
	for <ath12k@archiver.kernel.org>; Thu, 25 Jul 2024 12:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8oJs4jKM64Bb4UIhzhy5Q7DGSrTTbVldln+tr59H8Do=; b=OJQQzRdDlAFzV4/FnZ1Pnp5yuL
	uI+1aohkCDAvM1XiWrYqxYNPaT4+zx7jINn0WMFffMqK2CPyFrkOJqtD9U6wogrfHNgAYwLzQaSnT
	fw37AArMNOGu1Wb2jAQRH8FwukEvvRMIJnv91BpGJbDc+ojicsxYPuxil52hGSU+BsPIb9eUrUz3b
	fefCfX33qFe1bvwjCxdBdWdC9qA5be6YHzJynGuj331RbECHEveQat8BN6TRMByzsEca4BPLCjVub
	Clxyd/WywKphr4OiIRTG/AXr9sMPo2iGSa5cX2ycrS7osRDed8uyHRg2Z1N0NQgaIQKN3p0HtomK2
	srvTjm6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9s-00000000q3P-19Ye
	for ath12k@archiver.kernel.org;
	Thu, 25 Jul 2024 12:01:20 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sWx9d-00000000puJ-1nQj
	for ath12k@lists.infradead.org;
	Thu, 25 Jul 2024 12:01:09 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46P8OAkP010205;
	Thu, 25 Jul 2024 12:01:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8oJs4jKM64Bb4UIhzhy5Q7DGSrTTbVldln+tr59H8Do=; b=OwIDGNLJG62YEiy2
	/XyuEPcfjKX8iqZbVY4yOdsVM2Iww4w/rR5w4yzdbhYXreSjc9EHvmtA3TBCs9mB
	LwQPf5MvTjE6h0GL7SRoNj9zh53KH2sioizujPM6Qk3f4rUArhqeJCzpgn8flwNR
	UIRrUEoZlol/iLwrpAbyvF4OD1jRPlgrD0wlGWKiL2xwFXQj4+imhphZKWDVyNIP
	8A6wwCNv8aSUfrgjqGcDXKPJV4ppfpPoD9xPSpgJSRwWnlKIdttDKCbx6nZzkorL
	qnF61/SE+e2ekU1sdjikM9ORCkff1wUAHt2w8hTbRgT4MO5dLFbwYUQRhSpI0pcZ
	A8Dvwg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40g5auw5mq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:02 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 46PC11et005910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jul 2024 12:01:01 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Jul 2024 05:01:00 -0700
From: kangyang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 01/11] wifi: ath12k: remove unused variable monitor_present
Date: Thu, 25 Jul 2024 20:00:25 +0800
Message-ID: <20240725120035.493-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20240725120035.493-1-quic_kangyang@quicinc.com>
References: <20240725120035.493-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: Pypnw9picooE8oSSx9Ew2ac1m9KfxUXG
X-Proofpoint-GUID: Pypnw9picooE8oSSx9Ew2ac1m9KfxUXG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-25_11,2024-07-25_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 bulkscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 clxscore=1015 phishscore=0 spamscore=0 adultscore=0 mlxlogscore=807
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2407250082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240725_050105_723236_5D0A6C48 
X-CRM114-Status: GOOD (  10.60  )
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

From: Kang Yang <quic_kangyang@quicinc.com>

Variable monitor_present is never used. So delete it.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index cdfd43a7321a..00c96d839a77 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -555,7 +555,6 @@ struct ath12k {
 	u32 chan_tx_pwr;
 	u32 num_stations;
 	u32 max_num_stations;
-	bool monitor_present;
 	/* To synchronize concurrent synchronous mac80211 callback operations,
 	 * concurrent debugfs configuration and concurrent FW statistics events.
 	 */
-- 
2.34.1


