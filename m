Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D280E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 13:57:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/Da0P3T8OcYngtrwuPK2DUHqia+CmiTgyeS/jU3pteY=; b=Iu5kzBPuyl7iM9rGL7YfWWX/eS
	JUpOrHA214BCR8D4kbH3SXyefSI5gQGFHwAnhpVojvOZ6gx/+AiW0uFuDg3ZFCChFNYW84nbDY9TE
	rHfW6SAcKx1uz3trHki3d+thrRDxh9z723LXMmJbdC2WmvfC87x+aExg5OhZJYSof1VpX6bVJ0j3j
	ZRyFVIXSpxARQSkRtsg/5WMzRjVgMydO7eUXNomMhZ1FsfLWOJJ3Z+Hghh9kfRnSK2U6D/7qH7rNA
	m71DRif7eNg6pjGhUI4RAXuvWQsy3TbmKI7o4Sf1B7v+kATJTlt1tuVBjjEmO1E7isYbvUwBIBxv+
	M5qm/tOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhQH-00000008ZpV-3MJ5
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 13:57:37 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXhQE-00000008Zp4-38oJ
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 13:57:36 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50E6ckOM003620;
	Tue, 14 Jan 2025 13:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=/Da0P3T8OcYngtrwuPK2DU
	Hqia+CmiTgyeS/jU3pteY=; b=XykbVmAwh24xggGhX8LR1vfKJQRvvBLEZCbi//
	E4kbyqrnLXWN48IMrMIW8vDYz+Mc6z3oVL8ZQhi7wGnvqHrgZbiFNYFTcV5cvx+V
	kbuSJte9lBoTIojW1fgZ0lcXVUo5KKjBOr0tKFi3WLKOb9XvmNBoDBElxWoQWE7s
	I78wuKT+tSusHmCThGs5tnOdc5xpv9zjICfkAzvLBbJfnVRjKZ5wdCJaqYpdkSce
	Jmc4TjdiW5+2Nv5a+tWyTpD7oFAjKM9ki7mN4uDUJ/KhyWcdjlVhlPiek3JOOhBG
	2dbHiBULKT2aZ8XVnV6Utas47SfxShm8++whN3QjM7kB+ELg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 445jubgw78-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 13:57:33 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50EDvWW3028471
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 13:57:32 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 14 Jan 2025 05:57:30 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v3 0/2] wifi: ath12k: Support Transmit Power Control Stats
Date: Tue, 14 Jan 2025 19:27:06 +0530
Message-ID: <20250114135708.966170-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: y9CSwbzMo3NrJgoN9Y5hM5xPumqEVZHc
X-Proofpoint-GUID: y9CSwbzMo3NrJgoN9Y5hM5xPumqEVZHc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 phishscore=0
 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140112
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_055734_918910_11954883 
X-CRM114-Status: UNSURE (   9.89  )
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

Add support to print Transmit Power Control Stats. Add support for basic
infrastructure necessary for enabling TPC stats via debugfs. This patch
series brings support to request stats type from firmware and dump the
corresponding stats.

Schema for an ath12k device:
ath12k
-- pci-0000:06:00.0
    -- mac0
        -- tpc_stats
        -- tpc_stats_type

Sample TPC logs:
*************** TPC config **************
* powers are in 0.25 dBm steps
reg domain-22           chan freq-5955
power limit-126         max reg-domain Power-252
No.of tx chain-4        No.of rates-1164
**************** SU WITH TXBF ****************
                                TPC values for Active chains
Rate idx Preamble Rate code     1-Chain 2-Chain 3-Chain 4-Chain
4        OFDM    0x000          39      15      1       -9
5        OFDM    0x001          39      15      1       -9
.....
12       HT20    0x200          40      16      2       -8
13       HT20    0x201          40      16      2       -8
.....
44       HT40    0x200          88      88      88      88
45       HT40    0x201          88      88      88      88
.....
76       VHT20   0x300          40      16      2       -8
77       VHT20   0x301          40      16      2       -8
.....
172      VHT40   0x300          88      88      88      88
173      VHT40   0x301          88      88      88      88
.....

Note:
MCC firmware version -
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 does not print stats
because MCC firmware will not respond to the event passed from host,
resulting in timeout.

v3:
 - Fixed datatype conversion warnings in v2.
v2:
 - Fixed compilation issues in v1.

Sowmiya Sree Elavalagan (2):
  wifi: ath12k: Add Support to Parse TPC Event from Firmware
  wifi: ath12k: Add Support to Calculate and Display TPC Values

 drivers/net/wireless/ath/ath12k/core.h    |   5 +
 drivers/net/wireless/ath/ath12k/debugfs.c | 716 ++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/debugfs.h |  85 +++
 drivers/net/wireless/ath/ath12k/wmi.c     | 458 ++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     | 139 +++++
 5 files changed, 1403 insertions(+)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.25.1


