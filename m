Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D410C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 04:12:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NajBJAsBO8+UgBqH8ORa1new2evUUg6pY80SaUiA3xs=; b=atXC5nxe+3j2Xb2HbncUomFDqZ
	z1qEG3KF1uF8wmGCrf42b9nbUqqEyUNTSd955vE8eFacF1bSnj6/82GWzjnFLFNe7OAkb5Dm1R+pl
	SS+R2Dm8+Vc5W/MsHLPrKaEg+szslnVZGMtKk/1uCvllBJoTWrJbFQBNT10QJpR7CCa/DRb/8RVGU
	04U/uqCFDYSOK0CJOv8UIqV4jL88gUiulMGPAHNrj8waRjVKJL+StP621WWQaM+DUHHO0/ntu3Fv4
	xBbjuVDnsx2DJ81KrqTXE7cJsukoz4bkqW1RBTpoXuldMk1JmELnvWpuI5hpcx5OyDdX9Cd78GPzV
	nWAToK5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKscU-009jhn-09
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 04:12:42 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKscQ-009jgr-2q;
	Wed, 03 Jan 2024 04:12:40 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40344GXX024022;
	Wed, 3 Jan 2024 04:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=NajBJAs
	BO8+UgBqH8ORa1new2evUUg6pY80SaUiA3xs=; b=G7PjCH6giTT0OiQFpbfwpA8
	m9JPYjEMorGx/1kp219K18LC12/I/YVCzsdikwaB6Fy7TzHVqHoLooEuD1bpvL1F
	oCJqdNVzYaUP2ezNqOQ8MSv0cJbdN9cX+xN8gT7uo2lOHU9g1sIYnffZXx1MlSUc
	8quazEnfbgRtRjOQkYQykifrKO23s/rJd9qTSQMMTuY6uLQe+ursEL2vwfLj10Sb
	swqI6+HbKIKSwM0unR0zbK98y9jDLXkZ/D6KpeQ9XGjN1VAK4qJHQ0gi0XpReFka
	5ZTU7jcYwYDZtFqF+lnXTH6e8IXXa/SKOXM5zv7JFmwYIiEy0Vy6Q0HPB9oTamw=
	=
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vcum10h7f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 04:12:36 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4034Cagv021857
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 04:12:36 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 20:12:33 -0800
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
        <ath10k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/3] wifi: ath: replace ENOTSUPP with EOPNOTSUPP
Date: Wed, 3 Jan 2024 09:42:17 +0530
Message-ID: <20240103041220.3082014-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dLedypDPTHGIHTaWZjCv2Q20hUEFb6D2
X-Proofpoint-GUID: dLedypDPTHGIHTaWZjCv2Q20hUEFb6D2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 mlxlogscore=433 clxscore=1011 lowpriorityscore=0 adultscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 impostorscore=0
 suspectscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401030032
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_201238_932671_0FCA603D 
X-CRM114-Status: UNSURE (   8.69  )
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

ENOTSUPP is not a standard error code, don't use it. Replace with
EOPNOTSUPP instead.

No functional changes, compile tested only.

Karthikeyan Periyasamy (3):
  wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
  wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP

 drivers/net/wireless/ath/ath10k/core.c    |  4 ++--
 drivers/net/wireless/ath/ath10k/htt.c     |  4 +++-
 drivers/net/wireless/ath/ath10k/mac.c     |  6 +++---
 drivers/net/wireless/ath/ath10k/pci.c     | 10 +++++-----
 drivers/net/wireless/ath/ath10k/wmi-tlv.c |  7 ++++---
 drivers/net/wireless/ath/ath10k/wmi.c     | 12 ++++++------
 drivers/net/wireless/ath/ath11k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath11k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/dp_tx.c   |  6 +++---
 drivers/net/wireless/ath/ath12k/hal_rx.c  |  4 ++--
 drivers/net/wireless/ath/ath12k/mac.c     | 10 +++++-----
 11 files changed, 38 insertions(+), 35 deletions(-)


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.34.1


