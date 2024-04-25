Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC4C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 09:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FzLMLRf0/Oul5pTj7sI17DYOoOnFuUynrgQFhLmmW1w=; b=029ADy+VqdMysZhxPRrm5PJc4C
	r2v37c3sTVwbqHyEsMAAFUmiT5uuChVXiDyX+DOySRR5bWUNTd1BVZwKlq6GqQQCTMOh4NBeg3L3x
	CCZCD2i+9kpKK98z/xA4d7UWkXYvnSH2or7I4Fc/HHhp07zSB7bkjpHE6fP3VpAKks2a+hIIj3q3K
	KpAY/7fUR8Y/Egqcw+F1AYS7+uZ+PvEdWU1iydpvHKHZqRl10Jqp6WkzFNtx/s5R2RRXSAW3FNOfA
	1Dk0PfegfQLJMDHQCS0BMuJ1nxZntCJPyOt51uBDqvi/dS5sAft/fNpgVvNrV6TIHg+qgTcaxKwRC
	TTL2lwpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0p-00000007WW5-2TwS
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 09:03:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzv0m-00000007WUT-0Dtp
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 09:03:25 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43P8h0Mf004350;
	Thu, 25 Apr 2024 09:03:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=FzLMLRf
	0/Oul5pTj7sI17DYOoOnFuUynrgQFhLmmW1w=; b=S+FS2ImNV+lEUpgaoqFHpNp
	yqQPHcSGe0+wNLsOM3/XT8QIfDm+TBvoiQpz4++lPqBVZwxIb4li/o97dV2A5vZG
	NzA0qRckyMaZKTzoyJyLXDzXcAgYug3VClTkRS51G7+jBlznoEO6dPTrY1i6HMN3
	72KyJcJMQI5AdXl0BujC6zZmVEJf3EXmXe0oxgWpz1H+T6cZXC+xyjOAPTVc9Glv
	3eCRuIqrPA+PJp73iW4Iwn4qPYG7A5lb23tfc6aVadjLlo1oJb1dD9ZispF8Zphr
	/uOBGlzrgLjgoK9WMR+vPMAJxYveU/BL7xXjI8dx5IGGJVJkkCIV8jj9Ge0hPwA=
	=
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenk9fac-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:22 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43P93LmE012593
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 09:03:21 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 25 Apr 2024 02:03:19 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v3 0/3] wifi: ath12k: Refactor the hardware recovery procedures
Date: Thu, 25 Apr 2024 14:33:04 +0530
Message-ID: <20240425090307.3233434-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CxI3AEWU6KX0lvQ0PrsHcj5BJKmlqcia
X-Proofpoint-GUID: CxI3AEWU6KX0lvQ0PrsHcj5BJKmlqcia
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_09,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 mlxlogscore=527
 adultscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250063
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_020324_405508_27D411E8 
X-CRM114-Status: UNSURE (   7.48  )
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

v3:
 wifi: ath12k: Refactor the hardware recovery procedure
	* Removed unnecessary conditional check
 wifi: ath12k: Add lock to protect the hardware state
	* Introduce auto guard mutex 
v2:
 - Rebased to ToT
 - Renamed the lock name as per the kalle comments

Karthikeyan Periyasamy (3):
  wifi: ath12k: Refactor the hardware recovery procedure
  wifi: ath12k: Refactor the hardware state
  wifi: ath12k: Add lock to protect the hardware state

 drivers/net/wireless/ath/ath12k/core.c | 98 ++++++++++++++------------
 drivers/net/wireless/ath/ath12k/core.h | 28 +++++---
 drivers/net/wireless/ath/ath12k/mac.c  | 88 +++++++++++++++--------
 drivers/net/wireless/ath/ath12k/reg.c  | 19 ++---
 4 files changed, 141 insertions(+), 92 deletions(-)


base-commit: 326f8f68f28b0b831233acfabffb486a5b0f4717
-- 
2.34.1


