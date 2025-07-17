Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C552C83F34
	for <ath12k@archiver.kernel.org>; Thu, 17 Jul 2025 17:39:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=55RDTNygMlCBI5mFI9RZR2EapDsighyZM84JT7RE1Cs=; b=J4N9qKZSgu0TUVy09K79ETc9uq
	gqGKDLYx38lOPmDrIKlTXe67xfE0OaUmn3DgfLc2LwFLP0UHLWXSyOWwmhuSUBBPOom1P2mZDeItI
	Ywh+422i+/ZmsEhugghttd9sxEKMtuSRQIPDoRqus4mLaIXxlCCe+2XdwqRiHQaaU7O3npJCc62nk
	RGmJM44JNWlSKWtCdafUUVUCXMql1jtTaW75hrc9KUO74E5+1pp07XN7b8oxSp0dW5zTACk4ii/CE
	1MgkgAnZ7jpdmKcFO9mugwxGXzXTT5PLD9UjBSrTrZVxCbg8XagS/ZfLnGQh4ua6n7GDqtQ3xp+bt
	tjjzDqWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSa1-0000000ApNC-3RoG;
	Thu, 17 Jul 2025 17:39:37 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucSZz-0000000ApMJ-049a
	for ath12k@lists.infradead.org;
	Thu, 17 Jul 2025 17:39:36 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56HCXWpI000572
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:39:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	55RDTNygMlCBI5mFI9RZR2EapDsighyZM84JT7RE1Cs=; b=j/KqD/ngQe1faVpR
	EC3yuWbGyXSqfKywCfYXjs5lv2KQypreIMLvM8liFfWSpj9R31fHt0hklky+tQlL
	kYABv0D9xvswH2hvtDepL6UTW67oo/udGnEXSUrlwVslBlSJ0I02fzuVpYYb1S6i
	h2OCOMx/ctD5SijtbsE2dhkxJyg+Bjj9RVFTZBFAyKzzmp9f1mljusTd9nbl9oEu
	QN9HW6gCCssDXoiB4AtYKT+Iq4uLJFkq9nRbltJ6d3CoQ9GWRF2y9Am0iPumLqP1
	hOjwC7An73wuYAHU1c3cez1+ydNT8D5xmeWlISFLhUilmifByHNaStAertjAlshW
	59hJQw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47w5drurm7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 17:39:34 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-23827190886so12269055ad.3
        for <ath12k@lists.infradead.org>; Thu, 17 Jul 2025 10:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752773973; x=1753378773;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=55RDTNygMlCBI5mFI9RZR2EapDsighyZM84JT7RE1Cs=;
        b=AMZ+B8rECiHFJoUvp8gFehrXbYMhLPX8p9jBz02me7DeD9PlS5z3ogRjaDi62hLW9F
         gQp3SCa1AZbxuGCJ9o4jtpKjksYApfjRjrXNHsKnX6N+6vwTvk8yOtmlbS8m527LrBL6
         EsmlleHHgWayq6GK9LO1YFXm9TKzU0IXDK/8q6NzeD/QGHLGsILQi0I3clMOZl+Yi73F
         Sa6VZ2mYNyz9PWLp5RnYnpc/UdFX2hik1j7QLOaG2TEhK07L4zAq4qU97gtrqYRPY1lK
         UTUWc7qYG54gzQjm6x3nJ9d0mar454wtxz9gVM/naVoXFiQyVykkWSB3kk2jDjmEI7vE
         uFtg==
X-Forwarded-Encrypted: i=1; AJvYcCXYhZC7R5ZqtWcHu+RNi6+YabGG4DXA3KTDPMvUtn/G5neX+H37BebV42YJM6DzD2IzcntqMz0=@lists.infradead.org
X-Gm-Message-State: AOJu0YwbcAzqCUHZrpPjdTNYOk7D0eNx3FrYjcJDkDN8HeU17We/jb18
	ymyvI/gxlfWi+FPNan6rrAOxYDhulF8dRNEi1CeV6UlIhrUnkVbsiolaY3/z0WuEcXeM8j1tUUW
	NWbxs/zmo682SwmA3AkiDgSUUe+oooplz6P5mu4FQAKwm1zzXJeFFbZBua/1lsUlK
X-Gm-Gg: ASbGncunGGAHFR6JR7bKVZY1oLHSK0EeydNs2z0aMPV6C+DDZ4NMTftO7zoBM1voFqm
	i6SBIKNKI9Ze7IBHFnjlWNYIxPWjHkzrqHqn7gYuqgHC2tysQoA3NCgp/Z7b5tY7SxX5ifu3Aky
	gUqquZIK1NG4pp/eBPrg0HmQchxz/0+H00+oR5SmDNvZZc5fpNW588SkcEKf7cxbgHawY5CuNGK
	+MHZEFU0b3vyOsbuOeeKmqs6jXJJyIW38oTSWIQgtlimHS2ya91R8A8uFEsQldxaszY0yNjS8pa
	jO00/r9i8RXiRBpo0pm6GVRM+xMPUDgGMUXaf90zETzOaOWnjYWDxV4jrk/ESJuIWVkmY+WAyQs
	Awt4xc+/1828H
X-Received: by 2002:a17:903:1aeb:b0:22e:5d9b:2ec3 with SMTP id d9443c01a7336-23e2572af07mr106171265ad.30.1752773973565;
        Thu, 17 Jul 2025 10:39:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHeuY6VI9uuLprQ+Nr5x3foPCimOeA4RpDHNRcdV0qThrTuIhejOKoACDRfjbPzR+hCdl21ug==
X-Received: by 2002:a17:903:1aeb:b0:22e:5d9b:2ec3 with SMTP id d9443c01a7336-23e2572af07mr106170905ad.30.1752773973072;
        Thu, 17 Jul 2025 10:39:33 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.215.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4322cd2sm143006055ad.99.2025.07.17.10.39.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Jul 2025 10:39:32 -0700 (PDT)
Message-ID: <d191062a-f9af-7f00-35fb-677504ec4cc2@oss.qualcomm.com>
Date: Thu, 17 Jul 2025 23:09:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: Extend support to parse wmi
 service bit
Content-Language: en-US
To: Tamizh Chelvam Raja <tamizh.raja@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250717173539.2523396-1-tamizh.raja@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: kIH3IUtbI_ifmQ7XurR7iUP9w7j5Cvg9
X-Authority-Analysis: v=2.4 cv=D4xHKuRj c=1 sm=1 tr=0 ts=68793556 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=yGYHVi08oRoRdJ9zovgz5A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=dHrHj1FnWLW9-lTSwmEA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: kIH3IUtbI_ifmQ7XurR7iUP9w7j5Cvg9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE3MDE1NSBTYWx0ZWRfX4VJ3FssU4+IL
 145WEAwfdp7hYMq6SfP1LDX9gRkqrhCi7dlThk4r/V+rQrklkHB4vyBEMGIOKNjjneYPvmLtH4L
 qod2lr3E+1uJ/+G/VT9Y4iV0k7mZi0XoS2RJH5p4qfQOuBfGuPs3kQoH5ZFpiqBzGNBdtMlLzYe
 XOr95shCOK/5nCZN/lJhQFAOFMmKAzK1BGeJDZRsc5lBG8ojPdYQklgCQRHfhfALfbHUgKqMIIy
 ggCHXHysD0itBip8JBFYi76Yp+6QtNXBEgoXpNH4tdyituxsMPVR2zbiGnQrUp52gmRjFbYKbvw
 e8OO2hlNJ8VM0K6Yjdmksh40fsMBiN843rTrEyGMUOpeRhuWovdxCDvOZG98FAvT6lYiOtNeyET
 VzOOKrsWKk9S/Juz+SwNAMDDvCvc/U1pxM8N+h2QQxSyPsdra1bCxrhglfbYqNrrPhO70irE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-17_02,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=999 impostorscore=0 spamscore=0 clxscore=1015
 lowpriorityscore=0 malwarescore=0 suspectscore=0 bulkscore=0 mlxscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507170155
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250717_103935_067510_534EBD72 
X-CRM114-Status: UNSURE (   9.93  )
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



On 7/17/2025 11:05 PM, Tamizh Chelvam Raja wrote:
> Extend support to parse wmi service bit till the last value firmware
> is advertising and use endian conversion while accessing the
> wmi_ext2_service_bitmap value in ath12k_wmi_tlv_services_parser().
> 
> Tamizh Chelvam Raja (2):
>    wifi: ath12k: fix endianness handling while accessing wmi service bit
>    wifi: ath12k: Add support to parse max ext2 wmi service bit
> 
>   v2:
>     * Modified commit log as per review comments.
> 
>   drivers/net/wireless/ath/ath12k/wmi.c | 17 +++++++++--------
>   1 file changed, 9 insertions(+), 8 deletions(-)
> 
> 

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

