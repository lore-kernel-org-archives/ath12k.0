Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8317C4345F
	for <ath12k@archiver.kernel.org>; Fri, 19 Apr 2024 09:40:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:CC:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fX2Zkoi/Q8jYaRe57Bx6SrWfONRDiLzDduR+kVRXZHY=; b=kMZAzSW73EB6noL/mZMeBpwMJz
	mNBFJdQ6a8GQHAa8AG/JL/N3gMYp3gTd/VcTURymy6NQaDyigZMFA5yv8S1XQh1CkSGSeJLX+JT4f
	osvCoKz/ddZ5ly61kgM9Id/YH3Lcgs25g1Vgg/kKU6LUOPdc4SO/Lv9AMv4R8BAVLHAVG5cA691t2
	Rt4b5M38PEbejTx8FvZrXVpfBMWx7CywcEPXmQ8okR+tjQXaMfXbegllU/6Gkgjq0L7MkFnGqe8o7
	rjs3QndaOIwiggYWK/wTUBhO/iLp3iMyQCkkGrMXfLrNnXI/ER+pn3VC+UZvWncVh26M1rFRghKrr
	5aaiyMoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkjC-000000056p3-1m64
	for ath12k@archiver.kernel.org;
	Fri, 19 Apr 2024 09:40:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rxkj9-000000056nj-2mec
	for ath12k@lists.infradead.org;
	Fri, 19 Apr 2024 09:40:17 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 43J5e9ek026167;
	Fri, 19 Apr 2024 09:40:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:references:from:cc
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=fX2Zkoi/Q8jYaRe57Bx6SrWfONRDiLzDduR+kVRXZHY=; b=nL
	G/Mkbi2CKN9buLfQ0Ir9lzWoF8Litj+M7jCjuco7MouQ7sd42rqEKd3F3dfNioyB
	B1NMfedUrS1NyBR4bjhrIwQAWEQl72BOPy5wxVZ1JtIkWpzI/BfaB6fggdCEtY/c
	rjVCL9PEPu6bP11ZFN5o+P3FGjPbEmgqAYJcDsdVsZwsUHu/tVabF/H005NyQD3d
	Vkio7oL7wbVTrUKJ8GV8+w4qROda4QGwClDnxfmYzlmje2hjNi6LX+2q837sc2gl
	TaQFfr5zOSAK//ketKSZQ8hwJSt3bcFQ+715JUWaNfmUEjRH24hJuxhmG6ZuoT2y
	6jsEzn6KkyfDLCzVqJKA==
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xk4vnt9r5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 09:40:06 +0000 (GMT)
Received: from nalasex01b.na.qualcomm.com (nalasex01b.na.qualcomm.com [10.47.209.197])
	by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43J9dZvK011434
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 19 Apr 2024 09:39:35 GMT
Received: from [10.110.91.89] (10.80.80.8) by nalasex01b.na.qualcomm.com
 (10.47.209.197) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 19 Apr
 2024 02:39:34 -0700
Message-ID: <be016fbf-0198-4fe1-84f8-cfb0bf00dc4b@quicinc.com>
Date: Fri, 19 Apr 2024 17:39:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
To: <ath12k@lists.infradead.org>, Kalle Valo <kvalo@kernel.org>,
        Jeff Johnson
	<quic_jjohnson@quicinc.com>
References: <91cbda07-0b93-4e0b-adaa-cd9b078a91b8@quicinc.com>
Content-Language: en-US
From: Lingbo Kong <quic_lingbok@quicinc.com>
CC: <linux-wireless@vger.kernel.org>
In-Reply-To: <91cbda07-0b93-4e0b-adaa-cd9b078a91b8@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01b.na.qualcomm.com (10.47.209.197)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: VWvcZX25eGwhdAh1Rb4gG4HbwGeboxjb
X-Proofpoint-GUID: VWvcZX25eGwhdAh1Rb4gG4HbwGeboxjb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-04-19_07,2024-04-17_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501 mlxscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 mlxlogscore=778
 suspectscore=0 malwarescore=0 impostorscore=0 spamscore=0 bulkscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404190072
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240419_024015_737913_CC43761E 
X-CRM114-Status: GOOD (  20.27  )
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



On 2024/4/19 14:30, Lingbo Kong wrote:
>  > -------- Forwarded Message --------
>  > Subject: Re: [PATCH v8 0/4] wifi: ath12k: ACPI support
>  > Date: Fri, 19 Apr 2024 07:16:07 +0300
>  > From: Kalle Valo <kvalo@kernel.org>
>  > To: Jeff Johnson <quic_jjohnson@quicinc.com>
>  > CC: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
>  >
>  > Jeff Johnson <quic_jjohnson@quicinc.com> writes:
>  >
>  > > On 4/18/2024 9:20 AM, Kalle Valo wrote:
>  > >
>  > >> From: Kalle Valo <quic_kvalo@quicinc.com>
>  > >>
>  > >> Through reading ACPI tables, implement Time-Average-SAR(TAS), BIOS
>  > >> SAR, configuration of CCA threshold and band edge channel power
>  > functionalities.
>  > >> This is enabled only on WCN7850.
>  > >>
>  > >> TODO:
>  > >>
>  > >> * test with ACPI support in hardware (I don't have such hardware),
>  > especially
>  > >>   suspend and hibernation
>  >
>  > [...]
>  >
>  > > I can verify this doesn't crash my system, but apparently my ACPI
>  > > doesn't have the underlying settings, so cannot verify actual
>  > > functionality
>  >
>  > Thanks for testing. I hope Lingbo has a device with proper ACPI 
> settings.
>  >
> 
> yes, I'll apply these patch then test it.
> 

Hi, kalle, i've applied this patchset, set ACPI correctly, then ACPI's 
functionality is right.

>  > > Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0:
>  > > acpi_evaluate_dsm() failed Apr 18 15:13:59 qca-HP-ZBook-14-G2 kernel:
>  > > ath12k_pci 0000:03:00.0: failed to get ACPI DSM data: -2 Apr 18
>  > > 15:13:59 qca-HP-ZBook-14-G2 kernel: ath12k_pci 0000:03:00.0: acpi
>  > > failed: -2
>  >
>  > I just want to verify that these are debug messages, right? Normal users
>  > shouldn't see any ACPI errors if there are no ACPI settings in the 
> system.
>  >
> 
> Let me check it.
> 
> Best regards
> Lingbo Kong
> 

These messages belong to debug messages, normal users won't see any ACPI 
errors if there are no ACPI settings in the system.

>  > --
>  > https://patchwork.kernel.org/project/linux-wireless/list/
>  >
>  > 
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpat
>  > ches
> 

