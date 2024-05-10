Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0ABC25B10
	for <ath12k@archiver.kernel.org>; Fri, 10 May 2024 06:48:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Pd1wYFZVI4nWz8fO2Y1exIIfp70OFjIwe33JKa1CruU=; b=ggACZaWWmIiQJJ5sKAwMqH3nl/
	yP3Zvkl6l9OncnAHhrAeZ5DC5+qRwEYoWgsV0bnKl1HYKOcMhgv4jv1CNNM+HWmwwAVZkRiXx9lXd
	SDMa7pgsmMGqcpxzGVpkSO6B5ueHygVdLRZpGr/lTF2VZWsgizwYgiEYDiqRTyuMdOzUEf6cyeN/J
	7yT0b5KvdIKB3+2fbW35nx/7UBnHr7lFHQqFNNMlBQHNg8WiRxvbCpy1aER8eNFI4BX/dFqdqPpDr
	WsFP9KAjQqnV9YcmpAAc3mdarOfAFvee6iJqWikYM6rdxA2oSwa4YLKMCQzgUgtqxGNhZkdu8siie
	Wit3k26g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K37-00000004G59-1lSo
	for ath12k@archiver.kernel.org;
	Fri, 10 May 2024 06:48:09 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s5K33-00000004G3R-254J
	for ath12k@lists.infradead.org;
	Fri, 10 May 2024 06:48:07 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44A2ua4F014570;
	Fri, 10 May 2024 06:48:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=Pd1wYFZ
	VI4nWz8fO2Y1exIIfp70OFjIwe33JKa1CruU=; b=d+H8vLcJC3wiyUugTyCDn2N
	BmC+m2A2rZjoaJCbyhWoVUhhbMzl1x+VMEq4BKBc1on0VXikjghL9gSu/gulhzMD
	CHK4AvOq4Al8VBwbGSq7JmuTZ4cqEZDaLOLL0z+eabcPWf7/NpUuhnLBBLmATqSa
	32+paY7tHKEGyOXxirezF0YNoaWHLdZO/98I6Zv6RscvqqL91YIKV761ON2IIzGv
	3QrX9Y/wb6BP55+sctLUfHxfjISxbUdmJ7272b2dvTrqJQaL+9yJyOkJhrPLXQOC
	XEvdRzqDvlQX2r7KJM0guo4FmCDsF9IJx8Pndybfp1E07andCnKr5KyamGBA99w=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y16w10se1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:48:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44A6lxRN011550
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 10 May 2024 06:47:59 GMT
Received: from bqiang-SFF.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 9 May 2024 23:47:58 -0700
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_bqiang@quicinc.com>
Subject: [PATCH 0/7] wifi: ath12k: add support for WoW
Date: Fri, 10 May 2024 14:47:41 +0800
Message-ID: <20240510064748.369452-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 54h8vDxdgkmYEiHe23lOTZW6YA72YSrt
X-Proofpoint-GUID: 54h8vDxdgkmYEiHe23lOTZW6YA72YSrt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-10_04,2024-05-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 bulkscore=0
 malwarescore=0 phishscore=0 adultscore=0 mlxlogscore=494
 lowpriorityscore=0 impostorscore=0 clxscore=1011 mlxscore=0
 priorityscore=1501 spamscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2405010000 definitions=main-2405100047
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240509_234805_757984_613C9325 
X-CRM114-Status: UNSURE (   9.83  )
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

Add support for WoW (Wakeup on Wireless) funtionalities, this including
magic-pattern, net-detect, disconnect and patterns, HW data filter, ARP
and NS offload, GTK rekey offload.

Also enable keepalive before suspend to avoid unexpected kick out by AP.

Baochen Qiang (7):
  wifi: ath12k: implement WoW enable and wakeup commands
  wifi: ath12k: add basic WoW functionalities
  wifi: ath12k: add WoW net-detect functionality
  wifi: ath12k: implement hardware data filter
  wifi: ath12k: support ARP and NS offload
  wifi: ath12k: support GTK rekey offload
  wifi: ath12k: handle keepalive during WoWLAN suspend and resume

 drivers/net/wireless/ath/ath12k/Makefile |   1 +
 drivers/net/wireless/ath/ath12k/core.c   |  48 +-
 drivers/net/wireless/ath/ath12k/core.h   |  37 +
 drivers/net/wireless/ath/ath12k/htc.c    |   6 +
 drivers/net/wireless/ath/ath12k/mac.c    | 252 ++++++-
 drivers/net/wireless/ath/ath12k/mac.h    |   4 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 719 +++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    | 559 +++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.c    | 878 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/wow.h    |  62 ++
 10 files changed, 2557 insertions(+), 9 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.c
 create mode 100644 drivers/net/wireless/ath/ath12k/wow.h


base-commit: 1025c616ee13372f3803b158abb1d87ef368ae3d
-- 
2.25.1


