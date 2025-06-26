Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 928DEC7EE3A
	for <ath12k@archiver.kernel.org>; Fri, 27 Jun 2025 00:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QNf6psQuaYs1sV2z+eOJEJrYUuj36k6T3cjWzvS/EFE=; b=0CaSRbVEbABriu0AVdWxLyHtmA
	LEqZfvqlefOCCwrKPs5P7GHkpXxduE6HGCG8socI5m6+z8Oy7ES2gE34yU/VT+bn/XMyQ/2b5wRoy
	EcuI6oALw+TqUktfB4d/9v+XYAkHP0aZKuGH96id10bQYWJI5LSGRurpVXHTfzSovsgPK+lfEfds2
	BGYrKWPoJfpXwfqsjBDR8K2T9CpwolK09lOo+w4FFjBruy78jkp9BNc/LEK/ThA9QSJEsQIfyYEIZ
	RXYtX1fB/N08eImgDx3dt6ncbcUCaj3Ly+/SeH9S1tt6DLoWXvL5zsnzi79lVejQT9FOmIETLyO7T
	oV+ne/+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUwuV-0000000DCT4-18sC;
	Fri, 27 Jun 2025 00:25:43 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUvoX-0000000D23D-30XD
	for ath12k@lists.infradead.org;
	Thu, 26 Jun 2025 23:15:30 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QJPi9r016254
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QNf6psQuaYs1sV2z+eOJEJrYUuj36k6T3cjWzvS/EFE=; b=jb6U9TMXB/Q497gK
	Bvw5kweEaXJVciSI5cJvzQb/BbH0h0Xv3YQY3O1jEHHBUbp5wr5GZ++hoeISz9bn
	EeMf3iWV1T+Pd0/YstoItKt/meYED6KT6EPFFkWAFhuelQ8XU1RPvFryh9AYk6uc
	xb4TMSHn6fIoOYZTn1qUSmmbDEGc2TmcRpLDKZyai2COAwANKcs+YpCer4gTKzOu
	UMB0cuUk3ajzFe58oy0P/m0BCYfebuSdO/k7a4Vi5RuY5+3CqWbhVo/LUxXHiiuw
	356jThXVgYow9WtEivIToWvLDwOCdwyphdzK8WiFfKCinbGc22NJ8Q637AEX4ZIu
	mcuM4Q==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47g88fejus-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 23:15:28 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2369dd58602so11742005ad.1
        for <ath12k@lists.infradead.org>; Thu, 26 Jun 2025 16:15:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750979715; x=1751584515;
        h=content-transfer-encoding:mime-version:date:message-id:subject
         :references:in-reply-to:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QNf6psQuaYs1sV2z+eOJEJrYUuj36k6T3cjWzvS/EFE=;
        b=loyPtSyyWOEJvuh+zbUoNOFOcgfgnzAMCwMS0u4NWJJ8gI/PS+PkO/YFHxoh09gRyo
         /Ojl8GyIyIrSTKHJGP4ydmhlYrAtkaBwercNe4P02mWNbO+TP5U4QAa3Aernt0uN/N3t
         TANla2RqDRb7TxWoxQX5PYnTrNJ6E1mRTVtFhGDApb5I5ZXsEaKonZa2U0xxQxxqraCA
         BA5GI1Vz9VbyJil9uLmPi55vQ3a6HPgrKopspa2rFZ143LHvIEBk6gYfOZdOnaUMWD/m
         OuehQXGVfH4+ZwPT/+mc6I7mg8DxyCN1+y6yi2WB28GJt6KniDEZel5MVqABD/cE1LQ5
         UV3Q==
X-Forwarded-Encrypted: i=1; AJvYcCVZN+803WXTBNZ9MXT/w148HgzlVbo/Hj0gFmgJIMx6j1ttDFmG3UTvpEU9d33uamIg5Fqc38w=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzpzz+VVSCos60PRAKSrKi+Itgy/4AOhYlTpz2tyc3o8cU/v4qj
	cFHktCFy25seiq/HihgewhR5RrLbPGpOAm/Mjr/ix+6RgPnPwhWlFqIUUKOmh+qJf3wHGMfdnZg
	UQbksylDuAyWWkWg9/wIkh5GWDgB+O9hU214CFVGQCUbC2NkCQcZM1MuY7RvINjZaESY8T4sK
X-Gm-Gg: ASbGncsJmVTvsvI1C9F0bHF9MCVlwU50zrmmelGncxNVeQ6dzY9G7QiR2Le5i11xMQu
	AxsvHxLIH05wGewREVCQBx/xC3WgMr1SJ56sdD3mvEvvCBhOtIxny3DDt8IjgT0VRL5UdPifZQf
	BSuP6yyLgUXOagnGHJGljjfDBTz8gYw5GVZy322iioR4j+H8nPkDPIiBMUb2TNSjUBeprXdQ+rn
	aqIcgvxy5VkH8YkOq3mA7Cn+J5sCDO02SSAbdWEj1oLXichqRcFjmMMWLyG5omOGir9WOAyBcFi
	BP4FEndC6P4jKSshn3A5IPgQn50ilkxc5y3YMlCaAHFmWmRW4QYp4nL5Uys=
X-Received: by 2002:a17:903:2c5:b0:234:bca7:2920 with SMTP id d9443c01a7336-23ac45e262dmr20098935ad.24.1750979715410;
        Thu, 26 Jun 2025 16:15:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3UyoHUikHjCEajXKJptSGnRA5N5qfhMM6/xXUltul0UA71goc5dUnQg2TIU9Lxbb/GwXUeQ==
X-Received: by 2002:a17:903:2c5:b0:234:bca7:2920 with SMTP id d9443c01a7336-23ac45e262dmr20098145ad.24.1750979714949;
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
Received: from [169.254.0.1] (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23acb3adeeasm1548105ad.156.2025.06.26.16.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 16:15:14 -0700 (PDT)
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
To: Jeff Johnson <jjohnson@kernel.org>,
        Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
In-Reply-To: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
References: <20250623-support_real_noise_floor-v2-0-974bbafa317e@oss.qualcomm.com>
Subject: Re: [PATCH ath-next v2 0/2] wifi: ath12k: use real noise floor
 value
Message-Id: <175097971429.153431.7513339241294145921.b4-ty@oss.qualcomm.com>
Date: Thu, 26 Jun 2025 16:15:14 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDIwMCBTYWx0ZWRfX5MzxNgbTsw1X
 dNyK5UUIK3pF43JxmUSymzv98rD7k6Bce3hfNo1opYVdBXob9cRVhZ1o7IkWBA0Oi6vQuE4tG/t
 /3hT094UomiMUoPz/hHtC5QcV0ZufUbPj3AzDJhhIBkAZLYnxVPoEZSo4WTzLmIioEo8HL5cEN5
 8t94bgB0SsiyjYr6i5aNK7IovH2JEQpcXK13xZdtgzyWkFy/jt+SdIH9I8aJ8tMgebUvuyNy7sj
 NHTB1kmLCEnyyI1ETjkaAC4oGZOG/s2rZGNoPVvlzO90lSZ7q4otOYIGefFni0iR3yUwMSLpwLm
 bWLsxk2ZFA47e7yCdyPtmGXtzGeALjDkLxX5CrTRYCBYbmhOcX2rOM/JwaOVN+PZNwpK1/OmG+x
 uDWmues3puUibcCtVzvrQt8sVWbI7bjyUlhDc+0xGh7WuP8BaNGVlXaUvdGVEbU+6krLun3Q
X-Proofpoint-ORIG-GUID: grboGY8gR9IrZlfNsKziOKzlhANbN8tv
X-Proofpoint-GUID: grboGY8gR9IrZlfNsKziOKzlhANbN8tv
X-Authority-Analysis: v=2.4 cv=LNNmQIW9 c=1 sm=1 tr=0 ts=685dd490 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=-iIeHy2jdy7NZ5vI0E0A:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_07,2025-06-26_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 spamscore=0 bulkscore=0 mlxlogscore=999
 impostorscore=0 mlxscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506260200
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_161529_880613_C3F3D20D 
X-CRM114-Status: GOOD (  12.16  )
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


On Mon, 23 Jun 2025 21:19:08 +0530, Aditya Kumar Singh wrote:
> At present, the ATH12K_DEFAULT_NOISE_FLOOR (-95) is used to calculate RSSI
> value, providing an estimated noise floor value. Consequently, the RSSI
> value is also approximate. This works but however, using actual noise floor
> value will enable the reporting of the true RSSI value.
> 
> The firmware possesses the necessary data to determine the actual noise
> floor. This data is provided to the host via the WMI event
> WMI_PDEV_RSSI_DBM_CONVERSION_PARAMS_INFO_EVENTID, which includes the
> runtime parameters needed for calculating the real noise floor in dBm. This
> event is triggered by the firmware during channel changes, temperature
> offset adjustments, and hardware chainmask modifications.
> 
> [...]

Applied, thanks!

[1/2] wifi: ath12k: handle WMI event for real noise floor calculation
      commit: 0314ee81a91d22366e8ec6f5a993d75b246cbea8
[2/2] wifi: ath12k: use real noise floor instead of default value
      commit: 662e9032140fd92662142d4bf394916cf48e426f

Best regards,
-- 
Jeff Johnson <jeff.johnson@oss.qualcomm.com>


