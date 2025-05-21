Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECC3AC54E90
	for <ath12k@archiver.kernel.org>; Wed, 21 May 2025 22:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SkBtOb6ERC41NqMKxpZepS28MVVqnTvaZ4PXI3QW3VI=; b=wTYtlMXNMrqQeemKqxH1gQH11Y
	eSmCBCAi4URtjWmWFQEcWFquRHgvgdOeVFu+fmeVzg5NudSdkK8wpQT6XedoY6OW8br5Qr98hqFRx
	sAFYVROh+OFmxnD7RsFrh1EZZWR7gyHOKMwKb5Xk4H2x5d6fiG+/Ho07knggtiGMVtV3f5kimx+Nt
	okoryPHiz4qfPQ530I3yYTxe7fshQLH1Sg/STclA1iQ+Xwnt1mv7xMyIpqaIyEQbu+B4YXzP2G+uw
	nm+ZUEZdH60Ghr09lhaUmdqcdN5Z1NyIEKDDa9avmidouLJ7OcihjJ+UrGC5lqXVE0fDQGFzaBbpr
	zQ3uneYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCC-0000000Gxlb-2T67;
	Wed, 21 May 2025 22:45:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHsCA-0000000GxjY-11Lv
	for ath12k@lists.infradead.org;
	Wed, 21 May 2025 22:45:55 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54LJ0GR3011336;
	Wed, 21 May 2025 22:45:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=SkBtOb6ERC41NqMKxpZepS
	28MVVqnTvaZ4PXI3QW3VI=; b=NyTpefuPmvEqLmP056Lm9bVVYPiH4mQgxN5Kgg
	BjBV7xTG7VFq9t/Zn5j0XQzxuqcBa5w+KTlHzSB6C1kXzIpjVAvQ48GG3W/VNmkS
	22Wl82TL2JeizAP7J42ruhQQmnKKeG0tfvR3DyRmiqU8ohjH1qlmVBfhMrVr2NdU
	3W1WxwCVsDrmLjzUkapPiwEz4hbaREJH2V9lj1Sg6xxP1OjxuyERIWTGiEpNw1q/
	cVfJf3tcg/RQTusbbLrE0oVO09k6o/IScocMTJP2A3NGuZSNq3MHBl456/Nb6Ql5
	JjE9hovWbD3CFBqNg+el2RwVsZLEH+ygUGLMrRTxshc/2qmg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb4b3u-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 54LMjqqk027086
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 21 May 2025 22:45:52 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 21 May 2025 15:45:51 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next V14 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth support
Date: Wed, 21 May 2025 15:45:30 -0700
Message-ID: <20250521224539.355985-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 1Ed1cKzVoXEGqLcj5Djrm3eREqLkLlE5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIxMDIyNiBTYWx0ZWRfX9Y8kVJABjWWu
 knFNdsV/Bx6CBLh4keYMI+ddVkPEzdf8O/8UNqINuJMhyMEh7gADFuSP6DnY9GF3aGNdEX0JN6n
 n/np7kwdazOqQf4YX0DUohsPTGW3cev6Xaby0j4xHYct2SSFXHu/jhj2J0WOKmOWYMSRa8j2hDx
 Q9Yy98PSUOTnOfSbvmDYj6Z96oA9sTCIzNRMh062GCYkeL0MHe9GSOHPe/ai8Joz8254hlyvhwV
 c6IFtMzTPP+xoiUEq0S+Wzjorysgk1KkcjplhmY/dYCDhJIoUsJdQI/alh2GE3AdeL9Akqws1z/
 rUfCJvO4W7RV2J4TJjmleVI5woxcBPoW2ngq8nCwKSkNRe4qKdIKvnU/fLyNuFXUTIYKqC08Fuw
 NLhCqarcFnXjPcL/3u/5UfIJJHdLqbjZ384JI/W6C62HYq0n5sQFm/cPTL9KgnSZ6WU5eLOn
X-Proofpoint-GUID: 1Ed1cKzVoXEGqLcj5Djrm3eREqLkLlE5
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682e57a1 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=GEpy-HfZoHoA:10 a=dt9VzEwgFbYA:10 a=QCY7fwImu4SyahzicskA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-21_07,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505210226
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_154554_401352_EEC3CB1F 
X-CRM114-Status: GOOD (  13.46  )
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

 Add support for
1. enabling MU-MIMO in HE and EHT modes from hardware
2. setting fixed HE rate/GI/LTF
3. 160 MHz bandwidth in HE mode
4. extended NSS bandwidth support

Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3

changes in v14:
 patch 6/9:
 - cap max_nss using ar->num_tx_chains to fix interop issue caused due
   to sending nss value 4 when firmware only supports nss value 2.
 patch 8/9:
 - Set the default return value to MODE_11AC_VHT160 for 160 MHz
   to allow STA to connect to the AP even if it does not
   explicitly indicate 160 MHz bandwidth support.

changes in v13:
 - rebase

changes in v12:
 - rebase

changes in v11:
 patch 1/9:
  - fix return values in ath12k_mac_set_he_txbf_conf() and
    ath12k_mac_vif_recalc_sta_he_txbf()
 patch 6/9:
  - fix missing he_mcs initialization in ath12k_mac_init_arvif()

changes in v10:
 patch 6/9:
  - use ath12k_ahsta_to_sta()
  - fix rcu_dereference warning in ath12k_mac_set_bitrate_mask_iter()
  - change return type for ath12k_mac_validate_fixed_rate_settings()
  - improve readability by adhering to nl80211 definitions of GI
    NL80211_TXRATE_DEFAULT_GI. Introduce ath12k_mac_nlgi_to_wmigi()
    for conversion.
 patch 7/9:
  - do not change default MODE_11AC_VHT160 in
    ath12k_mac_get_phymode_vht() as it breaks clients which do not
    set VHT_CAP_SUPP_CHAN_WIDTH_160MHZ.
 patch 8/9:
  - Use IEEE80211_VHT_CAP_EXT_NSS_BW_MASK along with
    IEEE80211_VHT_CAP_SUPP_CHAN_WIDTH_160MHZ for determining VHT160
    phymode.

changes in v9: rebase on top of master branch with mlo changes
 patch 1/9 and 2/9:
  - fetch link_conf using ath12k_mac_get_link_bss_conf()
    instead of arvif->vif->bss_conf before mlo
 patch 6/9
  - fetch mcs/nss values from sta->link[] instead of sta->deflink
  - fix spelling of 'incompatibility'
 patch 8/9
  - replace sta->deflink.addr with arsta->addr in
    ath12k_peer_assoc_h_vht
 patch 9/9
  - replace sta->deflink.rx_nss with link_sta->rx_nss

changes in v8:
 - rebase and resolve KASAN warnings reported by Jeff in v7, in patch 6/9.

Pradeep Kumar Chitrapu (9):
  wifi: ath12k: push HE MU-MIMO params to hardware
  wifi: ath12k: push EHT MU-MIMO params to hardware
  wifi: ath12k: move HE MCS mapper to a separate function
  wifi: ath12k: generate rx and tx mcs maps for supported HE mcs
  wifi: ath12k: fix TX and RX MCS rate configurations in HE mode
  wifi: ath12k: add support for setting fixed HE rate/GI/LTF
  wifi: ath12k: clean up 80P80 support
  wifi: ath12k: add support for 160 MHz bandwidth
  wifi: ath12k: add extended NSS bandwidth support for 160 MHz

 drivers/net/wireless/ath/ath12k/core.h |    2 +
 drivers/net/wireless/ath/ath12k/mac.c  | 1144 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h  |   17 +
 drivers/net/wireless/ath/ath12k/wmi.c  |   13 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
 5 files changed, 1061 insertions(+), 222 deletions(-)


base-commit: 0d777aa2ca77584b339ce195db86fe0ee7dda5d5
-- 
2.43.0


