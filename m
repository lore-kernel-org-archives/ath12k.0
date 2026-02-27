Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F08BFD7F91
	for <ath12k@archiver.kernel.org>; Fri, 27 Feb 2026 10:33:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AmleyjsdcwmU6RUWm3nT6zae3j05K+pyYsiW/VZse7M=; b=JAVYT8h3Rf9dt54SUN3VZE1uXH
	83XtSl3FVeEavBM4qVVCm3rZdLOGV6gRCXPYwQgOuZVBMtxH3cwczZRS+OLON7tBIcHtzII9DOK12
	1V4/EGHUleKfOLzrOh6Y1nWNbZAlci0g4ZOdNifv+MMhfGd5oFemA9dsiZRJhCBRsD2nFqcm/ve2E
	foTD5DOBOqDZdhTS4LwjsL3hnmN9WM03SI0004FCLl+KQuZY2egcSV6itRgKpZKPlEk14v5taKjqJ
	WPchU1FtvQxo2rgWit87Yd5eTNA8oF/7Lnc4r2mc24GpnOGJuxVcHLHGrXT3SSaKoYfvhg/QbSfqY
	9ugfDJ0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv9h-00000008Ex6-1IaX;
	Fri, 27 Feb 2026 10:33:09 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvv9f-00000008Ewl-0nOl
	for ath12k@lists.infradead.org;
	Fri, 27 Feb 2026 10:33:08 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61R9i20n1601652
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:33:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AmleyjsdcwmU6RUWm3nT6zae3j05K+pyYsiW/VZse7M=; b=R4LsiabpcdrIDT3m
	MxZ5wYNUUw/zEFXskr9vxQyQsgNcctuQqNarx5hvE26wrDq3OLndstreWrwPAZHO
	rcZsVB5EHEw4nMnXWjd1LPcroyIwkr7kwly1POP4mDSStUwQxM5Vr6EFchLJ3Ch1
	eWpommHzfMFK2ONuPuzvs3yEdJpLTE+YYNd+XhCRLA69q19lZOqTIOueEijlBysv
	VicDKK/hBI7g2GvqdSZX8mV45934l4ZxQ7kTusnterjL6BmYcSas4UVoxWwznvmB
	EMnJd5ouyzBOHtils3p9uwVV5jDGiB2L64OJ6HwGZpEOc1RzJZlP3WJDV2Ic2CCL
	bjnMwg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cjt99u6vp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 10:33:06 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ae04f58b19so99126905ad.0
        for <ath12k@lists.infradead.org>; Fri, 27 Feb 2026 02:33:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772188386; x=1772793186; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=AmleyjsdcwmU6RUWm3nT6zae3j05K+pyYsiW/VZse7M=;
        b=CxQWbrW03mNCsInNK2rqSBBF6uPBax2DgvPWOs0gxEWgqDfqEG+3zVupsu7PaaK4qv
         FSZvqL0jiMbIzFJHB9K05/QRmR2p0eiurBoGlH45fgRSQe2A4FDd4eC7HjMJlCgUF1KC
         P7sHhUyQpJSTsxyWO1QI0/4ZzHQDkZdJNhxlEzZCT5tgQlwQK37BuFssRXjWwLlAYvxV
         kf0OaqrrU3kuC+jg3rgKd0jMWgKiC/Bi1soaqZLWOo5sgNovNBzOuTtT3cyNbEjQqFQb
         7+vxVAynvSjO2H8oa8r0PCOyQXBqI8yw5FSFZr9zcAn4vGzVLKHz7G/cT/3JUFeQre9z
         YSSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772188386; x=1772793186;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AmleyjsdcwmU6RUWm3nT6zae3j05K+pyYsiW/VZse7M=;
        b=k5PJceLGdfbZdosqIIhkW1DCcwS4tpdSklkXXseGnNBIdEyet8ttPm8AhnDa3lL3im
         3M1HGE5/1WmfDw6dyZpFgmrfm/FthVfHAidJ5f8JpwN9pT11uXK0wPwB1Whrtx8jNBZ2
         vTK/1xdTPGs3f/kypiDWqfsfIYOiVZDZma2lAi9gpy1uSAc8K/9x2icjGISC0h7LCy3d
         w7gn5THczEx/yY7jWtPlcZH1cTgbCsPCqe9P1iNxv1tC7HxN+lpv4Qg+cvO+r82p41yW
         uUsaHWLmXF1r50JDcnId2sq3OZqQp1e4wsdSFGzAQE/hE/ARfFLrHGfuDmb/GcF9hE0b
         3iuQ==
X-Forwarded-Encrypted: i=1; AJvYcCWPtOE9k0PYRpReTKNi0Ser5ipf1wDgWa8w3xFoBqyUF1sVVH3aB8YVqvHS/5BXmzr9hEWTI1k=@lists.infradead.org
X-Gm-Message-State: AOJu0YzGAs3cbSFy5Vinz2BOwn2Gl4MYrJo8l8wkDSK6PpUn3y/FJjTA
	rutqh7RgjHIMDQyMobPN0Zz70HWu67so4vIaGstkZVQEoiHoYegs4lhJY7AYtF2xVyUOecrLrOa
	dqhg8Q4XNqA8dk3S81yFhbS1/FyAJiWiltfI/7RJYUXqWATLKhQR5sNOfrS0+Nqw4TpG4OUoG
X-Gm-Gg: ATEYQzwieAJUdwFJ/IH5XdXjIzXz/zsGy/VeY99vqX8h3MofnTeoAh7RKQrlhS53DIq
	QFE+HjJB9D7e5u29NqZJOGqTbTcehLaBORUqof8vuqVqX0kmlRF4Fk/EeA91Wa5PsfqrPOz8Deh
	SNqf0oVyoOEPxfHCU0FNVTkUw3j6zw8e81aDgEHKQd388dPM14l5i+6F/wRUBN2wQnFKQHveSAe
	R/HoU+3KNTjxOaWzd1AjBzTEyDiaOCaEoUMgoEppvYNKPYODzqwnAJbm/JhDDDjVKTr5rpZquaP
	HNc2vpwX30eIhsxK/ZYHtsXqyJltaa75qgdUzh/CfhuPyl1yiel7efXwICnMjOtsuDULoqqn+4l
	AygS8G5q3t49A/sLUV3dwa6mUHF7tvqvSfIcXjOyI3tjPbQKI1h1UmK1BQ03s4UZRhKs=
X-Received: by 2002:a17:903:2f8c:b0:2aa:d61d:b6b3 with SMTP id d9443c01a7336-2ae2e4bbabcmr25011985ad.41.1772188385969;
        Fri, 27 Feb 2026 02:33:05 -0800 (PST)
X-Received: by 2002:a17:903:2f8c:b0:2aa:d61d:b6b3 with SMTP id d9443c01a7336-2ae2e4bbabcmr25011735ad.41.1772188385477;
        Fri, 27 Feb 2026 02:33:05 -0800 (PST)
Received: from [10.152.204.0] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6a0409sm80007975ad.44.2026.02.27.02.33.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Feb 2026 02:33:05 -0800 (PST)
Message-ID: <9a647bdf-640f-4d3c-9fd2-50bd55af1008@oss.qualcomm.com>
Date: Fri, 27 Feb 2026 16:03:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Set up MLO after SSR
To: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org,
        Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
References: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
Content-Language: en-US
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20260227041127.3265879-1-roopni.devanathan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=IZWKmGqa c=1 sm=1 tr=0 ts=69a172e2 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=_3h4uQTCdB2spDowhVgA:9 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: lBcGkxwKsphpgm7vYVX4dXYQTzIR8DUn
X-Proofpoint-ORIG-GUID: lBcGkxwKsphpgm7vYVX4dXYQTzIR8DUn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI3MDA5MSBTYWx0ZWRfX8APayg8cew7r
 HT/fQrNY0of1jvHk3Ze8Piq25gy4W0DPn1vOqTQS+jJzTft0A19evTHfYGaGo6KtvaDMHmKMqsN
 x4UpY4H4wPmUCRrVsjK34AMcjkRppBAPoYJYAwi7axwbu528gG6el/bulRROEQhHOpT7ruFBwyt
 dFvU4KDpQB/N5QN72FMggeFhXFXqieulC2IVUCtAPNYLkok9Snrthgy0YUl5scbKiewafNlmrKc
 5A4gzGVtnUO0UcebQ1R3b4SVMi/HlzgIS9FzruoWrYAuYDQE1RLppc8yb/2K7kZjxPxtS+tccTJ
 Zos6Q0hQt5NNrmYOPOyL2kLeNOUspVwFzQ6lDrqiXEvDWAuWDzkjNX6f2Lpe8yt626Szo+vKfXa
 f2Z9K1kkRznWnRxJKVqZZW4RJfALnWlCxXEWnmX5+PyaXgtVR+vVSCmJp8Cin/KJz3VIV3w6RPU
 UebxYUR1CLcGXJtTG4Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-27_01,2026-02-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 impostorscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 malwarescore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602270091
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_023307_255245_D493C795 
X-CRM114-Status: GOOD (  10.72  )
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



On 2/27/2026 9:41 AM, Roopni Devanathan wrote:
> From: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> 
> During recovery of an MLO setup from a core reset,
> ATH12K_GROUP_FLAG_REGISTERED is set because ath12k_mac_unregister is not
> called during core reset. So, when an MLO setup is recovering from a core
> reset, ath12k_core_mlo_setup() is skipped. Hence, the firmware will not
> have information about partner links. This makes MLO association fail
> after recovery.
> 
> To resolve this, call ath12k_core_mlo_setup() during recovery, to set up
> MLO. Also, if MLO setup fails during recovery, call
> ath12k_mac_unregister() and ath12k_mac_destroy() to unregister mac and
> then tear down the mac structures.
> 
> Also, initiate MLO teardown in the hardware group stop sequence to align
> with the hardware group start sequence.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01181-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Ramya Gnanasekar <ramya.gnanasekar@oss.qualcomm.com>
> Signed-off-by: Roopni Devanathan <roopni.devanathan@oss.qualcomm.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

