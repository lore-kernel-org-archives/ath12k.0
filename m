Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCA5DC021A4
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 01:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9/CB2HE4v/eXzPtHXCSjbTBghOvnqptIv1D+YTr7Xi4=; b=i6C6pGgYB7AGc9U3hSrRYqXtTv
	oKSMTZvxuVpiZSzmnNxhSS9e0TCyNCYbnm3TW/g//RQgb81ioXz68oyXmaSzWOOeyEeYUqH9JHBYn
	A1J6rlrPFlq0eO29SnCZ2+8SnwDHKIpnk/+zj8ojH+utvGaCVCPjt52fCWEZrg76ycCkvaR6WkFv/
	g87grzYPFA4zpFP8BFDhuX2hAWAbyuVe5ymCrT7xx862Fj+sIaih4Xs/Y+zjkIOmNfvFtQUAy5aat
	TW+TVrZbjHXg/H1Hqg2lQZDEe2wdaRzJoNt2DPqdCGhDZYj3kW/RYFdjALUNE0+TM9DJ0LVnPQyKP
	k5NKbpIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyL-00000009NcA-1qyD
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 01:24:57 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiNyH-00000009NYg-3m9y
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 01:24:56 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51CJc00v010885;
	Thu, 13 Feb 2025 01:24:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=9/CB2HE4v/eXzPtHXCSjbT
	BghOvnqptIv1D+YTr7Xi4=; b=pbvN5dYOhcZXYiV+EHO/QXDfMQYVSpw6Nk4ahG
	No4UHmHU5lOtbn9evRknU4tedL6yNyjnZMw3pIamYtcDLZcvhUGsS2yDdOx6GfQ5
	IlPAeEMHAF9ugZbRiwVQxZ7xsqY0GOkQ/2vo9aruPA1TVG9ZgpjBhlbl2oIsrzqM
	te4FwoJ4S+q11Dw/uFUdZ56mVUrrVeBOnFmas+M2mWMC8Zxku4XsnFpTaDDLXtyx
	MRLAvFpQXqCux76NgjghgwVLH58phRwIvug1Gw1bunVY50Q+Ka8JZ+/cEoU46kTH
	Sh6qYFCGQHg3y6zfofgaRLzyG/kDl9e7umcW3eDXmq8BkAgQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s1yngmsa-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:52 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 51D1Op9u012597
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 13 Feb 2025 01:24:51 GMT
Received: from ath12k-linux1.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 12 Feb 2025 17:24:50 -0800
From: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Pradeep Kumar Chitrapu
	<quic_pradeepc@quicinc.com>
Subject: [PATCH V10 0/9] wifi: ath12k: add MU-MIMO and 160 MHz bandwidth support
Date: Wed, 12 Feb 2025 17:24:30 -0800
Message-ID: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: lSyDdJPhaneAmAMEuP4HPE5WHf0ebjQl
X-Proofpoint-GUID: lSyDdJPhaneAmAMEuP4HPE5WHf0ebjQl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-12_08,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 bulkscore=0 lowpriorityscore=0 impostorscore=0 mlxlogscore=999
 clxscore=1015 adultscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130008
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_172454_157484_F6643CDF 
X-CRM114-Status: GOOD (  10.53  )
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
 drivers/net/wireless/ath/ath12k/mac.c  | 1140 ++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/mac.h  |   17 +
 drivers/net/wireless/ath/ath12k/wmi.c  |   24 +-
 drivers/net/wireless/ath/ath12k/wmi.h  |  107 ++-
 5 files changed, 1068 insertions(+), 222 deletions(-)


base-commit: 704a2d7237043317ed1b0f8a08203e9ddde70097
-- 
2.34.1


