Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A608C52D7B
	for <ath12k@archiver.kernel.org>; Wed, 14 Aug 2024 10:34:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=urEOtMyYCJIrniggQnSAI0GhBA/ck8b0APD6KK0PlBs=; b=IuzaqfhAs4WU3Y+lyxL+FAsYEP
	nQNHbrvDi4eg5gW5cfFqF5ELaLRR6WPIuekZZ6KAPpi4hpFM9+nXY/GnLSlZGO225i+MLfbFlx1Fj
	zbeXZd1bgGkRZFbNckBO7VjkOQcu2FQabYmveqgC6J9biod4pDW5fJ6RrUzZ7ydKwpHysForlddXZ
	BC2xvhabzHfp+DNwHxm2Anl366D1WLPEkzhCzDFJbguuaBoUlgdkusv/xTihho5hWUIsRlrP0kvO8
	Ud4Y1Lbr82frP0k5CrnTljJeRseOLcdUUD6wSDSggkcKeGklX0HJH4OWNhav8w06Tq4JghL9WuIMn
	GJEFszbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBL2-00000006cdR-36Bz
	for ath12k@archiver.kernel.org;
	Wed, 14 Aug 2024 10:34:44 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seBKz-00000006cck-384N
	for ath12k@lists.infradead.org;
	Wed, 14 Aug 2024 10:34:42 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47E2i6wc021543;
	Wed, 14 Aug 2024 10:34:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=urEOtMyYCJIrniggQnSAI0
	GhBA/ck8b0APD6KK0PlBs=; b=GpTkEf+VjcxNFQH74YedcO1A50ZuyDbNQhbc2C
	BZRHYfK0dgrS2nd4HbOZPkahwevfwY82CKPtMJ6CHzzh/9YFj0CWnFVrNSf3OX7L
	k1+geqhvGr8Vfuc1DcnLNLVq9Ge3Tnjy9HpQeJ587qYacKfrWfVpF/7qoyG9ICc+
	sil2CX/pf5aNt9oZ/Loc4Rs1Pk8qNY7SV2xIZpwlcEoiNVYNo8MuB320BsRdQg3p
	d82BQh+w7UMMMToI0T5ngmdW6khlzp2aAsGiX6EyO4mrbgdHHXmqMlrKw8JeGnZa
	wOhIDbEDr2K5D/LNBhZq8YmnoL9uFHFWKXo6BEBDvvCmy9cA==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 410m291415-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:34:40 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47EAYdWh002518
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 14 Aug 2024 10:34:40 GMT
Received: from hu-periyasa-blr.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 14 Aug 2024 03:34:38 -0700
From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: Add multi radio iface combination support
Date: Wed, 14 Aug 2024 16:04:20 +0530
Message-ID: <20240814103423.3980958-1-quic_periyasa@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: GARY9vHkOgO1XePeyC38oo8nChcgsEox
X-Proofpoint-ORIG-GUID: GARY9vHkOgO1XePeyC38oo8nChcgsEox
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-14_08,2024-08-13_02,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 mlxscore=0 bulkscore=0 adultscore=0
 impostorscore=0 phishscore=0 malwarescore=0 mlxlogscore=487
 lowpriorityscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408140073
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240814_033441_807993_04B975A6 
X-CRM114-Status: UNSURE (   7.15  )
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

Refactor the interface combination procedure and add support to advertise
multi-radio interface combinations when multiple radios are combined to
achieve Multi-Link Operation (MLO).

Karthikeyan Periyasamy (3):
  wifi: ath12k: Introduce iface combination cleanup helper
  wifi: ath12k: Refactor radio freq low and high information
  wifi: ath12k: Advertise multi device iface combination

 drivers/net/wireless/ath/ath12k/core.h |   3 +-
 drivers/net/wireless/ath/ath12k/mac.c  | 225 ++++++++++++++++++++-----
 2 files changed, 185 insertions(+), 43 deletions(-)


base-commit: 1462e8e1c93ecb96b5820ec28f7cbbb8a5aeb732
-- 
2.34.1


