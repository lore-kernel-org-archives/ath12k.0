Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1342C001E0
	for <ath12k@archiver.kernel.org>; Thu, 20 Jul 2023 02:52:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:CC
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=LQX+m8SbX8mKun6c+KfpNSC/pBdg7uOx2bMNMEmQrXY=; b=M4AEsBVOdzy4Jv
	xCajHq4EiMt10/b15cLta6OXX4Qge0cBqZ97l25BRzdNt9yVMCxkioggLMzBMlFYaXPgDkl0uN1Jh
	qfF78DNKpA7EpcEmmIIxORyvjtIttoQY8rXtyu6ntDBRr/q6trCj8M4OkZ3rAAFaB3Doq9j40yVUo
	2sMvMBdBVZhzEeQSCAWER1WPEfxhvSscMlCrf3dtW9y54kL/TBJ9vsc3WVkGE06HtR9DgWRzCGpJp
	yHM8vopI6k4/fC6+RwhKAUQtOqOFmqgC9+LZfnnaIqiBrUGAgKkE9I/7jT9ft+6mLSa0AmhtS5NBM
	sZO6Y2J3PrScyhveMq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJmi-009auo-1U
	for ath12k@archiver.kernel.org;
	Thu, 20 Jul 2023 02:52:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qMJmf-009asp-0P
	for ath12k@lists.infradead.org;
	Thu, 20 Jul 2023 02:52:54 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 36K0GJiD010106;
	Thu, 20 Jul 2023 02:52:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-transfer-encoding :
 content-type; s=qcppdkim1;
 bh=gOMwF+WkE1Ry0Q+u1W1672r5b4JrZGRM7pXj9vnUB8w=;
 b=WIW4tH9EZqdgW2h6F9tneYo3Ee7fmwO9amTnV3HloYJ5KCN59VnoECga0N26JP6KuYoW
 5SFjdIx0Uz+e2F3vfrLhgxPc7b2Djq0AOu4E7o/h/uo9p5ibxjIQnkwyU4KWP+DSW59z
 ehNAFLGU5OL6UCF2r7kDvQpLlh75/OckOf4ERYQYMF2OF+9n4V7eWuuaflgEqcabIEGV
 lcBYOmYX1gU8c+VuDIyYkVjx8iHpw9M2SiHhzP8xSI+nal8ID0G9ukVj/15PKXEC8vGP
 2DLj0lVqHzfbDTy3dFRQwETWZ3tD21UDmdxR+SPNcBG8lAV2ncBvFcV7v+oDYLLHPtb7 KA== 
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3rxpyqrg0h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 02:52:48 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 36K2qlhM002952
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jul 2023 02:52:47 GMT
Received: from wgong-HP3-Z230-SFF-Workstation.qca.qualcomm.com (10.80.80.8) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1118.30; Wed, 19 Jul 2023 19:52:46 -0700
From: Wen Gong <quic_wgong@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, <quic_wgong@quicinc.com>
Subject: [PATCH 0/3] wifi: ath12k: add support device recovery for WCN7850
Date: Wed, 19 Jul 2023 22:52:29 -0400
Message-ID: <20230720025232.7701-1-quic_wgong@quicinc.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: sTwnNf-U8cflEkStaQzrR0EXbZDk05r7
X-Proofpoint-ORIG-GUID: sTwnNf-U8cflEkStaQzrR0EXbZDk05r7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-07-19_16,2023-07-19_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=629 malwarescore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 mlxscore=0 bulkscore=0 spamscore=0 priorityscore=1501
 suspectscore=0 adultscore=0 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.12.0-2306200000 definitions=main-2307200020
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230719_195253_330904_BC010DCE 
X-CRM114-Status: GOOD (  12.63  )
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

Add support for device recovery, e.g. firmware crashed.

depends on MHI patch which has applied to mhi-next:
[PATCH v4] bus: mhi: host: Skip MHI reset if device is in RDDM
https://lore.kernel.org/all/1684390959-17836-1-git-send-email-quic_qianyu@quicinc.com/

Wen Gong (3):
  wifi: ath12k: configure RDDM size to mhi for device recovery
  wifi: ath12k: add ath12k_qmi_free_resource() for recovery
  wifi: ath12k: fix invalid m3 buffer address

 drivers/net/wireless/ath/ath12k/core.c | 1 +
 drivers/net/wireless/ath/ath12k/hw.c   | 3 +++
 drivers/net/wireless/ath/ath12k/hw.h   | 1 +
 drivers/net/wireless/ath/ath12k/mhi.c  | 1 +
 drivers/net/wireless/ath/ath12k/qmi.c  | 7 +++++++
 drivers/net/wireless/ath/ath12k/qmi.h  | 1 +
 6 files changed, 14 insertions(+)


base-commit: b21fe5be53eb873c02e7479372726c8aeed171e3
-- 
2.40.1


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
