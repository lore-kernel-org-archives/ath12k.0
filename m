Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D837C3DA4A
	for <ath12k@archiver.kernel.org>; Fri,  9 Aug 2024 02:51:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=MatuQViqmeLAQYZVnqC/H0roPpOjQdJYAd8IwyUywNg=; b=x0yaGdN1A/xanEESBskIQfekiA
	SZB3ZSqBFjKF8FQDWUfl9IGmedexT3BdRVwSkWBxP7KKjh7Vzvey+4WJCLirVqb0IrUuq1JErZITk
	WAqivJlj/0WFIZxI6Mfihqo6i1QuRYOjSzmv4k6ENywua22rv4Ma8QnW4qFvIPsp/woi1t60HBTp/
	IC8ESgclOIuIq7qoYcX5j61sq+pK6WMe9oeZwLtmMuW/XDjOV1bCQATE+b9hOisMF/6Tgza4zzJsO
	3TuaRBrwtmdX7CAM6iQKQ78kLnRlStbqS+iNRljk1n85o7+kI8lzKojbM5YYC+9jiwCKMys+TKTdp
	Ql+LPoKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFiu-0000000A4aD-0yd0
	for ath12k@archiver.kernel.org;
	Fri, 09 Aug 2024 02:51:24 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1scFis-0000000A4ZR-140B
	for ath12k@lists.infradead.org;
	Fri, 09 Aug 2024 02:51:23 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4791kQKs006827;
	Fri, 9 Aug 2024 02:51:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=MatuQViqmeLAQYZVnqC/H0
	roPpOjQdJYAd8IwyUywNg=; b=Ps+EMDGV3uX8J2Fto85Upsh5SxdHBITJ0FCRmP
	cKDJcyFphgoPexWsAzuJeThpNuvp9ZcSY0vSXa5m6EeWTxZ6JrejE7kCpH/w7gvo
	Q3smjjD7z1N5XrgDQenC+0tpjRe4Bh4JBD+opG25aRa8rNp0QSN+OEydnfpYX6JR
	XMMqL1bGExdOFUgGlUzyOsdZdlsCduphrcv7MAFwevzIo1KQYspdWGw7ETCXfsj7
	TA+WD5/3Sl/BtyjshSpTf7uCyO3dAq19ekSZ8WiwWwRTxzggz6XMu/Pwesahp9Bz
	poVsB05Nki+XwzI6MF5ld9BC24ydw4mk9jbfq9GCdNEM31jQ==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 40vuwat88f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Aug 2024 02:51:20 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA02.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 4792pJWN032340
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 9 Aug 2024 02:51:19 GMT
Received: from lingbok-Birman-PHX.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 8 Aug 2024 19:51:18 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Add new features to ACPI
Date: Fri, 9 Aug 2024 10:50:51 +0800
Message-ID: <20240809025055.6495-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mEarZNM052aUh6RXabF0yT63TQZOo6sG
X-Proofpoint-GUID: mEarZNM052aUh6RXabF0yT63TQZOo6sG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-08_25,2024-08-07_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 clxscore=1015
 mlxscore=0 phishscore=0 adultscore=0 bulkscore=0 impostorscore=0
 mlxlogscore=815 suspectscore=0 priorityscore=1501 spamscore=0
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408090020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240808_195122_424609_9054E432 
X-CRM114-Status: GOOD (  10.09  )
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

By reading ACPI tables, implement a method to obtain the ACPI functions
Bitmap, enable or disable specific features based on ACPI Bitflags and
download board data files based on ACPI board data filename extensions.

v2:
1.support functions for cases where CONFIG_ACPI is disabled

Lingbo Kong (4):
  wifi: ath12k: Add support for obtaining the buffer type ACPI function
    bitmap
  wifi: ath12k: Add Support for enabling or disabling specific features
    based on ACPI bitflag
  wifi: ath12k: Adjust the timing to access ACPI table
  wifi: ath12k: Add support for reading variant from ACPI to download
    board data file

 drivers/net/wireless/ath/ath12k/acpi.c | 200 +++++++++++++++++++------
 drivers/net/wireless/ath/ath12k/acpi.h |  38 +++++
 drivers/net/wireless/ath/ath12k/core.c |   8 +-
 drivers/net/wireless/ath/ath12k/core.h |   7 +
 drivers/net/wireless/ath/ath12k/mac.c  |   3 +-
 drivers/net/wireless/ath/ath12k/qmi.c  |   9 ++
 6 files changed, 217 insertions(+), 48 deletions(-)


base-commit: 805781bdcbc4dd736770542e1d8da80d05a2e121
-- 
2.34.1


