Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7EB44C4345F
	for <ath12k@archiver.kernel.org>; Sun, 28 Apr 2024 03:30:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cO8Mvl5OAgu+1BhISJ6VFybtPEk+K+33daikX9jiGX0=; b=XB86xWwdiGD0vp9GSDmSY+BBye
	gpPAwQBd+jz1B1hVQLbYWwGzzbxxHbp89olnUgeLi3S/AUnuu1iBUbuh5cdTNL+OyHizaZmmE2qiJ
	HCEMqGfrm/Qiodh5Cbtk6hRmspW7nH4UxEdcaiZql9Pp/40S1eEdPwtQvBesvkNK8IDKVj9R98Lha
	LXcZXqPnUtnX3I6KsO3ymSiSDUOpXxCH6UPsqBxBPKWTPSWJXUPmPseuCSXF7SL3zbVX6rD606goo
	huU6bwnn4i8UH25PPvEAB/EQ+rjANQAwJNg/uouqZ7K0F9M5XsGFH88vha+suHapE/Q5Kb+xNwQhL
	+FqJRZDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0vEo-0000000GjdK-0XeH
	for ath12k@archiver.kernel.org;
	Sun, 28 Apr 2024 03:30:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s0vEj-0000000Gjc9-0iFt
	for ath12k@lists.infradead.org;
	Sun, 28 Apr 2024 03:29:58 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43S3TsgA018332;
	Sun, 28 Apr 2024 03:29:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cO8Mvl5OAgu+1BhISJ6VFybtPEk+K+33daikX9jiGX0=; b=MN
	DSwu7Bmv+GoGQFgu8JEhzzWr+GngA2qlIR8IZCuKWGmj6N2r9eNXY3Z4EG2w4f97
	ABibXeTGCka78vK7rzVDYby8vDthjwClamymvSAltNXHPrkMQ8Z7DrowVajZ1T5D
	GNG+wPKwEVtUJ38mReGHulUd/AWUZtfJ5DcSs2WjOr5wjkapkat73vgZOS5IAeSy
	XVVFNu0ERQch1wUXIuigSLmqntdK72LHe9TguQrPDFLY3YIWqnTIa0XrQzJiF95h
	F4zq2viRMdM2vVWjh2eH7gondHh51nUnwDJXKOK7MO0gHWAZPj43OdU1MCYMKNxt
	NgSk79q6ocoMMvalgNFQ==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xrrcch970-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 03:29:54 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43S3Tihv022767
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 28 Apr 2024 03:29:44 GMT
Received: from [10.216.63.219] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Sat, 27 Apr
 2024 20:29:42 -0700
Message-ID: <4cea96f8-399c-0974-4d9c-21bf5eda143f@quicinc.com>
Date: Sun, 28 Apr 2024 08:59:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCHv2 0/3] wifi: ath12k: Remove unsupported and unused ring
 configurations
Content-Language: en-US
To: Tamizh Chelvam Raja <quic_tamizhr@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
From: Vasanthakumar Thiagarajan <quic_vthiagar@quicinc.com>
In-Reply-To: <20240427162644.2470886-1-quic_tamizhr@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: PXJTaAtXO_19WwF7yoSbqqXVB0ZXAmNH
X-Proofpoint-GUID: PXJTaAtXO_19WwF7yoSbqqXVB0ZXAmNH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-27_24,2024-04-26_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 adultscore=0
 suspectscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 mlxlogscore=925 clxscore=1011 bulkscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404280023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240427_202957_407410_B32F0D18 
X-CRM114-Status: GOOD (  10.98  )
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



On 4/27/2024 9:56 PM, Tamizh Chelvam Raja wrote:
> Currently in driver doing memory allocation for tx_monitor,
> tcl_cmd_ring and tcl_status ring. Here driver support for
> tx_monitor mode is not there and memory for tcl_cmd and tcl_status
> rings are allocated by firmware and it uses that memory instead of
> host allocated. So avoid these unused ring setup configuration.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Tamizh Chelvam Raja (3):
>    wifi: ath12k: fix calling correct function for rx monitor mode
>    wifi: ath12k: Remove unsupported tx monitor handling
>    wifi: ath12k: Remove unused tcl_*_ring configuration
> 
> v2:
>    * Rebased on top of ToT
> 
>   drivers/net/wireless/ath/ath12k/dp.c     | 16 -------
>   drivers/net/wireless/ath/ath12k/dp.h     |  2 -
>   drivers/net/wireless/ath/ath12k/dp_mon.c | 40 +----------------
>   drivers/net/wireless/ath/ath12k/dp_rx.c  | 56 ------------------------
>   drivers/net/wireless/ath/ath12k/dp_tx.c  | 44 +------------------
>   drivers/net/wireless/ath/ath12k/dp_tx.h  |  1 -
>   6 files changed, 2 insertions(+), 157 deletions(-)
> 
> 

It nice to see code removal in general :)
But I've also seen some concerns internally around code removal
especially when the code will have to be re-added in future while
properly supporting the feature. I guess the cover letter
may need to clarify those concerns at least for internal review.

Other than that, the series LGTM

Vasanth

