Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA017C27C43
	for <ath12k@archiver.kernel.org>; Thu, 30 May 2024 07:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=owPbnJd9BdWvTkZs8GqezHYP8b6CWxtcmvhMJpgrw5I=; b=Q1O2VfxOAS2EKFU6QfeuO0WXOi
	mca2fiVLwo12pUHCR/9BNrFzZ0q+m4Ct2L3sUrWrDc/OdtWLRq16m9REJHMqkexooDt80IIYGfnru
	1N8Gns9HFd7UPmCFabGw7d8RlAr6TK1SGuwiF+otiSbhSZysxcj9CnzmH/dzwa/zvq4dwXqQ/zyla
	H3XbQEBWhhC8NXs9Aid2PHBtWNaqOhGpUW2tLQfpMcX9Iu2EuykBb9nunFb1INTo1RKmeZ+T8nrrm
	hMJsaFE0q9f0HJ/rsreAGOUCAMesYZC4hXqevWS6xDYlFWkQrmVLo8Lwlv9Ws4aLY0RRrskXGZpSb
	qQcHFrjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaCK-00000006Vr3-2RdX
	for ath12k@archiver.kernel.org;
	Thu, 30 May 2024 07:27:40 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCaCD-00000006VkW-2zPE
	for ath12k@lists.infradead.org;
	Thu, 30 May 2024 07:27:36 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TIHb8K011441;
	Thu, 30 May 2024 07:27:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=owPbnJd9BdWvTkZs8GqezH
	YP8b6CWxtcmvhMJpgrw5I=; b=RDVQ81jkCbKiJbwvEY/T70HHX7YJi0gz13d44D
	VCj+vzqTv/RXpPV5ABnY1do2ajfljeCsM/9O1lGeF0LIV7BFhQr9nlyh1MOA2OlF
	IBURmPuLtikm41hNVjVHBjWXvkIhLTOlYjzXM92OyN0R22PnLSqrKMWmN6+DhIcE
	Tj2fSqS1AOhFLbmBZqXR4r8SglHAy67cEoykLzay8+BUoG2Fjnajan8vuPi/2Zys
	luEYcp5hS7NjC4J0+DlS/EiXhbEAxXcosnQRZ86KRGHfGnpKCKmirsBRNHqnseUq
	6PnaWgGI0YO1kvzH/ytcMu/71O8A6bRQBfvzL4LUdQj84KOA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yb9yjbd9y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 07:27:26 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44U7ROkH006757
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 30 May 2024 07:27:24 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 30 May 2024 00:27:23 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v3 0/8] wifi: ath12k: add support for WoW
Date: Thu, 30 May 2024 15:27:06 +0800
Message-ID: <20240530072714.25671-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YuJM0Qaa2h7VP8nllKyhhtXccnznIARL
X-Proofpoint-ORIG-GUID: YuJM0Qaa2h7VP8nllKyhhtXccnznIARL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-30_05,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 adultscore=0 mlxscore=0 phishscore=0 mlxlogscore=769 spamscore=0
 clxscore=1015 impostorscore=0 bulkscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405300054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240530_002734_305087_5B7D8671 
X-CRM114-Status: GOOD (  12.45  )
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

v3:
 - wifi: ath12k: add ATH12K_DBG_WOW log level
	1. new addition.
 - wifi: ath12k: support ARP and NS offload
	1. move ipv6 infomation parse to ath12k_wow_arp_ns_offload() to
	   avoid memory leak issue.
	2. move ARP/NS related definition from core.h to wmi.h
	3. rename ath12k_arp_ns_offlaod to wmi_arp_ns_offload_arg
	4. rename some macros
 - wifi: ath12k: support GTK rekey offload
	1. add rcu_read_lock/unlock in ath12k_wmi_gtk_offload_status_event()


v2:
 - [2/7] wifi: ath12k: add basic WoW functionalities
        1. In ath12k_wow_convert_8023_to_80211(), change to use 'size_t'
           instead of 'int' to make GCC happy
 - [5/7] wifi: ath12k: support ARP and NS offload
        1. In ath12k_mac_arvif_get_arp_ns_offload(), change to use
           GFP_ATOMIC to fix kernel crash due to sleep in invalid context
 - rebased on ToT

Baochen Qiang (8):
  wifi: ath12k: add ATH12K_DBG_WOW log level
  wifi: ath12k: implement WoW enable and wakeup commands
  wifi: ath12k: add basic WoW functionalities
  wifi: ath12k: add WoW net-detect functionality
  wifi: ath12k: implement hardware data filter
  wifi: ath12k: support ARP and NS offload
  wifi: ath12k: support GTK rekey offload
  wifi: ath12k: handle keepalive during WoWLAN suspend and resume

 drivers/net/wireless/ath/ath12k/Makefile |    1 +
 drivers/net/wireless/ath/ath12k/core.c   |   48 +-
 drivers/net/wireless/ath/ath12k/core.h   |   20 +
 drivers/net/wireless/ath/ath12k/debug.h  |    1 +
 drivers/net/wireless/ath/ath12k/htc.c    |    6 +
 drivers/net/wireless/ath/ath12k/mac.c    |  110 +++
 drivers/net/wireless/ath/ath12k/mac.h    |    4 +
 drivers/net/wireless/ath/ath12k/wmi.c    |  720 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  578 ++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c    | 1012 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.h    |   62 ++
 11 files changed, 2554 insertions(+), 8 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h


base-commit: 2580be9ee6f5d97d6763b5d4ae4f9c0383fdf130
-- 
2.25.1


