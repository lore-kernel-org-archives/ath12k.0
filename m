Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B31C4345F
	for <ath12k@archiver.kernel.org>; Sat, 27 Apr 2024 16:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFd6ENsGO/cclvnJCgMh9yw2JMm3BjWGly3AxMK9K2w=; b=A3Bx4DRVtJz3F5aG5KDcvRbM/D
	0GQSY9oywAr47YTlpmoRYM/+8jgg5tFsjxm/XMaOqBVmZtrhTYsOqpGnd3V0dEH904UdxeuNuMb+Y
	UegMXtaocgf+mYYwLFSSoaxkd1BtLL670caneLxiDHCHTqhJG8E+OeKiQCs+1qhhCIcpz4j/GLCl2
	+jZrXA3BenU9qRSAgrZBWfWf0UAYZz99L7p+RwZsI0x6U2Zjd/xsH/8Ythglnlg190DTWsKoDl3vC
	BGGF5CYCKD00Y2DkbU4ivxcm8HAUxHf8eZgYqhQaXT2NhQyq/fbFjoZoG4QN1RHfHQ+ANWiJB7Qmh
	Gabgo59A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ktN-0000000Fo6O-1Avc
	for ath12k@archiver.kernel.org;
	Sat, 27 Apr 2024 16:27:13 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ktJ-0000000Fo4Y-3nY3
	for ath12k@lists.infradead.org;
	Sat, 27 Apr 2024 16:27:11 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43RG85tE005221;
	Sat, 27 Apr 2024 16:27:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	qcppdkim1; bh=nFd6ENsGO/cclvnJCgMh9yw2JMm3BjWGly3AxMK9K2w=; b=Bx
	wTvZs99GNcuKHs1QabkL2Y+eg94aYNR+uu6zmV8AgGgek3Z00GVTjwKOEe3aRfUp
	CfTlFZ11uPNm+5JwrcMieM1fmjuZ8TEy7jtQNYlxe0rvvbFafuVFdJO+Y6e+irCf
	/biQEOrVG9I/V7ZmlfsA7MJxQIWr6Tso9yDMWf+17/c1RZwANOZDzZYHUNb0cbRt
	6MKEwqV8+mGljyac5xAkpW5cg3Ui0LO4iXKSyrZl4THzFJstZFnVPmhQhAWRjiJl
	KFtS3hrtvXifyGOM/7Hun60RjNVHK1+mdrBB3v5gFw43JKKTxg1FT7dx8FoLt+ZD
	t5R4gUE5siQvlZcT5BIQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrq2k0ufn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 16:27:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43RGR3F6026137
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 16:27:03 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 27 Apr 2024 09:27:01 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv2 1/3] wifi: ath12k: fix calling correct function for rx monitor mode
Date: Sat, 27 Apr 2024 21:56:42 +0530
Message-ID: <20240427162644.2470886-2-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
References: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: hmnSK9l7zw4XK6P1RNFc5HIi18bt6lXb
X-Proofpoint-GUID: hmnSK9l7zw4XK6P1RNFc5HIi18bt6lXb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-27_14,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 adultscore=0 malwarescore=0 mlxscore=0 priorityscore=1501
 suspectscore=0 phishscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404270120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_092709_988114_7DF95AF8 
X-CRM114-Status: GOOD (  10.64  )
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

Currently in ath12k_dp_tx_htt_monitor_mode_ring_config()
ath12k_dp_tx_htt_tx_monitor_mode_ring_config() function wrongly called twice.
Fix that by calling ath12k_dp_tx_htt_rx_monitor_mode_ring_config().

Currently monitor mode is disabled in driver so the change is compile
tested and boot sequence verified.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Signed-off-by: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
---
 drivers/net/wireless/ath/ath12k/dp_tx.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath12k/dp_tx.c b/drivers/net/wireless/ath/ath12k/dp_tx.c
index 9b6d7d72f57c..2fb9fc42db11 100644
--- a/drivers/net/wireless/ath/ath12k/dp_tx.c
+++ b/drivers/net/wireless/ath/ath12k/dp_tx.c
@@ -1044,7 +1044,7 @@ int ath12k_dp_tx_htt_monitor_mode_ring_config(struct ath12k *ar, bool reset)
 	struct ath12k_base *ab = ar->ab;
 	int ret;
 
-	ret = ath12k_dp_tx_htt_tx_monitor_mode_ring_config(ar, reset);
+	ret = ath12k_dp_tx_htt_rx_monitor_mode_ring_config(ar, reset);
 	if (ret) {
 		ath12k_err(ab, "failed to setup tx monitor filter %d\n", ret);
 		return ret;
-- 
2.34.1


