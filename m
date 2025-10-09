Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FEB5CCD18A
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 11:11:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d462OtAVwzlJkjANvTb3BwAtXgr1GzRu102yV7Eu1ys=; b=lJBGVzW1usQANgx0tymdpxFIvy
	UACx92cRIQn4NOtQoPoHLQxkc/4OdOFKjBgN5gNgDATBDoWgleQmjB8hfO0Xb9utcaxQ0zkbgVViM
	sLxZaXdb3OTryWoaLkJMBOCQssLJH7LwSGkJM9bdOXOzurES3OYHKVkuHu6KE+PA6xNza08iQg8NE
	dtFsABeKeRS8dPOdhwGiQnNJeCwSkfokICYdSlTzDpy+rWRrBMdU9YLFDQdjtHl3Ng2Mp/ZaY8rzs
	EABs2njm4OVARGo9ltfE7j9fIpO5BrDeYjDKakSlKna/O7sfTdDYyshs7dW40dqs3fDvEYM/odxm8
	yZYPXsWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oYF-00000005ukb-05pq;
	Thu, 09 Oct 2025 11:11:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6oYC-00000005uiF-1YA7
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 11:11:13 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EgEe022541;
	Thu, 9 Oct 2025 11:11:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	d462OtAVwzlJkjANvTb3BwAtXgr1GzRu102yV7Eu1ys=; b=Bj3rKIKQ5NGQOahG
	thoMySSLCY9Y/PoHMZDjTV4YyQiFzMQlX2FI173Yv+IntsE5XYUyMaPg5p9UDS89
	e4kRm30sMkbmuLX8GbS71eJkEiyzlotk2vRLgAE2aNqmH24hYxPi07l4DSTlov48
	yD6mpjq0SQdEAZKh9BKJ341DpfMZzvhMnx085wcvqwqy+bUYADWUZkOYVtXqbfwj
	OxGNmZvl0nNmArd5UOkd10joFM2uBuRacRNmmYFnPMwWKQ2hd0Ud1NACF5eQhr8T
	j1s32Y0jeXz55PlkTIkLUGXNMI3LzkP0YJ5oyPfsalyvbwQGV+AI1NZvN/wQr17q
	3i+jDg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4sjgr6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 09 Oct 2025 11:11:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 599BBAfe021635
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 9 Oct 2025 11:11:10 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 9 Oct 2025 04:11:09 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 06/18] wifi: ath12k: Add direct HAL pointer in ath12k_dp
Date: Thu, 9 Oct 2025 16:40:33 +0530
Message-ID: <20251009111045.1763001-7-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
References: <20251009111045.1763001-1-quic_rdeuri@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cbho-jUzj5rOo9MJIp59ihts5fcRI9pk
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfXz6RwguNxTpwz
 TsWtShFE7Abs56gQs+jbUExuZAwfJVWDjQLGUh83MnTgP9Ez1EF6l5y06j/CoZsivqH2jK4tYBL
 /U3p1uADv4eHsKIwPB0JmiptUwgrNfVBFmfy7rFZqUWelmVG5vRgWxRsJCgzxFdjvsQCnn2RrTD
 xmnmIgx3312bVBnkMnN8o2r9GtX/AT8UuxlBgAflyxeVczkf/fFSVh5scpUxzxgYlelAWq5ILyd
 wcTdiQ64gxBy1GsfDlRX1Q2viEma6mmxl2eLYCNV7juA5IGBGI31KEijyxGKnZvqfEOkUW8ae9j
 mqiCMLgyxEsL8JIGEYnULT/qBal59RXOLQZN9xr3FQUZkwhhrSG92k7qTI1EldrPV2jQxyd2JVz
 R9iTMY8uJUiw+U+qOlHF3ARysJJSHw==
X-Authority-Analysis: v=2.4 cv=SfL6t/Ru c=1 sm=1 tr=0 ts=68e7984f cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ZvKp1mPiiKzcst2GRK4A:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: cbho-jUzj5rOo9MJIp59ihts5fcRI9pk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_03,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0 priorityscore=1501
 suspectscore=0 impostorscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_041112_536722_9362D79A 
X-CRM114-Status: GOOD (  12.20  )
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

From: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>

Add a direct pointer to the HAL context in ath12k_dp. Since ath12k_dp
is frequenctly used in the per-packet data path, this avoids the need
to access the HAL handle through the ab pointer, reducing indirection
in the per-packet data path.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

Signed-off-by: Pavankumar Nandeshwar <quic_pnandesh@quicinc.com>
Signed-off-by: Ripan Deuri <quic_rdeuri@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp.h       | 1 +
 drivers/net/wireless/ath/ath12k/wifi7/dp.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/net/wireless/ath/ath12k/dp.h b/drivers/net/wireless/ath/ath12k/dp.h
index 284e89f7c4b8..9690e3472ab7 100644
--- a/drivers/net/wireless/ath/ath12k/dp.h
+++ b/drivers/net/wireless/ath/ath12k/dp.h
@@ -447,6 +447,7 @@ struct ath12k_dp {
 	struct ath12k_reo_q_addr_lut ml_reoq_lut;
 	const struct ath12k_hw_params *hw_params;
 	struct device *dev;
+	struct ath12k_hal *hal;
 
 	/* RCU on dp_pdevs[] provides a teardown synchronization mechanism,
 	 * ensuring in-flight data path readers complete before reclaim. Writers
diff --git a/drivers/net/wireless/ath/ath12k/wifi7/dp.c b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
index 4465a9e93bf8..e691d0ca0d75 100644
--- a/drivers/net/wireless/ath/ath12k/wifi7/dp.c
+++ b/drivers/net/wireless/ath/ath12k/wifi7/dp.c
@@ -152,6 +152,7 @@ struct ath12k_dp *ath12k_wifi7_dp_device_alloc(struct ath12k_base *ab)
 	dp->ab = ab;
 	dp->dev = ab->dev;
 	dp->hw_params = ab->hw_params;
+	dp->hal = &ab->hal;
 
 	dp->ops = &ath12k_wifi7_dp_arch_ops;
 
-- 
2.34.1


