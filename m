Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 785BCC4345F
	for <ath12k@archiver.kernel.org>; Thu,  2 May 2024 17:13:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=K8xVd/U4u50AnhxZsSwFUZGn1XoKcHQlGRW10kowWd8=; b=qgwxva1j7Z7OxiGI1nADDdlwP4
	1SFewT1z4zBkKSiJMNDQOMhq0Z8EA7SlOrVbiZPaVgFSGE3JVbPGIZ4/bbmKUEPWODol49ldorlLH
	z6ETI1UYqRWT6bCH4xks6iocLTypixDP/m7rKVtIbjH/+bHdasbGkwSfSq6UMW5EQmUzeLnmBil4U
	5vT6Ah0oSlSAaO0rpBJHhjxVuLuZPJwa1WC4Soxq2pglvxZ0BKHrW80FRZ0aGTt1T6yAubywmcAPR
	u9sH1eUscwR79ejjkwsGWa6SSlUW/h+KyuaJ0M68qb5mIFG+PcvE1YnOZpCqwX1vcLSDP4v00M+Uh
	FBpuv67g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZzX-0000000DPLi-0Qle
	for ath12k@archiver.kernel.org;
	Thu, 02 May 2024 17:13:07 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2ZzU-0000000DPKt-133t
	for ath12k@lists.infradead.org;
	Thu, 02 May 2024 17:13:05 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 442CRTMX003143;
	Thu, 2 May 2024 17:13:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=K8xVd/U
	4u50AnhxZsSwFUZGn1XoKcHQlGRW10kowWd8=; b=LEaTXK5NROeEJFjlIemOnGA
	lNfjl/h2+FbhXkD18h2v4YGofAATM6DCMAX1+mxk5IO0ZLGQ8BzqTx4IIOfmINEi
	KFFgZt+aOLu+myn1IwBFtPAdQLj9Piq+5o0fsmtTa2L7BO+0Y3y4bo4gYPVg7LmX
	3LI6jZhG5bmDdtfLFEsmA3BS2zgozJ8OpXjoPPzZf/1i1c37s3CsUmml0bI9kqs6
	8uPUHSPlAfUN4cGw50cUZJlLJwEgOapf6yijp5ervjoMRBM3R0xbYB64yUf5PDmh
	vQi9TRRA0z821def+0/gNprwBxxBkK+DoAklJGkrL2PlG8VqTbOvvxyY8/G4Ppw=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xv8vs8wm3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 02 May 2024 17:13:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 442HD18e000854
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 2 May 2024 17:13:01 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 2 May 2024 10:12:59 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: prepare vif and sta datastructure for MLO handling
Date: Thu, 2 May 2024 22:42:37 +0530
Message-ID: <20240502171240.927155-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ywppCiP7GWTTmTMyxAdP5_n10gjNjeMW
X-Proofpoint-GUID: ywppCiP7GWTTmTMyxAdP5_n10gjNjeMW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-02_08,2024-05-02_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=699
 suspectscore=0 priorityscore=1501 mlxscore=0 spamscore=0 adultscore=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2405020112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240502_101304_451167_6CE97EE7 
X-CRM114-Status: UNSURE (   9.41  )
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
v2:
 - Rebased PATCH 1/3 on ToT as b0afabc4d7e0 (wifi: ath12k: add support to
   handle beacon miss for WCN7850) has introduced few APIs that use
   arvif.


Sriram R (3):
  wifi: ath12k: prepare vif data structure for MLO handling
  wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
  wifi: ath12k: prepare sta data structure for MLO handling

 drivers/net/wireless/ath/ath12k/core.h   |  84 ++-
 drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h  |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 861 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h    |   9 +-
 drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
 drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
 drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
 drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  12 +-
 15 files changed, 684 insertions(+), 381 deletions(-)


base-commit: 25a42664a2e2587f2582e0717f2a71d0bdcc4be0
-- 
2.25.1


