Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 518D8D132DE
	for <ath12k@archiver.kernel.org>; Mon,  4 Nov 2024 15:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kPI0iAdhtoOom6RjX2x9CdraLwySyEOx+cns+4xR+hA=; b=XNUvBcLaIl/Uzlvgm4lPCQHMGR
	2fgaz0Wq70rFOdVY8bNFEwLxHv/vqK7ehRexJiG3CXWxUHjPME0c/8w7rcfzzXUSXLa8/iQrTtMR0
	oUP0Gk8G8ab16ajiSctpn8P3eU1oSR+H/HumB8hIl39PWHXbLvyljSc4osEpp/EKmINA6CfobNHGF
	cR+BGW21pnjuJcRJFzq8L99yAIEiRPDjH+tKsA0GMdFhmB2TjqS4fjY7etPx6xP+AUnRtAqIedTUK
	3+8w4w6MpLv5tkmQnFhHLOuhQGYydfAndLaKxZNiHHYbGD14rK73tmvRM238dV27kQOILxzl8t0h8
	qo+XKyXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zFj-0000000EFSw-0DjJ
	for ath12k@archiver.kernel.org;
	Mon, 04 Nov 2024 15:44:27 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7zEU-0000000EF8f-13CO
	for ath12k@lists.infradead.org;
	Mon, 04 Nov 2024 15:43:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4BRFHk003006;
	Mon, 4 Nov 2024 15:43:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kPI0iAdhtoOom6RjX2x9CdraLwySyEOx+cns+4xR+hA=; b=oGx/DLS6HGZr3uL0
	N0E/OCxkt0sKe4k3TkvDGv0hqoXwPxMgfjnvC2rg8YRkA5ww20sbxl+KQ1sLqeA0
	p7YaKiXPsN7VT++aqM3vPKUP6ZvtunLt4EHleXIBoX0UV2WNBJIIaqW/3j33o2nM
	bAjK6e/65eAMuK0DHhJfb50UNbDJui3gXx4/V3J+0AaSby4b3xUNpc1AUk19lIDB
	xnGEpQVgx1a/p9AOBKtOTxaQ/wDhgP2aJehs25vPK4CRi1mc9jWDVMda6dmKiGZn
	YfsMk4iAHNi4nSfUj+8QGYbksMUZchqCBlZ1PYXs2aBcMdathc3tDyqxIAWBQ5Pf
	BNIYeQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd4umq3v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 04 Nov 2024 15:43:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A4Fh4O8023584
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 4 Nov 2024 15:43:04 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 07:43:03 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241101151705.165987-1-kvalo@kernel.org>
References: <20241101151705.165987-1-kvalo@kernel.org>
Subject: Re: [PATCH v2 0/8] wifi: ath12k: MLO support part 2
Message-ID: <173073498389.2435998.13463784355335607514.b4-ty@quicinc.com>
Date: Mon, 4 Nov 2024 07:43:03 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: cuG3X7FG-MFoWOEBHKJ5iM1QgutZprgW
X-Proofpoint-ORIG-GUID: cuG3X7FG-MFoWOEBHKJ5iM1QgutZprgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 bulkscore=0 phishscore=0 priorityscore=1501
 mlxlogscore=665 impostorscore=0 suspectscore=0 spamscore=0 mlxscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411040135
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_074310_440010_0EF5FB3A 
X-CRM114-Status: UNSURE (   7.75  )
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


On Fri, 1 Nov 2024 17:16:57 +0200, Kalle Valo wrote:
> Here we continue to refactor mac.c to support multiple links and extend peer
> assoc WMI command to support MLO.
> 
> Please review.
> 
> v2:
> 
> [...]

Applied, thanks!

[1/8] wifi: ath12k: ath12k_mac_vdev_create(): use goto for error handling
      commit: 09b99c10ddcb4ce6ea8410057ce99e5ab8e21f84
[2/8] wifi: ath12k: MLO vdev bringup changes
      commit: 60dcd3ce43104d774962c63cd21e93853449f2b0
[3/8] wifi: ath12k: Refactor sta state machine
      commit: edecb91a4f808ae48885e69479aa1b8e0d8e23e0
[4/8] wifi: ath12k: introduce ath12k_hw_warn()
      commit: 0b532c7a3d7f6dfb44796df12afa0823338453dc
[5/8] wifi: ath12k: Add helpers for multi link peer creation and deletion
      commit: 2496a67fee5a1d08fa1dd193057ae16d35e656da
[6/8] wifi: ath12k: add multi-link flag in peer create command
      commit: 9ef82da375f8991a6006a36e4b00f87adbffb67e
[7/8] wifi: ath12k: add helper to find multi-link station
      commit: 08a171207b407c5c8e187ab0dd137cbb0394294c
[8/8] wifi: ath12k: Add MLO peer assoc command support
      commit: c33f9c2728d0ccc7472e6239346c0fb3de556e0f

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


