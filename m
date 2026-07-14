Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CCB5AC43458
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 02:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=; b=2HUk/4sLyJd77iEV2NXk9aWl9W
	GjtR8A0ad2o8qGEGsbFaKeX2b9xBRsXWQvCIKm/fnrRUNZhICtOe4pghSeC4imB8kmZjdfuPxkIRb
	pOqBiysG+Mzl7Ed6e+5nG/MQbR44oGeo7zaf+S8Eo9ou88BxaxHnqYQ4pVBwgpsyVgNfdarv5kvgu
	sFav09y+9/zxQHQkCJN1fdGw6cIcqcVnYCBDoWA8E0661n8lwzRoeCcBdLYFiq6C/mpxyPs6FeOl6
	TC3pukfSSBs7IEVdDLV9WyxHYMGtJpy78vp5+voeJ83t0oS6+u5zVQpwZnT2tTOHxb/WYpjhdv06z
	U+VDA35A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT7q-0000000Alox-2JlE;
	Tue, 14 Jul 2026 02:44:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjT7o-0000000Alo4-0Ac5
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 02:44:01 +0000
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66DNnENZ3070553
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 02:43:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=; b=KGafVAMqtHkOmRY4
	tmGl+zGa6Hf9/8j9uQc8K73AABn0VXca/Ya2uXn8Sw8G7BLBFjXBoDyolbuVXqAl
	4alGkBIb4qZJ4O3SniPqzWQ96q8fyMyTpQgwvuPzMMuJqMblnNhddQBUqCyzXo4P
	IBXlENchzcdas9zadJb7tmZiyf7GwmV/AW0JKo7XvVttofDQ9gUL2UAZ+Sp7RWFB
	KNCIgvIRE3zxYJ6crdbRNO1pbf8rci8xUlN790cbJJ8KlExGrmzyma6Z/Ltt/2zM
	/KfZJ595nlRZczV0THOtemOOL/RSVFNQeLbbuuX0C5FF7220fijFoaN4Jqz5960L
	1AAAcA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fd44jsmme-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 14 Jul 2026 02:43:58 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cc5faecf01so72247935ad.1
        for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 19:43:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783997037; x=1784601837; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=;
        b=eONRv1orJnR1+luyq46/wQCbriWHbbss4ftYzJv3krTh3e7UP2YP52oWqpIFTaTtPs
         Apd3QBy8j7UU4ACOvVk0LqPELRVncRmjWMaKqWySfLHxC7x1Nlq46nBexydanTZWCngr
         dR2GoipEwho+O/j3XocOI4nEPDWz9BO40PUS8CV4T3dXMMy2UnvbEnLHC1vIapfV8bMP
         1+F6durXJO+Hp+c2AlYSTtTC4myHFe8p4OO24E4/V8s2Vx0aDky5EiDaRgN0Ims34qhC
         Y5I6GQkHZDcouJJY4RmKwJ9Oxqvwj653Qh8RqacaR8xU6BqW9Vk+JAxB6PZei/9eAHk/
         TgzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783997037; x=1784601837;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ltdoAZBtEFO/nE1R3kO4JD7BwStlFCI9ybsndDyxNM=;
        b=ULXKOxcsFBL5uU/MfWQAYRryHkt/7VhimZGRfHaONkOQEIimPoYPOV0WA+FhB9LhiK
         srxSQuTl896xTimotK/ytkUdbF6jWKGDrHdA7MONDZa7bPKiKEMHXFm+1aPYCKO6ZEQ/
         4zjZJ94ccKB2YvuwY88bi4UOeNgiciPJaKaOntM7XmNnIf341DKMUfW2SQh0osMRRAgs
         NOUep+W+hgKtcuL70O4y/eMe0j8iY9FNwEgrC8No+tX+8fslUmwMVazp6M+VOiUkV0cr
         OfugAgC3d5S06h5ENMd/RF+5gM/sAf1JI4i8LpH8EXNM8gT+jfmatKxlZN89NPCeRVs4
         yFrQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq0w0+j956oHODasdzh4I42j+DkxXPAsr6OvtnOztsHKUAhJTf1DI9avAOmLf38Mt9MvaEWyg8=@lists.infradead.org
X-Gm-Message-State: AOJu0Yzh1zDISu5OGwDE59WrIGsi6xcgU+gCkPQyCywVyUHNW8ymVjvN
	/jjlZ3QyZS6G4xqysjyXhE+SNx7FHFBLqbpJ/sGlkxd5OFp8HWtDgNDcq7C+zo/n0z31E89fCgK
	EQhVGSUy7zxlZSxJNfKr210rfx2PZqc85geY/qxGq8+3856XP+QXzgAQONJnZcdO+
X-Gm-Gg: AfdE7cnNJsCvBTqBwboUGpBf7ahMGYE0yMkHc+JRjR4GJxSPahB+QsHy7cLQVRogTrk
	vguGE+CQ3JKGdVtaT5nqG/hWxGystjtqqh4HT6qVsGiC5ijMqLkzxFQyLxqr5jPcppN3FqCPt63
	RMrvNbE2zXmc9j6D2pJiIQS76gb0nIzFEucxBKyWJVpce49SXlD+gTj4qf8GWaOrqMCmUPBqsGM
	1PusEWjE18WW/Qfmxu1LAhw5HWDtY5fJhzd3qe/uMSv1DCBlVaO/jqFey4JSCoIcDSQkBrYoNka
	xqL9oup8Nrt7OXH85YxCCfSJ5e5RCD//6xz8qV7NtDj7Can7ebH7TeYBL6I5+RU1hVUxKpqSnAt
	gsbY37Yv9DB/saxVOncfDorKqOQgt1u9DiDZmIu9GY/WMYVemWTcrfZUeLe0Vbh3Xdl4/3uiFXk
	TbtlJJiSw=
X-Received: by 2002:a17:903:189:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2cee9a8ad02mr17077935ad.13.1783997037243;
        Mon, 13 Jul 2026 19:43:57 -0700 (PDT)
X-Received: by 2002:a17:903:189:b0:2c9:deec:f564 with SMTP id d9443c01a7336-2cee9a8ad02mr17077665ad.13.1783997036665;
        Mon, 13 Jul 2026 19:43:56 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb7ddsm108461875ad.1.2026.07.13.19.43.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Jul 2026 19:43:55 -0700 (PDT)
Message-ID: <c57ac898-e74b-482b-8993-c4aeed728ac4@oss.qualcomm.com>
Date: Tue, 14 Jul 2026 10:43:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath: Correctly copy the hint BSSID in
 WMI scan request
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260713-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-v1-0-4ffc4a472992@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 08oyyA4AVNtQX7WaGk9G_2RGk2-FMlBd
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE0MDAyNiBTYWx0ZWRfX5e2pdYiARvLX
 Q5z9/Nj6CXwu09b7V12U4TbEzObkCif1J2JFe1ffF65eOZF0hc4R0lU1eFDmaEwA8umm9sGzh8i
 jocR9sg09GeKj6yqI/oqMy8xvFZYA7Kg89TLX90fkPy2+Kig7MpAhzg/fs7KBMLZ/Ue9EbG+Jzr
 HPow08qUiuM0eoW+LRoP0DVh4Z4MP3DIry4uHDv/OMKBlzltdgHM5BnbWxNF2wVnbwQy20/TBWA
 f+v/5ul/3UzEyG1aHvGRNlpL96bSflg8A/yrwokefDi9QdFs5Ey9TlUsq1ByNvBFsJx5/VXqkoj
 nblxNe8lkBuIfDCcAgsMIoPvVcifW60gbqjOUWV4GtEG4AS8UOMdxGuB57kM335ckD7Dfk/nO1g
 gpkPLCXHNI98Swd/BMPiqkNu4dd4065vEpR3j3s0f8w/oq18sd9929VTOzpcfMquenSXrSpG7OZ
 aQ15UhISn7DjwZloJFA==
X-Authority-Analysis: v=2.4 cv=XonK/1F9 c=1 sm=1 tr=0 ts=6a55a26e cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=fdWN1coKQMrcGTyBBJUA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 08oyyA4AVNtQX7WaGk9G_2RGk2-FMlBd
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE0MDAyNiBTYWx0ZWRfXwW2gz8wzYnra
 sqiGzvd6H6X5CtpeFphasdkcm0Ifk+cZQa0dZJp3VOvMyVC1vLStrRz9EHdwSegrZ2JW35UCMd4
 2KT5sm0XsoE/en/UIdXib9A++04cVlY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-13_06,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501
 adultscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607140026
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_194400_198954_925F35C7 
X-CRM114-Status: UNSURE (   9.33  )
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



On 7/14/2026 12:15 AM, Jeff Johnson wrote:
> Issue was reported in ath12k, but exists in ath11k as well.
> 
> ---
> Jeff Johnson (2):
>       wifi: ath12k: Correctly copy the hint BSSID in WMI scan request
>       wifi: ath11k: Correctly copy the hint BSSID in WMI scan request
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 4 ++--
>  drivers/net/wireless/ath/ath12k/wmi.c | 4 ++--
>  2 files changed, 4 insertions(+), 4 deletions(-)
> ---
> base-commit: fa1b1469f1c5f0f54ed9dab80106a117e7736bfd
> change-id: 20260712-ath12k_wmi_send_scan_start_cmd-bad-hint_bssid-8786dbd8cff9
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


