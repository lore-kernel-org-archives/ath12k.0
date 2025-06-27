Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BFE0EC7EE2A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 05:39:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oxTpg++xQo/Kx2N25g5VpBf60MBGualJNHTFqUV2XeE=; b=MXKTvHNztNX7LVO71m3j+0AYtq
	ITy1OQZOsCu6jm45vTmgeJd7wAuN+m/FC+H/OnE80fjoMl8b2Ncjy5ynz8zr6jS88RBCFwa3T+UjH
	tmmzhPuuABRLHrlxcyOA5a6WZ+slDtCuOexmtJ9e8y0rgfHBlVExa3o6KFLLiYlb7obm+9zF22fJN
	qujFu6WHVaUWySiXVPsbCX+SjCDLCfRhlJfHPy29xIgSf2j41lWKiMqywN1Dw8EbFHZzIZn8K5lOM
	pGjNz/Y+SCmSeKzlq+ZptB6U58Q5hK7zeppxCgxau/l5A6G3Dcu+Z3z6h4lmTebWg+KaOMEP5810g
	YFD8XA9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1nx-0000000Dd7o-1WFC;
	Fri, 27 Jun 2025 05:39:17 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV1nu-0000000Dd6o-1M1n
	for ath12k@lists.infradead.org;
	Fri, 27 Jun 2025 05:39:16 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55R4DJ1B028748
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 05:39:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oxTpg++xQo/Kx2N25g5VpBf60MBGualJNHTFqUV2XeE=; b=N+xn0yDwZVR2MZss
	MUe+jtNxU4bz3McjadRTik1fjTCK1ttWOEJMTPT5tU+pUwa4l7MSYT7ZaQyRhCGq
	2yUK1f8yPT1EnAErMuTeUoUlhgtpgKRuSh7hEuhsZrF1VCZOCi8AHwLlhmgnUiCk
	+lLEkNuJCqV48yFLUCCod35ZARTYg/riYubiKS2+BC5Kne4A9YsghJ6UVjCsW6Gw
	ICuRIT9NGCm4JDBek7HLQwAFKaa0ySNY1lRcOonQ8bFJp/4O2PGquf8Wpof6ZOsM
	qfxr2npfANPjvOrNTMExcqOL8eGVBmmQwXOXAOIxiasLNIqgfjJadraviFexlvBc
	8FQSrw==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47esa4xusx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Jun 2025 05:39:12 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b31f4a9f67cso2047351a12.1
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 22:39:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751002752; x=1751607552;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oxTpg++xQo/Kx2N25g5VpBf60MBGualJNHTFqUV2XeE=;
        b=ikYDx9r9NJJiItna3Yjy9A+hkPdDAgXnKBLzK5mmT5FaBk4F+p5ZN5GRJlSwvlHp3w
         dSzfILVDwVBWCK+OQTpesxwH++ScApGPmfR70hWJXw+IATozqjd1KeZU0OwGCRCcNY5G
         H2Ke2GB34Yjg7U1Qa40SGbWxvPt2ZtTLra2atApUStaXyVgifxgvHpEuPL6htcffnPf/
         iSKEM08rZP6WRThaFjaeoJ/cfPmsT8g6vms7ycyI4ELXgxLGJvgayCiNkINDJdg1bdpi
         oPRz8HsNkrcsab37c4J6GDJtyhijM+Wv75UhOpaSv70EI3F8phxgdxBaIsmGzGJNHIRy
         i1ew==
X-Forwarded-Encrypted: i=1; AJvYcCU/S1dgyOCA0E9okS78BOcpIt4GLrP6BsXqF822G6W+nmka044SrOIw1xHHpDr/iTRXZQ6wss4=@lists.infradead.org
X-Gm-Message-State: AOJu0YyMtcHOEbHHfBIRiEayLgTe/BIWsmfLhf+KAHxmpkTXs1V1UB+l
	MLZEo9yAj78oJ3jFA1zEGybD+M36iRfbaC9yhGsEv7FjVh0ZN2Pf/yryl6T4BHrfLX+6SQFjnZU
	XEEKh/+TvPY/Dj3LvooqfhgBHkIYKjfq4hyuRnSJDfy4ihJ2qggwRkDjtjKtaptHJ
X-Gm-Gg: ASbGncsHqMqSC1PvwtThShIeoIYw7p60kF8t0xsrZ5MUaNeXUebsjXA9WJjxfjTV8JK
	IjZI+F5KZ2kbDyxJUVhzAZJpaufOVknLNVK//XUWOliv32G02iuxB9uDzdZcCE8FYc1H9TZCNyx
	A/QTqKiHYVT+hW520Z8TLnDQ2pKPPjZYHUvhT1sakh1KjRhi2WKM+45c+oB4yPvUAt5JQ7n0gm+
	yGdXuEhX/nzc7t/JB5MQ4wUuDOYb9lzvuk5ylrlg8hhN5Q+Z/WDFvQ3ETgXUNNzETUxqsfwoeHm
	EiMQRVlC0Y5Gb25IxDWFzMckhDjgOhPvBbD1hygICxc9+GQV03udGz0so2U0Qv+EbAaNlyFfWb2
	j4trYNee5rt4Enw==
X-Received: by 2002:a05:6a21:3394:b0:203:bb3b:5f1d with SMTP id adf61e73a8af0-220a113ca4dmr2982003637.6.1751002752144;
        Thu, 26 Jun 2025 22:39:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6SJ90oL14ce7W8awMAVolaiw2uwi0whL5nP8wepFa/D1DEk94f0Oa6WqT/XC4xbcrBTqKlQ==
X-Received: by 2002:a05:6a21:3394:b0:203:bb3b:5f1d with SMTP id adf61e73a8af0-220a113ca4dmr2981969637.6.1751002751716;
        Thu, 26 Jun 2025 22:39:11 -0700 (PDT)
Received: from [10.133.33.95] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e31d85b4sm697467a12.56.2025.06.26.22.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Jun 2025 22:39:11 -0700 (PDT)
Message-ID: <0ba2176e-3339-4a8b-850a-ca5643939c8b@oss.qualcomm.com>
Date: Fri, 27 Jun 2025 13:39:07 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k_pci errors and loss of connectivity in 6.12.y branch
To: Matt Mower <mowerm@gmail.com>, Jeff Johnson <jjohnson@kernel.org>,
        will@kernel.org, joro@8bytes.org, Robin Murphy <robin.murphy@arm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        1107521@bugs.debian.org, iommu@lists.linux.dev
References: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
Content-Language: en-US
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
In-Reply-To: <CAPDiVH8gaBH6o_OY-zUWYpDbj5mhiqmofKGb71gLgHOi4vA=Vw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=eLYTjGp1 c=1 sm=1 tr=0 ts=685e2e81 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=xNf9USuDAAAA:8 a=1nlNwiK_QeuRR0xryQcA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: hXbmX6LNrhKnkfkdLpXmUcefDTO8tniu
X-Proofpoint-ORIG-GUID: hXbmX6LNrhKnkfkdLpXmUcefDTO8tniu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI3MDA0MyBTYWx0ZWRfX+RxUyLVreXDj
 RgA0dpsxKd1huEzij5WoiSMLnA1j9hhUJeKue3kgirjQ1Hf9I6usut5fT71I+9wxaDxmlqS+DqQ
 VslDTa6lkXW6AcnDmPftgibtjIszc8LfRIF8xpeKg7v22XUwmedyUhlllGJEMvcCcMHqpLjP+96
 uP491sFWbET9zx2OKRFkUNxTMYagoG3k0ydWJVjQct5+/jmMf5NrckiQ+6p3vM82ASE7Xd//ptE
 XzIeBZ7CsFxUjVvhP2IS2QrjFvPniQOSabB148A8kwKfK/uiBGjzwwqwtkieBZyMAbSVSkJnbFh
 xJrS8VN2OEGmYg1wJVmIvrNdkDI7Vjrzl4I15ik2WOAXC16DhnOWm9B8qqF3Rhurzk1sL3ScsXr
 +sABegOIgGxvboBPZ5thmqtEKNrnvn3JW+PxnlcSIwewy1GIsLuYC28SpWE7bTVrHQR/aZoS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_01,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 clxscore=1015 mlxlogscore=999
 suspectscore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506270043
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_223914_366015_75A02B4B 
X-CRM114-Status: GOOD (  21.75  )
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

[+ IOMMU list]

On 6/27/2025 12:21 AM, Matt Mower wrote:
> Dear maintainer,
> 
> I have been experiencing lost network connection with the ath12k_pci driver
> in the linux-6.12.y kernel branch. Often, when the issue occurs, the
> network does not recover until I reboot the computer. A full report of the
> errors I encounter, the symptoms that arise, and several dmesg attachments
> are in https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1107521 . I have
> attached a dmesg from 6.12.34 for convenience. The short summary is:
> 
> 1. I started noticing log lines like the following soon after boot when I
> updated from 6.12.22 to 6.12.27. After these events occur, the network goes
> down and often does not come back up.
>    ath12k_pci 0000:c2:00.0: AMD-Vi: Event logged [IO_PAGE_FAULT
> domain=0x0010 address=0xfea00000 flags=0x0020]
> 2. I was able to reproduce this issue very rarely in 6.12.12 and 6.12.22.
> The issue always occurs soon after boot in 6.12.27, 6.12.30, 6.12.33, and
> 6.12.34.
> 3. I have not reproduced the issue in 6.15.2 or 6.15.3.
> 4. In some cases, when shutting down the computer, a kernel bug caused my
> computer to hang. I haven't determined whether this is related to the issue
> above or an independent issue. Search the bug report
> for PXL_20250611_140820085.jpg to see a picture of the kernel bug on my
> laptop screen.
> 5. I have tested two firmware versions:
>    a. fw_version 0x1108811c fw_build_timestamp 2025-05-17 00:21 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>    b. fw_version 0x100301e1 fw_build_timestamp 2023-12-06 04:05 fw_build_id
> QC_IMAGE_VERSION_STRING=WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Thanks,
> Matt
> 

I had a quick test with 6.12.27 kernel on both my Intel desktop and AMD RD but didn't hit
the issue. And I am using WLAN.HMT.1.1.c5-00284.1-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3.

As mentioned in the Debian bug report, since reverting ath12k patches does not fix this
issue, maybe it comes from the IOMMU subsystem?


