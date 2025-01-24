Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51DC3C02181
	for <ath12k@archiver.kernel.org>; Fri, 24 Jan 2025 17:18:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0iqYc00VIj9MIxs9LsZwU5idIPPtfB7Pnc0X+TguzCo=; b=ssNiiPonW/QPp7KhmWGJpW6K0T
	SChG20PPgNxH1f41TogRVckPX7hoxHT9zURLNXnpiUqvM0UFKC9WVT5wc7AI3gY8fyR2o5bkE7R3n
	K2CbO6cCDSpi7TIWDtMwbE9d+kPoLI+jov1C72I8AZzHUMz1j0lt/qt2YuOqy/5pPWjFruMIEuFdF
	tHACufoueRsC5XaVjAxMsHzXrXC43ZBOI/yLfVUWPa/+fUEZ21xfGE8mQmoZ2inaGwaZ60QCH9RPi
	cmtOdLWp/CU22cVTRvQa8xNSZ/+Ldz2cy2MGgyOSwZ0MwOvo+rVov6bi69UEr4c5qMEeJs9+0ya0t
	x97D7nsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKM-0000000FC9Q-0KcI
	for ath12k@archiver.kernel.org;
	Fri, 24 Jan 2025 17:18:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbNKJ-0000000FC8p-18Wo
	for ath12k@lists.infradead.org;
	Fri, 24 Jan 2025 17:18:40 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50OAkq1J008024;
	Fri, 24 Jan 2025 17:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=0iqYc00VIj9MIxs9LsZwU5
	idIPPtfB7Pnc0X+TguzCo=; b=aSKub3UhM4SIwMposVIAEqhXj+ZyCamiEj0Q0F
	U/HiY1aCVdLEl4R/oqaimQuueGqHHwCL9rYizBctatoQndHznixLcMNlTJ/XfgWK
	fhhxuon6IblecgMccUPrZFMXZqKQyLs9FlLXlXZelnsiYE+LengnbpDiBLr3JBZe
	Y2wZ9uQKsDlhGnyWokdGKuRAl9dSJvkGiG2cLauUuAIyXzhNSHmrj8EHdXtY9WgK
	WCTDMso84+/MxMyC7BSBJIlw5GBY480w31ssOYrIxsRu8wny8slOctg9cOYnDk6j
	j3Ks+8p54wO3Jz/UJzaL6b5coeZi12a+dnLMUoyeqz0QuLmQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44c9djh0r4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:37 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50OHIa0K027804
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 24 Jan 2025 17:18:36 GMT
Received: from hu-rdevanat-blr.qualcomm.com (10.80.80.8) by
 nalasex01c.na.qualcomm.com (10.47.97.35) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 24 Jan 2025 09:18:34 -0800
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
Subject: [PATCH v2 0/5] wifi: cfg80211/mac80211: Set/get wiphy parameters on per-radio basis
Date: Fri, 24 Jan 2025 22:47:51 +0530
Message-ID: <20250124171756.3418663-1-quic_rdevanat@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b7qNcS292c6leFaIXi1qy4PmllRDiYDS
X-Proofpoint-ORIG-GUID: b7qNcS292c6leFaIXi1qy4PmllRDiYDS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-24_07,2025-01-23_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=999 mlxscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 adultscore=0 phishscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501240119
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_091839_439378_7C23C301 
X-CRM114-Status: GOOD (  11.29  )
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

Currently wiphy level configurations like RTS threshold, TX power etc.
lacks radio level get/set support and same value is applied to all radios
of wiphy. Add support to parse radio id attribute and use the same to
apply the configuration to corresponding radio of a multi radio wiphy.

This design will not disturb the global wiphy configuration. If radio id is
not passed from userspace, then the existing design of setting attribute to
all the radios will hold good.

Also add support to get the radio specific attributes in a multi-radio
wiphy from userspace.

The attributes that can be handled for each radio are:
NL80211_ATTR_WIPHY_FREQ
NL80211_ATTR_WIPHY_ANTENNA_TX
NL80211_ATTR_WIPHY_ANTENNA_RX
NL80211_ATTR_WIPHY_RETRY_SHORT
NL80211_ATTR_WIPHY_RETRY_LONG
NL80211_ATTR_WIPHY_FRAG_THRESHOLD
NL80211_ATTR_WIPHY_RTS_THRESHOLD
NL80211_ATTR_WIPHY_COVERAGE_CLASS
NL80211_ATTR_WIPHY_DYN_AC

With this design, the new userspace designed to set/get per-radio
parameters can work with both traditional and multi-radio wiphys.

v2:
 - Rebase on ToT. No code change.

Rameshkumar Sundaram (2):
  wifi: cfg80211: set tx power per radio in a wiphy
  wifi: mac80211: set tx power per radio in a wiphy

Roopni Devanathan (3):
  wifi: cfg80211: Add Support to Set RTS Threshold for each Radio
  wifi: cfg80211: Report per-radio RTS threshold to userspace
  wifi: mac80211: Set RTS threshold on per-radio basis

 drivers/net/wireless/ath/ar5523/ar5523.c      |  2 +-
 drivers/net/wireless/ath/ath10k/mac.c         |  2 +-
 drivers/net/wireless/ath/ath11k/mac.c         |  2 +-
 drivers/net/wireless/ath/ath12k/mac.c         |  2 +-
 drivers/net/wireless/ath/ath6kl/cfg80211.c    |  3 +-
 drivers/net/wireless/ath/ath9k/htc_drv_main.c |  2 +-
 drivers/net/wireless/ath/wcn36xx/main.c       |  2 +-
 drivers/net/wireless/ath/wil6210/cfg80211.c   |  2 +-
 .../broadcom/brcm80211/brcmfmac/cfg80211.c    |  4 +-
 .../net/wireless/intel/iwlwifi/mvm/mac80211.c |  2 +-
 drivers/net/wireless/intel/iwlwifi/mvm/mvm.h  |  2 +-
 .../net/wireless/marvell/mwifiex/cfg80211.c   |  4 +-
 drivers/net/wireless/marvell/mwl8k.c          |  2 +-
 .../net/wireless/mediatek/mt76/mt7615/main.c  |  2 +-
 drivers/net/wireless/mediatek/mt76/mt76x02.h  |  2 +-
 .../net/wireless/mediatek/mt76/mt76x02_util.c |  2 +-
 .../net/wireless/mediatek/mt76/mt7915/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7921/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7925/main.c  |  2 +-
 .../net/wireless/mediatek/mt76/mt7996/main.c  |  2 +-
 drivers/net/wireless/mediatek/mt7601u/main.c  |  2 +-
 .../wireless/microchip/wilc1000/cfg80211.c    |  4 +-
 drivers/net/wireless/purelifi/plfxlc/mac.c    |  2 +-
 .../net/wireless/quantenna/qtnfmac/cfg80211.c |  4 +-
 .../net/wireless/ralink/rt2x00/rt2800lib.c    |  2 +-
 .../net/wireless/ralink/rt2x00/rt2800lib.h    |  2 +-
 drivers/net/wireless/realtek/rtl8xxxu/core.c  |  2 +-
 drivers/net/wireless/realtek/rtw88/mac80211.c |  2 +-
 drivers/net/wireless/realtek/rtw89/mac80211.c |  2 +-
 drivers/net/wireless/rsi/rsi_91x_mac80211.c   |  1 +
 drivers/net/wireless/silabs/wfx/sta.c         |  2 +-
 drivers/net/wireless/silabs/wfx/sta.h         |  2 +-
 drivers/net/wireless/st/cw1200/sta.c          |  2 +-
 drivers/net/wireless/st/cw1200/sta.h          |  2 +-
 drivers/net/wireless/ti/wl1251/main.c         |  2 +-
 drivers/net/wireless/ti/wlcore/main.c         |  2 +-
 drivers/net/wireless/virtual/mac80211_hwsim.c |  3 +-
 .../staging/rtl8723bs/os_dep/ioctl_cfg80211.c |  4 +-
 include/net/cfg80211.h                        | 22 +++++++-
 include/net/mac80211.h                        |  2 +-
 include/uapi/linux/nl80211.h                  |  9 +++
 net/mac80211/cfg.c                            | 25 ++++++++-
 net/mac80211/driver-ops.h                     |  6 +-
 net/mac80211/trace.h                          | 24 +++++++-
 net/mac80211/util.c                           |  7 ++-
 net/wireless/core.c                           | 18 ++++++
 net/wireless/nl80211.c                        | 55 +++++++++++++++----
 net/wireless/rdev-ops.h                       | 12 ++--
 net/wireless/trace.h                          | 16 ++++--
 net/wireless/wext-compat.c                    | 11 ++--
 50 files changed, 213 insertions(+), 81 deletions(-)


base-commit: e7ef944b3e2c31b608800925e784f67596375770
-- 
2.17.1


