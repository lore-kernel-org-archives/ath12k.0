Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8805DD2A52C
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 15:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SH3bBZN/9oAcprWisJXMyVK4cNqUwM2Chc4nWaqNOdg=; b=y0lERbd6GGurkjZNzQcM9sWRgH
	+PGAdJmzDEaY5u0rIpN04mwBi9wNiwDzhmiaSekpTpWugqNXVqj3Fl/lt5KFmogRJKdxfYq2s5j3E
	afGQ6xtlxnSOD9oQ0Pqp0SdZbWzeJdkkD28z2TKJJ30jf91qUIqw1g+3Te+O1xz9F90LYreVbdCFA
	+Y+EYEexhXLIlIKY7/AA8kYDfQ8P896A6vl02cZleZa8O6edraRRiWESyrX0Mj8sbAMkWFcAs8Zj3
	Ag9rqLkLJslm/RJLQn2zg19JARbmipqftlttqEmGJRUId0YFhgIWc8MFhhjw70MbSJRI5pJbKHUdS
	ZbeVer+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t16AN-0000000CHsj-1AN5
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 15:42:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t167E-0000000CHMu-1dyi
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 15:39:13 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49G8Q2Kx002600;
	Wed, 16 Oct 2024 15:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SH3bBZN/9oAcprWisJXMyVK4cNqUwM2Chc4nWaqNOdg=; b=DjnbrJVxbWfFmIup
	6GyB+gUk6RhaUwdRpgNRGAOL3hNh0TLUf+0J55ASWTMnYpFmXKs9GuYdmXt4rJNP
	zEvOtuJOb4tlNxYSQLV7bUZvV9dUI3O+R+j4D0Wo6VIIscYvEcqdAfdpic8gX5Ht
	6LIR+tMhIvqGGa/oq5m4FxrDk5GGn621lQBmoe2pglcWV7dfPcB+l5mB/0fcCdur
	tzj8F7tMTcnmQrsj2wC93opJw5NwvrjlXv49Aa25/5eQI6BckD/9ruYcqF2SbzD4
	lJbvb34YeUq7Arz3epE1wSQ6kZGLolzSdAEgCnFwe1cmsGdxYb86sx3BNYINPtb9
	geAIGQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42a5xyj3xk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:39:09 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49GFd9RE026363
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 16 Oct 2024 15:39:09 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 16 Oct
 2024 08:39:09 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241015171416.518022-1-kvalo@kernel.org>
References: <20241015171416.518022-1-kvalo@kernel.org>
Subject: Re: [PATCH 00/11] wifi: ath12k: MLO support part 1
Message-ID: <172909314915.475660.17863446001052139312.b4-ty@quicinc.com>
Date: Wed, 16 Oct 2024 08:39:09 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01a.na.qualcomm.com (10.47.209.196) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: EFus7yCFiMeXKnuINh4DNRYISoMXJAXA
X-Proofpoint-ORIG-GUID: EFus7yCFiMeXKnuINh4DNRYISoMXJAXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 mlxlogscore=426 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410160098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241016_083912_470385_2807F967 
X-CRM114-Status: UNSURE (   7.95  )
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


On Tue, 15 Oct 2024 20:14:05 +0300, Kalle Valo wrote:
> From: Kalle Valo <quic_kvalo@quicinc.com>
> 
> I'll start submitting patches for adding MLO support to ath12k. There will be
> several patchsets and this is the first one (of many).
> 
> In this patchset we start refactoring code in mac.c to support multiple links.
> 
> [...]

Applied, thanks!

[01/11] wifi: ath12k: prepare vif data structure for MLO handling
        commit: 3dd2c68f206ef7020d12b9f85cbfe05ca8662cf4
[02/11] wifi: ath12k: pass ath12k_link_vif instead of vif/ahvif
        commit: 005fe43b93dedb621a0827408051f3a51d7a0769
[03/11] wifi: ath12k: prepare sta data structure for MLO handling
        commit: b89b5dbea65294e660f26e90d51ec786a7fdccb9
[04/11] wifi: ath12k: prepare vif config caching for MLO
        commit: 84c59710829411d4ad344cc6cd8a0fb2d9faa104
[05/11] wifi: ath12k: modify ath12k_mac_vif_chan() for MLO
        commit: abaadb934b30ec86065e9c8a23843d7bb8be0064
[06/11] wifi: ath12k: modify ath12k_get_arvif_iter() for MLO
        commit: 94a2712f0b152739d1f506977fc38be0da37610f
[07/11] wifi: ath12k: modify ath12k_mac_op_bss_info_changed() for MLO
        commit: afbab6e4e88da68cca94cabfc1604d71db161d42
[08/11] wifi: ath12k: modify ath12k_mac_op_set_key() for MLO
        commit: 25e18b9d6b4bfd9cb3dd32e7b081eef306cd2517
[09/11] wifi: ath12k: update ath12k_mac_op_conf_tx() for MLO
        commit: af41f908c9e4d3358b5753648e669114d9109004
[10/11] wifi: ath12k: update ath12k_mac_op_update_vif_offload() for MLO
        commit: f4adb07e0a524a35b34397ad08d0199cfe2c450f
[11/11] wifi: ath12k: modify link arvif creation and removal for MLO
        commit: 477cabfdb776b571fab425813c074f30c02a5cf6

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


