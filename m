Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4A92E77179
	for <ath12k@archiver.kernel.org>; Fri,  6 Dec 2024 13:34:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Hn0HwqHrd9RV9F+5c/7IoZJrz3XpWrPTKPwWTUjAEjU=; b=c9VThpVEMMXXJkZRvKNFYLgwSX
	pdJv/lvJBhYEz6JeD20l9Od9bDo6BsAb67vCZkvfrAlaVQsfnggybksCFYr5Ay6FZy7RE2fXk/hat
	YIZp3V0muRRODrsYqE/1eV2DcWdx8e4HXPsc11Tl7i8wbnt5BqRTKRn8456/CtEHRuYvZVfxouTnV
	nKP7+/U8FtXNWgESI2Ovko2PJ9GePIhLbQoPTbjSzzvheoTRiGM2hHpjrgKKSzUDwjAlkls+dnDEE
	8zy6hj3pMV/KEihwmrnoWdyjrSPB/3CUOWcf0B6TkP8ulXjeYjIk5LPKYFIiCRrzJZWEFEqqooEok
	2PkXiguw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYTC-00000001jXQ-2Xxk
	for ath12k@archiver.kernel.org;
	Fri, 06 Dec 2024 13:34:10 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJYTA-00000001jWZ-3WIj
	for ath12k@lists.infradead.org;
	Fri, 06 Dec 2024 13:34:09 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B67Pj5N003703;
	Fri, 6 Dec 2024 13:34:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Hn0HwqHrd9RV9F+5c/7IoZ
	Jrz3XpWrPTKPwWTUjAEjU=; b=R+sW2Edv7GFpxHpoHmcRh3qeurHCo7pbrOmpE1
	AHHqKW92yQ5xF8IMQH0B+eWRDv4mXJYrlbCTLBhxScxwF4rrSkQDzL0iA6j2/Zc9
	euBdTyq7qeRnYciC6ee0JEwezIj2fhk/Kj1/BQ4VKtP96eisgg1GugxreF3AmI0o
	iaeQ9ZwHOCpy4wQ/MV+lA8/e9QTO4cap0l38l1W4hOOao5YbgO7/rsA4TFNXI+Br
	hMxiTriOREuOKvYDzf9Q/gilT5IzqwS++XRQ/H4d79BoaZan9oio8bQNmSVrMsSY
	uDVXc91zycPybmCa9xcTaETpkrR5LTouU8Tv3/Fw+xGUzN/A==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 43ba0km16p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 06 Dec 2024 13:34:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B6DY6tq022924
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 6 Dec 2024 13:34:06 GMT
Received: from lingbok.ap.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Fri, 6 Dec 2024 05:34:05 -0800
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH v3 0/3] wifi: ath12k: Support dump PDEV transmit and receive rate HTT stats
Date: Fri, 6 Dec 2024 21:33:52 +0800
Message-ID: <20241206133355.1990-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.45.2.windows.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dmM6KHtO4LwSzBJO8mmcC7JUeu-mJqb7
X-Proofpoint-GUID: dmM6KHtO4LwSzBJO8mmcC7JUeu-mJqb7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 suspectscore=0
 mlxscore=0 bulkscore=0 mlxlogscore=597 spamscore=0 malwarescore=0
 impostorscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412060102
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_053408_917799_50BF3673 
X-CRM114-Status: UNSURE (   5.35  )
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

Support to dump PDEV transmit rate stats through HTT debugfs stats type 9.
Support to dump PDEV receive rate stats through HTT debugfs stats type 10.
Support to dump additional PDEV receive rate stats through HTT debugfs stats type 30.

v3:
1.Rebase again to 48322e474f04

v2:
1.use TAB to be consistent with existing code

Lingbo Kong (3):
  wifi: ath12k: Dump PDEV transmit rate HTT stats
  wifi: ath12k: Dump PDEV receive rate HTT stats
  wifi: ath12k: Dump additional PDEV receive rate HTT stats

 .../wireless/ath/ath12k/debugfs_htt_stats.c   | 500 ++++++++++++++++++
 .../wireless/ath/ath12k/debugfs_htt_stats.h   | 182 +++++++
 2 files changed, 682 insertions(+)


base-commit: 48322e474f04f671dc4a57fa2063e9402ecdc51e
-- 
2.34.1


