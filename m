Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58503E7719A
	for <ath12k@archiver.kernel.org>; Thu,  9 Jan 2025 21:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jjWG1bYTdqbLh8NAqdIp3J5nh3T7QSmrTPraAQAjW7k=; b=uc/obkTgbenaHTc46JpAHFyick
	9QTyx1/NCI36iDDRddtHVmoTPmSTgaFlbkWhvGmmsWYtJ+iUTX/NrLy5Q9Bbic09wunQ8U0lrYukm
	Ik2j4XO65zdYU7Hto/iivF0FL8bkewnU+2vGtieXTTLZaLFhqmOChXxak4oeVNcexs/iybVNYLqOW
	GO3nqvNvDtUqbj+ToT0TTWT3Kjnxfm5TCGXi1mKcRYoQ9oJQiHRlmYk4mTAneBUHH1Eamys6rIpfH
	wu4U0kBq2kWb9KgmrnB+wETIYGkIdsdQCFpWrwFWpgYceviPbUxfKFAJInqq3ewCNu/9YPk+ZYDec
	DgDNAWww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzlA-0000000DJqp-0VHV
	for ath12k@archiver.kernel.org;
	Thu, 09 Jan 2025 21:08:08 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVzXP-0000000DHyV-1Sd9
	for ath12k@lists.infradead.org;
	Thu, 09 Jan 2025 20:53:56 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509JqpVQ009895
	for <ath12k@lists.infradead.org>; Thu, 9 Jan 2025 20:53:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jjWG1bYTdqbLh8NAqdIp3J5nh3T7QSmrTPraAQAjW7k=; b=YMI5U5RHyrdrOrC0
	Z6MXxHVE1SPwuaLGblobZ9ckIDwvmV8/M0C+4IrEWCHJkGKyeRpcr5hhRIZcOJpx
	mgk7moMUZLCvmTc974kfIsNvfIJF/DOcrHfTfCxMLz6xV6oTXq23nNNTJP7dJvIH
	C+UovTeRh9PI8sRqFl/3tuUDell+3NdyrkjGZdZ6+yGxWmxTmDeadVlV3IH1vbN5
	q0AXyoq+pxr41wF2ys+1v5a4f+3ZPx1RLuhiN2SrX4q7IljLwSCw6gKGXSDOss2H
	27M5wKJktPBsLknPOHBX1C8NsbuU00qrMgxHVBGzB9qT33K51J6jB8vKOX/6f1vC
	JF6ANQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442n0gg3ru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 20:53:54 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2166f9f52fbso41042335ad.2
        for <ath12k@lists.infradead.org>; Thu, 09 Jan 2025 12:53:54 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736456033; x=1737060833;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jjWG1bYTdqbLh8NAqdIp3J5nh3T7QSmrTPraAQAjW7k=;
        b=V7xx+vdMWdkji3FJddvSdNSK34K3/AOS9tzw5dwKMdXr+u8yl3+QFAsgOwN2cwiZ9V
         s0If7T8VBmdwhEfj5OWrfXj62odJ9s1vEUbKlowB1wNeFBCAB5HvyqviOfOzNM/Lf5oK
         l6/XhGiK3hHKs0Wik1BeV/5wg3aqrmiHyXdvbnuB298/dC5YeQ71pKz8EwrmMUUKsHk7
         D7vwHqQ3TzRdukCzJb11jgm95HJPuUfHkIBWPv6rgbNcPknRhs8WV2XyzrUfZaQIMaGf
         fH6jvMAiuhDT3De0BgBaKJY0+IIAM40q7OFe5QR1DkT319DgZsnVxprLqcQZ6WNQ49kE
         I83Q==
X-Forwarded-Encrypted: i=1; AJvYcCWO8IHFhCWUkNnA6rEfT23xJTtFYjC6L+53u7l0GYFbognGGpgvvWGVNabHWatqRXMsiqR+Zls=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw5q6uSOdcinOQK1/ODD8kf9EjXYRLyisZzxwltm12sxtP7iuge
	2NljDgdX7Fc6QZvMHIaEGj9+/D+/fiVyMr8uqkZpE3zTHEmeoqW1sEfatCL0J7yonG4XKapYoDN
	mKQGJgRTMYe9IBGYkHh7s7jNIClj5bjxQqy1RtNLlFisC8CS7D0LxB0jW5sOo2pl4Olfu
X-Gm-Gg: ASbGncut21ngRcbpnjRQ2GvFgDm9CW09M/9VYXz0ZkC+pGJnP5jmKs13dR/6y03N+wX
	wWVpeYQm6bfTIRbgo/0jhx4HB9/nfVdDq8shA3+7qd949EX6S7XX5kGmzHHH/qgZVJOj4/aqkT1
	i6IfF187Rh14SRUe/IxGeQyQr3znlQcLf724K/4YasLGgLVuSdNRNJdShCg1SLSEli9LI+Vy7mn
	FFQpjkBaUUAAs+XudQMvyXCX/FIAdbxRPMTIxJbC62rCeTtjrSrZJ/iTUNnYaInQsoebqwR+mL8
	m18dcjJvXzXz+NAiAHy66iWSUdtP8hGkhXOT
X-Received: by 2002:a17:903:32cf:b0:216:644f:bc0e with SMTP id d9443c01a7336-21a83f502aemr138891685ad.24.1736456032826;
        Thu, 09 Jan 2025 12:53:52 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHBpiMVb3WnlkvxE8joPaaT4BA5vVWlpYlIe3cgFo9Nthp9ndwMQB5a2/Zj+9UeaWS3quU+bA==
X-Received: by 2002:a17:903:32cf:b0:216:644f:bc0e with SMTP id d9443c01a7336-21a83f502aemr138891465ad.24.1736456032484;
        Thu, 09 Jan 2025 12:53:52 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-a3193921675sm1667243a12.40.2025.01.09.12.53.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 12:53:52 -0800 (PST)
Message-ID: <70242ecc-c353-4973-bc04-e85b89a1aabb@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 12:53:51 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/5] wifi: ath: create common testmode_i.h file for ath
 drivers
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250109183551.1028791-1-quic_aarasahu@quicinc.com>
 <20250109183551.1028791-2-quic_aarasahu@quicinc.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250109183551.1028791-2-quic_aarasahu@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: in0eOc-yQc9MbIwrOHXEN3-BsqSZhv4T
X-Proofpoint-GUID: in0eOc-yQc9MbIwrOHXEN3-BsqSZhv4T
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 lowpriorityscore=0 mlxscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 clxscore=1015
 mlxlogscore=817 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250109_125355_514441_17D8FB9D 
X-CRM114-Status: GOOD (  15.91  )
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

On 1/9/2025 10:35 AM, Aaradhana Sahu wrote:
> User space application requires that the testmode interface
> is exactly same between ath drivers. Move testmode_i.h file
> in ath directory to ensure that all ath driver uses same testmode
> interface instead of duplicating testmode_i.h for each ath drivers.
> 
> Tested-on: IPQ8074 hw2.0 AHB WLAN.HK.2.7.0.1-01744-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath11k/testmode.c    | 80 +++++++++----------
>  .../wireless/ath/{ath11k => }/testmode_i.h    | 54 ++++++-------
>  2 files changed, 67 insertions(+), 67 deletions(-)
>  rename drivers/net/wireless/ath/{ath11k => }/testmode_i.h (50%)
> 
> diff --git a/drivers/net/wireless/ath/ath11k/testmode.c b/drivers/net/wireless/ath/ath11k/testmode.c
> index 302d66092b97..9d1613723601 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode.c
> +++ b/drivers/net/wireless/ath/ath11k/testmode.c
> @@ -1,7 +1,7 @@
>  // SPDX-License-Identifier: BSD-3-Clause-Clear
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023, 2025 Qualcomm Innovation Center, Inc. All rights reserved.

should be 2023-2025 to account for the patches posted but not merged in 2024

> diff --git a/drivers/net/wireless/ath/ath11k/testmode_i.h b/drivers/net/wireless/ath/testmode_i.h
> similarity index 50%
> rename from drivers/net/wireless/ath/ath11k/testmode_i.h
> rename to drivers/net/wireless/ath/testmode_i.h
> index 91b83873d660..b8fa5092e6ca 100644
> --- a/drivers/net/wireless/ath/ath11k/testmode_i.h
> +++ b/drivers/net/wireless/ath/testmode_i.h
> @@ -1,59 +1,59 @@
>  /* SPDX-License-Identifier: BSD-3-Clause-Clear */
>  /*
>   * Copyright (c) 2018-2019 The Linux Foundation. All rights reserved.
> - * Copyright (c) 2023 Qualcomm Innovation Center, Inc. All rights reserved.
> + * Copyright (c) 2023-2024 Qualcomm Innovation Center, Inc. All rights reserved.

should be 2023-2025 for the same reason



