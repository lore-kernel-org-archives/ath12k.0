Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98C6EC25B74
	for <ath12k@archiver.kernel.org>; Tue,  4 Jun 2024 05:54:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AuN+RVJTm/9dbwUj7OPqpYoN3bK4eDiZUC8DKGAZEpw=; b=Rv8v3gkYw09qzKNGpWHR7n4XxC
	/4J6/sXoiyqVonb0sbJJq6Q6kpjFJ9Drd/qzg1qV3H7Qc1y15JSv72+vZbIcP/suM7mip0GO5Vz9a
	tksNp62Qnv/s4xHDs4lJekwo3MA0uAnZkuA29IJeXtSR3InGR6PYhLVmSfX7eY/g40OQuUJ9gBnwz
	q3JHbg4tIVOJzEM7X1tXw5zqsMS+2slBK8NcqJGlI8wJZBsOTXtG26pP9PXDfeALJMKVmNZYi9/wf
	ANjqczRWUMhewLzoiIGePyYIR79GkFRXBzFgCE1ilsbPOkMOPqX7lJahiB7qceybcHE3wDEiCtqoo
	CpeRq3aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN7r-00000001Jli-42A5
	for ath12k@archiver.kernel.org;
	Tue, 04 Jun 2024 05:54:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sEN7o-00000001Jha-1p2d
	for ath12k@lists.infradead.org;
	Tue, 04 Jun 2024 05:54:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4544iqrQ000456;
	Tue, 4 Jun 2024 05:54:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=AuN+RVJTm/9dbwUj7OPqpY
	oN3bK4eDiZUC8DKGAZEpw=; b=NcnT5GCJGCZ8YVrZFd9dFx5BlIZmcoleV9eWdf
	e7jzBSA8Nrg5kwfVdtBQoX4ujzC7OYeqk1GQUp6WhgeDaVK26N17gFtLri525FI5
	4o6WoqDfTiDi3Sei3V15ixAhzybHc4cVoWIL/3RdwG96AdZX3aRH5Pc5lS0qtts8
	4g1BmAKTUYko8it5XTtRPrXughWwayN9bwGI/L/L4oXJD1WY6LrhApHLlhddCf4j
	4pSKpeP2yQfUwUvahLqJ2PruESkFobW67u2wl5Kq2maxNU4siDSzuZdi0odcXBMl
	9TgETKwZYNF99IoloSgUxCKFC6mIp461PVVAjbhgiOtoKnZg==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yfw59nmvf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 04 Jun 2024 05:54:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4545sJCm025980
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 4 Jun 2024 05:54:19 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 3 Jun 2024 22:54:17 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH v4 0/8] wifi: ath12k: add support for WoW
Date: Tue, 4 Jun 2024 13:53:59 +0800
Message-ID: <20240604055407.12506-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 2Nv6pq6scQvE71ltxpySWvdv2hz005X5
X-Proofpoint-ORIG-GUID: 2Nv6pq6scQvE71ltxpySWvdv2hz005X5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-06-04_02,2024-05-30_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 adultscore=0 clxscore=1015 mlxlogscore=731 bulkscore=0 phishscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406040046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240603_225424_688601_D115DD09 
X-CRM114-Status: GOOD (  11.55  )
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

v4:
 - wifi: ath12k: add ATH12K_DBG_WOW log level
	1. update copyright
 - wifi: ath12k: support ARP and NS offload
	1. don't cache idev in _ipv6_changed() callback, but instead back
	   reference it in ath12k_wow_prepare_ns_offload. Also remove
	   _ipv6_changed() since not needed any more.

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
 drivers/net/wireless/ath/ath12k/core.h   |   19 +
 drivers/net/wireless/ath/ath12k/debug.h  |    3 +-
 drivers/net/wireless/ath/ath12k/htc.c    |    6 +
 drivers/net/wireless/ath/ath12k/mac.c    |   96 ++
 drivers/net/wireless/ath/ath12k/mac.h    |    4 +
 drivers/net/wireless/ath/ath12k/wmi.c    |  720 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  578 ++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c    | 1018 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.h    |   62 ++
 11 files changed, 2546 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h


base-commit: a116bf2be795eb1db75fa6a48aa85c397be001a6
-- 
2.25.1


