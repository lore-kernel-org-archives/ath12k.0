Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5BB3C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 13:17:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=vxYjAOui+sHY6cUMnscS8hwN2O2R8f0csN7n9FcYSlE=; b=bvX7+aaH6D6Ryq2+KmtMiyd3hF
	/hk0r66nMmqitFInFQvSgbi5caJ0kwz1l6+PcrVdocF6zE9XE78x6Otl3k/Bexg1e68SFZ8alZFK7
	fycXKGmOnFdh6yMJtAMNEynLz3uzI1aOyUIP6pyM6NIgURr87k+bleUy2cDLysRJxZ2E+YS7w4HYt
	YGe9UiRgiaTQwgGjp7Bh96h+34ptci4UxbNZp+LBIIINRq1VkEAVOM/C/c/9gz0QF7qacZN+VeL8e
	fLJjusqOGddS9rv2XldRDo7wLd35o2pUVA67nM420iL9Ne0V/zM+Afw4KKjmvEWTMzik76TVE9u8p
	6WZMZtVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCET-0000000AnEP-1ZgI
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 13:17:13 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJCEP-0000000AnCi-1sru
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 13:17:11 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45HAh09o023593;
	Mon, 17 Jun 2024 13:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=vxYjAOui+sHY6cUMnscS8h
	wN2O2R8f0csN7n9FcYSlE=; b=MYScLTisJ6yMDt3d0Y/LPZSNnOs9dUHC3RWzZI
	fTIhEXtYTp9928/MKs99EakLBrLrjxrT9ULGmWEYvq4vo6XRXO9cIINPRU9XO4ew
	9VQ0bzjLb22tw2mw8HkgHsKS7dtlmn1R5UUnIo0HhKetKhgCxoXwTz8hMZY/MMEt
	sVa1f2z5/uDWGiKnlHXKdhb7PoHo9vunN5mpXEUqPIbR6hg/9SDPb5wA63+oKGTM
	KZQwNs5XYmdqeLPhWtIAxVkUz902BdN1i7IOfYjZ3ZqHuF/ziyO7+NvFHUP1YbMY
	kGxHiM0opBvB1etsBPD07YmmnS5ZrVZPksVyDFG6pZibpDuw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3ys1y6usru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 13:17:07 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45HDH5tM024604
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Jun 2024 13:17:05 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 17 Jun 2024 06:17:04 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Rameshkumar Sundaram
	<quic_ramess@quicinc.com>
Subject: [PATCH v4 0/3] wifi: ath12k: prepare vif and sta datastructure
Date: Mon, 17 Jun 2024 18:46:47 +0530
Message-ID: <20240617131650.3288118-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: s31sXdlEp-m3Ra11t0uxAYlO5N2Uh8vK
X-Proofpoint-ORIG-GUID: s31sXdlEp-m3Ra11t0uxAYlO5N2Uh8vK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-17_11,2024-06-17_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 impostorscore=0 mlxscore=0 bulkscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 mlxlogscore=684 suspectscore=0 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406170103
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_061709_618427_02B59560 
X-CRM114-Status: UNSURE (   8.81  )
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

To prepare the driver for MLO support, split the driver vif and sta
data structure to scale for multiple links. This requires changing
the use of arvif and arsta to per link and not per hw which can now
comprise of multiple links.
Also since most configurations from mac80211 are done per link,
do refactoring of the driver functions to apply these configurations
at link level.
Add the required locking changes to synchronize the usage of these
per link objects.

---
v4:
 - Extensive rebase on PATCH 1/3 on ToT as MBSSID changes are
   introduced since v3.
v3:
 - Rebased on ToT

v2:
 - Rebased PATCH 1/3 on ToT as b0afabc4d7e0 (wifi: ath12k: add support to
   handle beacon miss for WCN7850) has introduced few APIs that use
   arvif.

Sriram R (3):
  wifi: ath12k: prepare vif data structure for MLO handling
  wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
  wifi: ath12k: prepare sta data structure for MLO handling

 drivers/net/wireless/ath/ath12k/core.h   |  89 ++-
 drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 921 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h    |   9 +-
 drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
 drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
 drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
 drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  12 +-
 15 files changed, 728 insertions(+), 400 deletions(-)


base-commit: e72048809ec7355a947415ae6836d2eb7fdcda39
-- 
2.34.1


