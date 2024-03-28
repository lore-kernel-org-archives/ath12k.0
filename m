Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A4F0C54E64
	for <ath12k@archiver.kernel.org>; Thu, 28 Mar 2024 07:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jMc2+5poLNzreiQAFk+cGSB4CBkoY0ZEbfzRKenmm2g=; b=wCBRdGRNYBwNzo9Vep3s2J9XLB
	t384v78gv6c6WdIFELQ3uCA1Q51cfi/dvcVzCZV0gqxw9TDrhijnwtuSQqZnVdeetloB2WfsozS6g
	ngtN1nQ1QJgsiOs0lTE1MfARy+uocG2GoqucGwDFz16Fsb0IlZ5WvvR3A8yds4twN2TlzxI4OauGL
	hb/NKENRVts1dc2HHzu3SWVPKU2417wwzi5LorVPKRLzrNlLr1BvwwSK2PTYU13QkN9JZq18JyyCg
	KnvrpDOASpa0CDv0yAoe3voCH2vRBL/i95erpea/FCSK8h8tIUsAmlNfHqfC0GoOilQ5tElSbkowz
	cWSkBy1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkCq-0000000Cs9z-3IRB
	for ath12k@archiver.kernel.org;
	Thu, 28 Mar 2024 07:29:48 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rpkCn-0000000Cs8i-1Nj0
	for ath12k@lists.infradead.org;
	Thu, 28 Mar 2024 07:29:47 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42S6qiJc027519;
	Thu, 28 Mar 2024 07:29:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=jMc2+5p
	oLNzreiQAFk+cGSB4CBkoY0ZEbfzRKenmm2g=; b=aOLx+VvOVhkLERlhztBbyrN
	OeD+Rn53JCJp8tGmX5rbiFiGjcrtMTBoO/OqeWh+XPNYIWjXaFh+Yw6OComRG0An
	Pw5t7WubHkm3K0iXJqArnTyN42IryMsDZOmCG8DGghLA9Ho832Ng04WyA1uHKJbF
	CidsTsOg7gh2AnAnaowQ6ZgeFMcDj8Ogxom/6TOBj67AIko8VhCdciLvI14Qt8ZP
	kDfTfZXfus3eXns6w2jRcoo4C/SpkHtwNvYCuat+2RJKOaMCSIoaJqWZGVmTMYxY
	UKrm3p9mDHytK0ajd20JNLHw2TR36hAj8tcWRW78+KZrTk89NArBv+YL1FUKv4A=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x53nxg4vc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:43 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42S7ThIE032340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 28 Mar 2024 07:29:43 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Thu, 28 Mar 2024 00:29:41 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <johannes@sipsolutions.net>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 00/13] wifi: Add multi physical hardware iface combination support
Date: Thu, 28 Mar 2024 12:59:03 +0530
Message-ID: <20240328072916.1164195-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: RtRZRNyD0slKJC1On8ugK3Mkd9d2KYkC
X-Proofpoint-ORIG-GUID: RtRZRNyD0slKJC1On8ugK3Mkd9d2KYkC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-28_06,2024-03-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=648 impostorscore=0 spamscore=0 bulkscore=0 mlxscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 malwarescore=0
 adultscore=0 clxscore=1011 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403210001 definitions=main-2403280048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240328_002945_399250_69E206F0 
X-CRM114-Status: GOOD (  11.23  )
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

The prerequisite for MLO support in cfg80211/mac80211 is that all the links
participating in MLO must be from the same wiphy/ieee80211_hw. To meet this
expectation, some drivers may need to group multiple discrete hardware each
acting as a link in MLO under single wiphy. So it required to have some
sort of mapping while describing interface combination capabilities for
each of the underlying physical hardware. This patch set tries to add an
infrastructure to advertise underlying hw specific capabilities like
channel and interface combinations.

Some of the todos

 - More than one concurrent monitor mode support each operating on
   different channels under one ieee80211_hw
 - Mechanism for each underlying radio specific configurations like
   txpower, channel, etc.

RFC series Link: https://lore.kernel.org/linux-wireless/20220920100518.19705-1-quic_vthiagar@quicinc.com/

Harshitha Prem (1):
  wifi: ath12k: Advertise multi hardware iface combination

Karthikeyan Periyasamy (1):
  wifi: ath12k: Introduce iface combination cleanup helper

Vasanthakumar Thiagarajan (11):
  wifi: cfg80211: Add provision to advertise multiple radio in one wiphy
  wifi: nl80211: send underlying multi-hardware channel capabilities to
    user space
  wifi: cfg80211: Refactor the interface combination limit check
  wifi: cfg80211/mac80211: extend iface comb advertisement for
    multi-hardware dev
  wifi: nl80211: Refactor the interface combination limit check
  wifi: nl80211: send iface combination to user space in multi-hardware
    wiphy
  wifi: cfg80211/mac80211: Refactor iface comb iterate callback for
    multi-hardware dev
  wifi: cfg80211: Refactor the iface combination iteration helper
    function
  wifi: cfg80211: Add multi-hardware iface combination support
  wifi: mac80211: expose channel context helper function
  wifi: mac80211: Add multi-hardware support in the iface comb helper

 drivers/net/wireless/ath/ath12k/mac.c | 147 +++++++++++-
 include/net/cfg80211.h                | 175 +++++++++++++-
 include/uapi/linux/nl80211.h          |  78 ++++++-
 net/mac80211/chan.c                   |  35 ++-
 net/mac80211/ieee80211_i.h            |   5 +-
 net/mac80211/main.c                   |  46 ++++
 net/mac80211/util.c                   | 196 ++++++++++++++--
 net/wireless/core.c                   | 294 +++++++++++++++++++----
 net/wireless/nl80211.c                | 154 ++++++++++--
 net/wireless/util.c                   | 321 ++++++++++++++++++++++----
 10 files changed, 1318 insertions(+), 133 deletions(-)


base-commit: d69aef8084cc72df7b0f2583096d9b037c647ec8
-- 
2.34.1


