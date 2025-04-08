Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F7AC3600C
	for <ath12k@archiver.kernel.org>; Tue,  8 Apr 2025 13:33:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=LczO5m9Vdozc6Omm7oiHJBqtxBUALXTbZ5uRQEtqkhA=; b=Sa51qwftKl1XFzqwLOfuYf8bi1
	uC2wAxVt/OcM8jfe1G8//b8ujefoSQ5t8DnmnpcZbQtM4/4qLw1ch4t+HDAcKsVunk2FudmwSjqb6
	YxrtmdnepzGQCrRHcVDq8Dy2A8BXzv/LUN51S2eTjuR9uMU7nctPz7ckB4ZiZNWO6VdlTyVDU5Hmv
	YGbQB5fufOObqoIMxVo+hQmkxbZx/45GTh6V/3nu35dMLA6vaeDsPM6bZOtPt4KlNkf60prWDgSJr
	JincQ1mC8YbLFHDLkJ7lIHlNiWwsdR+dccp8fjMf0pEgjAeiwr0JMWNJg99iG5RziwHy7Op1ZWZUi
	U/Ajf17Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2958-00000004Doy-2TU4
	for ath12k@archiver.kernel.org;
	Tue, 08 Apr 2025 13:33:38 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u28aS-000000043zF-1HnT
	for ath12k@lists.infradead.org;
	Tue, 08 Apr 2025 13:01:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Bmdkv015965;
	Tue, 8 Apr 2025 13:01:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=LczO5m9Vdozc6Omm7oiHJB
	qtxBUALXTbZ5uRQEtqkhA=; b=O39UlQkK1WTm5kJDTud3jnrBjfHJrhdbd5+769
	dEx/4tpYpD74KBpENt3OEkQGiD8WaEAltrNFtDXLLVMt6HCo5db4ap3nF8owNaL9
	6c5SqB+rJxZno7IDFSYQ5TxPcmpLiM2Qlz4u6Ng2Gqt2D8A0jThlWLMaYqAmUjR5
	+bmT8Hf5ZU5fhl5bPReyzA8Rl5GP/okk97AMbxOJocFoW5N3kf5A3MUP1xsmr8vI
	2lQ5L9nfyV89CleKMrkwCVWbtsAKwZzIBwvqjqcnzAj+nKutMDeWOHiaaai6oxJq
	qV0trtaRTPXZz8Kgn8ouQ8OC+Lu2/nGYOU/qGkoP9fzcneng==
Received: from nasanppmta05.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twftfq0t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 08 Apr 2025 13:01:55 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 538D1sr8028576
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 8 Apr 2025 13:01:54 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 8 Apr 2025 06:01:53 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next 0/2] wifi: ath12k: correctly check RX multicast bit
Date: Tue, 8 Apr 2025 18:31:30 +0530
Message-ID: <20250408130132.2919329-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=B5+50PtM c=1 sm=1 tr=0 ts=67f51e43 cx=c_pps a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=GEpy-HfZoHoA:10 a=XR8D0OoHHMoA:10 a=0b8t2eLurJbve7txGXYA:9
X-Proofpoint-GUID: VwmgUvZzdjgEWKprs8POanl-ijKXGzak
X-Proofpoint-ORIG-GUID: VwmgUvZzdjgEWKprs8POanl-ijKXGzak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_05,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=523
 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 mlxscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250408_060156_346295_C11DC18A 
X-CRM114-Status: UNSURE (   8.58  )
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

Currently, the RX multicast broadcast bit is fetched from the MPDU
start descriptor. However, in some scenarios, the value is not
accurate. Therefore, changing the process to fetch the bit from the
MSDU end descriptor for improved reliability.

Sarika Sharma (2):
  wifi: ath12k: using msdu end descriptor to check for rx multicast
    packets
  wifi: ath12k: correctly handle mcast packets for clients

 drivers/net/wireless/ath/ath12k/dp_rx.c | 5 +++++
 drivers/net/wireless/ath/ath12k/hal.c   | 8 ++++----
 drivers/net/wireless/ath/ath12k/peer.c  | 5 ++++-
 drivers/net/wireless/ath/ath12k/peer.h  | 3 ++-
 4 files changed, 15 insertions(+), 6 deletions(-)


base-commit: ac17b1211841c98a9b4c2900ba2a7f457c80cf90
-- 
2.34.1


