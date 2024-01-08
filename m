Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FA7C3DA6E
	for <ath12k@archiver.kernel.org>; Mon,  8 Jan 2024 08:26:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=T9P4YVexqiedBf/xWZBHTQkXKzYHF4Mo8fSg/bHzRgg=; b=a2OfURfvAI+jT+xhtc7sUTq56C
	gGd67XB3jNH/sx8N1Z7MvX8uemg7BjCbewKN1HP0xOvzRoglqKpoRYvG91qbyzTqdM7FmXCyAKjGG
	ji2yIGKkDTdkYxUWVatl4YFEjdBgKJ30RC1ZTn4t9n+KdGRUuHjOXeswhOTBCu9xBlztcrfT5odFU
	9azFK92WLHFVGpXJIj0xfsb0yVHTdiH8TodKmhppC7eb4PzT8tyszu+P4eO43T2GvxOLqL8vnYCfZ
	dguEzcnRfmU5fR3ipq4ebciBxYTr2AFzAGnqsMwT4+GVp/GNS9b4jVLfHVmn9QSOkFgKxW25VAlZh
	XBEgbs2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxs-004IR4-0w
	for ath12k@archiver.kernel.org;
	Mon, 08 Jan 2024 08:26:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rMkxp-004IPJ-1B
	for ath12k@lists.infradead.org;
	Mon, 08 Jan 2024 08:26:30 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4087qBQU001540;
	Mon, 8 Jan 2024 08:26:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=T9P4YVe
	xqiedBf/xWZBHTQkXKzYHF4Mo8fSg/bHzRgg=; b=Tc2dtVMYLBIEvnH65HeuMQc
	eFT8Esjx+5rYdHaaPv661+FpLZqINHY38g1FVKid3QiQl2a3vTiE10Mmh9dBywim
	Ol4f+JUCKpGWI8ceuOTnufF/taKBw5Ar4dtKHksN4f+ueCnu3Nek4i47dErxKjMv
	5mDB8ZI/gOAwF9bJyRNOP1I+yU/91gbasOWpwbQy/Vr/ZdL3JrUQSkLerZBanlUO
	cNcNuyhZ90VGlGiEyOleQjkHIidtyu4jek7QkcLgJPTLT3+cwD/wWlW/k3LFV60F
	3LncdTg73zLuZ81tAls+0PlTjCVjzyWp08vH5uq/G6Pm3n3OhYCSd01ZGGtOnew=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vg8nwrh3g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Jan 2024 08:26:26 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4088QQrx018376
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Jan 2024 08:26:26 GMT
Received: from yk-E5440.local (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 8 Jan
 2024 00:26:24 -0800
From: Kang Yang <quic_kangyang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_kangyang@quicinc.com>
Subject: [PATCH 00/10] wifi: ath12k: P2P support for WCN7850
Date: Mon, 8 Jan 2024 16:25:42 +0800
Message-ID: <20240108082552.7227-1-quic_kangyang@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: oKoftf4yxrXpaNMnDwc35bhJe4sXf-zp
X-Proofpoint-ORIG-GUID: oKoftf4yxrXpaNMnDwc35bhJe4sXf-zp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 mlxlogscore=854 phishscore=0 mlxscore=0 bulkscore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401080070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240108_002629_417707_75E91E84 
X-CRM114-Status: UNSURE (   9.73  )
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

Add P2P support for WCN7850.

Kang Yang (10):
  wifi: ath12k: change interface combination for P2P mode
  wifi: ath12k: add P2P IE in beacon template
  wifi: ath12k: implement handling of P2P NoA event
  wifi: ath12k: implement remain on channel for P2P mode
  wifi: ath12k: change WLAN_SCAN_PARAMS_MAX_IE_LEN from 256 to 512
  wifi: ath12k: allow specific mgmt frame tx while vdev is not up
  wifi: ath12k: fix broken structure wmi_vdev_create_cmd
  wifi: ath12k: move peer delete after vdev stop of station for WCN7850
  wifi: ath12k: designating channel frequency for ROC scan
  wifi: ath12k: advertise P2P dev support for WCN7850

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/core.c   |   1 +
 drivers/net/wireless/ath/ath12k/hw.c     |   5 +-
 drivers/net/wireless/ath/ath12k/mac.c    | 358 +++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/p2p.c    | 142 +++++++++
 drivers/net/wireless/ath/ath12k/p2p.h    |  23 ++
 drivers/net/wireless/ath/ath12k/wmi.c    | 116 +++++++-
 drivers/net/wireless/ath/ath12k/wmi.h    |  48 ++-
 8 files changed, 633 insertions(+), 63 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.c
 create mode 100644 drivers/net/wireless/ath/ath12k/p2p.h


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.34.1


