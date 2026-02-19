Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3659C531D4
	for <ath12k@archiver.kernel.org>; Thu, 19 Feb 2026 21:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iKx/fk4L9hr4iTsFMK6M/vbjuUixutrPmAviSLksXy0=; b=Kegk2zx6zuyxeiXcJKoDY42S1q
	m6tBVtMcht3waGYEScHzLMwZtWZp844dOzceig2U1wY+bTnmYihMoSBvLZ1BALI3U7BinZkfXqGa7
	U8Qf0lgz9rJakY9kJWki0b1mrKoUTbvKxluii0C3HvSuZdck8g5hDLwb12yNJlfpCsvtNXxVOgOlI
	EB++RPD9isEUoGtgSJ3Kscu1BfKLXiw6Vak8mxSAarZX1QdU05njdQnS/MpSpUMtjRKNThNNlQ/aw
	Pwxg6y5pDLBMPjauJKYAAopjjvzET0xAaCdklXEftGNkxLAR3j3LoRNV5P6I3tp8j5PuzJ18qbWrr
	Uo/0ZlQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBiO-0000000C6Xh-00mb;
	Thu, 19 Feb 2026 21:37:40 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBiL-0000000C6XL-14mO
	for ath12k@lists.infradead.org;
	Thu, 19 Feb 2026 21:37:38 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JI2DVn3133241
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:37:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iKx/fk4L9hr4iTsFMK6M/vbjuUixutrPmAviSLksXy0=; b=EY4ya4wwCUcP6HvQ
	Mfz+ylrwQUa94jTdtJ/uh7VniG+B3/7hLy6im95VkrhAh2h5ZFb+OcSBiNLUHylB
	DDc5MFiWKUpJ9YRh/pmup8jIuQMcfFYelLgsC1MQbnQQCS++/acWdzNDsicDEruV
	PZOiKvm9w57hd0uxDoYG34Ns6IKnjy/XD5INmfi22N12j0XBqF0Ky+7OJINvJwGV
	mS33zWW/8aWtbycs+VfqSPDKNZPkbIuJxglcnFHN1qRaTmzJZ9Ulw3FR84qknJKz
	MWg3aSZG0dYW0bTwgUD59LM6g08WZ8YZouZT6fRmXpcRNo+o4bRV0CSqjPnZxM/1
	+dmXtw==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvurba-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 21:37:36 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-127337c8e52so50520739c88.1
        for <ath12k@lists.infradead.org>; Thu, 19 Feb 2026 13:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771537055; x=1772141855; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=iKx/fk4L9hr4iTsFMK6M/vbjuUixutrPmAviSLksXy0=;
        b=GhpurElLAUWKzL+ugO3WIr9tz+LoX3bQud1EYyecTPVSXLS6qnb9kTw8rK8GzuVUxq
         YG66K3melcK4N6W0DHbyRttbjKovcoCTbSRi1yeoLgxeybMBeZfc9OnKq/ZDd4f2Z/W7
         CTnc/lhDbR5wvh9BXncbHd2Hl5pCQlcaqi7WbQ2G1ifri4kh70mYness4xrsm01mXI9y
         Rylov9dwWlQohTUmGb5UNvDjnpREM4xPnCAGRTPO8yN/ovJbxRezGoq9+9YHy1UQ0MnI
         slfRMVY6vmixJuESH3QZui4oXyTISU1XkV9bbqFwdtgiUCTX0355ZGrZP+gRBwCWYQY2
         0LSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771537055; x=1772141855;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iKx/fk4L9hr4iTsFMK6M/vbjuUixutrPmAviSLksXy0=;
        b=PiZSOudL2fjhXm7Pj5J4XtVZL8KX9D5FVn9AS7zB5QFdRGCbBVQChpeM1CJD1FDyeK
         3Fb0kvLbppRIpwRMZsmOJW9gs0id2TOY2pdk272t1lguJ9k66bOT7Y2byKkF1iSKcPMY
         fdQfe5efSgsL0J9xeNJbcgmk+f0Ny2fAyT5MoPtDqe7+WtGIWQeeZxipXD+O+mHqWpu3
         zx1GG/JUmpqx/Bft/V+l5C2XuVxACqqvOSkyYMbjbFLhsTAVGOt8jsgc78HJ6OZXCNad
         KUJMdm4Q/+uRTT1R7qeijAm8Qrd+4QqxwhNIUvzKdFL5UG6YLAMOlrZtJkmgVFXRE/F/
         qxmA==
X-Forwarded-Encrypted: i=1; AJvYcCXxxy0v3F23cTwgORTEC/ocUxwQUb84/g08TV2wHNeEPbUGDgeQJZTWQyByG7VXrMwr5GgzMSw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc3dfz7luGvKz0znXSylkqLWtOF7mnOc4sfFcQ8hF+KfOWZwpI
	ScGIkpVPFXIJtnGPLXnCoKS4zG9Gh+NK7xVY6H2bjXEimBCN4qvxMUWMJTq3z9Ae3GP1WQL5BeS
	J4IxRa7ye0FFmBpXATxD2T9BgdyWvuqiz/lVR6VEBpJBbKRg/g0t9OqEPS0qlnX5f
X-Gm-Gg: AZuq6aKMkUx3+VwxCgz56v9JoFoWjP3m4yE9wW1rF1miQyQXFl557SVUkBP3OfJ2jIM
	ezUjsSfxCFZvrZmXY141ISvwdhajB0s8kWm4o1DAjMGT9yYfX7hII9xTBjEbTz3DRNfaBKqvbTZ
	Sf3t6rIUrZ3/3SAD53K45kyha/aYpWfdZ2heGlN6JTob53pC6G77Fe+qAXpCusB/VF3WK4SR5Pl
	ME4FGLjGF5iks+aVvsBqsv9nd1v/wAz4ONjACgHzN5AkH3kNRjt1GBzZbB1U5smFDWtpyUHGaBM
	GUknUU616GHhhhta6y6e2DObnc/jp1d52BXCD8J1JpJ5UqPmqAK5X3YFzPUf8sdVHLTRTRSjtxB
	+MPIUQ1ytAODMf1EI4t1Hz0kBTvDtZZ3BMoYqtyrGWSraFK8zhNJBcdl4ClUG1BL6HBJN6nA+3F
	aFY2I/JOVdxfhNyQ==
X-Received: by 2002:a05:7022:78f:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-1273adc697bmr10349109c88.11.1771537055387;
        Thu, 19 Feb 2026 13:37:35 -0800 (PST)
X-Received: by 2002:a05:7022:78f:b0:11b:f056:a1b3 with SMTP id a92af1059eb24-1273adc697bmr10349091c88.11.1771537054787;
        Thu, 19 Feb 2026 13:37:34 -0800 (PST)
Received: from [192.168.1.41] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12742c64282sm30220375c88.5.2026.02.19.13.37.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Feb 2026 13:37:34 -0800 (PST)
Message-ID: <017ec99b-693f-47e5-ac38-6c207a32eb62@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 13:37:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v2] wifi: ath12k: add basic hwmon temperature
 reporting
To: Nicolas Escande <nico.escande@gmail.com>,
        Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Aishwarya R <aishwarya.r@oss.qualcomm.com>
References: <20260219073440.19618-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <DGITONL8L200.PJE38TDXYRQC@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <DGITONL8L200.PJE38TDXYRQC@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: XLp-NniV9l_smGj35XKOKjylaNKoJ9LW
X-Proofpoint-ORIG-GUID: XLp-NniV9l_smGj35XKOKjylaNKoJ9LW
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=699782a0 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=4Jm5UyAM-6VcxyqVLLgA:9 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE5NiBTYWx0ZWRfX0r/w5DL5iEri
 Eb0CevLMrrCWiESXO3pvZxFgQW9rWT4uWlNcRtk9zY1BBTzeZWSM7PI07N0aoG0HPQn1NHpahYN
 yEbutoiK4p8Ia9TvE8U486HRv+Am8YPenWqZImaItqKbOs/qBMuSnY496lQ91IXl1tDahqQOIVs
 w9r3hgIfIjdDR+jEnBvj0REJMDsIhE+81SJSH4TDoZj5Zsu4FlGFzgVbkfRrjASKHpPsodDvgAO
 GTYNRUmayMyCynJby3X+bMNHIQAawDk9dBVfkHr/uf181Mhpss0yXMI93BA6Pss6B9UmUPvvaq0
 lBZG/Dz6QiCHhOhdaVg9oyFIxpohbuVvjr9rTm4KCU9nS4pD5kHa1xcjikhPbsYZdDkjimY29gV
 WFa8pCN8Z1aXKTc8P9ZEwTThoznsVTVeQR54nyuGFvNM01o3wz56b6UESsfwKnvwbM5jQXEt1H+
 sEtXi4gqjLSjm9P8hmA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_05,2026-02-19_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190196
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260219_133737_308562_B476AE1C 
X-CRM114-Status: GOOD (  11.12  )
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

On 2/19/2026 1:15 AM, Nicolas Escande wrote:
> On Thu Feb 19, 2026 at 8:34 AM CET, Maharaja Kennadyrajan wrote:
>> +ath12k-$(CONFIG_THERMAL) += thermal.o
>>
> 
> I may be wrong but I do not see Kconfig changes that allows to actually build
> the new files. Is this intended ?

There is no configuration specifically for the driver -- it just follows
whatever has been configured globally. So CONFIG_THERMAL would need to be
enabled to have the file compiled, and CONFIG_HWMON would need to be enabled
to have the sysfs file exposed. ath10k and ath11k have the same logic.

/jeff



