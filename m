Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76EEC4707C
	for <ath12k@archiver.kernel.org>; Tue,  9 Jan 2024 17:51:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=TK4R7YjpOoaeJpgRenwcUYToruwgnjKAjGG59bKhVmI=; b=sEXmEDzms9Mg2d
	YxoUSPp+51oWOIaqXO2IHJgC36owMGc5RdGdRaIauc5qd6VIw2jzvDh7Yy0t8C5k720eZBZ3yuvmy
	pAneN20Wup+oUq+4TKVQBJKKckwVB5T6N8+BIIDVSkOM5AgfRdZFy7S16WewntKoRmnkxCgUeW7vb
	QRn64cuD1PLYkNG7lUCkMkI8di45KjZnPybOtVclFJV1j3ht3p94URcbsLd5NDiMxY9jx4JUGkla/
	7MUoL+A2uHSjQVP4282X1zQxOEoVRzFjS6EIlhp20CIqfZ5Q7pstJeTsCbl2bpDrClGQy53znQnRP
	AlTZAlXPPO2Gi2ASsRLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFx-0092UU-1J
	for ath12k@archiver.kernel.org;
	Tue, 09 Jan 2024 17:51:17 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNGFs-0092Rs-0u
	for ath12k@lists.infradead.org;
	Tue, 09 Jan 2024 17:51:14 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 409Ganr4012230;
	Tue, 9 Jan 2024 17:51:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=TK4R7YjpOoaeJp
	gRenwcUYToruwgnjKAjGG59bKhVmI=; b=No63c6/+71OXrBOUAd49ylbKGmzR5l
	InSaddKxZuMc0ObnboxU0CB90wwKJ9vflhDeiAwl+qfz9nYp/hmZ/S0VldcYCvqW
	EUYRTRimPQ79lgzXC/zfQcIOqgyY75L4dn1KW2hyC4whdIYgt+saX5+5buSgxBG0
	arT9JKFSQDOE6qdwhI0lFYEgt4snjNoyvkTTu0U+D+2VcbeJ0g7jigTcAb8KiSCD
	U4B5Evlf/C/SPdhSz7EqLDOH/bhB0bGoFD0Ed45uQvnYk8yxRgWEUFfyp1Ms3S2Z
	oPlpp/aZVYuLaMwJk12XJeXcEPeMjIaSVrdn02eBEh1ifKYMg+IOC/XQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vh9ta05rp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 09 Jan 2024 17:51:08 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 409Hp73K032020
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 9 Jan 2024 17:51:07 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Tue, 9 Jan
 2024 09:51:06 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Cleanup QMI messaging functions
Date: Tue, 9 Jan 2024 09:51:02 -0800
Message-ID: <20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIaHnWUC/23MSw6CMBSF4a2QO7bmtoJWRu7DMIA+5CbSQiuNh
 nTvVsYO/5Ocb4NoApkIbbVBMIkieVeCHypQY+8ehpEuDQJFjRwbtkzE1NP0bp0ZIvKr0rWVgkN
 5zMFYeu/avSs9Unz58NnxxH/rfydxhsxeBin10OAZT7dlJUVOHZWfoMs5fwEL643VqAAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: FpIzD3PGQrvo8NqJ0xSwp665X4LN4-h5
X-Proofpoint-ORIG-GUID: FpIzD3PGQrvo8NqJ0xSwp665X4LN4-h5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 adultscore=0 mlxlogscore=279
 bulkscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015
 phishscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2401090144
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240109_095112_446326_1484F9B9 
X-CRM114-Status: UNSURE (   6.06  )
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

Correct some issues in the QMI messaging functions found during code
review.

---
Jeff Johnson (3):
      wifi: ath12k: Remove unnecessary struct qmi_txn initializers
      wifi: ath12k: Add missing qmi_txn_cancel() calls
      wifi: ath12k: Use initializers for QMI message buffers

 drivers/net/wireless/ath/ath12k/qmi.c | 63 +++++++++++++++--------------------
 1 file changed, 26 insertions(+), 37 deletions(-)
---
base-commit: e7ab40b733094dfc50dad58bbce81f544af1d8cc
change-id: 20240105-qmi-cleanup-00019cd4f821


