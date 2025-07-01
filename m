Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71B7CC8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 01:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CS2HLU7KE0n+wupLdfJabkZkefXDlbsviW5DMRfRvX0=; b=PbdwG1Y/vl8eJoFJXKnyEe9vtF
	A1KmZKY6du6bs1PQ2z0dh4Uq6AESvqu8YNKfghptYJ9vjjhTMeoUGy++gwA/3pbt7xf1T6+48F2XD
	dQ1LmqKG6e2/qXN6g5BFvLIPW8gGEeaUrZFlSsGtliLpQQOx8UnmDQAHNmxZYCZIj/F19eTEemQ7c
	AKUNyraYyScqTXUbz432mYqvEXDplbCL//FqxnOhJjJF4JQoVIjXj4EA9AiyyNIKNP906F6Tb0pj2
	X3+TU6CacLcSF7qmHcwvKPHp66PCOgsUmEN6VuUUYyZcOqLAkXCQnmuJ0SF15v55bk6AO8FCoUWMZ
	W0btbikA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPRc-00000003mmT-0le9;
	Tue, 01 Jul 2025 01:05:56 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWPQ7-00000003mYy-2Dnt
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 01:04:24 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UFfPNB029431;
	Tue, 1 Jul 2025 01:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=CS2HLU7KE0n+wupLdfJabk
	ZkefXDlbsviW5DMRfRvX0=; b=fq4CuiJn1BRGISjoGjik2hO5In8731TBG9kcAZ
	x8w5h2gZZT7bxPinLzpdWoZCAYK1FfS0yYA3JG7lXFYtVOiUEnrDnGq2Vq3q+jC+
	rG8jO+tsDq/jWcn1MBieKWKKZGwXKsAgDcfaEE2I59384RTEnN1P+94YfrnoKyIp
	bBcWFgeHUk6g3vuIAt/xSLGcDuiM6vUB15a374o0b9epvH+9h9wV5t/WEMi5yr7g
	yGv934UROiU23CSYdRcm2bSa7ECJn8s5v7WhhnIe2vRe9G+JEqqSsevkMhAClCJJ
	G7dWB+cuL5BqBZjYBNpLE+CsEHpKDk0EPE2Vmz7Z/TkizOjg==
Received: from nasanppmta04.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j95hxfe2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 01:04:22 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 56114LKd017219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 01:04:21 GMT
Received: from ath12k-linux2.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Mon, 30 Jun 2025 18:04:21 -0700
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH ath-next V15 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth support
Date: Mon, 30 Jun 2025 18:03:59 -0700
Message-ID: <20250701010408.1257201-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMyBTYWx0ZWRfX6/8mRrN9/D+V
 X5XNFSo3JuhTVOPSZJVcFEWN4KoM5mTTX7HaTT8PMoK9SUEVI6tpKARZWtA+foLcHK8ppiKTqvm
 dBGVVNtytxzch+qJRitmyKRfXHJJXzn0FI8ZlrIGTBzIctHyzRYMiEuT7/IsJzRNLt9ajdG2iwQ
 n/0VckYg74CiilixTexBc8kKyVeau+8WngRitCbiN4RAfiuG49yOFZroFlCskBDd4mlzvjSWpjk
 1ppbAcH0onl28vAygj4MzH1kFfC3OzuDcVh4vNb94C7wuomnXb80kDNDvrF0KTneg+K3lpyIZQY
 RcGYPWLPeG/Gg923chAsF+OOuWVuYYVy3ox/X8P1GkuTaDgQAFQRs2vXqGHgDcj1Wy9h/Nj+djW
 7gH0dQYL9rWv4Si2wYWtwYFe6dU4cZ/1wmI3SdDbgfggNbsvq4LPRU/u2ibWC3VLG+zXcO4a
X-Proofpoint-ORIG-GUID: vRcu1oB19-t1PBg4cfL1blaB1dMbZ0t0
X-Authority-Analysis: v=2.4 cv=EuHSrTcA c=1 sm=1 tr=0 ts=68633416 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=QCY7fwImu4SyahzicskA:9
X-Proofpoint-GUID: vRcu1oB19-t1PBg4cfL1blaB1dMbZ0t0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 adultscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250630_180423_588954_493A3E1A 
X-CRM114-Status: GOOD (  14.36  )
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

changes in v15:
 - rebased the series after merge conflicts reported
 patch 4/9:
 - change the fix to apply for all modes except STA mode as
   WCN7850 expect it same as before.

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
 drivers/net/wireless/ath/ath12k/wmi.c  |   28 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |  100 ++-
 5 files changed, 1069 insertions(+), 222 deletions(-)


base-commit: c256a94d1b1b15109740306f7f2a7c2173e12072
-- 
2.43.0


