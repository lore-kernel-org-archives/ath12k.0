Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AC40D1CA28
	for <ath12k@archiver.kernel.org>; Tue,  5 Nov 2024 04:53:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GhOIK0o10F+Z0TDxjdoohBKRTg4qeTp1vINVLgiL1FQ=; b=QBHwpAfKrdA41LXUq//tejubi7
	bUBPuYnNHmg4hK4H4Ex4ElhzoFqvPpLFlD+zZ9+Q+37GPM1dbInzXNpMsCk8pwRjUKrFUCZmHaziq
	1Rag8KcuxKvOr1i3RpcLOHwlvwjA1jY4MEEie7p6Z8xmAlwjW4KMcsTI9AAKUprxrdtoXGlLh5eOE
	P5ZAogWO1kse3jqn15V4DyoPMN1FrK5NA0vvPG2fV+6PPqp9msC+JXjZjG5f04TeDs8O6n9uUghfD
	zUVjPbc1m/cg+EW61TA6E0///+mco0wgy06tXQMf1IgroFyL1VhkZ1oTey/nBHXR87nsrodFwiHdl
	OIyrcQ7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BYv-0000000Ftcc-3Hu6
	for ath12k@archiver.kernel.org;
	Tue, 05 Nov 2024 04:53:05 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8BYt-0000000FtcA-0WUM
	for ath12k@lists.infradead.org;
	Tue, 05 Nov 2024 04:53:04 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4A4LIj9q012130;
	Tue, 5 Nov 2024 04:53:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GhOIK0o10F+Z0TDxjdoohBKRTg4qeTp1vINVLgiL1FQ=; b=bk1R0AynVjsBaXjA
	bZ0ThQMHqgDx4V7huJDiQDVJvArJczvu9wzTqpxW78sDCHLWrkVcVfUK2HwYciVm
	4WTgnEjUkupjcLiMtyK9EIJmAv813aSjTmXk0tEQgW2buSrl9DSrdMK5hnrrRydZ
	nTiNPF34brsR3s+k0VE5gPSb0k2G50DkmWNY6BiqO3jj/Q356GPn9v2rR0+nmScF
	XcZkEOUcpnzy+4q9QY6l9fU+UhNnTZazUGytXbhidZSayjfgiFLTLV8d3NQdYkWG
	5gFwAj3s+9NiIrAODRkfz1doiT0/qNSXIhAHjuapVLuk+uf2wBPWyaG7mpxNeEfV
	WHczEA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 42nd11xc3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 05 Nov 2024 04:53:01 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com [10.47.97.35])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4A54r0O8025838
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 5 Nov 2024 04:53:00 GMT
Received: from [10.152.206.29] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 4 Nov 2024
 20:52:59 -0800
Message-ID: <1149edbc-6440-4d4b-b792-2dce5be9a13a@quicinc.com>
Date: Tue, 5 Nov 2024 10:22:37 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
To: <ath12k@lists.infradead.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
References: <20241105041822.2039214-1-quic_rdevanat@quicinc.com>
Content-Language: en-US
From: Roopni Devanathan <quic_rdevanat@quicinc.com>
In-Reply-To: <20241105041822.2039214-1-quic_rdevanat@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 7Gqd_rhOTFAigZ9JiBmXYq4fRSz4pCva
X-Proofpoint-ORIG-GUID: 7Gqd_rhOTFAigZ9JiBmXYq4fRSz4pCva
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=989
 mlxscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2409260000 definitions=main-2411050033
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_205303_314913_046CF312 
X-CRM114-Status: UNSURE (   9.38  )
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



On 11/5/2024 9:48 AM, Roopni Devanathan wrote:
> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
> These stat types give downlink pager stats, counter and TPC stats, SoC
> common stats and Transmit PER rate stats, respectively.
> 
> -v2:
>  - Removed dependencies. No change in code.
> 
> Dinesh Karthikeyan (4):
>   wifi: ath12k: Support Downlink Pager Stats
>   wifi: ath12k: Support phy counter and TPC stats
>   wifi: ath12k: Support SoC Common Stats
>   wifi: ath12k: Support Transmit PER Rate Stats
> 
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 627 +++++++++++++++++-
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 200 +++++-
>  2 files changed, 824 insertions(+), 3 deletions(-)
> 
> 
> base-commit: e7e2957f403ba4655199f2ba9920c1a015a7be44

Apologies, seems like there are compilation errors in this version. Please
ignore this series. I'll fix them and re-spin an incremented version.

