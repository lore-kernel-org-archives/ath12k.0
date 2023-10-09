Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44E49E95A91
	for <ath12k@archiver.kernel.org>; Mon,  9 Oct 2023 09:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=aU9BN0gyZD7kq2VFI6EXao2n7CjeYlOJRY3O5h9DmiY=; b=BsiGWdbKnS3Dve
	f1cp0m03h3g8NbzUjrUfgvHpiTbeSQgAeedyfjGNsj+Chvr2gkmzRKzCpjQBwzY8ne73kVGH02teS
	N5RnVhN/OM7Ic3asZK3JkoGRnCb1D23w4fajVlod6EByZoFUF3XD3ZciCJS+qj776UBN3K0CBawOv
	XSGiVJBemyhxT2idp/f+dtpe1bD2LU6tORUqS2hHssY/w0FeVBTm42w6DAPwzrehbH1fRGfMNknHf
	BrQ38ZuOeFg3MuYqY+sxSA1+qc7Pgl7meWvw+ok31qiU149n1r8HHm445Yg9Vbs19Jw6QaT0T+MNR
	LqP9xVBjzRWRP/fXkatw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm9Y-00A2bh-2q
	for ath12k@archiver.kernel.org;
	Mon, 09 Oct 2023 09:02:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qpm9V-00A2aY-2y
	for ath12k@lists.infradead.org;
	Mon, 09 Oct 2023 09:02:15 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39984cIj023634;
	Mon, 9 Oct 2023 09:02:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=9twVUG2SrWS+ncc3m23Jbox6Lmt2JfGJv63ykKkk5s0=;
 b=DP3HlTgB7aLBFrBd/DKdAiZhhkQrlgBVANicGRDQmlR6CwmCg4KGAN+3hlYCloSCBuDa
 jwRJzSnZs0u1+1dI5wuQcoR7xiOa7qCmIPtbjH+i5tN2OWWpsjkI44yQtjVW2BiKfK9l
 HnJFV71AKMHXgM4h1Pf/4gYU5wzV+o5LPuknM19smeYN1/CS0aPRClrtw1ObxbJAtGOO
 tXR39bZF3mrtJ2+tN/ERZIZ5+77v0ItbXausMxVvURSNqbRq53e1cIC3GcV/nlYB4m88
 5xpX8YqTqnnOg+bGcxerYlzoH9WJN8IsnsY4t3SO7aYd5N/4qmhRrCiAPlJp+CwzsERg Dg== 
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3tkh4t9xr2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 09 Oct 2023 09:02:07 +0000
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 399926ws010343
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 9 Oct 2023 09:02:06 GMT
Received: from lingbok-Latitude-E5440.qca.qualcomm.com (10.80.80.8) by
 nalasex01b.na.qualcomm.com (10.47.209.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.36; Mon, 9 Oct 2023 02:02:04 -0700
From: Lingbo Kong <quic_lingbok@quicinc.com>
To: <ath12k@lists.infradead.org>, <kvalo@kernel.org>,
        <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>, <quic_lingbok@quicinc.com>
Subject: [PATCH v5 0/4] wifi: ath12k: implement some functionalities through reading ACPI Table
Date: Mon, 9 Oct 2023 05:01:45 -0400
Message-ID: <20231009090149.247211-1-quic_lingbok@quicinc.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: x4nM5OH-duSCYfeOUnQu-16a3vYfWrSx
X-Proofpoint-ORIG-GUID: x4nM5OH-duSCYfeOUnQu-16a3vYfWrSx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-09_07,2023-10-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=586
 priorityscore=1501 lowpriorityscore=0 phishscore=0 clxscore=1011
 spamscore=0 impostorscore=0 bulkscore=0 malwarescore=0 adultscore=0
 suspectscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2309180000 definitions=main-2310090075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231009_020214_097502_6930C69B 
X-CRM114-Status: GOOD (  13.41  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

v5:
1.rebase to the latest tag

v4:
1.revise commit log using imperative voice
2.delete guid_is_null()

v3:
1.remove unnecessary cpu_to_le32()
2.adjust the order of the macros
3.apply jeff's advice

v2:
1.put <linux/acpi.h> in the include guard

Lingbo Kong (4):
  wifi: ath12k: add TAS capability for WCN7850
  wifi: ath12k: add BIOS SAR capability for WCN7850
  wifi: ath12k: add adjust configuration of CCA threshold value for
    WCN7850
  wifi: ath12k: add set band edge channel power for WCN7850

 drivers/net/wireless/ath/ath12k/Makefile |   3 +-
 drivers/net/wireless/ath/ath12k/acpi.c   | 365 +++++++++++++++++++++++
 drivers/net/wireless/ath/ath12k/acpi.h   |  60 ++++
 drivers/net/wireless/ath/ath12k/core.c   |   6 +
 drivers/net/wireless/ath/ath12k/core.h   |  13 +
 drivers/net/wireless/ath/ath12k/hw.c     |  10 +
 drivers/net/wireless/ath/ath12k/hw.h     |   4 +-
 drivers/net/wireless/ath/ath12k/pci.c    |   6 +
 drivers/net/wireless/ath/ath12k/wmi.c    | 252 ++++++++++++++++
 drivers/net/wireless/ath/ath12k/wmi.h    |  47 ++-
 10 files changed, 763 insertions(+), 3 deletions(-)
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.c
 create mode 100644 drivers/net/wireless/ath/ath12k/acpi.h


base-commit: 3b961e3a412d9d4b70418f53d07847af0a7ea376
-- 
2.34.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
