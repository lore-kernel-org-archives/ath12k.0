Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C40BBCCF9E0
	for <ath12k@archiver.kernel.org>; Fri, 24 Oct 2025 18:16:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GRE105ykZ7VpJJmvugSTi7HIJXlHdrPsLorDBv36q1Y=; b=Ob/e12Vjn69Dbrn+xsYQfyO5qV
	6tXIXMmgYRCjWvnt/XRQfDGzPciES3NMOWb261k9tj3McBBPYkVJNcmRFT9gRAm0uznyTUPJJ9VWA
	V/72sPQwlkW0LlwjgkCkwTT6Q6AKvsJ7ghJkT6OmK6M5l/wME9Kmzqm4b+bby0AYRYpy+k/HdafT7
	PTTmTXv+rtY2TNbSsUak2C1D3XEYl4XtjJz2SBiw/7zDsJGBkY+Zz4Mp8mk4g+GGZjTSpqrCENDSf
	35+v1fXm48pA8HkZl18hiCple7upTxoG5NAKsbRy2arcwpdLera1KnInQhPsV5nq4LOBs2Qof2bDH
	AtVHpXow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMKl-0000000ADaP-1yUG;
	Fri, 24 Oct 2025 18:16:15 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vCMKe-0000000ADWt-1Icv
	for ath12k@lists.infradead.org;
	Fri, 24 Oct 2025 18:16:13 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OI9Iu4023506;
	Fri, 24 Oct 2025 18:16:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=GRE105ykZ7VpJJmvugSTi7
	HIJXlHdrPsLorDBv36q1Y=; b=M4Az8mj83lSq03E+ELaQJmo/ohNTKFhpGxj73/
	1pQ7mKs1fK8nMDiWBhj112c/0o4gVO2wWFTIh0TAAQiPeTf7ncp3CUUbirL6/MUg
	Kn4reqN8Bsxyc/IIjRfUaDpB/19XG6IZQTX3OX4RC24bODnj1/D7pfcqOAWcmvY/
	Wmq26nUsAgGRMf/hIIVMoco0u52m5KYVKusTvUV0ylwoytGmu94cBWZNLvWup5eH
	RfgnEiFsJRNWe20xSeZDtz7Fw9uzdu9vlRIucPkxiCewIPJgK3c0REuBOb9NsRxE
	s832vHXqSdo7d+Rm7UFlCidRspD/tocsW1UJoYqF5Wd1Ya6Q==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49y5x8q3rf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 18:16:06 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 59OIG5gp021910
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Oct 2025 18:16:05 GMT
Received: from hu-rdeuri-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.24; Fri, 24 Oct 2025 11:16:04 -0700
From: Ripan Deuri <quic_rdeuri@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH ath12k-ng 0/9] wifi: ath12k: Modularization of peer object
Date: Fri, 24 Oct 2025 23:45:39 +0530
Message-ID: <20251024181548.3255166-1-quic_rdeuri@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: ETFUM0se3J-OoIag-GmddZWXIBgN1FWT
X-Proofpoint-GUID: ETFUM0se3J-OoIag-GmddZWXIBgN1FWT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIyMDE2NCBTYWx0ZWRfX1NHZ8F5MR8rl
 38DbM2oxuIreX/+rC/D4w5J7CVhz4mlcJ3xI70q6VA7b1NmD4sbQOk9KMM2CxI/aX1mX+7zYFJP
 yPXLrMZdUkppUaMZdOLT9YMK7z6AfPn/hKRkWpW9W8ThlIwxKumhxbuIT/kyxSac033E07AnXFc
 h9E+FyxXECtp2ayoaU19PUk8iRPwaYuucx3d5h2Qr0J2It6htX3pMHk71DJRS9Ua7GRNfOkRBRq
 iM2K5RZS83k2fVcuuntlt6GI3Hk6W2hLeIp/rtShQKestN5CwwHKPK0GdFn9E4CbIFVS/gplMmk
 kASSpNcMIOE/lS2lti84Ff1oIodx9n54LoAWikKOBbbCpZIaOiMDg5zBx1n18Xmn0yhUoVE5GcB
 IFYOBheGWxvHmZwY00WTWp5fGmPDVQ==
X-Authority-Analysis: v=2.4 cv=UOTQ3Sfy c=1 sm=1 tr=0 ts=68fbc266 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=PZzZyu-LANIpnL0jNGgA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 adultscore=0 clxscore=1015 phishscore=0
 bulkscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510220164
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251024_111608_512587_AAC1386B 
X-CRM114-Status: GOOD (  13.86  )
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

struct ath12k_sta has an array of struct ath12k_link_sta wherein each index
represents one link of the connected station.

For each ath12k_link_sta, there is a corresponding data path peer which is
represented by struct ath12k_peer.

Diagrammatic view of the station is a below:

        ath12k_sta
            |
            |-> ath12k_link_sta <--> ath12k_peer
            |
            |-> ath12k_link_sta <--> ath12k_peer
            |
            |-> ath12k_link_sta <--> ath12k_peer

Currently, in control path, ath12k_link_sta and ath12k_peer are used
interchangeably, while the data path makes use of ath12k_peer only.

With ath12k next-generation driver framework, in order to have a clean
segregation between control and data path, the plan is to use ath12k_link_sta
only for control path operations.

Station view for the data path is revamped as below:

        ath12k_dp_peer
               |
               |-> ath12k_dp_link_peer
               |
               |-> ath12k_dp_link_peer
               |
               |-> ath12k_dp_link_peer

where:
ath12k_dp_peer is newly introduced structure and represents the data path
version of corresponding ath12k_sta.

This ath12k_dp_peer contains the fields used in the per packet Tx Rx paths
applicable across all the links and maintains an array of ath12k_dp_link_peer.
Per packet Tx and Rx path operates on ath12k_dp_peer. This ath12k_dp_peer is a
standalone new object and has back pointer reference to ieee80211_sta.

ath12k_peer has been renamed to ath12k_dp_link_peer and the fields which
are common across all the links are moved to ath12k_dp_peer. ath12k_dp_link_peer
contains the fields specific to a link and these are mostly for statistics and
monitor usage.

Final view of station is shown below:

            Control Path                            Data Path
        -------------------------------------------------------------------
        ath12k_sta                            ath12k_dp_peer
            |                                       |
            |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
            |                                       |
            |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer
            |                                       |
            |-> ath12k_link_sta    <---->           |-> ath12k_dp_link_peer

To achieve this, following set of changes are done in this patch series:
1. Refactor functions present in file peer.c in such a way to retain functions
   operating on ath12k_link_sta in peer.c and move functions operating on
   ath12k_peer to dp_peer.c
2. Rename ath12k_peer to ath12k_dp_link_peer and change find APIs
   correspondingly
3. Add hash table for ath12k_link_sta in ath12k_base
4. Move peer linked list from ath12k_base to ath12k_dp
5. Add hash table for ath12k_dp_link_peer in ath12k_dp
6. Define ath12k_dp_peer structure and APIs for creation and deletion
7. APIs for assign and unassignment of ath12k_dp_link_peer to ath12k_dp_peer
8. Use ath12k_dp_peer in per packet Tx and Rx path
---
Harsh Kumar Bijlani (8):
  wifi: ath12k: Move DP related functions from peer.c to dp_peer.c file
  wifi: ath12k: Rename ath12k_peer to ath12k_dp_link_peer
  wifi: ath12k: Add hash table for ath12k_link_sta in ath12k_base
  wifi: ath12k: Move ath12k_dp_link_peer list from ath12k_base to
    ath12k_dp
  wifi: ath12k: Add hash table for ath12k_dp_link_peer
  wifi: ath12k: Define ath12k_dp_peer structure & APIs for create &
    delete
  wifi: ath12k: Attach and detach ath12k_dp_link_peer to ath12k_dp_peer
  wifi: ath12k: Use ath12k_dp_peer in per packet Tx & Rx paths

Ripan Deuri (1):
  wifi: ath12k: Add lockdep warn for RCU

 drivers/net/wireless/ath/ath12k/Makefile      |   1 +
 drivers/net/wireless/ath/ath12k/core.c        |  12 +-
 drivers/net/wireless/ath/ath12k/core.h        |  17 +-
 drivers/net/wireless/ath/ath12k/dp.c          |  48 +-
 drivers/net/wireless/ath/ath12k/dp.h          |  17 +-
 drivers/net/wireless/ath/ath12k/dp_cmn.h      |  28 +-
 drivers/net/wireless/ath/ath12k/dp_htt.c      |  44 +-
 drivers/net/wireless/ath/ath12k/dp_mon.c      |  30 +-
 drivers/net/wireless/ath/ath12k/dp_peer.c     | 627 ++++++++++++++++++
 drivers/net/wireless/ath/ath12k/dp_peer.h     | 125 ++++
 drivers/net/wireless/ath/ath12k/dp_rx.c       | 151 +++--
 drivers/net/wireless/ath/ath12k/dp_rx.h       |  19 +-
 drivers/net/wireless/ath/ath12k/mac.c         | 381 ++++++++---
 drivers/net/wireless/ath/ath12k/mac.h         |   1 +
 drivers/net/wireless/ath/ath12k/peer.c        | 439 +++++-------
 drivers/net/wireless/ath/ath12k/peer.h        | 112 +---
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |  47 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   6 +-
 drivers/net/wireless/ath/ath12k/wifi7/dp_tx.c |  24 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx.c    |   5 +-
 .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   1 +
 drivers/net/wireless/ath/ath12k/wifi7/hw.c    |  19 +-
 drivers/net/wireless/ath/ath12k/wmi.c         |  14 +-
 23 files changed, 1504 insertions(+), 664 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.c
 create mode 100644 drivers/net/wireless/ath/ath12k/dp_peer.h


base-commit: 25122460e7f96864a80b59ffe6c953911516d3b3
-- 
2.34.1


