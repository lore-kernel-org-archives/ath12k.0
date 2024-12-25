Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E1AABE7718B
	for <ath12k@archiver.kernel.org>; Wed, 25 Dec 2024 11:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bg10l2N1ErgNtKbeAMp1kGJdPIuq9OS6yp3zLdnBkIw=; b=PTDWUUqtmwMuc+iuknwTzOiHty
	xz8zqZk/jiMUu8jP2kO5VyEwIyv+9DqYudPPsBeULM2qGsDLAvQiGZPx/SZa2xteDvWLPbGbl2iC0
	C09tKn/B6mOhrcTJbac4jVLFGt11JQH03yK7NFFJzdIdm6cP3XRfqzjyk2BH8Y85ZvmK2DXqn1oNm
	JO3afj8NBN7m+7ixeN67k16djisrL5S2x8z7vbvQ49HyEcabcYjasU7kZtTy0bzTxdksqB0w5I+tg
	4oAryEGoGrd1NmU67xtIm9ocDsraj9rIdHe2VrqZYxWWTnvlfD5XOuqWMSNJnshPqEk9yRkcizmvi
	u43sN40g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQPUJ-0000000DiJN-25BQ
	for ath12k@archiver.kernel.org;
	Wed, 25 Dec 2024 11:23:39 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQPUH-0000000DiHb-0FO0
	for ath12k@lists.infradead.org;
	Wed, 25 Dec 2024 11:23:38 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BP0j76r025101;
	Wed, 25 Dec 2024 11:23:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Bg10l2N1ErgNtKbeAMp1kG
	JdPIuq9OS6yp3zLdnBkIw=; b=D2bdbhoHfMF5xiKEJ0l0H3FVTEBe3sFq/Sr0w5
	q34ZkkGEHwAjojtWkWPwFnOusGvfrCPVdMk2Ncd0iZhGr4i/k+Yo4v1FBEKHQOP7
	vBtWodEx9XlNxe9LMbrWb2EKHNty2L5//OhvLXhzgNYIQSIphhRYwseWzg8LFZyH
	watUGdpicp8ourUGFFLg8ATVXmMrrIVRBrklbMWQFs9dH00xkH41LOnFnBDw2SG9
	zKo+ha7iDNv3K+g88LqV6WQyoukMtrBrCwSoGDZIqG432ApOoU9LmtZAUpCmUZ6u
	fBpSNNLtRK6r3AAxf5IZZ/+/uKSNaWya7lnEeugmNQ+Fv6HA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43qybd567s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 11:23:34 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4BPBNX5R024887
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Dec 2024 11:23:33 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 25 Dec 2024 03:23:31 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v8 0/3] wifi: ath12k: report station mode stats
Date: Wed, 25 Dec 2024 19:23:12 +0800
Message-ID: <20241225112315.49881-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QwhQ6fbPaGJJbAHaehN3YU6gwkckcrSW
X-Proofpoint-ORIG-GUID: QwhQ6fbPaGJJbAHaehN3YU6gwkckcrSW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=949 bulkscore=0
 spamscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412250100
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_032337_241012_D866459D 
X-CRM114-Status: UNSURE (   9.34  )
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

Currently, the transmit rate, the receive rate and signal strength of "iw
dev xxx station dump" always show an invalid value.

This is because ath12k has no logic to handle this relevant information.

To solve this issue, ath12k parses the information passed by the firmware
and passes it to mac80211.

After that, "iw dev xxx station dump" show the correct value.
Such as:

Station 00:03:7f:12:03:03 (on wlo1)
        inactive time:  600 ms
        rx bytes:       4642228
        rx packets:     23796
        tx bytes:       933967
        tx packets:     8761
        tx retries:     66
        tx failed:      0
        beacon loss:    0
        beacon rx:      8925
        rx drop misc:   191
        signal:         -20 dBm
        beacon signal avg:      -18 dBm
        tx bitrate:     1441.1 MBit/s 80MHz EHT-MCS 13 EHT-NSS 2 EHT-GI 0
        tx duration:    0 us
        rx bitrate:     1801.4 MBit/s 80MHz EHT-MCS 11 EHT-NSS 3 EHT-GI 0
        rx duration:    0 us

v8:
1.rebase to 09fa3b6974a1

v7:
1.use switch statement
2.use guard(mutex)(&ah->hw_mutex)
3.use info0 = le32_to_cpu(desc->rate_stats.info0) and then use u32_get_bits() everywhere
4.replace time with time_left

v6:
1.rebase against wifi: ath12k: prepare sta data structure for MLO handling

v5:
1.use ieee80211_find_sta_by_ifaddr() to avoid using base_lock

v4:
1.rebase ath-pending-202404181533
2.change ATH12K_EHT_MCS_MAX from 13 to 15

v3:
1.change wmi_vdev_stats_event to wmi_vdev_stats_params

v2:
1.change copyright
2.change name according Naming conventions for structures


Lingbo Kong (3):
  wifi: ath12k: report station mode transmit rate
  wifi: ath12k: report station mode receive rate for IEEE 802.11be
  wifi: ath12k: report station mode signal strength

 drivers/net/wireless/ath/ath12k/core.h    |   5 +
 drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 +++-
 drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
 drivers/net/wireless/ath/ath12k/dp_tx.c   | 139 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_rx.h  |   3 +
 drivers/net/wireless/ath/ath12k/hal_tx.h  |   7 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 138 ++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   3 +
 drivers/net/wireless/ath/ath12k/rx_desc.h |   3 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 132 ++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++++
 11 files changed, 493 insertions(+), 8 deletions(-)


base-commit: 09fa3b6974a1245ddd0751747609431494ba5b4f
-- 
2.34.1


