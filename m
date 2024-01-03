Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF075C3DA6E
	for <ath12k@archiver.kernel.org>; Wed,  3 Jan 2024 05:10:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OlhOUdLq+cGfppRS6u0LovKMuQ4HaUfJARI1h41+tq4=; b=ys2BVY7OnrrHESffPdK/xZxPu0
	aGLReaYgyLRRKZR4kQIMsuixBQnN0bD1Kyh7gwK5cXEl8P/P99fzXiIBVrFWjk5ZrKg96lv9oPWyW
	H/twaslMdWVodz7gG8WVOcQMU/EIGRSM87rpbW4XmzAied7gyazKLWbSBOUWB3t+utoRbw7ttccUs
	l+lnBRrTZNlRGO5FqAerte5T4Eytk6DByStBf/iXkGi6CArDvxBI6VBXYjrWeJVnM4oC2+d9s8dCG
	BXzuSky7ssQIKEnWF73Xhi9rgio+F6wJ+al2UfUEHCOT3wNRtu5uNhM/ua+qnIQ2JP5N00YwncbRH
	mBjXUPsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rKtWU-009ndA-1R
	for ath12k@archiver.kernel.org;
	Wed, 03 Jan 2024 05:10:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rKtWP-009nb2-1Z
	for ath12k@lists.infradead.org;
	Wed, 03 Jan 2024 05:10:33 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 4032oFfo013290;
	Wed, 3 Jan 2024 05:10:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=OlhOUdL
	q+cGfppRS6u0LovKMuQ4HaUfJARI1h41+tq4=; b=jyRn2kd8n5JYRQ/cvSYS+53
	NLk4A3yePzU8rfVCbGzFbyubSGi+NFkFoNQiXUUlBXo7495RkjOzedvACVJTXuIt
	d3YivuGM9UxiJiI9Dp3ftSTJmmpUdsT+zD9r3hhSXEvY+m4eEQDN3UelVayOUIoD
	XMtlKfnzqDCwJWRRbhIWlm/UA4eqN0RVvc0tRO/IDQEJIhYESSu1xSbRC7JFL6zt
	+P0zlFNNY3FYWjhzFEgs9JlphTlUqTD+tH3Rbb4cPgj6xQeQlz7rbq6gadAec7e6
	/H5gIGe2jIQfPh/nGNBBAE/HMXPRAh+CtnnuVzA6zrEBiJNBFfeS3NUYhHq5qDQ=
	=
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vc9nn2q7b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 03 Jan 2024 05:10:27 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 4035AQmI003078
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 3 Jan 2024 05:10:26 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.40; Tue, 2 Jan 2024 21:10:25 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 0/2] wifi: ath12k: add processing for TWT enable/disable event
Date: Wed, 3 Jan 2024 00:09:24 -0500
Message-ID: <20240103050926.14115-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: KTtGUJNMcwqnWG7Nxz3lSix8aJyeSJJO
X-Proofpoint-ORIG-GUID: KTtGUJNMcwqnWG7Nxz3lSix8aJyeSJJO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 impostorscore=0
 priorityscore=1501 mlxlogscore=394 phishscore=0 mlxscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2311290000
 definitions=main-2401030040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240102_211029_657866_57E2D218 
X-CRM114-Status: UNSURE (   8.38  )
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

From: Wen Gong <quic_wgong@quicinc.com>

This patch set is used for processing TWT enable/disable event. It can be
more convenient to debug TWT.

The patches work with WCN7850 and QCN9274.

Lingbo Kong (2):
  wifi: ath12k: add processing for TWT enable event
  wifi: ath12k: add processing for TWT disable event

 drivers/net/wireless/ath/ath12k/wmi.c | 72 +++++++++++++++++++++++++--
 drivers/net/wireless/ath/ath12k/wmi.h | 12 ++++-
 2 files changed, 80 insertions(+), 4 deletions(-)


base-commit: 2cd4e3f91f264926a6b11df948417b74d52ca9b9
-- 
2.34.1


