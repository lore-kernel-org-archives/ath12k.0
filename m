Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E877C7115B
	for <ath12k@archiver.kernel.org>; Mon, 23 Jun 2025 05:22:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=GR5tZKoeXtivK3tT/8aasRTMEc
	OcdoHOtnalBEkX+PGsXFqQdgrCbo8bQaix6k+jadFthnMlA+eSbXuZGdzq5UXfRWzMzAjXoJbUrlQ
	nz4Iis8OC3yNI5CVTvbq/i+eiDS+WIdKQfbtmlmo1gdjZ/DAk/QTpHmRDYN9Le+1+D4VSzzEA54Nd
	YF1aeh5iIabyjtY6HgqLa0WY8MrVmp0is8foF5ofJCPrEG3LOiDC6GlAsWMtAJDxretw6hSkIAbXa
	/ne9grMT1cdejiaZuc845d5dtBeyiSnP03gJq7xTLImSzI0goz/QPTPmb3TIfR23gTKJZ+Zv54spR
	ZsKjcowg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdr-00000001c5T-0CX4;
	Mon, 23 Jun 2025 05:22:51 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTZdn-00000001c47-3S6p
	for ath12k@lists.infradead.org;
	Mon, 23 Jun 2025 05:22:48 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4dM04014395
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=; b=YxtkILJ22j77Lvbt
	1AWZYgTxsA0nxvlFD65y0HkRFD4ThGDotDJVoAy22T7Z40KaYzNpqzVZ696K8SUq
	UYfogTeIyUmh/LRTP7QtaU1+oa5X1TFKBdLOHPbsVSDuJxaSfNHSbnQR8KLqajef
	3q3MrwocUgpRr/X7k1yp+YADnvhoBgRe1504WUcDPQve9nncTqMKwJdB7x/i7sJK
	ES6EE7ennAouWY0hRYWyrSarQj/5p3aW1EpKLm8jDgHi0YLtEa1Jlb+ZTlYAAyCy
	1SheVsZI8jd6PdsAnEAZM1pXrGg4Y15t0dJO0yZUw2kd1/TWt7vMHTRI//FmGa3E
	ogfi8Q==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f03b02jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 23 Jun 2025 05:22:47 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b31cc625817so2871656a12.0
        for <ath12k@lists.infradead.org>; Sun, 22 Jun 2025 22:22:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750656166; x=1751260966;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hLTjHztutua3z5I4nsvOTKbG4m9yNPn0gh8iTJrQ/94=;
        b=Z159hHmg85Jc28hJhljGmZE4lngqZgPWXhkAzgyZ/PMaN8lXN6ieSgmVYPX9rruh5I
         HGsKqfiQOIfCU/SMqtubOmU1IaOiHaEDtp1Hnh0U97P9O+wndJ2Yzkdqp6CYXKhb2jHB
         YZ0SbPI9pjUThC96nbrH/DwUdPNE2475ApbTUZb0iQ+WqWx6MYM1WpbnEtgj8RCe1UCE
         /lB8XR89uGU3HnVqWlPS12bkFQb+o1DK8NVhyXq3i7OR0WPU5KBaSrFozKctCeRXr22z
         zCHCa+A9UpabwysBplyj8b40rxZmuMrGUXcNOrNPSZ92avbgBtRyz9CPwUVom60BYSbJ
         Z5QA==
X-Forwarded-Encrypted: i=1; AJvYcCVEyvgKIV1qZ/uBxPxDUymF6F9DPQTafZOtdyg5Kn5BPpCL5oNATsuPz17mQ5uq3IihUCBBKuM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzdGKjJVF3p7MRzMIzEVYM1vdLDg1xwKC5NcBZbyZ8rLYzePOR6
	hXuK3AyTc5p1A+wfkxaX0aBiTDLK8GG1QRpxgFi1LtjjgpKXVZ3yE3sUFgBEIbQ1Rmcyv+kJ84v
	9fmnWVXU0uiXQK2KW7B+uKj4nyIRfYwp/GWVwBGUS/Wrjh6idvizzSIFFHwj8pWD9
X-Gm-Gg: ASbGncsUuEg0xYZQNSm8Uy8jWzATYMRaTdXBuejXKwvN+jU9nJEKm+BmOQzQ+PqJhKH
	R2ZThh3BjLkfbt3fY79YVTbzzLx2Z++9+LF5E5f4yr4ThtCSYEKDNFOoVTUaTwLGyuyBcgxWUeY
	E7BNn+uoVmRAjGrSkcmSW+OCqHSXKHKs1YNBFm1cUgyxq+URznC9PJdiH/zvhhb+L15kTJurEpk
	CUcQnYcPmQ59T00uE/GtuCVlJkiUsH1YyodA2qODp2f6Y7B3kAoLTNsu/j25+KTPEiWqgqC44is
	AT3WOmfZEQeHcAQMy/yZ5dFayNA4lbY+AY28BewPPTAsbHF5iLp1yCMmkNwf9dVR
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842785ad.0.1750656166369;
        Sun, 22 Jun 2025 22:22:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPbiH4zXPXU8XN3CMiJXdjzBJctNi2A9Anl0Doa38MkcwwcT6EaraSrDq/JY2/ygobpeCE6g==
X-Received: by 2002:a17:902:ea04:b0:22e:457d:3989 with SMTP id d9443c01a7336-237dad62e05mr157842595ad.0.1750656165996;
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83940f0sm74662795ad.18.2025.06.22.22.22.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 22:22:45 -0700 (PDT)
Message-ID: <b2415006-6176-8645-9ac1-47b8598dec17@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 10:52:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH ath-next 5/5] wifi: ath12k: Add missing include of
 export.h
Content-Language: en-US
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vu?=
 =?UTF-8?Q?sen?= <toke@toke.dk>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org
References: <20250611-ath-unused-export-v1-0-c36819df7e7b@oss.qualcomm.com>
 <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250611-ath-unused-export-v1-5-c36819df7e7b@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Jnoue_wOZJ3mkwr7dojk2q1Mlibkeh4d
X-Proofpoint-GUID: Jnoue_wOZJ3mkwr7dojk2q1Mlibkeh4d
X-Authority-Analysis: v=2.4 cv=CPUqXQrD c=1 sm=1 tr=0 ts=6858e4a7 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=rPD8waAe7N7EK57NJTkA:9
 a=QEXdDO2ut3YA:10 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAyOSBTYWx0ZWRfX2Jj8Tfrk39wz
 +iJYwocpe2dXnuQFAd9eVOL65ixe9L5YKzkREc/yKq8ce32erXySysMsA45JrhCAo92Kuht8svR
 Zq3swa/x/iOa1VgE1p1/vUbtqcfqXN20IrNQkRGuhQReFHmpRt6Taw5A/TVTtgxUi5syCya22P1
 PXFmp+hJYrqezdEjeeUwH0rawTEL5Y93x8pocLFO/b/B5OiCHW7b2OvatP98UetS14HJtRSGrxA
 +K7Tw4GnEDAMW746UExvd9kIV5J7Uy9cEpC2BdTxKFe7DxrIXfQNd9AAb2pQYrQGuEpZCzhfFNK
 hbG7xWojWc3DtFBQPU8h8HBqh97+NrGt6Fm2CbT0lJRmdzNmgJAR+Sq/zl0750tKIzIGXeCoZ80
 YTQ1L+K0UzQBFxaaJcbtQhTBO7qBzS9S0LMccNooviKqbDuZO4e41RuSQYfnmORdJGVdGTLU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_01,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 mlxscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxlogscore=995 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230029
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250622_222247_871430_7663F5A5 
X-CRM114-Status: UNSURE (   8.23  )
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



On 6/11/2025 9:43 PM, Jeff Johnson wrote:
> Commit a934a57a42f6 ("scripts/misc-check: check missing #include
> <linux/export.h> when W=1") introduced a new check that is producing
> the following warning:
> 
> drivers/net/wireless/ath/ath12k/core.c: warning: EXPORT_SYMBOL() is used, but #include <linux/export.h> is missing
> 
> Add the missing #include to satisfy the check.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

