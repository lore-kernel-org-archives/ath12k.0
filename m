Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E459FC369B1
	for <ath12k@archiver.kernel.org>; Wed, 16 Apr 2025 04:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=70UL/+TvMgIg/Zg9WALcrQO76O4dSA2hdprkTpMTm9w=; b=dBfHwMmwDLHW//S7llzLYQB8gR
	LxWz4QyTBOALOXZGEPfSdI/I2BKDucRP8tZaqtKBhnVtkWlq37hM8QsxxZqSqtnVuctf0CvjRos/E
	IHoe7RrfacDwybh/fRHLnjEStt/aofQXNjkVPJE4JhORGo2g7C848unF0M2sMLL2ETpP8PZqkhNJh
	ogI+yHoADLGaA/Bp99Y0BOrpayIbpL+P9Kk8NzQOJ8pXSOkqX+mHEO9FV6eWQvtYPmOI15hGtxXMg
	GrSDUoJc9JHDyo7slroF/gf8iXX72C3AhVC4/7WGtmzuIydZv56gqeSt/2cMcijZkg6UwrmAAW2ba
	606gEwEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u10-000000086wd-2HTn;
	Wed, 16 Apr 2025 04:04:46 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4u0y-000000086w8-0W4S
	for ath12k@lists.infradead.org;
	Wed, 16 Apr 2025 04:04:45 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53FIhrgM002235
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:04:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	70UL/+TvMgIg/Zg9WALcrQO76O4dSA2hdprkTpMTm9w=; b=YVDk4SeNtVi6hQtM
	+XEpFlaVae//Ke792YS//f2ULn6D3iqeblPcJZJxI5fUJtqqMhtV6gYmhMAgWoKg
	1E3vaix8DIuzOqRpMTzU531kpQ5zObIDgqraYLotBC2FonW1GJSG6w/lRtKXtGTu
	qoBvcZO96zUfpspwombb9f0YOPKcQXBti6TyqpshjQPA5XQH2K3EDiy29RAkphdT
	UMf1StboNF8neyF2Vl2xZQ+BZBGtuipokBoQdMX/kJiiCs78QkFnjLzfS3d+8Bli
	/4KqFc+pGe73IL3TitlnwtBjvgE1Y6lPZaRONi0WqBf2wqmmHZYIW8t0hS6yukpT
	BNOUoA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vjbq2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Apr 2025 04:04:43 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-224192ff68bso57413215ad.1
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 21:04:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744776282; x=1745381082;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=70UL/+TvMgIg/Zg9WALcrQO76O4dSA2hdprkTpMTm9w=;
        b=CtZdSAyLff4puxVU00g1T5OxXk0/27F8VEK6xI9jhm+kyr5qBhFysCmuGcVQHQLkFa
         X+LRjP/VU9ecSAMQ/gWdJ01ny1gtLU01vfoubchVTSLdbDSFAd3DM0TiT8QfjhSzDe8q
         UU8oO80MzBvKERhmTZXI/SLH0qM7VJvWMB4SCoNLOcyuj3YenkA8RCGTQYznHHvn4B1c
         8Fv6YxKvbj0h8o7uIpj3s9CIrp4+zg3h/SNLt1idH/8YUHsNw2Ig4+sdKMGiA1dLzdon
         aNawEP865il5kyfVrvtvqtKpYSHkMH7m8IZ1IP0z9kOONQIuBLZxIG/AIDPrOjvfXVMt
         IJog==
X-Forwarded-Encrypted: i=1; AJvYcCXAr04Auc6mnIpvLng6wUC/Xh8LmOF5ffFou/r98tUMcvvYMnXPLc1ntmYKf0gHKCihV5wxE88=@lists.infradead.org
X-Gm-Message-State: AOJu0YxURCGf/vlGqMW+7Kr9Oefn9SoEv+gw0B/k6XeBp3SpmgcYaZrR
	LHUNOsmYuU8ldR6YPVy9OY3DMDd+wJnrXED+q7r9D4ODSsANU+AEm2TMsaMehIPZ+qgHXlyL9lF
	jXlMJlsA8uJ6sg96v0r1+lvvTVEH9T6srOwREPvRzULeG5J2e31ZUZjEtHiER
X-Gm-Gg: ASbGnctCu44g9jIviCrGVCv8fjPcEXCyVWnP+Xdx7yvgQ6DySMFipVM+FF6uiTP0JXk
	H3qr7K7jtZ9UmJfn12hnYyH4rCWSE3hk2RG6ja2tXqFQuVDvvgGpjp4Jpaae1y7+30YWyfNRuuT
	kELQjlzJyGTPVFCF0QCucSqMcnWIWIifaFYxdh+noe6gpPbBHoExlqVHbj81S7JcAaVcifBCetO
	Ba4FtTYrOl+e55wKR+mX+UGz7yMkwsrRVvLM5Lpo7evlrTI7ys+8nbdL1V+Do/houcQS2P6S++A
	SQ+p5L8MN4g7m8byDkNvrAxk3pf6TqzgaIhugSBnZyXWxi7tmL1XHA==
X-Received: by 2002:a17:903:1a44:b0:223:5e76:637a with SMTP id d9443c01a7336-22c35909c6amr5324965ad.23.1744776282662;
        Tue, 15 Apr 2025 21:04:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGoEBj1D4kIegDEZ6lgS23aKyLsMg4L8z7Pg7/7ytFTcfMeWqeteiRCTgt0vwpmqzWiR0XfEA==
X-Received: by 2002:a17:903:1a44:b0:223:5e76:637a with SMTP id d9443c01a7336-22c35909c6amr5324685ad.23.1744776282260;
        Tue, 15 Apr 2025 21:04:42 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fc4c8csm3685915ad.166.2025.04.15.21.04.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 21:04:41 -0700 (PDT)
Message-ID: <d21bc6fd-9e16-4d36-e8cd-3bb0f43edcce@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 09:34:39 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 2/3] wifi: ath12k: Fix frequency range in driver
Content-Language: en-US
To: Rajat Soni <quic_rajson@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
References: <20250408042128.720263-1-quic_rajson@quicinc.com>
 <20250408042128.720263-3-quic_rajson@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250408042128.720263-3-quic_rajson@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: w9FCPnXLwxqLi2IIVnezzpFgs4WKFKVu
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67ff2c5b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8 a=hbFnv7ZSs8Y9jydCB-MA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: w9FCPnXLwxqLi2IIVnezzpFgs4WKFKVu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_01,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160031
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_210444_174665_1D7FC178 
X-CRM114-Status: GOOD (  15.14  )
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



On 4/8/2025 9:51 AM, Rajat Soni wrote:
> From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> 
> During the initial WMI exchange, the firmware updates the
> hardware-supported start and end frequencies in the
> ath12k_wmi_hal_reg_capabilities_ext_arg structure. These frequencies,
> being hardware-supported, may not always align with the current
> regulatory operating frequencies. When operating as multiple grouped
> hardwares under a single wiphy, the driver advertises these values
> directly to the upper layer in the per-radio frequency range,
> which can be misleading.
> 
> Sample output snippet from iw phyX info command -
> 
> [..]
> Supported wiphy radios:
>            * Idx 0:
>                    Frequency Range: 2312 MHz - 2732 MHz
> 		 [..]
> 
>            * Idx 1:
>                    Frequency Range: 5150 MHz - 5330 MHz
> 		 [..]
> [..]
> 
> The frequency range displayed above is incorrect because the driver
> directly advertises the hardware-supported values to the upper layer.
> 
> The driver is aware of the current operating regulatory rules, and
> hence it can use this information to determine the final operating
> start and end frequencies.
> 
> To resolve this issue, add support to store the start and end
> frequencies received during the regulatory update event.
> Then, intersect these with the hardware-supported start and
> end frequencies, and finally, advertise the intersected values to the
> upper layer.
> 
> Sample output snippet from iw phyX info command after the fix -
> 
> [..]
> Supported wiphy radios:
>            * Idx 0:
>                    Frequency Range: 2402 MHz - 2472 MHz
> 		 [..]
> 
>            * Idx 1:
>                    Frequency Range: 5170 MHz - 5330 MHz
> 		 [..]
> [..]
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.4.1-00199-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
> Co-developed-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

