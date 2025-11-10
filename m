Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31079CCFA13
	for <ath12k@archiver.kernel.org>; Mon, 10 Nov 2025 15:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NCoKBD4Qjvh74ye/aYs598WKJ3COZ2RaZcQENxaxf1M=; b=cj8QMNtCdVd0sRqoJslOC5ZCOH
	ARVmHZkRwvCcFU2xJ7ICfGAvi/q10OZN9inoFAhtrKiCq6mYohuMQvfteUVw2ur57z3cWgbpte4Pb
	9N7Lji3cpKe1Mrkh1lwIXDlz+A4tQSXHwaXZpSP07+TaSzOswtBalFPqxt6HyU9EvZRWoFMxrfR0S
	7EHdrs5rXstn1oZRat0f7rGkdTyBIJCSjWzy4G0F7pB4EX3I4f0mu+Gzh+ylMgANKG+seresFywqj
	1h/D/HFvE2sEl+/iPro3cZdKVWAr71NfFj4MHBmieERLhwP8sW1P/3bL1mUo3qka7TiT4tPyljIks
	fObFF2NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBZ-00000005jca-410e;
	Mon, 10 Nov 2025 15:52:05 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUBX-00000005jbj-19wC
	for ath12k@lists.infradead.org;
	Mon, 10 Nov 2025 15:52:04 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5AA9EjWl2992480
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 15:52:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NCoKBD4Qjvh74ye/aYs598WKJ3COZ2RaZcQENxaxf1M=; b=kAg4TwtoK+8hjeLl
	2ybeWk4qWEwF9c/WJA48VDUaH928bx3q2VWEa4pMSaHdP6pke93WbE09P9pw0X7v
	LzRE8zoWd4m8wSDzzOLIhoWZ2Nvg1yStv7b5XC+JCpNjSrO9/ofyqYq5ioVCygG7
	A8LHnkcC/CDYt1rbRCMlFNnnL0wxlRS94NOFbQJ5qP8qqOfzpb6+RJPUVU+KRpNP
	Aid2tcCX1dufltyf/WCGt8LVoc+28IkJwBjNQ23L3NQ9+ohmqHNH35Keuyvwd6/X
	sp/H9BG9P8WWIqqRVNrKyGcsJFT/U3cLRWLbfRGaXywwluRiQDvlw5yiCGDoQ8QH
	euwiBg==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4abd88s5ck-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 15:52:02 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7a153ba0009so7192828b3a.1
        for <ath12k@lists.infradead.org>; Mon, 10 Nov 2025 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1762789922; x=1763394722; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NCoKBD4Qjvh74ye/aYs598WKJ3COZ2RaZcQENxaxf1M=;
        b=P3xLeRS/p37U3kbS7r/7DxdB0NUk7Rdawe81yDK2A9UaPJsgUDcpEFU++mDUPef0nR
         iYnZGHW0NSldm/Tvus/Y9mNP66dUsIi/fvAcgGYbFfHbr+yczDgbS0i/TX1xwWE4cjRt
         1o/+Zt8HMxNP/zRa/kFRgOkonpwweAVB8l7CrLHQ+H1BEOAILTZxV8QaHOyJ8Ai5sFno
         zaKyNO4xpcYrUBfvkPyJCFEN1MqKWHyKKqL24GyiJTiwi07x8M8axDiIO8RhS8YQ4aIR
         TwV52ath3hqyK0hmqpmvfJgoWt61Cj41dzd5euk1oLXDEv8yscM1iJbfrWWOQUpHCB/Y
         TlVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762789922; x=1763394722;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NCoKBD4Qjvh74ye/aYs598WKJ3COZ2RaZcQENxaxf1M=;
        b=ONTc/Lfk0pxxt2IKo1bLGiGBXCJyi0gRMLQaG+SqU2O25zhio/S93buWMbV/oJTQ0n
         ecwv33LQ+hAxf//5La2AIF/3bEn+kJVykTZTnZ0Kw/vDkiJFyEqxBUpbxcfpDtAaNcId
         qKIWmcPty0fmXEbizCsYAQK2sQVIY98u85LzIhzEmRTQ+bx1I4keJNonaT03lgj+0vlh
         wJGyniSeUOuo66MnuBeJI9NDHnyS/mc8xPaLzR0aZ/L61DWus5FrrxrTooi8uF0czMUr
         q1A6KAMh3KS4UWBtQp842tDIyx1xZXkTkvkWOjpa3E9p9VTo1j7/I4tO3686eVMi46Yy
         4c5A==
X-Forwarded-Encrypted: i=1; AJvYcCUigafn23Q/gA31TcaegqUMyKgUGDb3G0UizqOxCjvaCvl/Yz/pc8A8y7Yaos93djELXTspTfc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxvIc1pmYC1N7GEbj/rUiKrm0RWqlc5OOqJXwzDXy7HagrFSNy1
	LrUpW4LNZaDOQ3CgYzcOgeJ4sgC+MiLJ/l/Evu5aBe5U8zQ/LONvjBV4sCgAB4H02Du+yAvvPDw
	t5JoYQRKrqPKZ2jBAwrZXgAPVeI7xZ0PAIWuwyrVGFodkaKIyoPUm2TvjF7/RSXHI
X-Gm-Gg: ASbGnctBiN7SjKAH7hbLnBvNZweisW2GtbI6vsh7pZDrxm5Jr2dZfo6eRV2Q7hCno8f
	H6ZHIgQ5i4N84sF7iJb64groZHPwJ5nfhGwhMd7cFyz4MDbBW7gPC7zGGzOcaFFCUVD3J0N1sp1
	yGVrEodISi0U7ikeHa3HOCh5Aepceq1VhmVXXCBF3oA/PSTzJdu4rL4CdZDpjKBTjtu3B/ddSWc
	ZDZDABKhVFwaYKXi0dXENMsqvylRJrdjSW4iSiPT3IDAjsim0kbmYFbkMXXl3wqi1bGsx4ZZR0E
	hRPz1GKy7RSsVUNyH04MUfpLYQi5Xmu6x2ZJbfwMctoikADHoZ4xJTk1Yn/G0AuqOeI8T5FyIju
	zwIiHNbmw8By1Z1ga73JO49+KV1V3DmkwR7/dfzqNXvrzOjg+4To=
X-Received: by 2002:a05:6a00:2d11:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7b225ae08a9mr10984488b3a.7.1762789921765;
        Mon, 10 Nov 2025 07:52:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFEeakJN5Qfs3AlzxqMzv75PYWCOMZd5H380WTJ4OIK5FYGQM/w4T/reySFWpmIYE3VS6Dd5w==
X-Received: by 2002:a05:6a00:2d11:b0:792:5db2:73ac with SMTP id d2e1a72fcca58-7b225ae08a9mr10984445b3a.7.1762789921168;
        Mon, 10 Nov 2025 07:52:01 -0800 (PST)
Received: from [192.168.225.142] ([157.49.194.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7b0c953e791sm12561248b3a.7.2025.11.10.07.51.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Nov 2025 07:52:00 -0800 (PST)
Message-ID: <a97adb16-8599-89b8-9739-d0266ea16233@oss.qualcomm.com>
Date: Mon, 10 Nov 2025 21:21:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath12k-ng 00/12] wifi: ath12k: Remove the Wi-Fi 7 header
 inclusions in common code
To: Alok Singh <quic_aloksing@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251110103713.3484779-1-quic_aloksing@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: pT_QY79LMAAnofdbE0KudWYHY0EgrCbx
X-Authority-Analysis: v=2.4 cv=PL4COPqC c=1 sm=1 tr=0 ts=69120a22 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=JZB7jehsBYXywv9cSu3mwQ==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=rApeeKJKgo9SdP4gWbgA:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEwMDEzNCBTYWx0ZWRfXwVHadg4z58Ne
 1074mEpj+qJvbqRkdh8cG5qQmoh724+3/sT9Ri45/vdUosHsMlfdccf42CcoVmWb2dB9OIJlZgb
 ncWWJw5FT5pAEUnOJtEsgJD3//YQbpoO7on0H0VH0iO3Y3qenHe7dmPl1Yn3Dew1XZAZaahDp6a
 tr5YIuNHZVDwENwmgpzLq7El5/7HlfQK1Lb8bCP1elvDtjcNUa7G+4vq6eh0YVTgYRsx6KcrOrn
 PgrhZv3LYtqxu6/j8fBJtxiOxa8H1fi1Y9CcDb4hn2fMiC7wGCtqGe1/ZNolUgsHXfWQ/pJJA9W
 e2UE6Z4R9aLefHUpYQoMM1u/BhSmx3r396344axCJdgkmmQJiHmh2brUr0A/ke0t4AvhKh9a2Zp
 udHYl36QNTzgWcEJSFdgGa+bqRdu3w==
X-Proofpoint-ORIG-GUID: pT_QY79LMAAnofdbE0KudWYHY0EgrCbx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-10_05,2025-11-10_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511100134
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_075203_335152_E5EC0AF7 
X-CRM114-Status: GOOD (  16.42  )
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



On 11/10/2025 4:07 PM, Alok Singh wrote:
> Idea here is to Remove the Wi-Fi 7 header inclusions in common code
> As a precursor to the movement of Wi-Fi 7 specific .c files to
> ath12k_wifi7.ko module, Remove all Wi-Fi 7 header inclusions (`wifi7/*.h`)
> from the common `drivers/net/wireless/ath/ath12k/dp_mon.c`.
> The common monitor functions now compile solely against the core
> ath12k headers and remain part of the `ath12k.ko` module.
> Move Wi-Fi 7 specific monitor implementations to a new
> `drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c`.
> This file is built into the `ath12k_wifi7.ko` module.
> 
> This patch series refactors the ath12k monitor functionalities
> into common and Wi-Fi 7 specific code.
> 
> The series includes the following changes:
> 
> - Patches 1-11 move various monitor mode processing functions from the
>    common ath12k driver to the Wi-Fi 7.
> 
> - Patch 12 removes the Wi-Fi 7 header dependencies from the main driver,
>    completing the separation of concerns.
> 
> Alok Singh (12):
>    wifi: ath12k: Move monitor ring processing to Wi-Fi 7 module
>    wifi: ath12k: Move monitor status processing to Wi-Fi 7 module
>    wifi: ath12k: Move MPDU pop functionality to Wi-Fi 7 module
>    wifi: ath12k: Move RX status TLV parsing to Wi-Fi 7 module
>    wifi: ath12k: Move TX monitor functionality to Wi-Fi 7 module
>    wifi: ath12k: Move HT/VHT SIG processing to Wi-Fi 7 module
>    wifi: ath12k: Move HE SIG processing to Wi-Fi 7 module
>    wifi: ath12k: Move EHT SIG processing to Wi-Fi 7 module
>    wifi: ath12k: Move remaining SIG TLV parsing to Wi-Fi 7 module
>    wifi: ath12k: Move MU user processing to Wi-Fi 7 module
>    wifi: ath12k: Move MSDU END TLV processing to Wi-Fi 7 module
>    wifi: ath12k: Remove Wi-Fi 7 header dependencies from common ath12k
>      module
> 
>   drivers/net/wireless/ath/ath12k/dp_mon.c      | 3474 +----------------
>   drivers/net/wireless/ath/ath12k/dp_mon.h      |   62 +-
>   drivers/net/wireless/ath/ath12k/dp_rx.h       |    9 +
>   drivers/net/wireless/ath/ath12k/hal.c         |    2 +
>   drivers/net/wireless/ath/ath12k/hal.h         |   33 +
>   .../net/wireless/ath/ath12k/wifi7/Makefile    |    1 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp.c    |   16 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp.h    |    1 +
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.c    | 3354 ++++++++++++++++
>   .../net/wireless/ath/ath12k/wifi7/dp_mon.h    |   23 +
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.c |   19 +-
>   drivers/net/wireless/ath/ath12k/wifi7/dp_rx.h |   11 +-
>   .../net/wireless/ath/ath12k/wifi7/hal_desc.h  |   19 -
>   .../net/wireless/ath/ath12k/wifi7/hal_rx.h    |   15 -
>   14 files changed, 3570 insertions(+), 3469 deletions(-)
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.c
>   create mode 100644 drivers/net/wireless/ath/ath12k/wifi7/dp_mon.h

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

