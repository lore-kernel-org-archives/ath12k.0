Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33267C05023
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 03:24:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XZy3Zl9onT1VetRVYHL2h1ohQiSRXEfHyp5j9SyTuH0=; b=M3HsblRLeP6SyZrmnd0NLoDCoh
	eP7rMXIpZIqF7PzYwZcPt3pZZGqq3cDtcqk9OyGulw4vYOwOoSY1EztcJWlx5PJipVGuhFevBm3Fx
	KKTp9FnFjSrCdjqFttEGbId6i1d7bZ4Wcn/M+r2nPsNe/3LXnkNJ7QL2zTKFK9/W3yv3iYu9XJo56
	g22tvueQZY2vDdPmtt3GcBA4u7XIYtp1dEgiZQcDQ9rXiLu1odEk+nZNbq0Os57mCRoR0QeCFYfzM
	npjp4D4O2aecB+uQjS9jf/6uQ7QUZMcAyTGQXHmbWugaJIGX2Z6pnHnH2PlYejg56cZuUFhlxTRnK
	IFWrWPJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxer5-00000004DN8-3Dbd
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 03:24:03 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxer2-00000004DKy-24QN
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 03:24:02 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J10fkQ026490;
	Fri, 19 Apr 2024 03:23:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=XZy3Zl9onT1VetRVYHL2
	h1ohQiSRXEfHyp5j9SyTuH0=; b=RKVSdQJVqZdL9W4vaN1gLOhKYFDgnemftjnb
	Z3eCuQnjWQjnzAbuZwlyuSTwkS5MNcMUMfGjThOoH+IHwHyD2Swx/iTc1H6cOA7Y
	RwJKkdtjskFIyUiQd+OA0HEcAjiRORR5XESqCvoY3EWGULHb+4yDuJ2QDeNw1ETL
	q6c+L1aEMLcFjGkunBkPI2Nt1PSePOu0fJomPapt6q0axXsYOMNOISFBsy/q1WAY
	wnruatwbmX34+u8ztKw+BJ0zBb4Wr6rfiQRoDQKkJGjjD6KNHTpIKGYK4yBp6Pio
	HY/HMScMJ0+h7LjFwlEw6ACuGaqH/DEj2oMzRbI9VXd9H1z2KQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk3tx9rhh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 03:23:58 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43J3NvsY006761
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 03:23:57 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Apr 2024 20:23:55 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v4 0/3] wifi: ath12k: report station mode stats
Date: Fri, 19 Apr 2024 11:21:19 +0800
Message-ID: <20240419032122.7009-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: iMdvmfb-K1N5jtYgSE5EnyZ7t4katUvZ
X-Proofpoint-ORIG-GUID: iMdvmfb-K1N5jtYgSE5EnyZ7t4katUvZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_22,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=822 priorityscore=1501 mlxscore=0
 clxscore=1015 spamscore=0 adultscore=0 phishscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190024
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_202400_830075_FA1BAB14 
X-CRM114-Status: UNSURE (   7.08  )
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

Currently, the transmit rate, the receive rate and signal strength of
“iw dev xxx station dump” always show an invalid value.

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
 drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
 drivers/net/wireless/ath/ath12k/dp_tx.c   | 147 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_tx.h  |   9 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 180 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   4 +-
 drivers/net/wireless/ath/ath12k/rx_desc.h |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 130 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++
 10 files changed, 538 insertions(+), 10 deletions(-)


base-commit: f5f3a3166c64d469150958a470f4a3ab99d45268
-- 
2.34.1


