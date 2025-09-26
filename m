Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52D9ECAC5AC
	for <ath12k@archiver.kernel.org>; Fri, 26 Sep 2025 05:22:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=dpL1hjMBaY2mW2kXKe2c8ukbrXrFeWpSJwA+ekdyg1E=; b=oR83wLroDIiNjfmLoAnr1OxiLi
	+TIFtdXMWr3RfKPR7O07WiMQjc4ao8BqDu77JVKGqPq6O7+q/K2dsWM6mGuaZZOZWarQU6ugobKRp
	od+eGqLlyRpVzsFZw0jaS1uoJjonYwJGBHZL3e9zY28/44+OKaZ09V1AoNPVUID1mQMJKxyIiP5EQ
	Mrl2Kblo2BWsUhZ5vaBuSCwxsfqkjAlmYh5lJtoMDIKSBQUNMmEyrDIv1SS8z+EZndtSU7kyiFNiO
	X+TB7Zso1oZBRdA0nlv1EpCGPn431J7XJ5zybjGja0UnJgjPayPpCs8qv/PfqSe+gwJg+KBZ0f6P9
	88ooNn5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v20ul-0000000G19V-3rpX;
	Fri, 26 Sep 2025 05:22:39 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v20uj-0000000G16n-2A5t
	for ath12k@lists.infradead.org;
	Fri, 26 Sep 2025 05:22:38 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58PIPi0H027682;
	Fri, 26 Sep 2025 05:22:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=dpL1hjMBaY2mW2kXKe2c8u
	kbrXrFeWpSJwA+ekdyg1E=; b=j8VREBjFExbX8O2SZHxn/doqcCRrJzrfX+4N2k
	joC2IEB0SNARtn0qKHcUCZk+RImoWb+vRxeJiXG/pPRueaMdN5n6Xa185oRubm9P
	S/aIqiSK2rKf4trGUog0latpKuWWe3r8Gjiy5Ua+Zk1Tp40GjqgmksCX+0qNa4yy
	lDgLFiR02WF13+18zRudv6dk1ZMAl6fGFC5Ds2KmZD1yToQIrv9BDmJWyWirykBz
	dGbv2B0ult2OB+5ztgwh12PPKvPGb25/KXWvAf98QQhvrDZlowrsrRBf9S+dTw7r
	Nl89b3WWARTOJ6zU7EZGp2ZYlmJONLxsdO0xepfK6v/90QDw==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0q1guc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 05:22:33 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 58Q5MXgC027670
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 26 Sep 2025 05:22:33 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Thu, 25 Sep 2025 22:22:31 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng v2 0/6] wifi: ath12k: Modularization of objects for Next Generation Driver
Date: Fri, 26 Sep 2025 10:52:12 +0530
Message-ID: <20250926052218.893876-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfXymVVlDVj6UfC
 7R/gkNKdcUrXv+L4K3lF5d806w8bY6WMwKNkTWLCEeFa4gSdcwCevX/4Hp3DRHvwXxuXezmrDmY
 tQ/nLQpxBopcnh1IY3BCqbXL87JG1h7o359pl0dV8Ou/p5W1M9GZjNQrgq96IWIoXz781S/I+Kn
 zt6B548URtlx6aHRtHGdgZUWXkIhskIbk76IzUOkIStMR1hGkGzy3z/kKKV0lduqmS03f73O4+2
 GY1AxoaE5DIfr+aTytmZlfRmXygSwJx6M+MCluubobhjTFjWb1DLAvBpNC3gqh64AwsRafQN5mD
 d7drEWOT5rND46LQUYk/EPXU6b3dR6m76+7sDpWDckyGeDBak8lIY0qjdnD4cp/vY/4qk+KhzD2
 zyflAxB7+gjeR04mmaejlbAYIWK2IA==
X-Proofpoint-GUID: GoaSD2NXBBXY2_PpY7QuEUxhcMGGdwx-
X-Proofpoint-ORIG-GUID: GoaSD2NXBBXY2_PpY7QuEUxhcMGGdwx-
X-Authority-Analysis: v=2.4 cv=JsX8bc4C c=1 sm=1 tr=0 ts=68d62319 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=yJojWOMRYYMA:10 a=ZmDZ8v0v9Rlbw9gN6qoA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_01,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250925_222237_569763_FD919029 
X-CRM114-Status: GOOD (  13.16  )
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

The primary purpose of the patches in this series is modularization of
object structures along with their allocation and initialization APIs.

Patches in this series are made to achieve the following:
1. Modularization of device object to have a separate DP object in order
   to support chipsets of different hardware architectures
2. Refactor hardware group and vif structures to optimize data
   path operations for future extensions
3. Add framework to support architecture specific interrupt handling and
   ieee80211_ops registration

These changes are intended to provide a base framework for the data path,
allowing the data path to remain flexible for future extensions in Next
Generation driver development.
---
Changes in v2:
     - Invoke ext irq setup/cleanup from dp device alloc/free to fix
     suspend and resume call trace for wcn7850 in patch 5/6
---

Harsh Kumar Bijlani (1):
  wifi: ath12k: Refactor ath12k_vif structure

Ripan Deuri (5):
  wifi: ath12k: Convert ath12k_dp member in ath12k_base to pointer
  wifi: ath12k: Support arch-specific DP device allocation
  wifi: ath12k: Rearrange DP fields in ath12k_hw_group struct
  wifi: ath12k: Add framework for hardware specific ieee80211_ops
    registration
  wifi: ath12k: Add framework for hardware specific DP interrupt
    registration

 drivers/net/wireless/ath/ath12k/ahb.c         |  35 +-
 drivers/net/wireless/ath/ath12k/ahb.h         |   4 +-
 drivers/net/wireless/ath/ath12k/cmn_defs.h    |  19 +
 drivers/net/wireless/ath/ath12k/core.c        |  19 +-
 drivers/net/wireless/ath/ath12k/core.h        |  42 ++-
 drivers/net/wireless/ath/ath12k/debugfs.c     |   3 +-
 drivers/net/wireless/ath/ath12k/debugfs_sta.c |   3 +-
 drivers/net/wireless/ath/ath12k/dp.c          | 143 +++++---
 drivers/net/wireless/ath/ath12k/dp.h          |  14 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h      |  50 +++
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  22 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c      |  15 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c       |  20 +-
 drivers/net/wireless/ath/ath12k/hif.h         |  30 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 339 +++++++++---------
 drivers/net/wireless/ath/ath12k/mac.h         | 131 ++++++-
 drivers/net/wireless/ath/ath12k/pci.c         |  39 +-
 drivers/net/wireless/ath/ath12k/pci.h         |   4 +-
 drivers/net/wireless/ath/ath12k/peer.c        |   8 +-
 drivers/net/wireless/ath/ath12k/testmode.c    |   3 +-
 drivers/net/wireless/ath/ath12k/wifi7/ahb.c   |   4 +
 drivers/net/wireless/ath/ath12k/wifi7/core.c  |  24 ++
 drivers/net/wireless/ath/ath12k/wifi7/core.h  |  11 +
 drivers/net/wireless/ath/ath12k/wifi7/dp.c    |  47 ++-
 drivers/net/wireless/ath/ath12k/wifi7/dp.h    |   9 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  88 +++--
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  29 +-
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  62 ++++
 drivers/net/wireless/ath/ath12k/wifi7/pci.c   |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c         |   5 +-
 drivers/net/wireless/ath/ath12k/wmi.h         |   5 +-
 drivers/net/wireless/ath/ath12k/wow.c         |   5 +-
 32 files changed, 882 insertions(+), 354 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/cmn_defs.h
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_cmn.h
 create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/core.h


base-commit: 972f34d54015a4a16aa9e6a081bafabb6f9bf95c
-- 
2.34.1


