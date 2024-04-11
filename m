Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2E63CD11C2
	for <ath12k@archiver.kernel.org>; Thu, 11 Apr 2024 02:53:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QZB8l1GVaA+ypojqlJVNvNR8qffQAmPNN+Fy48rPUeE=; b=vB4748Bi9mLAPEQgPU0nO33dgx
	Asr4ndpEiSUiYtHDKCxlvJkm1Pt+Z8W+t+4maAnd3pPUyD1NXJ16171jAz+3aLYelEM1RxO+AQcAt
	PsD1U9wSKgnU1Aczt9swUj88Ao4IeN82MoRw/ZeVyTd8OTit2FhsN1o/sfnQgHI2X+561FbMIvbc8
	P3HtT3NvxpPG6MrCMvpbs7//h1hShM+o+ozXqu4qFy5AInMYlW78aWT9DKJWQsdLzP8ilIcjPxlFL
	brvP/ESXLz+tj9Fa4A7e7DUr1mWwXT4WNY8wtf4y6bi8g5LnOSnRO5OpVn/2MtGfAXngjC0Ipy6ZO
	mzuW1LDQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukZV-0000000A3PU-25V9
	for ath12k@archiver.kernel.org;
	Thu, 11 Apr 2024 02:53:53 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rukZT-0000000A3OO-1UIv
	for ath12k@lists.infradead.org;
	Thu, 11 Apr 2024 02:53:52 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43B2JXLJ020499;
	Thu, 11 Apr 2024 02:53:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding; s=qcppdkim1; bh=QZB8l1GVaA+ypojqlJVN
	vNR8qffQAmPNN+Fy48rPUeE=; b=o7da8xhsNFewdD67U9KIh153/fin381yiJ4t
	HN2OHwBEhiXVpqs87Py4cWT6sHl14WjbbfkS4FLCvntrwqlc3KhBXZDOuh3g+Z+s
	dr7PvB6Cc0AGssSbHnYBBbXqHpLTtVleA3wtOMkSJNhUaPPXNFzQKxT0eswcD2sE
	8mMIoaO1i73We/FnQdOpovZe0T5QMqdTJWnQ3ttzXiRHx2HX07jrrVvpqWy3l+/i
	JiytJX7gCLFYEkBOxtYy9nLta9zw+uZoHZ6B48ZJ6VoAXnwREL+pz387koFblXnk
	WuAtUiMPRjfhEM+IpcgPndmTqJ/v2IBLQSPNFjPQfqXRvocgbQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xdnqtmjjy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 02:53:48 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43B2rlLa021401
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Apr 2024 02:53:47 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Wed, 10 Apr 2024 19:53:46 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: report station mode stats
Date: Thu, 11 Apr 2024 10:53:19 +0800
Message-ID: <20240411025322.33888-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: M8khZOVWhZoG_aJg0uViFjnJAXSxHQMc
X-Proofpoint-GUID: M8khZOVWhZoG_aJg0uViFjnJAXSxHQMc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-10_08,2024-04-09_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 suspectscore=0
 lowpriorityscore=0 mlxscore=0 adultscore=0 impostorscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 spamscore=0 mlxlogscore=869
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2404010003
 definitions=main-2404110019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240410_195351_646627_3AC6A0F7 
X-CRM114-Status: UNSURE (   6.17  )
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

Lingbo Kong (3):
  wifi: ath12k: report station mode transmit rate
  wifi: ath12k: report station mode receive rate for IEEE 802.11be
  wifi: ath12k: report station mode signal strength

 drivers/net/wireless/ath/ath12k/core.h    |   4 +
 drivers/net/wireless/ath/ath12k/dp_rx.c   |  20 ++-
 drivers/net/wireless/ath/ath12k/dp_rx.h   |   3 +
 drivers/net/wireless/ath/ath12k/dp_tx.c   | 147 +++++++++++++++++-
 drivers/net/wireless/ath/ath12k/hal_tx.h  |   9 +-
 drivers/net/wireless/ath/ath12k/mac.c     | 180 +++++++++++++++++++++-
 drivers/net/wireless/ath/ath12k/mac.h     |   3 +
 drivers/net/wireless/ath/ath12k/rx_desc.h |   2 +
 drivers/net/wireless/ath/ath12k/wmi.c     | 130 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h     |  48 ++++++
 10 files changed, 537 insertions(+), 9 deletions(-)


base-commit: dc410c4accd2fe64479a1f4ebc47ec9cd3928f4a
-- 
2.34.1


