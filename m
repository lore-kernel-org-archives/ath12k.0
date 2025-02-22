Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99387C021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 03:30:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PlFL2aom86lRsUXeBCB2EhyU3Ga/F277NFLwJq6Xk6Q=; b=1l8B+uGH5OyjRxP5HIunlMOire
	p8HZARpEmJyPocNrGedSSLEyWArJulHHFdYAcONijdayTip8fQcK3itDTUHvwvFfBtswu/mu8suoL
	mrx4rd85eaLb3TV4wGI4PMYGjmoRk5Q+q6hJDQYyKBv9/sBvJE1iQpUa2sbrRMtMbvQPuIdG5Izbh
	7EUyH7XkDm9tOWtOr2WGsD7JGumSYZt9ekcPZobXs7qyhflnA6Sz0UxCDhxzwyYWHpRuF8FVkwJeE
	NSwCtHZNMXNFD784zUrFO5r87dnuK/X//pJYS0NkT3n2/ixjr97ijzRUCXXCP4xJHC33nDq1s8rmm
	9gcnH4Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlgDf-00000007P25-1Evs
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 03:30:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlgDd-00000007P1W-0rOM
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 03:30:22 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51M3Pfpp025180;
	Sat, 22 Feb 2025 03:30:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=PlFL2aom86lRsUXeBCB2Eh
	yU3Ga/F277NFLwJq6Xk6Q=; b=BXBvfOmThUjB3ogKnt0gdDTcgXb6VKM9tDbQ9G
	mmIhyGJU0cxN30Js28w/hRKq2nhOzWk7XezwOc1oe6eFLNo/Q8M1Xjj94FSn7Hkm
	txd6ULxcTua8LiFSp5yTs+eGpM5S6IUkzeWm5Y0HV+rcRQkXfq8vXTPsl0jIto3+
	1crLvzRnT69p9x0xsAhiP0KMqoWt/paet2sk/7sXZxQjzisZ2uMnnOtunFmbBpWW
	Nx2PsxaIj9bOtW2qqIk1tojmXFQpYcJ66ItBXaTrE2VrnE4nIp8+LPRczu4fq7Zz
	7+69oTHPdpawdBxNc2s5hPvwAGQ9mLhqIJtV01eGkxt8OEyQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y6ntr065-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 03:30:20 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51M3UJOC014756
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 22 Feb 2025 03:30:19 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 21 Feb 2025 19:30:17 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v7 0/9] wifi: ath12k: Add monitor interface support on QCN9274
Date: Sat, 22 Feb 2025 08:59:53 +0530
Message-ID: <20250222033002.3886215-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: i0kerqL_XcWVBiiKEnKDmtSMxVpEnbwf
X-Proofpoint-GUID: i0kerqL_XcWVBiiKEnKDmtSMxVpEnbwf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_01,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=939 malwarescore=0 impostorscore=0 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2502100000 definitions=main-2502220025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_193021_370022_05DFDF3D 
X-CRM114-Status: GOOD (  10.12  )
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

Currently, monitor interface not supported. Therefore, add the missed TLV
tags parsing in the monitor parser, configure the monitor vdev state
identifier with HTT filter setup.

v7:
 wifi: ath12k: Refactor the monitor channel context procedure
  - Added new patch to avoid multiple change in a patch
 wifi: ath12k: fix NULL access in assign channel context handler
  - Added fixes tag
v6:
 wifi: ath12k: fix NULL access in assign channel context handler
  - Added new patch
 wifi: ath12k: add monitor interface support on QCN9274
  - Moved to NO_VIRTUAL_MONITOR mac80211 feature for adapting single wiphy usecase
  - Removed tags
v5:
 - updated the s-o-b as a last tag
v4:
 - Rebased on ToT
 wifi: ath12k: Replace band define G with GHZ where appropriate
  - Dropped the tags due to rebase changes
v3:
 - rebased to ToT
v2:
 wifi: ath12k: add monitor interface support on QCN9274
  - remove redundant filter setting in ath12k_mac_monitor_start()
  - set the default filter when the htt monitor configuration get disable

Hari Chandrakanthan (1):
  wifi: ath12k: fix link valid field initialization in the monitor Rx

Karthikeyan Periyasamy (3):
  wifi: ath12k: Replace band define G with GHZ where appropriate
  wifi: ath12k: fix NULL access in assign channel context handler
  wifi: ath12k: Refactor the monitor channel context procedure

P Praneesh (5):
  wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
  wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
  wifi: ath12k: change the status update in the monitor Rx
  wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
  wifi: ath12k: add monitor interface support on QCN9274

 drivers/net/wireless/ath/ath12k/core.c    |   5 +
 drivers/net/wireless/ath/ath12k/core.h    |  18 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp.h      |   2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c  | 362 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_mon.h  |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c   |   6 +
 drivers/net/wireless/ath/ath12k/hal_rx.h  |  15 +-
 drivers/net/wireless/ath/ath12k/hw.c      |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 109 ++++---
 drivers/net/wireless/ath/ath12k/wmi.c     |  36 +--
 drivers/net/wireless/ath/ath12k/wmi.h     |  16 +-
 13 files changed, 452 insertions(+), 136 deletions(-)


base-commit: 2dba67975394b47249189fcf975352105306962b
-- 
2.34.1


