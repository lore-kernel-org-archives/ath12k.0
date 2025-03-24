Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E47B7C36012
	for <ath12k@archiver.kernel.org>; Mon, 24 Mar 2025 06:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=RTSReIR0TPx+oe+hpDgttWh4jDmFF+zEBsJyeFN6xhY=; b=Qkhj404QfxsRktC6u77l9r+lbV
	14QhaYdOTnCOXMHz+ixx/1EOkEZhBQdniE1Kn8UfQGPECWpIur0Z6nEFXuActZYjV8RxZTskG0vWk
	daSnU5Why5i/sXgzhocpOmvsl0v/I0WI2ZPTwH1veSlqxTTuPjG6SLbC+1w2lVKjCELTWxl/m+Bkq
	+DPtvCqeLSo6oatGttnx/ythWJAYBc2irSorm8xqxhDIeoKNZFy2dKKIxbCAHXmkR5Q8V8TbQaDdn
	gcj8JleT4tKSnWAQtfGNDF0Nvhi2ZjU6Xf7rT01zmBo7QYlFXbFzvLHTiK8zRyA24+o5RML/Zm4D6
	5P2DUBXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twbQk-00000002LEB-2pj9
	for ath12k@archiver.kernel.org;
	Mon, 24 Mar 2025 06:37:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twbFy-00000002JgD-3c6k
	for ath12k@lists.infradead.org;
	Mon, 24 Mar 2025 06:25:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52O6FX3W014959;
	Mon, 24 Mar 2025 06:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=RTSReIR0TPx+oe+hpDgttW
	h4jDmFF+zEBsJyeFN6xhY=; b=pvIWHCcw4m4Kc8pTWADWSi/r245MTs3LAnQE5y
	cbYFMSlbd7s9FPjrIBaErWseZBiTulfzXBCk/IUy6R8QIzdeOYcHiM9grDuRCZlH
	twuWwna2mDh3WNmNcpPc4D2LcOXMwPt9JpU4D/ubWp1chLC1YjjvS+KdDWvEq0vf
	4MljlU50euvXDvpnU24GqgpnY5dxjTtUVGHKctoJTp5VoT1OLXbcvA6Iu5iNfkE1
	rmwVQq/jXJKMhz4i470CCKTcMpvPu45tp+d5pmT5/UiIbjuGJP3Ev/P7mTZgHswn
	RdRYLHxVb1nM4zHhm/TKmRFs/y7n/TdTPUtHMxww4Rb8ZhfA==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45hm79kcb7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:25:53 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 52O6PXid012779
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 24 Mar 2025 06:25:33 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Sun, 23 Mar 2025 23:25:32 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v11 00/10] wifi: ath12k: Add monitor interface support on QCN9274
Date: Mon, 24 Mar 2025 11:55:08 +0530
Message-ID: <20250324062518.2752822-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: gjZPLfNHDWYl84JBMzOvBdWT7qKIwABq
X-Proofpoint-ORIG-GUID: gjZPLfNHDWYl84JBMzOvBdWT7qKIwABq
X-Authority-Analysis: v=2.4 cv=IKYCChvG c=1 sm=1 tr=0 ts=67e0faf1 cx=c_pps a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=GEpy-HfZoHoA:10 a=Vs1iUdzkB0EA:10 a=drny9eR6pwTjfYRCe2kA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-24_03,2025-03-21_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 suspectscore=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 adultscore=0 malwarescore=0 mlxlogscore=964 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503240046
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_232555_097450_6A391500 
X-CRM114-Status: GOOD (  11.72  )
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

v11:
 wifi: ath12k: Move to NO_VIRTUAL monitor
  - Added new patch to avoid multiple change in a patch
v10:
 wifi: ath12k: add monitor interface support on QCN9274
  - Cleanup the VIRTUAL_MONITOR handler procedures
  - Removed "Reviewed-by" tag
v9:
 wifi: ath12k: fix NULL access in assign channel context handler
  - Updated the commit message
 wifi: ath12k: add monitor interface support on QCN9274
  - Removed the mac80211 callback config handler procedure
  - Removed "Reviewed-by" tag
v8:
 wifi: ath12k: add monitor interface support on QCN9274
  - Added comment section for restricting one monitor i/f in each radio
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

Karthikeyan Periyasamy (4):
  wifi: ath12k: Replace band define G with GHZ where appropriate
  wifi: ath12k: fix NULL access in assign channel context handler
  wifi: ath12k: Refactor the monitor channel context procedure
  wifi: ath12k: Move to NO_VIRTUAL monitor

P Praneesh (5):
  wifi: ath12k: Add extra TLV tag parsing support in monitor Rx path
  wifi: ath12k: Avoid fetch Error bitmap and decap format from Rx TLV
  wifi: ath12k: change the status update in the monitor Rx
  wifi: ath12k: Avoid packet offset and FCS length from Rx TLV
  wifi: ath12k: add monitor interface support on QCN9274

 drivers/net/wireless/ath/ath12k/core.c    |   4 +
 drivers/net/wireless/ath/ath12k/core.h    |  19 +-
 drivers/net/wireless/ath/ath12k/debugfs.c |   4 +-
 drivers/net/wireless/ath/ath12k/dp.h      |   2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c  | 362 ++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/dp_mon.h  |   5 +-
 drivers/net/wireless/ath/ath12k/dp_rx.c   |   6 +-
 drivers/net/wireless/ath/ath12k/dp_tx.c   |   6 +
 drivers/net/wireless/ath/ath12k/hal_rx.h  |  15 +-
 drivers/net/wireless/ath/ath12k/hw.c      |   4 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 237 +++++---------
 drivers/net/wireless/ath/ath12k/wmi.c     |  36 +--
 drivers/net/wireless/ath/ath12k/wmi.h     |  16 +-
 13 files changed, 460 insertions(+), 256 deletions(-)


base-commit: b6f473c96421b8b451a8df8ccb620bcd71d4b3f4
-- 
2.34.1


