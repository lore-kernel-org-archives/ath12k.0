Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C357C4345F
	for <ath12k@archiver.kernel.org>; Sat, 27 Apr 2024 16:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4ioZUz64SAYmX1rfKc3OPl/bfAwK4ChG/nHj1J/WXA4=; b=JnvVPxZnY8TxN7jBMugSLjxx+o
	RE9su4PDiYhyPFOxQ9TayD5TIhATEKQgZNqU+6eQZ6dOAPtvQHjvACPbguJNRHyAxfjZuEFkHXEY4
	csYjYmDN83ytfDYiWJG5RbDMFXefF+iCT8B4Ravq1s6r1GAHbNgzu2nsOj1pQeWGtm7e/a8kYB/+Z
	6AeYgM2aQhlHtKyce8XlzGs4lO1tOX4Q0GfSYKpia24IAWwFgao4P3LO7i4/6ajIC++w9aMOBe6/k
	m0tyRfGczeWBgQlzSBl7RFbu53sy9Fw6SWaYxkrSCaByM2KIEbEUx6OvdGHPJjCRkWV/wddoOf46G
	4xJ58GRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ktD-0000000Fo4K-2ZoN
	for ath12k@archiver.kernel.org;
	Sat, 27 Apr 2024 16:27:03 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0ktB-0000000Fo3n-0TNM
	for ath12k@lists.infradead.org;
	Sat, 27 Apr 2024 16:27:02 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43RGQNIa029512;
	Sat, 27 Apr 2024 16:26:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=4ioZUz6
	4SAYmX1rfKc3OPl/bfAwK4ChG/nHj1J/WXA4=; b=B3WSxw1vxAiTVMckSci+9vZ
	DVh47Q3TJlx/GC+O0YFV1xndp7ldTO3YcjOsldU9QHV7Q25sHPb+EP/uiNpB/EnV
	Wa/oMoeKkzD2KbdeJAQr4gxlWoNAWsxMikwTpRMpXiGFxuvmCAmuuP8ZKsRA1Sit
	TBpOO88q7Gy2BIs4DP5zIsqrcmuy0X2mRNik5umczMQqE+yImLO9aiMvKRuG0ZFX
	CTSm6IIhYewS2xOrKoYdNfJOvrbpp6YI7rAkySrbbfDuNFCHBQI8zSmwI3bfJBmi
	AmiL9EQWHfl2Yuc3M/FGZndQRSf87igFvvB63AsFFwCw6473Z104f/g9vUMor3g=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrrpq0qva-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 16:26:58 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43RGQukC013429
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 27 Apr 2024 16:26:57 GMT
Received: from hu-tamizhr-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sat, 27 Apr 2024 09:26:55 -0700
From: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Tamizh Chelvam Raja
	<quic_tamizhr@quicinc.com>
Subject: [PATCHv2 0/3] wifi: ath12k: Remove unsupported and unused ring configurations
Date: Sat, 27 Apr 2024 21:56:41 +0530
Message-ID: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: ysHqXzGyjGOXNqRb1LAb9PwFEFpLjTAH
X-Proofpoint-ORIG-GUID: ysHqXzGyjGOXNqRb1LAb9PwFEFpLjTAH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-27_14,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=745 adultscore=0
 spamscore=0 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404270120
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_092701_318310_2043F23B 
X-CRM114-Status: UNSURE (   7.15  )
X-CRM114-Notice: Please train this message.
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

Currently in driver doing memory allocation for tx_monitor,
tcl_cmd_ring and tcl_status ring. Here driver support for
tx_monitor mode is not there and memory for tcl_cmd and tcl_status
rings are allocated by firmware and it uses that memory instead of
host allocated. So avoid these unused ring setup configuration.

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1

Tamizh Chelvam Raja (3):
  wifi: ath12k: fix calling correct function for rx monitor mode
  wifi: ath12k: Remove unsupported tx monitor handling
  wifi: ath12k: Remove unused tcl_*_ring configuration

v2:
  * Rebased on top of ToT

 drivers/net/wireless/ath/ath12k/dp.c     | 16 -------
 drivers/net/wireless/ath/ath12k/dp.h     |  2 -
 drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +----------------
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 56 ------------------------
 drivers/net/wireless/ath/ath12k/dp_tx.c  | 44 +------------------
 drivers/net/wireless/ath/ath12k/dp_tx.h  |  1 -
 6 files changed, 2 insertions(+), 157 deletions(-)


base-commit: bf99bc7423e18aa3475ef00a7a6fb773c31ce6df
-- 
2.34.1


