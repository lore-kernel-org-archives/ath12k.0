Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AAC8C04FF8
	for <ath12k@archiver.kernel.org>; Thu, 18 Apr 2024 12:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pNTX1g+H1x0NYEeOCz14mXhfnnVR9dJL2viKrmO5tuM=; b=OX+olSkLB2KZ8L+3X/pU+SoZJJ
	Lw1Pv5nU67pm/Oc/kYDKCEemZxx0mVR08ybCcDmAPEOmFqduz9cZpGvGwmdsRqpmPBBH/Ek8DIXUb
	mo1sdYiCWwhU8FuPr8Jb2WCymjAPGpdPo0/hO5bhQIXDlz/pWZDvqbwo/oNn8kQRIV7vT6OxiG22y
	fBCrlTUgPrD1X2zVKwxg7tCtqO2+P/4uzabBVNWPKseI69VPoiEhN0uARuG4EvO0OHI3LQXogwP65
	Ad+raL1ggBoCYFCYFrOEpZ4ndFkr9LAoqfc3U+3k7w1gONAeDkWK1SJLjQ1iEqrUCg6izVjL81n6o
	WLj8ijrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJd-00000002GVL-39KS
	for ath12k@archiver.kernel.org;
	Thu, 18 Apr 2024 12:56:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxRJa-00000002GTN-0yA7
	for ath12k@lists.infradead.org;
	Thu, 18 Apr 2024 12:56:35 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43I9059C026889;
	Thu, 18 Apr 2024 12:56:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=pNTX1g+
	H1x0NYEeOCz14mXhfnnVR9dJL2viKrmO5tuM=; b=atcht9PEFIKokqmGyxWi+A9
	QIWmZ9mfHG2YYPwL+2Ri2H2myMJkPcYuGMk/Zf+8g9W2ObbV5wWCaEWcXXXqcUes
	j/qIfP1Pv+A2TwaP2JJ+6mkZFBrjgUomEqB6CqQYUIcgga6evA6KUZwBTwO4fgMA
	lU2o1H9g+PHhk5cFbUJMlO7knB1gS05C37YlNJtlF6ePDS1j9PXgFMFFybTCOnTv
	5HcYgmCAPvihdaNkyWje0uqFmxXhr1Va/fodvf+eDbJ3ttwyjAO7cIn/5AUAt3XN
	AEOV8ersRLpEMZsa6NT3LFpaDsepv084AgZXGJMCiytKZ68sJHzE7kb64F5Hrfw=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk0gm0fb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:29 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43ICuSD1019413
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 18 Apr 2024 12:56:28 GMT
Received: from hu-rajkbhag-blr.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Thu, 18 Apr 2024 05:56:26 -0700
From: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Raj Kumar Bhagat
	<quic_rajkbhag@quicinc.com>
Subject: [PATCH 0/2] wifi: ath12k: Add support to set mlo_capable_flags from QMI PHY capability
Date: Thu, 18 Apr 2024 18:26:07 +0530
Message-ID: <20240418125609.3867730-1-quic_rajkbhag@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F2f9GXA0lnRRZWP2ji102WrH7nvmn0dJ
X-Proofpoint-GUID: F2f9GXA0lnRRZWP2ji102WrH7nvmn0dJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-18_11,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 adultscore=0
 suspectscore=0 lowpriorityscore=0 mlxscore=0 phishscore=0 malwarescore=0
 impostorscore=0 priorityscore=1501 clxscore=1011 spamscore=0
 mlxlogscore=684 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404180092
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240418_055634_303755_7D3479D4 
X-CRM114-Status: UNSURE (   7.75  )
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

Currently, mlo_capable_flags is set to zero if dualmac device is
detected based on One Time Programmable (OTP) register value.
This is not generic and in future dualmac devices may support
Single Link Operation (SLO) and Multi Link Operation (MLO).

Hence, add support to read 'single_chip_mlo_support' parameter from
the QMI PHY capability response message. Also set mlo_capable_flags
based on 'single_chip_mlo_support'

Raj Kumar Bhagat (2):
  wifi: ath12k: read single_chip_mlo_support parameter from QMI PHY
    capability
  wifi: ath12k: set mlo_capable_flags based on QMI PHY capability

 drivers/net/wireless/ath/ath12k/mhi.c |  1 -
 drivers/net/wireless/ath/ath12k/qmi.c | 40 +++++++++++++++++++++++----
 drivers/net/wireless/ath/ath12k/qmi.h |  2 ++
 3 files changed, 37 insertions(+), 6 deletions(-)


base-commit: 448ef71a317cc00e2ec0c1edcefbdf6df4b3e46b
-- 
2.34.1


