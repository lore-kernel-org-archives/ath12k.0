Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98544C8302F
	for <ath12k@archiver.kernel.org>; Tue,  1 Jul 2025 11:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=bYtZCgXTBaGNYpAUCYFWxZ6qrdRKNcML+AcPNmcED3o=; b=0NiE3wzI/8E6DQInDEtT5laxxe
	4lghfLMX4n6EcBuxjvE44dM/HqQxJddSJMcK++tuC7LWPDM2isVneKtMyF2ExkQSZlDz4zlv/duyy
	O0S8ueK+WnT+EwLPYmwS9fgjWHEhmXScHNrS5CokbyIjBvRSW8Zh1fslojFYrbDm0yrfQeOk58YMr
	FQnlBGuDlHh/aPiy4RxCNMnQEzZtyDjlZLZrHjiBOcMuNFuANJSedSA0lKOsM5GjCZ+0wzhmcRfw2
	icUZfaVrN2X3CW7+uFpsGulTBHNu6jNBj8LjPKF5hfYsW2GyXK8sBB+zD6Qeyp3xw97oz7UKAeBuy
	t2kIpIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYmi-00000004pCZ-1WWd;
	Tue, 01 Jul 2025 11:04:20 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYiP-00000004ofx-0vC6
	for ath12k@bombadil.infradead.org;
	Tue, 01 Jul 2025 10:59:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=bYtZCgXTBaGNYpAUCYFWxZ6qrdRKNcML+AcPNmcED3o=; b=K/vhDdgqAIAZjju4t5rLVByT+K
	fPWZOUFhp+UoIrZrTmbe9/v+6MEXJWKDrZChO85BgLUYBn1YsOP6dZCBfhF0ssMsO+H6cPVEo0qg/
	AwYQMcCPY9Jepu0FnBO4Joxp6HymquhrehDfIkwkm2rdW7P5mkOPSvgs9BPCIOLEcp7FkPFbJWyMr
	6TmPF7LHfLhC3vpnHPuuCHqXp0WJUmufryWsn+7wQlf2ZMcdT6lN2kUyY+lq1DOdviKrpH8RMTjMK
	CbvJW9uTpf/Cw4GXa5iiDqHSh4W5cC/Uq7TuxQkpjDYtXz3nhMOVLoFZ1vqit90wZ6nSM6j9e06iB
	Sy20rZjQ==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWYiM-000000074SX-05lb
	for ath12k@lists.infradead.org;
	Tue, 01 Jul 2025 10:59:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5619oKaT002240;
	Tue, 1 Jul 2025 10:59:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=bYtZCgXTBaGNYpAUCYFWxZ
	6qrdRKNcML+AcPNmcED3o=; b=QgKnQQeq4KcuQLAELC2UTxkvGy0ptIYF1ilpFX
	nEcGq0YzvVQJUTtSivpZ67kG14z/0QSjErHcFF6xZQzEP2HqOm9C+lHSSaHrYldF
	jXwKAaXOsTGDJlqsW2AhisN26nlO+W3+XviTJzoMFb/hIOQMETj/NNA87IZbEOol
	EfH4WCMDzyLjZGLOA4uTvJFF20Gh6ZBTxHmVVB0eCp7IyCOhCVuL8xc/NN3ICPFI
	Guh8JC/Kk5punLy2ltQM/8+F6pRSRNwC6qy+j+Cg/+vBfFmeh4JgNVTrlCsCsBgL
	3Sc4IvSoUtHaqNd/Bag0nJq0QZWY8iM5I9r9EWPGGFEJUvNQ==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j9pcrex3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 01 Jul 2025 10:59:45 +0000 (GMT)
Received: from nasanex01c.na.qualcomm.com (nasanex01c.na.qualcomm.com [10.45.79.139])
	by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 561AxjoD021805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 1 Jul 2025 10:59:45 GMT
Received: from hu-sarishar-blr.qualcomm.com (10.80.80.8) by
 nasanex01c.na.qualcomm.com (10.45.79.139) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Tue, 1 Jul 2025 03:59:43 -0700
From: Sarika Sharma <quic_sarishar@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Sarika Sharma
	<quic_sarishar@quicinc.com>
Subject: [PATCH ath-next v8 0/5] wifi: ath12k: add support to fill link statistics of multi-link station
Date: Tue, 1 Jul 2025 16:29:22 +0530
Message-ID: <20250701105927.803342-1-quic_sarishar@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nasanex01c.na.qualcomm.com (10.45.79.139)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: f8Lf86jLvSfj4RkwY9F7_AnduUI2EvVZ
X-Proofpoint-ORIG-GUID: f8Lf86jLvSfj4RkwY9F7_AnduUI2EvVZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDA2NiBTYWx0ZWRfXxT9lFUa/Xywy
 qgS39NxFcueAgVLHNsO0/CWVGvL+RweZHCa95yWn1J2ogaMRujuez9sQJD6ZICZbfdLgQT1atLT
 r8v3nJDytT9Zw0agtmPCzvrVxUDEJdNikL7OKYMFD/zqzyWbqOVR4XcRURo6iwyL/Z/XFYr9NTN
 ZFeXaH8z2H1eZRGEBEzdDzWhCxVx9jIGKoNUJWtSzVW5InM15Gy3ba6iqood4tqlNi6soG8AWZ/
 evwMZSbWFuMlevoclSjPyZQXSiwTlX1CGDI0GRrpsDde4TIn57VgfNem90Wdno5LwAEFThSs19x
 clCbm72PgtCW5cSjhgHzilcdsYIvQSIsgI0wRRRyDILJUvCdGDHYCHPgqV4rxQD2E6VsC9ClArc
 tgN1uBRRmdThx1BBnHB3o1e85KNxzlxFycQhVZn5LsB+3TAvggAyHOf0B97o0bgj9v8+q0m3
X-Authority-Analysis: v=2.4 cv=QMFoRhLL c=1 sm=1 tr=0 ts=6863bfa1 cx=c_pps
 a=JYp8KDb2vCoCEuGobkYCKw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=GEpy-HfZoHoA:10 a=Wb1JkmetP80A:10 a=kYzkSp3CTHGy5h0v6O0A:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=708 mlxscore=0 lowpriorityscore=0 suspectscore=0 impostorscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507010066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_115950_511531_8DD4663C 
X-CRM114-Status: UNSURE (   9.86  )
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

Currently, station statistics are filled at deflink for both non-ML and
multi-link(ML) station.

Hence, add support to fill station statistics for the corresponding
link of station.

V8:
 - Remove unnecessary initialization of bool is_ofdma.

V7:
 - Rebased to latest.

V6:
 - Remove dependent cfg80211 patch- as merged.
 - Change the code according to  design change of cfg80211 patch series.

V5:
 - Removed mac80211 patch from this series and included in dependent series.

V4:
 - Removed driver patches.
 - Added branch tree tag.
 
V3:
 - Fix kernel test robot build error

v2:
 - Convert RFC patch to actual PATCH with each patch bisectable.
 - Add new patch to update bw for ofdma packets.
 - Add new patch to fetch tx_retry and tx_failed packets.

Sarika Sharma (5):
  wifi: ath12k: fill link station statistics for MLO
  wifi: ath12k: add link support for multi-link in arsta
  wifi: ath12k: add EHT support for TX rate
  wifi: ath12k: correctly update bw for ofdma packets
  wifi: ath12k: fetch tx_retry and tx_failed from
    htt_ppdu_stats_user_cmpltn_common_tlv

 drivers/net/wireless/ath/ath12k/core.h   |  2 +
 drivers/net/wireless/ath/ath12k/dp.h     |  2 +
 drivers/net/wireless/ath/ath12k/dp_mon.c | 22 ++++--
 drivers/net/wireless/ath/ath12k/dp_rx.c  | 48 ++++++++++---
 drivers/net/wireless/ath/ath12k/mac.c    | 88 ++++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/peer.h   | 26 +++++++
 6 files changed, 173 insertions(+), 15 deletions(-)


base-commit: 0339e1433e228fbbbb106d9284dcc8b35ae6c4e6
-- 
2.34.1


