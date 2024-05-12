Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 188DAC10F1A
	for <ath12k@archiver.kernel.org>; Sun, 12 May 2024 11:03:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0TkP1ofQ9/M7Xhxb32vl2WjCX6fvJ510gnM2k3F+gTk=; b=G+7mrLvS7BODdYdwts8tKt1Y5+
	rnTCvX54p6sADfB8G+h+ESI1da3q6E7xVN7a+wSvuv2R8DHryfGkOhTyluPxSmmXYwpH//zTiZbda
	9cDEzqo1Emh8NVwCBJBGTbSL5ZMwoWe9oKHldYZ9EdzG7mshOQ4beY6eqRotXrVKykWLs73aIUEMP
	Eq5FaxGV+bUnpSBRDkUyqxM+7ewSupvtD/qZ8qJ1TczC54B/MqBkvIMpQm8tW/X+riM3VqE3USiar
	3qynIp4vo30xDyiwl+x+ZBpP9bKN/pfOeeMvjdXxaH2Hdi7IxyeZeE4YMDf57Ipt9LFq/pRmGHkV8
	K2PMARpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s66zE-00000009mYp-2kd9
	for ath12k@archiver.kernel.org;
	Sun, 12 May 2024 11:03:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s66zB-00000009mWd-18WW
	for ath12k@lists.infradead.org;
	Sun, 12 May 2024 11:03:22 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44C70DlK005907;
	Sun, 12 May 2024 11:03:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=0TkP1of
	Q9/M7Xhxb32vl2WjCX6fvJ510gnM2k3F+gTk=; b=MhURkBv7gUdpuovlXNbgBkP
	QK2AjGZZr/I0ehS3stwCX/HDTSGCIb86DIdHAVX4LSRvgBFjEWVkPeJ0RtSbLhvM
	8LE5VtJV1S+qxHvMHZFbXb7PyshF8RxNwl1eUjYaySRaRvBtJOvY3kVBI3lVSI+d
	9fGFqjzT5/fhKdKuueZlhSNfeCPGQQsZV+IDwW0rsXAmMJWcoXwezrMt1yFpkUjG
	yXSnnsFH2hODt5g2LZtAsyjqEsqM85Jmv4I/JCbLb0uYdDsI9josxFs9l+ntSe5p
	mXBnupJ5FyW77a9sHGcF49F2keVCjXLlfIjDlEUtZKIPujUHkiKDWTQFR88S7Iw=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y200f9nvk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 May 2024 11:03:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44CB38O5009864
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 12 May 2024 11:03:08 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 12 May 2024 04:03:06 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v3 0/3] wifi: ath12k: prepare vif and sta datastructure
Date: Sun, 12 May 2024 16:32:48 +0530
Message-ID: <20240512110251.4062260-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 37n5o8bCO0A-DHriJ2XkJYtl3lRVNdMJ
X-Proofpoint-ORIG-GUID: 37n5o8bCO0A-DHriJ2XkJYtl3lRVNdMJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-12_07,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 malwarescore=0 mlxscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=636 clxscore=1015 lowpriorityscore=0
 spamscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405120082
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240512_040321_500466_AD450157 
X-CRM114-Status: UNSURE (   9.43  )
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

From: Sriram R <quic_srirrama@quicinc.com>

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

 drivers/net/wireless/ath/ath12k/core.h   |  85 ++-
 drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 856 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h    |   9 +-
 drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
 drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
 drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
 drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  12 +-
 15 files changed, 681 insertions(+), 378 deletions(-)

base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
-- 
2.25.1


