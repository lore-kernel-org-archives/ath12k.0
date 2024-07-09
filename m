Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A43F7C3DA47
	for <ath12k@archiver.kernel.org>; Tue,  9 Jul 2024 12:07:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=1nxtgf857iEugWwAopnSYCJEacEddrftkBPdG/ByHqo=; b=DNu2Qlc2z0VS4fNHRWqiSeV0AW
	1rTX7srMxUznZLPkc1Ktbj8Bqx4KL55iVPC5CaiNrfK3Wv7vJTE9NbqwN+CxQVWrVZOPtOvyvrsNK
	TVrwL+NeRRbSEWSREZHgyHGEdEmcQHrJRJ1QNVHKujZ06O7Y5L4dC2IObv80jGGLfmwQx4ICPEuNU
	ZUoLJikTmnqLSFee6pc0Kp3b8VT1O95B4/xUpnjxu8DAtJ4Yl9Wd+Pb3CpoxIAWvVbOHer+XTP2mp
	EFpy4XOx6445nYJeYnVr2ADUqUN+3WneUcQko5dM+YnW2ZsRUuRH6fWfIMKbzvDpPIXi7huH12e+t
	zw62wXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR9dA-000000074h0-1Z3W
	for ath12k@archiver.kernel.org;
	Tue, 09 Jul 2024 12:07:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sR9cy-000000074ew-3xBq
	for ath12k@lists.infradead.org;
	Tue, 09 Jul 2024 12:07:26 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46947dfs001325;
	Tue, 9 Jul 2024 12:07:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1nxtgf857iEugWwAopnSYC
	JEacEddrftkBPdG/ByHqo=; b=UZiNXh48GRZQSzLDkKqYgi9fwyAOzG1naWIOZr
	EFZaQ6NhFJCvihe0iPkGop2evM4n7Cna9nd+ZtiqHOFbGa4MuE43X880hxB1UTQl
	R0KbSyNmdrWlceofrzrX6oU5Mk+JlovQ1GK9hS0oZ3vzH/XInw5COvOMwXeQy5Ws
	dj3rYMfDCnbTpDvbJMuCQlGmpYz5RZnGxLv5ixDdsbIpeNHav+bAo/F/h7IkDeed
	F1JSon4LiYxBuPkvSVbZ/swdVpJRhwGyQFmX9t1sTwathQkTqmoOu0eeoLMxbyta
	UuHkTOIOP9cT3/sD+tYDI4Je2a2Hb8s1DBhqDjKWVpDPDbcA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 406we8x91q-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jul 2024 12:07:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 469C7LrL001581
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jul 2024 12:07:21 GMT
Received: from hu-ramess-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 9 Jul 2024 05:07:19 -0700
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>
Subject: [PATCH v5 0/3] wifi: ath12k: prepare vif and sta datastructure
Date: Tue, 9 Jul 2024 17:36:56 +0530
Message-ID: <20240709120659.1564434-1-quic_ramess@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: pgBsS0MK6aEycA43htAAMikzcFMK5qQz
X-Proofpoint-GUID: pgBsS0MK6aEycA43htAAMikzcFMK5qQz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-07-09_02,2024-07-09_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 bulkscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 priorityscore=1501 mlxlogscore=683 malwarescore=0 mlxscore=0 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2406140001
 definitions=main-2407090080
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240709_050725_194723_3F48A1C1 
X-CRM114-Status: GOOD (  10.33  )
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
v5:
 - Rebased PATCH 1/3 on ToT as few more instances of arvif were introduced.
 - Changed ath12k_vif_to_vif() -> ath12k_ahvif_to_vif() and
   ath12k_sta_to_sta() -> ath12k_ahsta_to_sta()
 - Used ahvif->link[0] instead of deflink as preparation for MLD in 
   ath12k_mac_op_sta_rc_update()

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

 drivers/net/wireless/ath/ath12k/core.h   |  91 ++-
 drivers/net/wireless/ath/ath12k/dp.c     |  21 +-
 drivers/net/wireless/ath/ath12k/dp.h     |   3 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c |  14 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c  |  16 +-
 drivers/net/wireless/ath/ath12k/dp_rx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c  |   9 +-
 drivers/net/wireless/ath/ath12k/dp_tx.h  |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 960 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/mac.h    |  11 +-
 drivers/net/wireless/ath/ath12k/p2p.c    |  17 +-
 drivers/net/wireless/ath/ath12k/p2p.h    |   2 +-
 drivers/net/wireless/ath/ath12k/peer.c   |   7 +-
 drivers/net/wireless/ath/ath12k/peer.h   |   4 +-
 drivers/net/wireless/ath/ath12k/wmi.c    |  22 +-
 drivers/net/wireless/ath/ath12k/wmi.h    |   8 +-
 drivers/net/wireless/ath/ath12k/wow.c    |  59 +-
 17 files changed, 800 insertions(+), 448 deletions(-)


base-commit: 9fddbf081f2da3a20fecda0b58adacbf1379e304
-- 
2.25.1


