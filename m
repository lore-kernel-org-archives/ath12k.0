Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D80AC38147
	for <ath12k@archiver.kernel.org>; Sat, 16 Dec 2023 06:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rZK/Xcnjk3L8biv7FoNRD0CQnCUzAoYQp6lNN+mJEx0=; b=Eh1ZhItU5dgfPpwJgiYlli8B0x
	T/x8cKxNxxyoSCfW593YInv6uUe/8OjlV5ndIr9xcP/YAvYCPOAzvWljjgUeCe7RtE3EFlcWYIgMu
	c8/pIZpnoz8a0ruBjJQblnXZY9RR6eRaG08UpGOoRbE6pHO9TzNs/HCB35xCYfEaVTYZEMvs69q9j
	5+JsZ1DGuJtLLJMRTUCEO1l/AWoNGGf+tplY5FBLTwNfZKmjoSs6F2OVnFAqvDnWzSsMs7/6d3P5F
	LDwQnmO7vPiuoaYQpddOuH8e6Xw98ywYMiCZBAZOzC/DfLeLhGM0sTmA5up1bDbjjG29w5RL5XCRq
	72bzQcIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rENki-005X50-0b
	for ath12k@archiver.kernel.org;
	Sat, 16 Dec 2023 06:02:20 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rENke-005X2i-0i
	for ath12k@lists.infradead.org;
	Sat, 16 Dec 2023 06:02:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BG5xIB8032516;
	Sat, 16 Dec 2023 06:02:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding:content-type; s=qcppdkim1; bh=rZK/Xcn
	jk3L8biv7FoNRD0CQnCUzAoYQp6lNN+mJEx0=; b=b4oM5xMIfnPpIPW59pIX13R
	Kn4D0TCmP7jaTrD29NsZ0rNGug8QIxSIONun2s/uOt3Ky0OYECxng+otm3Kw3hgl
	ZSUem8EsKNiA1esghYfllMYZXjWmsF6ih6bue6OpT61nLYW/vuKH46IFPI/2xazp
	lNzWR92jC/5tqkgPv0CjaaHPzqp/OkRYcEQRa23SIbJx6KK+J4x7kCfvyecEWALy
	9IcS8mCEWzTkR7HUPda9R/IAaSTFqSeQzLoyi210o0Op26kV2BwMeRoo/KHMdN5s
	YuVIFklhhh8S1221Zaki0bGqWa5HFmJqvuKrmk1Bnwv7Ee1nJhRNhAY95bO8pPw=
	=
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3v152q833p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 06:02:11 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3BG62A5M029858
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sat, 16 Dec 2023 06:02:10 GMT
Received: from bqiang-SFF.lan (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Fri, 15 Dec
 2023 22:02:09 -0800
From: Baochen Qiang <quic_bqiang@quicinc.com>
To: <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
Subject: [PATCH 0/5] wifi: ath12k: support some new strings while searching board/regdb data in board-2.bin
Date: Sat, 16 Dec 2023 14:01:35 +0800
Message-ID: <20231216060140.30611-1-quic_bqiang@quicinc.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: mMxWL8-8kDm5zu8F_0idAb7YN2sqlcj9
X-Proofpoint-GUID: mMxWL8-8kDm5zu8F_0idAb7YN2sqlcj9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-09_01,2023-12-07_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 mlxscore=0 lowpriorityscore=0
 bulkscore=0 adultscore=0 clxscore=1015 malwarescore=0 mlxlogscore=688
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2311290000 definitions=main-2312160042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231215_220216_285534_F12E2DB6 
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

board-2.bin may be encoded with much detailed information such as
vendor ID, device ID, subsystem vendor ID and subsystem device ID
to distinguish different chips. So add support to do precise match
while searching board/regdb in it.

On the other hand board-2.bin may only contain general information
such as bus type etc, so add fallback method to avoid boot failure.

Baochen Qiang (1):
  wifi: ath12k: support default regdb while searching board-2.bin for
    WCN7850

Wen Gong (4):
  wifi: ath12k: add string type to search board data in board-2.bin for
    WCN7850
  wifi: ath12k: add fallback board name without variant while searching
    board-2.bin
  wifi: ath12k: remove unused ATH12K_BD_IE_BOARD_EXT
  wifi: ath12k: add support to search regdb data in board-2.bin for
    WCN7850

 drivers/net/wireless/ath/ath12k/core.c | 196 ++++++++++++++++++++-----
 drivers/net/wireless/ath/ath12k/core.h |  14 ++
 drivers/net/wireless/ath/ath12k/hw.h   |  20 ++-
 drivers/net/wireless/ath/ath12k/pci.c  |  10 ++
 drivers/net/wireless/ath/ath12k/qmi.c  |   3 +-
 5 files changed, 203 insertions(+), 40 deletions(-)


base-commit: fc91263c01cc01cccb5da15a82fa11b288e8f5cb
-- 
2.25.1


