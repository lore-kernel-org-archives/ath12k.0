Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBCE3C04FF9
	for <ath12k@archiver.kernel.org>; Fri, 12 Apr 2024 06:06:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NHDj1o/0mqo/xcSeW1qZ4eFrjjPF4O9GEsa6ZxNWsUM=; b=FAvpmaFIReIRN7qHgofW0UYAa1
	qEZ3ZtHxaIffHTXse3j5yQbNVUqS507K+XD5axm36Omtx8l4a8PwgrRRRynJsbhB4MY4MTR/uPgWE
	P93l3MIRpzW8lglmvwv07tO77QfBuKKkpRX4QFKmXrQjTGZHoZodjhgaxMUfcklmLqXf5wc6ZwaI2
	XtcUQiD8HdbEi1UZ+DBCbCVFWg/ByBWMJxksFqJTc0uvm2eofiih5tQ9oTxFf5bwPaYfuZOJy5r5v
	t90r293QWbweuw+7sHCKx4tOzM4CH4viFHGKIalr1WW8BgxxwOML2ie2+yts0dfsAY1OivmN527jD
	OeRu16vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3f-0000000FV1Z-1uYn
	for ath12k@archiver.kernel.org;
	Fri, 12 Apr 2024 06:06:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rvA3c-0000000FUzd-06Hr
	for ath12k@lists.infradead.org;
	Fri, 12 Apr 2024 06:06:41 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43C0vsgc022665;
	Fri, 12 Apr 2024 06:06:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=NHDj1o/
	0mqo/xcSeW1qZ4eFrjjPF4O9GEsa6ZxNWsUM=; b=FG2XOm2EZ4YguABWwNmkg33
	EABEwBr4fZTI4YAIb05hiVvuFZh+3TyP8osmUoJVjCJl1DHTkG0UHu4mu7KAvSGa
	E0eS8TiPLzC23HvEYls+5jvt2g/8N8atEIz2Dn5sLA7KLuxXIeiStez+jASg6yZS
	sdYQHC5F/asKylz4s6rUoqhIZQQKfiyGIKYpkrtIVkq4xObmVgr1Qle/mKKUuyhl
	rs1WeJ13YP3bWkCbV3OmcN2caKlEv5d0cuUIC8eVHTfxOc4rkM8eslxaney9pqtA
	6MeXDV0BWIXjmoK2HJfSGPa3locP+qJKbnyeekJDYH4jhryDDI21L279VsoTJpA=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xebqxb5k4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:37 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43C66aCP031834
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 12 Apr 2024 06:06:36 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 11 Apr 2024 23:06:35 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 00/10] wifi: ath12k: support suspend/resume
Date: Fri, 12 Apr 2024 14:06:10 +0800
Message-ID: <20240412060620.27519-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gijXp6JxPuRFufzPbYL1blaOXssypmI8
X-Proofpoint-ORIG-GUID: gijXp6JxPuRFufzPbYL1blaOXssypmI8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-12_02,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 bulkscore=0 mlxlogscore=875 malwarescore=0 phishscore=0 suspectscore=0
 adultscore=0 spamscore=0 lowpriorityscore=0 clxscore=1011 mlxscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404120042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240411_230640_093065_0F9C7E40 
X-CRM114-Status: GOOD (  11.70  )
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

Now that the MHI&QRTR patches [1] are merged, we can add
suspend/resume support for ath12k.

The whole design is quite similar to that in ath11k: firmware
is powered down when going to suspend and powered up when
resume, this makes hibernation work as well in addition to
suspend.

To summary, this series first does some preparations in the
first 8 patches. Then in patch [9/10] suspend/resume callbacks
are implemented. And at last in [10/10] we enable suspend/resume
functionality for WCN7850 because it's the only chip supporting
it for now.

[1] https://lore.kernel.org/linux-wireless/20240305021320.3367-1-quic_bqiang@quicinc.com/

Baochen Qiang (10):
  wifi: ath12k: rearrange IRQ enable/disable in reset path
  wifi: ath12k: remove MHI LOOPBACK channels
  wifi: ath12k: do not dump SRNG statistics during resume
  wifi: ath12k: fix warning on DMA ring capabilities event
  wifi: ath12k: decrease MHI channel buffer length to 8KB
  wifi: ath12k: flush all packets before suspend
  wifi: ath12k: no need to handle pktlog during suspend/resume
  wifi: ath12k: avoid stopping mac80211 queues in ath12k_core_restart()
  wifi: ath12k: support suspend/resume
  wifi: ath12k: change supports_suspend to true for WCN7850

 drivers/net/wireless/ath/ath12k/core.c  | 108 ++++++++++++++----------
 drivers/net/wireless/ath/ath12k/core.h  |   4 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  48 -----------
 drivers/net/wireless/ath/ath12k/dp_rx.h |   2 -
 drivers/net/wireless/ath/ath12k/hif.h   |  14 ++-
 drivers/net/wireless/ath/ath12k/hw.c    |   2 +-
 drivers/net/wireless/ath/ath12k/mac.c   |  28 ++++--
 drivers/net/wireless/ath/ath12k/mac.h   |   1 +
 drivers/net/wireless/ath/ath12k/mhi.c   |  91 +++++++-------------
 drivers/net/wireless/ath/ath12k/mhi.h   |   5 +-
 drivers/net/wireless/ath/ath12k/pci.c   |  41 +++++++--
 drivers/net/wireless/ath/ath12k/pci.h   |   2 +-
 drivers/net/wireless/ath/ath12k/qmi.c   |   3 +-
 drivers/net/wireless/ath/ath12k/wmi.c   |   1 +
 14 files changed, 175 insertions(+), 175 deletions(-)


base-commit: 363e7193eaf258fe7f04e8db560bd8a282a12cd9
-- 
2.25.1


