Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A6ED0D79F
	for <ath12k@archiver.kernel.org>; Fri, 11 Oct 2024 14:44:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-ID:Subject:References:In-Reply-To:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zcazVMZ8OwB4kJ2Zj2Fmagt/F4yGLV2Qz/rwCahr/wU=; b=LkwU2ifMu23i2EbqibtX52Shms
	xI0KW9570ACaISXt9Vx1kj5S9NikAgqt+de2LG7pJFuuTMOhPdOLstTkXOrzximsbQeRK6/oE7IBC
	rb8uyEjSOx6ngAVwV1ncrTsGLwZkSjKbHh5Cnj+5yGmasgjp3oPY6sgPP93iuD60P+Nvtg+lmRTtO
	R/kGkSSW26+6/x7PIArioBG0gc1OKvxkZGmU3KT15XgEl4ODkPtBWpFFgsbbUNOp/YJSC0s2YWHrH
	tsl/r3ip1sRYh+3/FLFWjbk3x4l6rz4tw2e3a/08IaBlN/VOEfnn/ywMMEszT432WHtLQEmnQWZuF
	/+iP+M6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1szGsy-0000000GfR0-3RjT
	for ath12k@archiver.kernel.org;
	Fri, 11 Oct 2024 14:44:56 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1szGno-0000000GdSZ-1E1a
	for ath12k@lists.infradead.org;
	Fri, 11 Oct 2024 14:39:37 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 49B6oUtY023952;
	Fri, 11 Oct 2024 14:39:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zcazVMZ8OwB4kJ2Zj2Fmagt/F4yGLV2Qz/rwCahr/wU=; b=dA6mUYDjlj9LWmkw
	pn4HbAO2XPWvznGssPf62DsyH6riQhCkMPOhjhgse0NjYb6Y3qshAoP6z32ALlCz
	IU5Gq/10k/ewfVdX4eW8LdNRMj9pn+M3gddpRPCm23kHFLdInHR/ZhQR7YAiI6KR
	g/vMq9i6S87R4CdU6j636Qdssw69jkm0mkVqXts71CfzSN9Z4TWCQ1ccBagNASSF
	J1hXplvmOvSzysfCUBgZWQNw6EgG7gv+s+fG91d8BIYxYlmmRGPcQpYNZKW/Zq5L
	Cg3El+MIaLQapSPxgNI0ys9jwNPTEVGqMzRmAn9Xk2iZUOKwBfJkzkx1m/oAwRWd
	sC2gjg==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 426y3vsd00-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:35 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 49BEdY1H015880
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 11 Oct 2024 14:39:34 GMT
Received: from [169.254.0.1] (10.49.16.6) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 11 Oct
 2024 07:39:33 -0700
From: Jeff Johnson <quic_jjohnson@quicinc.com>
To: <ath12k@lists.infradead.org>,
        Roopni Devanathan
	<quic_rdevanat@quicinc.com>
CC: <linux-wireless@vger.kernel.org>,
        Dinesh Karthikeyan
	<quic_dinek@quicinc.com>
In-Reply-To: <20241005104206.3327143-1-quic_rdevanat@quicinc.com>
References: <20241005104206.3327143-1-quic_rdevanat@quicinc.com>
Subject: Re: [PATCH v2] wifi: ath12k: Support Pdev OBSS Stats
Message-ID: <172865757370.243911.11996944263110029562.b4-ty@quicinc.com>
Date: Fri, 11 Oct 2024 07:39:33 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.0
X-Originating-IP: [10.49.16.6]
X-ClientProxiedBy: nalasex01b.na.qualcomm.com (10.47.209.197) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 8X8sMm1CsJP-rz0GpM_qRQaAPw5IcXIc
X-Proofpoint-GUID: 8X8sMm1CsJP-rz0GpM_qRQaAPw5IcXIc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 suspectscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 clxscore=1015 mlxscore=0 phishscore=0 impostorscore=0 adultscore=0
 mlxlogscore=787 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2410110101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241011_073936_496755_B2B409B6 
X-CRM114-Status: UNSURE (   7.04  )
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


On Sat, 5 Oct 2024 16:12:06 +0530, Roopni Devanathan wrote:
> Add support to request pdev OBSS stats from firmware through stats
> type 23. These stats give information about PPDUs transmitted or
> tried to be transmitted in Spatial Reuse Groups(SRG), Parameterized
> Spatial Reuse(PSR) and non-PSR groups.
> 
> Sample output:
> -------------
> echo 23 > /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats_type
> cat /sys/kernel/debug/ath12k/pci-0000\:06\:00.0/mac0/htt_stats
> HTT_PDEV_OBSS_PD_STATS_TLV:
> num_spatial_reuse_tx = 0
> num_spatial_reuse_opportunities = 0
> num_non_srg_opportunities = 0
> num_non_srg_ppdu_tried = 0
> .....
> 
> [...]

Applied, thanks!

[1/1] wifi: ath12k: Support Pdev OBSS Stats
      commit: 15d91424ea822ddfb28ed18564343b3ff9d382fe

Best regards,
-- 
Jeff Johnson <quic_jjohnson@quicinc.com>


