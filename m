Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90D2FC07E8E
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 06:57:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=PvJkgx9KwB7uBqVMPgUMHgAkN2uJht5c1B6uLIUS5as=; b=g6LRkl45u1H6Sfy+wfQeWr/SUH
	41i2Nm8Vc/+s0fMAyjaPE9wYmB9s/KbKsoPdA35l6VbgFbt1DSuo4uO+JwaFkzcIyfJVt3n9Vj+7G
	lfedS7ng2twzH7xZe4nvw3bVc1T8A7cq8ZiIvnYcNjfrX+tQNyNzT30AeMx26dnqD+X9brkL637HE
	/p3CtS0+YSXrGGnHvbwND7Xq2sNHFJpDgTZ20OwS6doTydw3ipO6LExoQ9aVDMVwYxtOPRXhryhi9
	auZyqcNB3ZH2Fvge7fuliCVGzl236IUJxiSbb0NE6hj/bkjp/kqeJVuzHS+tmOQvvLfBzwIoiPQiT
	Q5ERcC0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWZ4-00000002zQ3-0DJp
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 06:57:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzWZ0-00000002zL4-0VtY
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 06:57:07 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43O6WwX7022778;
	Wed, 24 Apr 2024 06:57:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=PvJkgx9
	KwB7uBqVMPgUMHgAkN2uJht5c1B6uLIUS5as=; b=W9dtbpgSQHq9MdnSe1XIvNs
	LV9R1sokdSx4EJvnE9JO1ZNEFJIxI+aAsyt8NipaDTB0kIiNnDNmzE21rsIrtQ2z
	IisjEDEhWnz3vWGUoQY0+O7eBwBLBzJJxVd80oJrvLyPr95x6GcrK7S6p12/y0SN
	pEPjkZNEbDdztwuTJEAZ9E84GrDom98Yj4om6gd9Ln2A9QRFuRkoMal2AWqUGeSj
	kbrrslFTIFK1vfGbbeKFm31baxCc+2bDIDvGrg/Qzlz2jpplf5g6+jtAiKwNzWui
	BTN5JHaLmkjGQ541zBZbYYrKjmk7+0LUrGyid0RFo+BnmSct2v6R+BaaUVV0Izg=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xpv9fg40w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:57:02 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43O6v19Q002219
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 24 Apr 2024 06:57:01 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 23 Apr 2024 23:57:00 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: Refactor the hardware recovery procedures
Date: Wed, 24 Apr 2024 12:26:43 +0530
Message-ID: <20240424065646.1666166-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: eJwZQIXmIEDhqFrodvfXz6gWD0dRZ3dK
X-Proofpoint-ORIG-GUID: eJwZQIXmIEDhqFrodvfXz6gWD0dRZ3dK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-24_04,2024-04-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 suspectscore=0 mlxlogscore=646 lowpriorityscore=0 malwarescore=0
 bulkscore=0 spamscore=0 priorityscore=1501 adultscore=0 phishscore=0
 mlxscore=0 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404240030
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_235706_247430_DF399988 
X-CRM114-Status: UNSURE (   6.80  )
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

v2:
 - Rebased to ToT
 - Renamed the lock name as per the kalle comments

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor the hardware recovery procedure
  wifi: ath12k: Refactor the hardware state
  wifi: ath12k: Add lock to protect the hardware state

 drivers/net/wireless/ath/ath12k/core.c | 98 ++++++++++++++------------
 drivers/net/wireless/ath/ath12k/core.h | 28 +++++---
 drivers/net/wireless/ath/ath12k/mac.c  | 95 +++++++++++++++++--------
 drivers/net/wireless/ath/ath12k/reg.c  | 19 ++---
 4 files changed, 149 insertions(+), 91 deletions(-)


base-commit: 1b61047b44218a00c7a7836eff4f8e037d5634d8
-- 
2.34.1


