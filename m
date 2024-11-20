Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9713AD711BB
	for <ath12k@archiver.kernel.org>; Wed, 20 Nov 2024 15:45:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4I9IAPmHbPMdgV0FRhO6QubwegIcwZ54FzVt8fiZ134=; b=IJqJZxV48pW0CEq7oZT4yJzfIC
	8WWfwHvZg52XN2xHax7hje6rHpQy6wH7nrdwuRplZ8onA5iwDPAlh78YG53XRQcS/iW/TWlAPGD0/
	FuS3SeM2mn4nwM4/oils48EOY41Fd2w4/kJUzXiAkh/IjXVnuczGtRQfo9pxbxwQ3FoN0ypQEw48r
	SXoZoJq393ASTEx8GqRxKJvn+1mXAnzEgbIWokgddaw4nHTCqjLMzvWeLH0RPW82jET593s94YJz4
	08LbbLFsjqGPEudi2ajR8yllMtpdPDA9J9LaAB+NhijjK1y9sygOOOLOsg6w6d/Lbwdf+t8N03xcK
	nyM2rRXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmtl-0000000Fijt-1XbY
	for ath12k@archiver.kernel.org;
	Wed, 20 Nov 2024 15:45:45 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDmth-0000000Fiih-1HFW
	for ath12k@lists.infradead.org;
	Wed, 20 Nov 2024 15:45:42 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AK9GWCA025955;
	Wed, 20 Nov 2024 15:45:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4I9IAPmHbPMdgV0FRhO6QubwegIcwZ54FzVt8fiZ134=; b=ioFmYfDp7LiMfhVE
	NoCmJt2GLeYdtlEhfHpeUSrK+yfuOAC9U1ryw5dRTR2n/XIDfUZSSPsWgGB4R1qi
	oK1p4lg1UrdAHfacrwDpOM9TyMoH253aaTVNKVsxZ9A+57SJAx/Cc1VLd6F5W5Cw
	sqS996qixXKWbtC2l6auNKOP+6BOiGDCn6D2mpp3kWrv2GEnO3OeMHWg6v2/M7yC
	xna3XgCPLzW6p4kQ5yVHHOIcpfenuXi1iqpFZ3Blu2WD+XXFkt/2pNgLf4/YZ8aG
	rlA1PGw95pk8AcVzmu0Qxl/2fLmWsOQjFXxSiccC2Cqc5GMoMeZvKEgSH3J3PE+4
	mODNRA==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 431byjh6tr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:45:39 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AKFjckx015825
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Nov 2024 15:45:38 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 20 Nov
 2024 07:45:38 -0800
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
References: <20241115062854.1919672-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v6 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
Message-ID: <173211753819.1671164.11446246438526962981.b4-ty@quicinc.com>
Date: Wed, 20 Nov 2024 07:45:38 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: b9p2iL4oStbprYruGPHX5kXisgr9ju2T
X-Proofpoint-ORIG-GUID: b9p2iL4oStbprYruGPHX5kXisgr9ju2T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 mlxlogscore=963
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411200106
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241120_074541_462488_2FC7E1F4 
X-CRM114-Status: UNSURE (   7.46  )
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


On Fri, 15 Nov 2024 11:58:50 +0530, Roopni Devanathan wrote:
> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
> These stat types give downlink pager stats, counter and TPC stats, SoC
> common stats and Transmit PER rate stats, respectively.
> 
> v6:
>  - Removed unused variables.
>  - Used le32_get_bits() instead of u32_get_bits().
> v5:
>  - Addressed Kalle's comments pertaining to variable declaration order.
> v4:
>  - Addressed Jeff's comments pertaining to data type conversions.
> v3:
>  - Added macros to fix compilation issues.
> v2:
>  - Removed dependencies. No change in code.
> 
> [...]

Applied, thanks!

[1/4] wifi: ath12k: Support Downlink Pager Stats
      commit: a93d125ebfdd530ea1980a45b7ad2e9471b82c87
[2/4] wifi: ath12k: Support phy counter and TPC stats
      commit: c3527cdfcdf70dcd613c4582283e28e4f81df9ea
[3/4] wifi: ath12k: Support SoC Common Stats
      commit: 3a660e7fa44d556f41cbef6d2430f7227ef3f3ef
[4/4] wifi: ath12k: Support Transmit PER Rate Stats
      commit: c8f314703bcbade1bcef8dfee9ffc6a1d66b9d8f

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


