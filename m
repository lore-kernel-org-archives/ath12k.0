Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C16A3C47DA2
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 18:05:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-ID:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=M5IsFLVWoaIOBfbWdK4konAtXheWq+0SyN45h3LMVcg=; b=codwpqGlfhTyvN
	ea395S9F+tzvG0IT4nXVdXMe/aJMsKDZpyhKwZys3Ji8wMe2qqf4S3GusW3MTxZ00pDMCnUwNyzaO
	g/MtalUIcXIujuFXmdRxFT8RhFU1cEGrtyO8uCkQZKeALQeowsW6f8W494NM3ut9Qc3+LZqB7LelL
	cVBPD5/fSisolvPFbkgiCElYzCJBOduR7SIaykKa2O23AMLDKIGQHtr51kawVXM1lGaZDZl5DdVAq
	gLSHg8i7H8fuC6ydBmhfocY8skJbYhvuUo0wL4zyMaFVEuslcOI0uYrmoGjccX/9ROh6klwn7q0qS
	8h+HS5yYlb90J9sExvdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzR9-000mxX-1S
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 18:05:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNzR4-000mwI-2l
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 18:05:50 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 40BDBViZ029340;
	Thu, 11 Jan 2024 18:05:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:subject:date:message-id:mime-version:content-type
	:content-transfer-encoding:to:cc; s=qcppdkim1; bh=M5IsFLVWoaIOBf
	bWdK4konAtXheWq+0SyN45h3LMVcg=; b=fLoQ5pKtlBUZKib6qJ+A6DBzvj0Se/
	LWyiBz5+OHceNhzCXx4okXSEWtKJJ0rb7zTOf+2AyrVJvJG3AmaE6D51hiM4BOv2
	VIHwhrTbw2VIFt4KlA+uLzhKdqC8tOW2uf1QpVdQDAHCAv0FgOXtl91f25HBZh2a
	wAwrlhIDL74qtL83rc2OAQboPqCwZMiowweqT020wJfshY8lnfHKUAg9XAKiStlK
	eFDhhUcH19KIjY41ZuoXPsdryyg5CDjZorkK2OUcykEIQpIjXh/0ImJ/hBwqbbn5
	DWegDMGtmewmL29PT0La7vKGTSICBj5h5ZF05z/2okdNIBw73RkbdhGw==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3vj6c8j64j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 18:05:42 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 40BI5gOR003813
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 11 Jan 2024 18:05:42 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Thu, 11 Jan
 2024 10:05:41 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
Subject: [PATCH v2 0/3] wifi: ath12k: Cleanup QMI messaging functions
Date: Thu, 11 Jan 2024 10:05:29 -0800
Message-ID: <20240111-qmi-cleanup-v2-0-53343af953d5@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOktoGUC/22M0Q6CIBRAf8XxHO1CgthT/9F8UIS8W6JCuprj3
 0PXS6vHc7ZzVhKMRxPIOVuJNwsGHFwCfsiI7mp3MxTbxIQDz4GBoFOPVN9N7eaRAgArdZtbxRl
 JxeiNxed+u1aJOwyPwb/2+cI2+/+zMArUFo1SbSNAwukyzajR6aMe+m38qcrfSkLRMFBCCSm/q
 irG+AaDG/8S3gAAAA==
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
X-Mailer: b4 0.12.3
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: CAmqVnNDzDkrVCYTJsOsl46omAaFBruC
X-Proofpoint-GUID: CAmqVnNDzDkrVCYTJsOsl46omAaFBruC
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_02,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=269 adultscore=0 malwarescore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2311290000 definitions=main-2401110142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_100546_894784_4F3731D0 
X-CRM114-Status: UNSURE (   7.80  )
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
Changes in v2:
- Fixed rookie mistake -- added S-O-B to all patches
- Link to v1: https://lore.kernel.org/r/20240109-qmi-cleanup-v1-0-607b10858566@quicinc.com

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


