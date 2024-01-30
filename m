Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0D65C46CD2
	for <ath12k@archiver.kernel.org>; Tue, 30 Jan 2024 06:09:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=eBPOUTStUtXOdZiLPwsIUbuE9YttOk/G4h+qPGGbswc=; b=y4DOqc2OkvNlwaqM/VRClYi0yR
	AR9f6q9oTPulltqwCAoziswC3HYovbFS06SzufewGVYOGFUvPMjllLIkibfG2KfaAzQ55fH27+kaU
	Gg2uGS5uCk1R4OiF1Ehh4W2yCSimWd7/4zY18oiHscxSaDzV3YfAGKNDX7j2nzx1eFIPKwnsQsfDB
	TOhEvA2VvbVn0/BU6IAeCYyqlvheZXWuoVgiqlgiRreEafLqvregb0+qhkh8JkYAvh6kWFqiuqAB9
	tCGP3TViteTRhccKf9nlX555VeNZAxTB+ibMsbdGxT/SwnOr4SKz/d1u8H8gQGjOaQ8hPE4f5Mw8V
	q4XiO4tA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhIq-0000000FNsN-14zG
	for ath12k@archiver.kernel.org;
	Tue, 30 Jan 2024 06:09:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rUhIn-0000000FNrE-1KHY
	for ath12k@lists.infradead.org;
	Tue, 30 Jan 2024 06:08:58 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40U4tcVE011575;
	Tue, 30 Jan 2024 06:08:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=eBPOUTS
	tUtXOdZiLPwsIUbuE9YttOk/G4h+qPGGbswc=; b=ITKx/Y3sZi8GDPnW7XvpZlA
	LDv19JnEA+NkfICgG1xkoy2MopKQE9X+sUGKNg9SGB9r02eV3znEzsyHyGfGVEPG
	5Zhkk4RjLQjhGMSheWysCCQgVISeFzt2UTKxCG0mus8MkJV/gwqreyVyRwwaq0WO
	8bk4TfUftlKIaDdu35hLBqTAFJzMqaYGFesvRx4dF6idCr5PuzDxbyjq/ArXKI2q
	6/VpHtCle3lyntHaO8XPFTAL/ce4g/GU52ZSc9Abv4pharyoBEcTRqDJ088dgFKH
	4lNtBi7oCh7hyUAJedZ1NQDMmilmRd5OJ8Xd3+6QhBMusFInwtBqUtHlG0FdyvQ=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vxsc207t8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:08:55 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40U68sY4008729
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Jan 2024 06:08:54 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Mon, 29 Jan 2024 22:08:52 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery procedures
Date: Tue, 30 Jan 2024 11:38:35 +0530
Message-ID: <20240130060838.3895599-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: xT4d9Li075nwkBR-iar0PB-avYrq_hXA
X-Proofpoint-ORIG-GUID: xT4d9Li075nwkBR-iar0PB-avYrq_hXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-30_02,2024-01-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 mlxlogscore=333 phishscore=0 priorityscore=1501
 clxscore=1015 suspectscore=0 spamscore=0 mlxscore=0 malwarescore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2401190000 definitions=main-2401300042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240129_220857_499264_ED314305 
X-CRM114-Status: UNSURE (   7.57  )
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

Currently, hardware recovery procedure supports multi wiphy model. However,
to support single wiphy model, we need to refactor the hardware recovery
procedure. This patchset allows the logic to work both multi wiphy models
and future single wiphy models.

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor the hardware recovery procedure
  wifi: ath12k: Refactor hardware recovery synchronous
  wifi: ath12k: Refactor the hardware state

 drivers/net/wireless/ath/ath12k/core.c | 97 ++++++++++++++------------
 drivers/net/wireless/ath/ath12k/core.h | 25 +++++--
 drivers/net/wireless/ath/ath12k/mac.c  | 95 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/reg.c  |  5 +-
 4 files changed, 137 insertions(+), 85 deletions(-)


base-commit: 17f4b952f067b1f87d14e6df4c8c216fe7a245d1
-- 
2.34.1


