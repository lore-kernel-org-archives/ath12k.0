Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BB04C02186
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 00:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ch5E/kO6NH3YdKrrUefLHg0sSCmYwjzd2xQhjp65ZKc=; b=wZLHZEpbYftnbxCLvEg18N2f7V
	L8VBf88F4gJQeptwvtB83/gm+TWfaSwEM/PlimCHG24wXsEWZBBFx3u8QqjgNNavslzqZydIvEyRX
	RCd5ynEz0/Ah5zAQvOWr+MBEsy+HA442puo6Nq+zSF2tFBXSrfvfGNCMg7n0TnTl8iHTEzdPtLVdy
	1+Bs05LoKfrIQZKE8aJv/hfq6QW2XluzliltWWeDBg3TTqOQVHk4d/V62GD6jOsxN0lKIhwkE+rSH
	bail0/WpCmw2j+WSpmP12KcW21LXn/97sqK8Bg7xg/sORQsG0SvJknRhyQSd1fR1aTyZi4uRboxc1
	7AYhYrzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUwy-0000000749r-0ksJ
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 00:38:32 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXUwt-0000000744W-0IOM
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 00:38:29 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DIixY0007956;
	Tue, 14 Jan 2025 00:38:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=ch5E/kO6NH3YdKrrUefLHg
	0sSCmYwjzd2xQhjp65ZKc=; b=dXvVNWxm7NM+4jSKsBcy5cbSIoX0mDvv+b8T9h
	L4rpvLL8f/b0cbWEPuxaCA9tkCEQeCo2p043gfU7v1XZLULdy7Bdu+J+B7TMmBaZ
	m6L+NdlOby+WClZN82BDqo++NTgDWu6tcpieDFryGmhBBzSgwEi0cDC1/khWnhvQ
	oVdnhn5fICYD1DUzMvbg6+WwJ5QzoVN3FIbGaF40cRX8XdD9UsffT/fjj3Cyj2Bz
	EeYpmXPNsLbMvXSy0NbrZgMeG+bo9xH+SV/z84IQkPYFKu46I6mH8i7ifpWY8kJH
	FkY1h8RPWp6Ttc4a57KlPi6vSvwYQAIv6/9g+bASTNdmxLLg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4458cn0npq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:24 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 50E0cN8q009609
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 14 Jan 2025 00:38:23 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Mon, 13 Jan 2025 16:38:22 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH v9 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth support
Date: Mon, 13 Jan 2025 16:38:04 -0800
Message-ID: <20250114003813.2783550-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: e_ldCzejKKkyZd2sBAQIyzA4sAun7qb8
X-Proofpoint-GUID: e_ldCzejKKkyZd2sBAQIyzA4sAun7qb8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 impostorscore=0 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501140002
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_163827_232147_60085834 
X-CRM114-Status: GOOD (  11.16  )
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

changes in v7:
 - rebase and remove patch 01/10 which was merged already.

changes in v6:
 - Change comment in patch 01/10 to represent only AP mode
   implementation.

changes in v5:
 - Fix column length to 80 in patch 01/10
 - Fix advertises spelling in patch 09/10
 - Fix choosing spelling in patch 10/10

changes in v4:
 - Fix ath12k-check warnings in patch 2/10 and 7/10
 - remove "hostapd" reference in patches 2/10 and 3/10
 - remove redundant prerequisite-patch-id's in cover letter

changes in v3:
 - address review comments for fixing ath12k-check issues.

changes in v2:
 - Amend mac80211 patch description as the patch is not specific
   to AP mode.
 - Amend EHT MU-MIMO patch description to specify future support
   for STA mode.

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
 drivers/net/wireless/ath/ath12k/mac.c  | 1117 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h  |   17 +
 drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |   98 ++-
 5 files changed, 1041 insertions(+), 217 deletions(-)


base-commit: 0c5fcd9069dd5f984e39820629acbfbe0f1b4256
-- 
2.34.1


