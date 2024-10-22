Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07288D15DBB
	for <ath12k@archiver.kernel.org>; Tue, 22 Oct 2024 11:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AT8IM7dGlh4w7Wm/i4xqTehVvmW0MDupNWwi7S4xI0o=; b=pMyjkP3npu9DUm/04j7U1Nz4dF
	ZHcZmAVt4+kF0nyXp4aZ+TFgb8p+9RX23JvXXOOB4RSuLeMw7PAOOTePZqEbJVnK1nor/efqH34pA
	KBNeEAoKGI9cLyc3PES4E+0ZQSmHa1aFR9t1w1l3e2I2KS8KlvFZoJV2Z1joMiPLmOl61Jq2IDrV3
	CXEfhaU7J1KHso3IX9p4M9Rx4Rp+J06j+0203t4IHwfizQ8bDmY3SZqPWRCJwC1QM94a/ILSucob3
	IXRnqN05vfmwQ1E9AStB4NaexMZ9nd36ZJc/0zJU1riz4Q9HVMWpAnWbLT3RMu5PzVZk7q/wPDj72
	Nen2et2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3CmQ-0000000AeT0-2wCU
	for ath12k@archiver.kernel.org;
	Tue, 22 Oct 2024 11:10:26 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3Ckz-0000000AeEZ-2RQB
	for ath12k@lists.infradead.org;
	Tue, 22 Oct 2024 11:08:59 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49M8j8dE017139;
	Tue, 22 Oct 2024 11:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AT8IM7dGlh4w7Wm/i4xqTehVvmW0MDupNWwi7S4xI0o=; b=fHQugz9Hyxd70wAp
	JIOac+Dz8SZKUMxOpPi/qRYnQlj+f+V55trfluZtZw1ShwgrzLrE250G6ekvpLpX
	p+oxlmEPBubb5bbJXrLMDHRWQazwd1ZNETiMQvgOfZrff0Tc1pd4459GCaNwW4bX
	IStrghM1LQBBIiy66OEyBkr81Sfn8G79++flyCuPXuIG9EPnoDGd8OufSeLkafVQ
	T5dwfMTTl5z58z9TtTSrideL8rhcVLbWw+9U0Yb7nUUj5fCBQjVNFiwf1NLtAoso
	GwxNaINK3kGbiTu1nX9gjV9gQiAHJEgHq4Xgz4MuiWTE3oHq1Wx0WetLiP9VkuAG
	IJdS5A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42dmdqbwbd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:55 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49MB8sUH012118
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 22 Oct 2024 11:08:54 GMT
Received: from kangyang.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 22 Oct 2024 04:08:52 -0700
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH v6 1/8] wifi: ath12k: remove unused variable monitor_present
Date: Tue, 22 Oct 2024 19:08:24 +0800
Message-ID: <20241022110831.974-2-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1.windows.1
In-Reply-To: <20241022110831.974-1-quic_kangyang@quicinc.com>
References: <20241022110831.974-1-quic_kangyang@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e2EedMZrcQF-Q05NSDp6113X6GNnDYsC
X-Proofpoint-GUID: e2EedMZrcQF-Q05NSDp6113X6GNnDYsC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 spamscore=0 mlxscore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 clxscore=1015 malwarescore=0 impostorscore=0
 adultscore=0 mlxlogscore=739 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2409260000 definitions=main-2410220071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241022_040857_833777_1ABA8A32 
X-CRM114-Status: GOOD (  11.37  )
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

Variable monitor_present is not used yet and will not be used in future
monitor mode. So delete it as cleanup.

Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Kang Yang <quic_kangyang@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/core.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/core.h b/drivers/net/wireless/ath/ath12k/core.h
index 23283ec3a81c..3410fcaac128 100644
--- a/drivers/net/wireless/ath/ath12k/core.h
+++ b/drivers/net/wireless/ath/ath12k/core.h
@@ -610,7 +610,6 @@ struct ath12k {
 	u32 chan_tx_pwr;
 	u32 num_stations;
 	u32 max_num_stations;
-	bool monitor_present;
 
 	/* protects the radio specific data like debug stats, ppdu_stats_info stats,
 	 * vdev_stop_status info, scan data, ath12k_sta info, ath12k_link_vif info,
-- 
2.34.1


