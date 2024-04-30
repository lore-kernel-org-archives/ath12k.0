Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCD6AC10F16
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 16:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+NGs/7h30n1S2Hq84xfG+4+AXUYE9/JcwfwCDGSmGPw=; b=Olz3Baol1jgJlktnbvH+1/glOg
	Ac+G1ruWm8ogYKefNPSVNdVzZpI3FsBJ5dEYs5PB0sQmK2pS2FpFTVvBvmfiX8+nRlXvm9ZowTGL3
	4I0Ss0ImKG//BmQlPofzcKGezouQOfGtxLE5HSvgZCkpDbnpWiqobIRkdG5UiXKaLxVIC7e93611h
	Qz+ZZcuIIfsjV7HtMV3tmZQR8gz2DnYjGzyXa94oRIm47nCqiRg+VtnxlV1q8DOZgjN3Sru/r5CIS
	mMRFFCJ6JlSpxDC7TIhEuzso/PDHhtEhXPloWB+4wVdTFnXUZraLvmjfloOZh4+5Gmc34nOfzhXMA
	u7svOjgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qoL-00000007L42-16Ib
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 16:58:33 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1qoI-00000007L36-0Ta3
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 16:58:31 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43UGLR6J024692;
	Tue, 30 Apr 2024 16:58:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=+NGs/7h
	30n1S2Hq84xfG+4+AXUYE9/JcwfwCDGSmGPw=; b=pBr4TuLWrNx8CPi4AjnqtRm
	xAwp+UOQNpkf7K6D/IN/XbOLMhRQZ+/TYROc30yUPIbk5ubwDS29mqKsVzgHgHVp
	U6Qte6LosNwFwohCzOOfppL3F3MOJ/kx2gc+dmGNYmEU9p5HF3GjLMiPY22OwpXX
	MYtvSnbnxiCURug++vvPNGDW/ddm4HqAOZ52fLlpbIXwjkGORKoxj7evfyE/2mRE
	nussHRkgrQ94se+p0oywcKlK0ZfcgjN8IVJK2pMfCzRKTOnw1l435RRowV9tptYj
	ETAUt0/yrsrhFeNvMPhYe8lpvQn/s8wQUDQNu7v8bReuy6vxJdePbFw+uX9VO7g=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xtrep2192-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:58:29 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43UGwSH7024699
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 30 Apr 2024 16:58:28 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Tue, 30 Apr 2024 09:58:26 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH v2 0/4] wifi: ath12k: Add multi device support for WBM idle ring buffer setup
Date: Tue, 30 Apr 2024 22:28:07 +0530
Message-ID: <20240430165811.1377182-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: pTNY-RseEn253RON9MS8X1gdRtZhuFr7
X-Proofpoint-ORIG-GUID: pTNY-RseEn253RON9MS8X1gdRtZhuFr7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-30_10,2024-04-30_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 adultscore=0
 spamscore=0 suspectscore=0 mlxlogscore=623 mlxscore=0 phishscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404300121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240430_095830_180644_EE520FA0 
X-CRM114-Status: UNSURE (   9.77  )
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

Refactor the WBM idle ring buffer setup to scalable for inter device
multi-link operation.

v2:
 - Removed the dependency of the patch series "device group abstraction"
   and include tha dependent change "introduce the variable device_id" in
   this patch series itself

Karthikeyan Periyasamy (4):
  wifi: ath12k: Replace "chip" with "device" in hal Rx return buffer
    manager
  wifi: ath12k: Refactor idle ring descriptor setup
  wifi: ath12k: Introduce device index
  wifi: ath12k: add multi device support for WBM idle ring buffer setup

 drivers/net/wireless/ath/ath12k/core.c  | 10 +++++++++
 drivers/net/wireless/ath/ath12k/core.h  |  1 +
 drivers/net/wireless/ath/ath12k/dp.c    | 27 ++++++++++++++++++++++---
 drivers/net/wireless/ath/ath12k/dp.h    |  1 +
 drivers/net/wireless/ath/ath12k/dp_rx.c |  5 +++--
 drivers/net/wireless/ath/ath12k/hal.c   |  5 +++--
 drivers/net/wireless/ath/ath12k/hal.h   | 21 ++++++++++---------
 drivers/net/wireless/ath/ath12k/qmi.c   |  4 ++--
 8 files changed, 55 insertions(+), 19 deletions(-)


base-commit: ec460f4384ea105f2998ca6b0d014db1cee336de
-- 
2.34.1


