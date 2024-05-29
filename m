Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A437C25B75
	for <ath12k@archiver.kernel.org>; Wed, 29 May 2024 14:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kJ5qKcintWpRbRz347ijnBiMJCZIvMoK3IueNeRB/7k=; b=GXZo4YAxP0gJ3HK77yvs0y4Mhq
	Y4fmz63WZFB+iprijOXLVDn4xL2+OcxjaS1OKcbOOAHpfw9InwEGpMbZZk7beAZGY5FpwY+0sVZXY
	gFmkFlQHVOkc7Q1XleRnvBWqV2VX6YkM6Hb0VLj/QdUgZuuk4oGeVHEo2JJ4fZo8giuHFHtZT7Rrz
	Qb9qUHgc2N8IDvhdaC0dqSjhX+soS+1svJDXLUkblHxNquVvAM0tyEgJ+uOLEyTdT/Flpe011W8R7
	1JSTFClJuW2jaxq/l7TnJZrv72WmT9Pbt/EmRAchllzaK5/l+Oi8NrJ7ekDnKHt25pxpT6KvYTBcG
	1Fyr412w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKUV-00000004WIV-1vWB
	for ath12k@archiver.kernel.org;
	Wed, 29 May 2024 14:41:23 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sCKUM-00000004W4i-1Aun
	for ath12k@lists.infradead.org;
	Wed, 29 May 2024 14:41:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44TB49Qc005808;
	Wed, 29 May 2024 14:41:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kJ5qKcintWpRbRz347ijnBiMJCZIvMoK3IueNeRB/7k=; b=BuqJzlBxzLSRy6nb
	wcexmv6jXj5EBLnCs9D7P3PRF4dKph1LJ0J0li2FVb8SRN/36qyVtSCPnGrRu0Sl
	H34dsQjcuAmKIBBKZ+2MCFi/y95yNjKR82ghAiAkhaLzuKt1vjpJS9r0lwHKwns+
	2t7WrBOxQqKJ9xTJWvWmKwGMNJAtbkB3vZbfRlDM45fKA74H07zzKX9378XT5x58
	Q3/sllv1F2BlCFUf12Ct6nM+tfiOT1B85LOn8Tf185DZpvVlfBMR/outwkgncwxd
	pTAZbQFMsWsRlAmEfWV4gfzlnoMEt/kRPawSjtwTjmtUVp45svYwbauPNZ2c6wVv
	rNRAUw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yba0ps3u8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:41:03 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44TEf2ug028634
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 29 May 2024 14:41:02 GMT
Received: from [10.110.122.222] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 29 May
 2024 07:41:01 -0700
Message-ID: <0f49d156-2359-4286-b2ba-b6fb4345af82@quicinc.com>
Date: Wed, 29 May 2024 07:41:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: modify remain on channel for single wiphy
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240528082739.1226758-1-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240528082739.1226758-1-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: HEUKkfD941SlGmtPX5_QcCSiPXfhhXmx
X-Proofpoint-GUID: HEUKkfD941SlGmtPX5_QcCSiPXfhhXmx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.12.28.16
 definitions=2024-05-29_11,2024-05-28_01,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=791 bulkscore=0
 suspectscore=0 clxscore=1015 lowpriorityscore=0 priorityscore=1501
 mlxscore=0 spamscore=0 adultscore=0 phishscore=0 impostorscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2405290101
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240529_074114_377918_AA58CA4F 
X-CRM114-Status: GOOD (  12.59  )
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

On 5/28/2024 1:27 AM, Rameshkumar Sundaram wrote:
> When multiple radios are advertised as a single wiphy which
> supports various bands, vdev creation for the vif is deferred
> until channel is assigned to it.
> If a remain on channel(RoC) request is received from mac80211,
> select the corresponding radio(ar) based on channel and create
> a vdev on that radio to initiate an RoC scan.
> 
> Note that on RoC completion this vdev is not deleted. If a new
> RoC/hw scan request is seen on that same vif for a different band the
> vdev will be deleted and created on the new radio supporting the
> request.
> 
> Also if the RoC scan is requested when the vdev is in started state,
> no switching to new radio is allowed and RoC request can be accepted
> only on channels within same radio.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


