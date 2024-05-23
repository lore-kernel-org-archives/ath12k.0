Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C552C25B7D
	for <ath12k@archiver.kernel.org>; Thu, 23 May 2024 03:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WxXak//OqqxTiQnA8bN0kAUMoYOaSwTOo0wZa7TqtTY=; b=mctClxhdV7llKP6ZGsmmE+BmS1
	vW9SCgBK9cFiHAcs9QbpNkkj67ur8FOgMjkXeMxvVCxnGiABT1JPkSuYSV6FH5RcWnW/LO/eJaWBL
	auX44ky22/8OND0smtahFvuvaWmDs5prwJT2pxo2Eo9X2xY8/tLtw3t03IUswM4cJWWS6/j7a3MRr
	nQLup1n9oxoTZBH1kjUu5k0u7l03w4W+ijFJwpxlTlP2yDlJ+dBAU4iTbzTcTHVeOM5ocGXGe7JpE
	7EF6NwveWF4Ot2TWVaIcx0Ueeqnc2W+imAtn03zanIBU4mqoQg7nukxd3H1Nsik8M68uK6Un8PyIV
	BUMRrSxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zBc-00000004uIV-17Q7
	for ath12k@archiver.kernel.org;
	Thu, 23 May 2024 03:32:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s9zBV-00000004uFX-1UG8
	for ath12k@lists.infradead.org;
	Thu, 23 May 2024 03:32:10 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44N3O4a6016423;
	Thu, 23 May 2024 03:32:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=WxXak//
	OqqxTiQnA8bN0kAUMoYOaSwTOo0wZa7TqtTY=; b=GAFn4oxhmsdZSTa/BGzN6hU
	ojDhL5Q9mOsbvvrScGgRE9gHAQYZKSHcDQAIUsZg7XCo7eZ92UUKWKeaXsTwMnWQ
	l0isIZNm4+Dap8vU3MlNI/O4RR7BA1Wfpvm6sdyFQ7SnqAhEed0FsyHqHxY5digc
	b16YM5OnF+muOsO7prDkbE9eRNpCgoA7EBV7J+i0OyF/4AYZaZ1uKVs3uzQTJypA
	7HyGCMHg0nEYaL6TTU5tai2RLWlZs2NwBv/M7Inc/ulBzi868oKPdLGPCo7+TNU7
	e1ED9dWGDGWKnhKLTyBPtaf5LPD9LsL4zokc8kEg55VkxlShC2Gp9aUzeIKRRhg=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y6n4gjmf0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 03:32:01 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44N3Vx0G011776
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 May 2024 03:31:59 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 22 May 2024 20:31:57 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v2 0/7] wifi: ath12k: add support for WoW
Date: Thu, 23 May 2024 11:31:36 +0800
Message-ID: <20240523033143.21677-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sRz82Z0qk_RtXyNloLrVa2MtThv1B1Ek
X-Proofpoint-ORIG-GUID: sRz82Z0qk_RtXyNloLrVa2MtThv1B1Ek
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-23_01,2024-05-22_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 bulkscore=0 phishscore=0
 mlxscore=0 malwarescore=0 suspectscore=0 adultscore=0 mlxlogscore=573
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405230023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240522_203205_732488_E435162A 
X-CRM114-Status: GOOD (  10.65  )
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

Add support for WoW (Wakeup on Wireless) funtionalities, this including
magic-pattern, net-detect, disconnect and patterns, HW data filter, ARP
and NS offload, GTK rekey offload.

Also enable keepalive before suspend to avoid unexpected kick out by AP.

v2:
 - [2/7] wifi: ath12k: add basic WoW functionalities
	1. In ath12k_wow_convert_8023_to_80211(), change to use 'size_t'
	   instead of 'int' to make GCC happy
 - [5/7] wifi: ath12k: support ARP and NS offload
	1. In ath12k_mac_arvif_get_arp_ns_offload(), change to use
	   GFP_ATOMIC to fix kernel crash due to sleep in invalid context
 - rebased on ToT
	
Baochen Qiang (7):
  wifi: ath12k: implement WoW enable and wakeup commands
  wifi: ath12k: add basic WoW functionalities
  wifi: ath12k: add WoW net-detect functionality
  wifi: ath12k: implement hardware data filter
  wifi: ath12k: support ARP and NS offload
  wifi: ath12k: support GTK rekey offload
  wifi: ath12k: handle keepalive during WoWLAN suspend and resume

 drivers/net/wireless/ath/ath12k/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/core.c   |  48 +-
 drivers/net/wireless/ath/ath12k/core.h   |  37 +
 drivers/net/wireless/ath/ath12k/htc.c    |   6 +
 drivers/net/wireless/ath/ath12k/mac.c    | 252 ++++++-
 drivers/net/wireless/ath/ath12k/mac.h    |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 719 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    | 559 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c    | 878 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.h    |  62 ++
 10 files changed, 2557 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h


base-commit: 429eeef2ed089af1b3aa1983ec00a7591166be27
-- 
2.25.1


