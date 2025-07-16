Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C1A4C83F1B
	for <ath12k@archiver.kernel.org>; Wed, 16 Jul 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CtwVruHuIm50LWxWnF3hYBprC3Esh5tU1YhwYPkVmYU=; b=2b3Nr4rLhfRfZ6wlLpU/ayRIOx
	M4pFkcgITIanntJxM6PLVcB/La3IDUNuKMhHllJn0Tj2uYnyyLdZE/0uWvdWRFk5wbvF+EMGejX0C
	M0fP1XX36DuEmpWGKyfP1+twLiCJqe9vN9e7f7EeMj+B8eLA33d2032fsdKQMfmLI/uW81KmSjQ4Z
	npQjZJ2Yu1qrBKEHlsYJCwSHnyUuWuSbh4nrfVxiVqHozilFeuRQ/lSEkzEW42yCBVkpMI92ddK7n
	lCyySCMn7y1eh5jT9IHYYM+awwCuyzQ/tAaFvp9xFd4wfX8Nh5pbuqFpgEJ0yE2LRQinhdTk/UZXJ
	3tNo10Sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3q3-0000000815q-0SHs;
	Wed, 16 Jul 2025 15:14:31 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uc3oz-000000080sM-1M5C
	for ath12k@lists.infradead.org;
	Wed, 16 Jul 2025 15:13:29 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56GEK5Zh018184
	for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 15:13:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CtwVruHuIm50LWxWnF3hYBprC3Esh5tU1YhwYPkVmYU=; b=e+gLK6UhreOYA2Aa
	xtkjKj494E6LYe80ZfIfNJyd3pt+AB4+S7gZ7K48X6MuljSxX99DeoPz0Ng5tQsi
	UgPgvZB3nmwhm2oOQ8iA/aot5exJoX856ekXbPOZskao02kIRkA3+87oSBXiL9W+
	ALRrom7w1/khEkQayc0zVpCbCfQhHr/5oS2UJLakYyEse7cQ9IGDpkY5UC7ClauY
	uDIHQMEI/UotXcNnxnk+AC6CowmPYRbHxAhgx+EgLPib2wPXDCtoBhlde2JGfI2p
	o+GxVJLBBIkK9C2jTdxQuqqfUMqZgPcmXqigR/VsYLajTcSNQvbM5AxpZND/kLXS
	EOxzbw==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug384j5w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 15:13:23 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-313f702d37fso19316a91.3
        for <ath12k@lists.infradead.org>; Wed, 16 Jul 2025 08:13:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752678803; x=1753283603;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=CtwVruHuIm50LWxWnF3hYBprC3Esh5tU1YhwYPkVmYU=;
        b=b0itIf1LEYOsqijz6YCvEE13Tr/L0dpR4bPpnq+8mlgEfEOfq0x6DpNRmywjPwFVm9
         In9MSnbWsK7gs+1jPwImZV+qpV27+wU14oS3VeLE72QrdQ9uHUWYF2RwelJ/yj6u787c
         OX816Mdr7DQLutGKEYR6tK3Dz20o1dR86YUV0gb9WOr/ENu035TnGbDFfFFamdVqUSQj
         wfZuwxyuazu+KgPjZFw8f0n2b8RMpeJJnn2Bb31rayI4uiAPsrAB5G9iuuTTXAzQIkOA
         YCbCK/lo36HqyC5/sfmtMjzEZ4JgQKUbIZxz5BeHf5EXcvr4hkxf45YFfd3y0ueoGyYn
         yiDw==
X-Forwarded-Encrypted: i=1; AJvYcCX8Fow631kYq02gdqPxRGiKoMma6iepwBuIyBl/sa/ziJ9MKhkugIIHeWD2LweV4XSmLKuRB4k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzRG955X29I+f0Gb/3xb/MFB3t5rDFa3IUuo1mQpU/fbUukjQPz
	Uwx+jC1kPKv3YZ+Rf385683mUoFwyRrEDfoclXiObQo7ivs4URL0zMJVHgwPIFk7It8CugrSA2v
	Q2d2PBvhDifpPZ32A2BhnB0qSMjevuE8DbaMZK2MvMbf2bWlm1fxCBaoKoJbzaGPE
X-Gm-Gg: ASbGncvy3n5SuiFbNxqAfFcTkX/5fPBWwuWNIzHK61ihBZxa5XVSVk7oaNa0iIlYUTu
	uK76XBI50EZrASVowbFndK4a9IRXGLp94A1rOkhd5QknlDcZHStq98gkrM/EjN13MAv6ynbU8Ho
	UkwygFeDeDfrYsG7qMUf7Mrk6Cv6pG/ra5CNmQ/juf9Beq7kpRf1sgj3qgmAdPFjVUGeRW1WwRV
	ZzbhigeCn1T0PohqMheAXZK/G9lMVDAg/LFZect5erV9cLTX0g5kbTTS+zgHSuG0pqSM/U/LxTJ
	jC1b0sQ0o6cSoqgYZY/zkDwlVlnxnZV8qjeeMXAmhlKFjRRU9wUCgUi51LLS/W1bI4pJrHj0rwK
	l2lWTT/ZqIMbLi4GK7xA=
X-Received: by 2002:a17:90b:530f:b0:312:1ae9:153a with SMTP id 98e67ed59e1d1-31c9f4b4161mr3809055a91.25.1752678802566;
        Wed, 16 Jul 2025 08:13:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEblc3jY+0h7Aosh+m7nUh8Q/00sNNYAVcErrYvNH3JTZ8WRCcrDKpFARGnKRnqDBN3kK5TlQ==
X-Received: by 2002:a17:90b:530f:b0:312:1ae9:153a with SMTP id 98e67ed59e1d1-31c9f4b4161mr3809025a91.25.1752678801982;
        Wed, 16 Jul 2025 08:13:21 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31c9f1ba96bsm1582569a91.7.2025.07.16.08.13.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jul 2025 08:13:21 -0700 (PDT)
Message-ID: <833ce5f1-51b2-4d4c-a839-38989ea10344@oss.qualcomm.com>
Date: Wed, 16 Jul 2025 08:13:20 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/11] wifi: ath12k: Fix endianness handling in QMI
To: Alexander Wilhelm <alexander.wilhelm@westermo.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org
References: <20250716075100.1447352-1-alexander.wilhelm@westermo.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250716075100.1447352-1-alexander.wilhelm@westermo.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE2MDEzNyBTYWx0ZWRfX67zCa0BCS19o
 Bg/fxXXfEw1aSLJt1aM1N6NURVKcGp+B4oiQm+wcL92rX402cBHvezb5dYj4xuv0xZklHL+Ha5/
 GhFpIpTBFHYIDFcrOe+Z6RUB5mYfNffcRCE5B6JV5ltW5aE8NEvzmKKX2BNOqZkm6G8/Y+sIo4x
 7Mg0O2Hg2ESez5R2xaYXhRRcjNbnNXA+agxOBbrMjzPWQA4/VyBQdoJsqY/Ac2Q+dGnyDkFGKrA
 M9b3KuCvtykMucB/QZyELuDAe6T7iuen+kNVSqClsewPQBG4fdq5V/EXZB0HId/BoZehhVyH2AF
 TfEpNVM+S7NgxQWjpkdeSq84PABdK9phNh+r4yoCgvlLPZLfJc/ybgq87382CT9HaT+cAdkjkVB
 cGdg4ppypQI9N6oPVmL6HZpEoW+PEaBzYskzltMtADOvCoEukQW4Fb/e/NyXAUCmVyp0C5/w
X-Proofpoint-GUID: H-xxrjoafg80U1M23JgGWLMZxUf1_W4-
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=6877c193 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=bi_AWBljq3a5P2oXxVQA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: H-xxrjoafg80U1M23JgGWLMZxUf1_W4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-16_02,2025-07-16_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=999 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507160137
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250716_081325_490885_D9BCFCCD 
X-CRM114-Status: GOOD (  16.70  )
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

On 7/16/2025 12:50 AM, Alexander Wilhelm wrote:
> Fix endianness handling in QMI firmware transfer on big-endian
> platforms. Without this fix, the firmware download fails due to
> misinterpreted data structures exchanged between the host and the
> wireless module.
> 
> The issue occurs during early bring-up on big endian systems, where QMI
> messages are not correctly parsed by the driver, leading to failed
> initialization sequences. Ensure all relevant fields are properly
> converted between CPU and little-endian format in request and response
> messages, as expected by the firmware. Attached logs showing the failure
> before the fix:
> 
>     ath12k_pci 0001:01:00.0: BAR 0: assigned [mem 0xc00000000-0xc001fffff 64bit]
>     ath12k_pci 0001:01:00.0: boot pci_mem 0xcd4148e9
>     ath12k_pci 0001:01:00.0: pci probe 17cb:1109 17cb:1109
>     ath12k_pci 0001:01:00.0: pci tcsr_soc_hw_version major 2 minor 0
>     ath12k_pci 0001:01:00.0: request MSI one vector
>     ath12k_pci 0001:01:00.0: MSI vectors: 1
>     ath12k_pci 0001:01:00.0: msi base data is 0
>     ath12k_pci 0001:01:00.0: Hardware name: qcn9274 hw2.0
>     ath12k_pci 0001:01:00.0: boot firmware request ath12k/QCN9274/hw2.0/firmware-2.bin size 15134776
>     ath12k_pci 0001:01:00.0: found fw timestamp 1722934582
>     ath12k_pci 0001:01:00.0: found m3 image ie (421880 B)
>     ath12k_pci 0001:01:00.0: found fw image ie (7229440 B)
>     ath12k_pci 0001:01:00.0: found dualmac fw image ie (7483392 B)
>     ath12k_pci 0001:01:00.0: found firmware features ie (1 B)
>     ath12k_pci 0001:01:00.0: features
>     ath12k_pci 0001:01:00.0: using fw api 2
>     ath12k_pci 0001:01:00.0: dualmac fw selected for board id: 1005
>     ath12k_pci 0001:01:00.0: Assign MSI to user: MHI, num_vectors: 3, user_base_data: 0, base_vector: 0
>     ath12k_pci 0001:01:00.0: Number of assigned MSI for MHI is 3, base vector is 0
>     ath12k_pci 0001:01:00.0: Assign MSI to user: CE, num_vectors: 1, user_base_data: 0, base_vector: 0
>     ath12k_pci 0001:01:00.0: Assign MSI to user: DP, num_vectors: 1, user_base_data: 0, base_vector: 0
>     ath12k_pci 0001:01:00.0: irq:18 group:0
>     ath12k_pci 0001:01:00.0: irq:18 group:1
>     ath12k_pci 0001:01:00.0: irq:18 group:2
>     ath12k_pci 0001:01:00.0: irq:18 group:3
>     ath12k_pci 0001:01:00.0: irq:18 group:4
>     ath12k_pci 0001:01:00.0: irq:18 group:5
>     ath12k_pci 0001:01:00.0: irq:18 group:6
>     ath12k_pci 0001:01:00.0: irq:18 group:7
>     ath12k_pci 0001:01:00.0: pci after request_irq msi_ep_base_data 0
>     ath12k_pci 0001:01:00.0: cookie:0x0
>     ath12k_pci 0001:01:00.0: WLAON_WARM_SW_ENTRY 0x2
>     ath12k_pci 0001:01:00.0: WLAON_WARM_SW_ENTRY 0x2
>     ath12k_pci 0001:01:00.0: soc reset cause:0
>     ath12k_pci 0001:01:00.0: MHISTATUS 0xff04
>     ath12k_pci 0001:01:00.0: pci link_ctl 0x0000 L0s 0 L1 0
>     ath12k_pci 0001:01:00.0: pci reg 0x3164 instance 0x11 read val 0x11
>     ath12k_pci 0001:01:00.0: setting mhi state: INIT(0)
>     ath12k_pci 0001:01:00.0: setting mhi state: POWER_ON(2)
>     ath12k_pci 0001:01:00.0: mhi notify status reason UNKNOWN
>     ath12k_pci 0001:01:00.0: mhi notify status reason MHI_CB_EE_MISSION_MODE
>     ath12k_pci 0001:01:00.0: qmi wifi fw qmi service connected
>     ath12k_pci 0001:01:00.0: phy capability resp valid 1 num_phy 2 valid 1 board_id 84934656 valid 1 single_chip_mlo_support 0
>     ath12k_pci 0001:01:00.0: intra device MLO is disabled hence skip QMI MLO cap
> 
> Alexander Wilhelm (11):
>   wifi: ath12k: fix endianness handling in QMI host capability request
>   wifi: ath12k: fix endianness handling in QMI phy capability response
>   wifi: ath12k: fix endianness handling in QMI firmware indication
>   wifi: ath12k: fix endianness handling in QMI firmware memory indication
>   wifi: ath12k: fix endianness handling in QMI respond firmware memory
>   wifi: ath12k: fix endianness handling in QMI firmware capabilities
>   wifi: ath12k: fix endianness handling in QMI bdf download
>   wifi: ath12k: fix endianness handling in QMI firmware m3 info
>   wifi: ath12k: fix endianness handling in QMI firmware wlan mode
>   wifi: ath12k: fix endianness handling in QMI wlan configuration
>   wifi: ath12k: fix endianness handling in QMI response
> 
>  drivers/net/wireless/ath/ath12k/qmi.c | 149 ++++++++++++++------------
>  drivers/net/wireless/ath/ath12k/qmi.h | 106 +++++++++---------
>  include/linux/soc/qcom/qmi.h          |   4 +-
>  3 files changed, 136 insertions(+), 123 deletions(-)
> 

Frankly I'm shocked that the low-level QMI encode/decode is not doing the
endian conversion. Since the Qualcomm internal tool that generates the data
structures has always generated structs with cpu endianess (i.e. u8, u16, u32,
etc) I just assumed that endian conversion was handled at a low level.

So should this issue be pushed down to the QMI encode/decode rather than foist
it upon every client's read & write?

/jeff

