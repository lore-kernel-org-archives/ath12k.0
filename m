Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E1DCD1297
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 04:06:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xXGeYFrAQ7N8NZ0T//i7nfEaH73ufHjBytqhp+VTURo=; b=gtZx+Tibhm6l8zoF2FcrOceSRd
	v+fz10ok5SucKwGatIxO2lwk/JamvFNetp56c7q9uBguQxB2V/c3NhqRNR9DnkbgEDg6nusNq+ZgY
	FzX4JMA61V3KFHegWcJ2Le/r17/5BsVp+8hsBgL3Yxus+euHEIKaJBBmr4A3vzdp4QQdvHsYKsOEZ
	+Sk1yFSCeFqJfjcdTB9pjv1qEEiA3eXImfCL0GTe5e8dJeLhGqQnp/F9WE0eylHPsAGpWTaJczE9o
	0Gj9mqgbRJCntDOZ5JONgyh3o3YObawX80uZtE8m+58ND7Vi2HGQ7I3xt5j7dKS2bU4IOCLN24R0i
	q7dHj5ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtgGq-0000000EGD8-482k
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 04:06:12 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtgGl-0000000EG9t-2PGn
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 04:06:09 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43841ECN022096;
	Mon, 8 Apr 2024 04:06:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=xXGeYFr
	AQ7N8NZ0T//i7nfEaH73ufHjBytqhp+VTURo=; b=oCySiLRoLXubglE+ZW0mTu8
	oeDGyILqiT8CCm3Ws4e58+tSXSl1C1U1E+dMGXltt2oE/1CJ1kTdYpHrBIznftR5
	6fZnUdoexCwruW/u0aK4EGJ49RDCYxPp8yprMH4jpq1LfmFbRdPLaNNdnRPpDi86
	+fBRESrG/jzeV9uUk5XK0ophBuHQxi9dZdb8yCGdj/Fn/epKNnpCZ6KyGmaJkLY5
	rUvUtJHaCMJYQ77fw/Qy1D9EdQKLu1Dt8J2F0NIN3xnIyKCe0ro4bmaVWCpbmqhy
	XeHtsaVpEETpDQlmS0x6p6n9nvbOg2IyEQmJcTxZItp2N0ix6l9ks3j9KaF7Djw=
	=
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xc8jmr225-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 08 Apr 2024 04:06:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 438463n6025043
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 8 Apr 2024 04:06:03 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 7 Apr 2024 21:06:01 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/4] wifi: ath12k: Refactor hardware cookie conversion
Date: Mon, 8 Apr 2024 09:35:43 +0530
Message-ID: <20240408040547.837639-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: w_XgLq-BYVFsoxmtzYnicKj46nsBqVhq
X-Proofpoint-ORIG-GUID: w_XgLq-BYVFsoxmtzYnicKj46nsBqVhq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-08_02,2024-04-05_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=714
 lowpriorityscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 phishscore=0 spamscore=0 mlxscore=0 bulkscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404080029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240407_210607_775368_1BF50339 
X-CRM114-Status: UNSURE (   7.41  )
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

Refactor the hardware cokie conversion initialization procedure to
support multi-device MLO.

Note: This patchset rebased on top of the patch "wifi: ath12k: correct the capital word typo"

Karthikeyan Periyasamy (4):
  wifi: ath12k: avoid redundant code in Rx cookie conversion init
  wifi: ath12k: Refactor the hardware cookie conversion init
  wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion
    table
  wifi: ath12k: Refactor data path cmem init

 drivers/net/wireless/ath/ath12k/dp.c | 70 ++++++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/dp.h |  3 ++
 2 files changed, 58 insertions(+), 15 deletions(-)


base-commit: 007c5443ab7bba338f81bf6ebc64375257c6af41
prerequisite-patch-id: fcb51c7a2119a4453ec00f6ec726020f4104a1be
-- 
2.34.1


