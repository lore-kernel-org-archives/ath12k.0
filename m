Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2DB3CD128E
	for <ath12k@archiver.kernel.org>; Fri, 29 Mar 2024 23:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=jExMj2ePWMn70UE/9PCuqtzjYyxnKvP7hV6+ozEGZqY=; b=cifTXlUKHRaICi
	1DqL/dZ2MC6rUso6N/jCsDMIxdBXfzjaOLvd1g3nE6q23C2rJ7A2MS3CN620xAGYh0TjXmxzIEf01
	kZeW520vpNSUu/O4/6vo/8dbwQCx8n70q565+cOxe3Qw/dSxwLoPYb+2lLyWLFRqgon43+58ktSPb
	W/WvchfLMs+gdVlRTJtMf6/ff2YOunJvlxFLADS7ns8LCzN8yzxgZU6FaA35LmS3oboimX9YY228t
	hn8UbN6bwOkJbdr4HlYbLrd8Psj5EC47t14rSRrSr7D6SC6LMw0yezoe0wOuSUaB5VsZL23lYXCI6
	oOzqU2RD9ygYZKHj4nLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLgZ-00000002J3c-2l2Y
	for ath12k@archiver.kernel.org;
	Fri, 29 Mar 2024 23:30:59 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rqLgV-00000002J1l-1yxf;
	Fri, 29 Mar 2024 23:30:56 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42TNTe54004354;
	Fri, 29 Mar 2024 23:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=jExMj2ePWMn70U
	E/9PCuqtzjYyxnKvP7hV6+ozEGZqY=; b=ZxDVxbYEqyBO+mIbAo7UlIhNmGL7p0
	XtffhcJumVtU9bDlOrHb9WTBjMV+r/wRP/YSmdq709z83asxxFIM2J6XL+Bf9fAP
	AKTOhh5nLRffvCcRrnRGQIvYv5aY/MYRvix59c9MDQ0dtc8p7kcCLD6LY+FB6+3J
	igNIyJ/B3BoNbuTJIbpEDAmTnNSzgeElDiWUF6N3+fTMr+Ay5Iube1R/gkECi4Iq
	mC6nzc16XZSkvNBf2atAfEfxnTfTHaERP1xQZWPAIR6jZkyhcM+ilr65dhntK+mX
	ylwdDAuQKtaVN9awo4E07h8D5/nVXrji+uNgQYjnYnlW6+QnwePGoEcg==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3x5u89htey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:30:51 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42TNUo8B014427
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 29 Mar 2024 23:30:50 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 29 Mar
 2024 16:30:50 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/2] wifi: ath: fix hal_rx_buf_return_buf_manager
 documentation
Date: Fri, 29 Mar 2024 16:30:49 -0700
Message-ID: <20240329-hal_rx_buf_return_buf_manager-v1-0-e62ec9dc2af9@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAClPB2YC/x3MQQrCMBBA0auUWRuIMcXqVUTCpJ00AR1lkkqg9
 O6m3f23+StkkkQZ7t0KQr+U04cbzqcOxog8k0pTMxhtrL6Ym4r4clKdX4ITKovwkW9knEmUnUK
 vBxMGb6/QHl+hkOrxfzybPWZSXpDHuF+xRMVUC2zbH4Xh01OKAAAA
To: Kalle Valo <kvalo@kernel.org>
CC: <ath11k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <ath12k@lists.infradead.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
X-Mailer: b4 0.13.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: YJ4gGW3Du894zrdNRYlDsqs9kfuJQ_yL
X-Proofpoint-ORIG-GUID: YJ4gGW3Du894zrdNRYlDsqs9kfuJQ_yL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-29_13,2024-03-28_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 mlxlogscore=473 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 adultscore=0 suspectscore=0
 impostorscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2403210001 definitions=main-2403290209
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240329_163055_569882_B145F1E1 
X-CRM114-Status: UNSURE (   8.65  )
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

Found two instances of the same issue once I added the -Wall switch to
my kernel-doc command, so fix them.

---
Jeff Johnson (2):
      wifi: ath11k: fix hal_rx_buf_return_buf_manager documentation
      wifi: ath12k: fix hal_rx_buf_return_buf_manager documentation

 drivers/net/wireless/ath/ath11k/hal.h | 2 +-
 drivers/net/wireless/ath/ath12k/hal.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)
---
base-commit: f09e3b774fe806ee0b1f2bb69771e8c29961e40a
change-id: 20240329-hal_rx_buf_return_buf_manager-4df5082f8b47


