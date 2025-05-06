Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64820C3ABBF
	for <ath12k@archiver.kernel.org>; Tue,  6 May 2025 23:36:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kvf6wWhtHxqg6MIN1ZuRftKcLX8kqJYFgLZnWRbjayo=; b=2x1yf/VhukLsjxRzGAGJtdDCk2
	2ZWR7wLiZmkRJj+MJl7w2s/ucaabviXFKgKjJPhAKFnPdJJ9NvfPLO+v5jSIcGXHAr55/CxxjH1t0
	W90zlMuLsScqdfk6ct1Gaw0sBKYEWn2FicrDl8H17N9SiCS9zcx/uEWyBm0VQywYkecis2AlsrJiE
	PsYJ6AOieb4348dXtxsMfWSqN3PLGp9W+IK/RQKRvs2Ph3WbJmKANs28UY5i5hvN8jRo/rNlvRoxy
	kmwAgwq39n0j0Oppux3fhH5n5gsZpy8Za1GgoSE2+BcBywsv3dImMFbvPWa6DbFxxVlIu3331U2Bw
	1YARvyPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCRqA-0000000DhH7-0bxI;
	Tue, 06 May 2025 23:36:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCNP1-0000000D9ly-1K2v
	for ath12k@lists.infradead.org;
	Tue, 06 May 2025 18:52:28 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 546FC5mj013836
	for <ath12k@lists.infradead.org>; Tue, 6 May 2025 18:52:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	kvf6wWhtHxqg6MIN1ZuRftKcLX8kqJYFgLZnWRbjayo=; b=ZrI/ro4k7lKCZbao
	Kp4dk99FhZxAGniNZbbePR5RDkO9PV+V1euWxf/I1R5Kuj4wXnIewhvDZRMc/1k1
	5dI38hn/+3vdyf0Nwe4LrxEL0pNzQIa8XzWsN1i85bLHo0qivSTh/UhoGMqggyBm
	8ba7qbCYbFxZKjmRVXmcdfCU9uaHlr/Heh8LQ1/efpgrrgdWeYnpW8BDlr/UBE1p
	2Z5JmxS2DAR5897UVGe//Mf7EB9la9U7nFf72JfzJmvd+qW6qibsOnV17P0P3uOE
	hw0V12fPrXEG0bOryvh7o0E4L6wQEn2e/o2nqV4+6qnRR9HMFee9XCfXLNfpSoda
	Zrr7NA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46fdwtt2bt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 06 May 2025 18:52:25 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-227a8cdd272so50177975ad.2
        for <ath12k@lists.infradead.org>; Tue, 06 May 2025 11:52:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746557544; x=1747162344;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kvf6wWhtHxqg6MIN1ZuRftKcLX8kqJYFgLZnWRbjayo=;
        b=P3GyNwuEE4Fnzf/qYXi6Y2rbhh49a2Y/YSeVOdDjTSyM0juNsEMsdOvVq2PIVXwDYe
         vnP9LaaKZWaPIz2yh2HK2dsdQJgUodnRHMNBUr3XiLOmqdqycZ/5a71DfD7pAhw9R42v
         Hps87Q1S/W8qQtcWATULIVjoG7YmlHMTFrq7yNUPRNxzY/3ica1uLvcZdkBXKxtITafj
         A6assUYNi3uDsRRkchzp3uT1lWi5XzfNR/1ji1cpHhb4hrrSlTMlnurukSf2R9mNVk1N
         cOuplHlb9ZrNmJSXn1/LU6iEHgKmpt1ixwWdlAtKBZQ+3QBeoIfadQppLRk2Wl+Hgi+b
         2nFw==
X-Forwarded-Encrypted: i=1; AJvYcCXrZYtkartGPcs731OpfZKFgP9UOkKI4IUAhywuiQ8+7CRzvAVs0hodU+BMPnO0tIE3PodE/bQ=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3ZJpZoPRwrENyYdRsTDbySecRWi8DAg+VjkJIKWubtI/TLuVP
	w9ry+PpPh7VWbiqaNyw+d0BLHxLLY8OH6kxAYX4gM4U58dlAco7ER7XMtp8j3Sr2cVRaW5DTCeu
	n/5pCGtb/CvX2zdbD3b/yg4Z44KmyTYZ3BXZ3gK2dgv/9wDvOnwJ/ldMyG8vI
X-Gm-Gg: ASbGncvARj6M2wgqzlEiDs03cRtLSW+oiKx/FEcl8J2Xv7jEpEc0gmPCvv9QUaeo3Be
	fWC8My/wt7N/jwfvlRoqyVest7fw7CphpW/y+T9r8LR9O1XmBKC4VA704tx3j9Qza0mEGXxePrB
	ACzrTjqHrUHAarN2xB6ft5pss1hA3tN0gE6zafSrHPIQWbwgcpEU6sojOpv7y4HrLtVjGC86qRv
	Fif/0wibIiTHEYNBGl7+uSDDomx/pm2745NLOlfGE+tkqmbCFKvm5XgdbmvbeR3COEOVR8rEjLK
	w8Eoy/kD42tAEYddINiVOhnuklsDq2QYFPVZmoMRonVuDggPEWQnF0mKB4G4L3N0
X-Received: by 2002:a17:902:db0c:b0:224:912:153 with SMTP id d9443c01a7336-22e5ea28001mr5838695ad.5.1746557544152;
        Tue, 06 May 2025 11:52:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFAeM302AG/fjm1ZK0SjS80F8vGb9oK5vmojLHOaYdA0jvxCLEcImHl7uo9z+QubhHm7POP2g==
X-Received: by 2002:a17:902:db0c:b0:224:912:153 with SMTP id d9443c01a7336-22e5ea28001mr5838335ad.5.1746557543747;
        Tue, 06 May 2025 11:52:23 -0700 (PDT)
Received: from [10.227.106.66] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e1522054esm77587675ad.118.2025.05.06.11.52.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 May 2025 11:52:23 -0700 (PDT)
Message-ID: <b3e1fbdf-a254-41ba-8560-3fec858ba0ce@oss.qualcomm.com>
Date: Tue, 6 May 2025 11:52:22 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: disable pdev for non supported
 country
Content-Language: en-GB
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Karthik M <quic_karm@quicinc.com>
References: <20250502230240.3692678-1-muna.sinada@oss.qualcomm.com>
 <5fcbf500-8005-403c-a9db-597fb8a54bc1@oss.qualcomm.com>
From: Muna Sinada <muna.sinada@oss.qualcomm.com>
In-Reply-To: <5fcbf500-8005-403c-a9db-597fb8a54bc1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=VPPdn8PX c=1 sm=1 tr=0 ts=681a5a69 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=wjPqW5DQ7UYj3S7x5DEA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: ajK16yKK2kowwqxPIXD3BGxYSU8zcZ1H
X-Proofpoint-ORIG-GUID: ajK16yKK2kowwqxPIXD3BGxYSU8zcZ1H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA2MDE3NyBTYWx0ZWRfXyGtSltAGB0u5
 +737+0Z2NvcsNs+MfY596QXELyUmZ53B3F0rB/nyhKMhGTHttsnDeVKDk3ALNnWo6PrHiT9K6SK
 TzaICGc1hlNWFWs0zTgkgndt5K8ccdLvzQJc8B0eydZ1z5H2IRiHo4hBoHAU/jqWREFK6Nvvg6G
 Lgqa8POWYoyxIcsuGqG2e8+IPiGVpQJyhCtF75lHpOKKrXLYBsFO1NjcCLy2CwK/jvXNo7pYCyH
 O3CgcDQpRtZ9dDypFluQe+H7d0AtjnwOUtWWcyVr/bGzfxcpQPilXXjRypgmLTOwMN9lqO9XrxM
 R3WOOxPwknfwbLb40ibnxhjF5k7w7TufQe80+qJG29+/RlPjsAJmJZQRnoVci5tA1m1KUKF/aqb
 +gFdVMU0fJz9bhqNTQbjzjxqOrNuXiwrXJxPR13USfzGeAW1paLcXtjrl4EA9EketG4tQXqL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-06_08,2025-05-06_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0 malwarescore=0
 mlxlogscore=662 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505060177
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250506_115227_366866_606CFBC5 
X-CRM114-Status: GOOD (  18.25  )
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



On 5/5/2025 10:46 AM, Jeff Johnson wrote:
> On 5/2/2025 4:02 PM, Muna Sinada wrote:
>> From: Karthik M <quic_karm@quicinc.com>
>>
>> In MLO configuration, ath12k_mac_radio_start() iterates through all
>> the radios and makes the ar state 'ON'. Even though some bands are
>> not supported in certain countries, ath12k_reg_update_chan_list()
>> tries to update the channel list for all the active pdevs and ends
>> up in the warn_on for non-supported band.
>>
>> To prevent this, disable the pdev when the num of channels in a band
> 
> s/num/number/
> 
>> for a particular country is zero.
> 
> Can you explain what is meant by disabling the pdev? There are plenty of
> countries where not all bands are supported, but I'd expect the pdev to be
> active on the bands that are supported.
> 
> Or is it more accurate to say:
> disable the pdev when the number of channels across all bands supported by the
> pdev is zero for a particular country?
> 
> I just want to make sure the description is accurate.
> 
> /jeff
You are correct that it is more accurate to specify that we are
disabling the pdev when the number of channels across all bands
supported by the pdev is zero for a particular country.

I will update commit message in new patchset

