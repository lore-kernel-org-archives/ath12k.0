Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A07A7C02181
	for <ath12k@archiver.kernel.org>; Wed, 22 Jan 2025 20:20:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JHHjSQd18Y1cYuysXzTsGuH3C1uMTh/IaU+/fk0uTyY=; b=2Mw1FH2eLmQVfd4bu4cU7+weHI
	oKl4aFY7heyRotdhNIRUvhVHY35eKCy1zb9AFDUmwfIhzYzfutI4I2KMGCDMupv6LXXOaAAKzqfqb
	SjKmBSITf78vfbJ3cqjnPc2FNMoToHOWgjQpwtO3TuSq0MLTFrSo5nm+kAvb2VxyFgdMGCcOa75ZA
	4o2uNKLZOfQSN8Yhyabf+MBI6fVK3eQp3bc2UtTME6Xsxu4/uLnt7DvIBDtzd2kEGGVwXwKfgUtOJ
	JGZ797e00yBf+g10XRK2QdnatSn1HS/svzyjkkeolwYRBbPcol/yvBUkXO9D0ZIsXZCRNuccDWETB
	1nvJK5zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tahCi-0000000B9Na-19R6
	for ath12k@archiver.kernel.org;
	Wed, 22 Jan 2025 20:20:00 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tahCf-0000000B9N4-12Es
	for ath12k@lists.infradead.org;
	Wed, 22 Jan 2025 20:19:58 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50MGu0JX018214
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 20:19:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JHHjSQd18Y1cYuysXzTsGuH3C1uMTh/IaU+/fk0uTyY=; b=Nx1VMuRteHY+2gcd
	VWcxWVHGD8NNWxNR99Vza1HKEHbwTEXjB2+15v1W891q7WrOCwjoIBXVZoQc2BOj
	NacxXoW43aMp60h4yA6GnnE7Y0CZSGgQ7q9E5uI6vUxSmr6g5eiLPhzYqdcnJRyH
	NDGGIpcbUCdtAK6uuUa9nXZhgguu5UDRFVRqeUEWKMM5fO0ZrphvQqS7+j5pvZtd
	jLhzVlY2nHc/KCxVgGpYujLBhctfLHEyr7py7ezWsPdPs8XScbR1gObfuUWZ4KIp
	TMdq2HpiDNbauxi+EvKeJhnYZhLW+2OyY9kzNCw1+9JdYRrydBj2NueDSBijQCkL
	wE7mFg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44b4mj8etj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 20:19:55 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-2ef9da03117so623215a91.1
        for <ath12k@lists.infradead.org>; Wed, 22 Jan 2025 12:19:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737577194; x=1738181994;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JHHjSQd18Y1cYuysXzTsGuH3C1uMTh/IaU+/fk0uTyY=;
        b=OhVRyKJ2pfBK+aRw/aQvJJRfzLZVZTulMzSOVyaDsN8LXGBRAWJw4Mw/esvcuLIrB+
         2VW4IcOsLUFH7MgmSdqrpDKDY5RrgWvo99MM9IsWkNpzFe8b0+dEyqa9oB9SlReGT+41
         w3+ks4JOY/fYEBvOo1PRoPOdUUTUao4rkDN+AeZQGfxkMg+vXQ5eqwGqgSg3ZvxaFQEq
         +adtTb3KnYZaKSLEvL5hcgNlGx5MQdqEPSTbNscrLVDeUbFTJT6xHOjMoxlYGsYoROAj
         bddvCXVmtRokb8KtVqagLAAurkIWSq2w3TKmHYwYoloB+smdRgYHHXe/yLmAv6+4jRgC
         iKig==
X-Forwarded-Encrypted: i=1; AJvYcCWzVbf/Ry+7NZ+gndLYXbzvZRlvQ+qZUsxvOMbIQ+AUVGaCeW7U1W1NKcdYiwIkaAqVuYyoxFU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxCrlEa80FMHmWGOduH32UYuD5H9BVARtW3wRE00whTfGQfaD5S
	ExM1OxpwDMbfWsHgAKl0qR7cZ9qsrW/EYDJURSvQ0e16kpB4t11ndo/uIsDkcyIGZCh7i6OuEGX
	Ix4Fx6jlHzsWglROh3vnNUyFxMgGyn4+2yTZ6p8F3QeEf2cbS4htPT2TFYOj3
X-Gm-Gg: ASbGncv/JZveSKEoR/E8B9ys1QG5eDbF6ACEES3hFjZScL3Q7B1He43TgyV1ojTm+vD
	fePiPvSX8jH2hhvHJRmgKZTOEcNsW3CMV06ND0KeTPHmr55sf59UM0PIe30/mzUtLbHGNzsTQBo
	8ojEK9dti2Tmk2iQZigAfNAkja1/sul1W6EbWDTHq/Stlf2bZDLl2i4XXyxd/OBnT7OT1PXJ75w
	OgzvfRx/9UeKtyIkGLYO3ulEkGYDFRsBrljEBxEjnvIKTG4WrgQs4EmlSXRxp9RFAMK60ozcaIj
	LljHAL2GsawgPzAIgQRHTSuvv/WvZkoJF1Uw8/rh940WeRqne1pF6za+7FYociY=
X-Received: by 2002:a17:90b:568b:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f782b11bd4mr41359115a91.0.1737577194631;
        Wed, 22 Jan 2025 12:19:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGK4d4okbPhPVphCozEzK0xFCb2TLOlnYr87swXBLsfPtnwchfIvrGxX0cqhLZ5nt/XzXIvyQ==
X-Received: by 2002:a17:90b:568b:b0:2ea:5054:6c49 with SMTP id 98e67ed59e1d1-2f782b11bd4mr41359075a91.0.1737577194236;
        Wed, 22 Jan 2025 12:19:54 -0800 (PST)
Received: from [192.168.1.111] (c-73-202-227-126.hsd1.ca.comcast.net. [73.202.227.126])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f7e6a5e2b2sm2157813a91.3.2025.01.22.12.19.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 12:19:53 -0800 (PST)
Message-ID: <c6b65bee-3680-4e54-9d7a-2b582461cc73@oss.qualcomm.com>
Date: Wed, 22 Jan 2025 12:19:52 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: fix skb_ext_desc leak in ath12k_dp_tx error
 path
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>,
        Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250122160112.3234558-1-nico.escande@gmail.com>
 <101c0824-1c0d-4e5f-bb4c-7d6ef65f1698@oss.qualcomm.com>
 <d0dfce80-3e57-4efe-8552-b18bae9e9437@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <d0dfce80-3e57-4efe-8552-b18bae9e9437@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qG9Zww_Tr1G8VMRSgqcaGFl0VoYc5Jnr
X-Proofpoint-GUID: qG9Zww_Tr1G8VMRSgqcaGFl0VoYc5Jnr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_09,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 adultscore=0
 spamscore=0 impostorscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 bulkscore=0 mlxlogscore=994 suspectscore=0
 clxscore=1015 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501220146
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250122_121957_418141_6C58C8BB 
X-CRM114-Status: GOOD (  10.90  )
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

On 1/22/2025 10:20 AM, Jeff Johnson wrote:
> On 1/22/2025 8:46 AM, Aditya Kumar Singh wrote:
>> On 1/22/25 21:31, Nicolas Escande wrote:
>>> When vlan support was added, we missed that when
>>> ath12k_dp_prepare_htt_metadata returns an error we also need to free the
>>
>> nit: Always refer function name with () for clarity.
>>
>>> skb holding the metadata before going on with the cleanup process.
>>> Compile tested only.
>>>
>>> Fixes: 26dd8ccdba4d ("wifi: ath12k: dynamic VLAN support")
>>> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>
>>> ---
>>
>> If there's going to be a new version please take care of above nit 
>> comment. Otherwise -
>>
>> Reviewed-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
>>
>>
> 
> I'll fixup () in both subject and description

fixup in pending:

https://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git/commit/?h=pending&id=29d6569f323a88ccb3239abea562f6e691cfd9e4

