Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E346CCF9F0
	for <ath12k@archiver.kernel.org>; Thu, 30 Oct 2025 16:53:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LPJIDdM+jhr8MK7g+RWoUM45XPB9dqtyKuSE/Sz40MQ=; b=eEdiO72jw5jytRDUaIelSQ6fzH
	w97fjb9+/aLGHbAbYym0VCBlvz3Sq2IrLzAtIhBlx2m4rQoOkXv0bIr3ywWS4lzcc8G5hW7pS8zN5
	9wmu2Sn3dyBDZD9JKG452xsNCIgFZMQOG/jVWgUSSet8yjS6hMH/vgOBsNq6AzZl1zwrOhM8qQH5M
	vQQgiWHteByMlZVRzAodug8TXhii5Y6lkMHmqFzaX4aa1B67ynxjWRdJUacGny64gfd7iUyszd7KZ
	1274U+D4ZAW4VKAkYx8M4eDtRBA7XhMyy+y4i3QPjCMbjsAiworVuzON4yJj1amaJH/fBxvSyPVBN
	ASjvHNYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVtk-00000004Ukd-3zUR;
	Thu, 30 Oct 2025 16:53:16 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEVtf-00000004UkL-1rMO
	for ath12k@lists.infradead.org;
	Thu, 30 Oct 2025 16:53:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 59UFEOAx083957
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:53:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LPJIDdM+jhr8MK7g+RWoUM45XPB9dqtyKuSE/Sz40MQ=; b=M+BwifcZrLHt2HCg
	/8uBQLXUzPDP30Gehqz0uK05++441mFLkaBCXBEmOuTMnGQNOsDGMA33EtHV+GS0
	49gubNVrZkScxyFaO0LNmSyV0b+UDoPTZ5vRlDQs41QMYZeJyT9ydclIyI+xsR6w
	OzD5l/OHEY7T5kNrRZWOkFZqSr0xFmzy0yKJJMy5LztFx3GP3lZotLZxkMaXnfhM
	K+p8kRrLrFzucibqdElXONdeGOyMIza4tGa69l1EPohMxm4XMI7C+3W1i8FlyroG
	RBdlv61RLrQ2gJls5t2t0VeJ8Ie2NQpI7Vr2O3hYGPII85TwfBts/0E+4UpQkysG
	2n1Hsw==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a4ag389j4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 16:53:10 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-294baa12981so16930905ad.1
        for <ath12k@lists.infradead.org>; Thu, 30 Oct 2025 09:53:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1761843190; x=1762447990; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LPJIDdM+jhr8MK7g+RWoUM45XPB9dqtyKuSE/Sz40MQ=;
        b=XTq3tncTzQz0XgOBj43BWC1mFW12RZTD4rMj2M8c6wmHPQyYZNZ8rNylCy30GIM7PA
         5Cwv/YnXrBbEVygSdo3FGJosVP/g1g9s5SEkYMGsEIsHGEIk0/WGFaes+KoYJk1ntydn
         QsUdQF0OhoUmYSExkTfDs39cYG3RmK5f+0sOD9WDyDRX46YISLJTitjEpXT5JNTV8j7X
         WBIQDy6YxPtfdtw1D9N6+gDROc8b4+0EkembF7vgcSe+bchhzbdUtMqQUvO1QF6LtfDI
         LDta3Phg4RyJGQZmcMN+pV6L+UO59BClKc7tVleed17BiVADe6HbBQBN8MRln2QH2KK0
         j9MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761843190; x=1762447990;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LPJIDdM+jhr8MK7g+RWoUM45XPB9dqtyKuSE/Sz40MQ=;
        b=KYH3Xg9w8tBWaj2OLq2i6m5XgX2NafJHOtAsmyHIgAzsUVpppTQlA3KSJ/BkddECvx
         qBUCeK7N9w+M/k0hMVE8VsM153wHf5OISX6GRvVLukZU+SI7LX0up48NII2dE8hn+PVK
         1TINghPqL9/QG3UYqZrIKm0mGpI1pUU1tfsfrnzvirOje5fkpOqb00zHYPjAYynYOWx7
         TV/w+OHP8Fax6leACxS1raZee/ZLK302xPqaz4/t2h4qDTOFQ9xRbceJW5p8fqDg1t3X
         qwCr+q4QfjshbCphhwTBsillrwnRxF3rKNOPfhA2pXgcHR6NTbXvA1SdXWCtZYfC0pAV
         ZQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCWZO9dziOszpKNtHux34UzI9tvLjYY6kotuRFOqL30kQviGi4BObYS/56fprsLf2cPpVY1ZxH4=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3DVfKmZTqy4Js0lqZwT0P4fTL2eajYPs8QbYgf3o3JH6LECbl
	6gGyB28RruMwJ8/mGMiUqq/pJgJ86D2NhfUxRIJ+15Jw5D99QRk6XijfgzlARunMS6hGWaUheaA
	dwmKNA0LaLT1qakhgIOMTFM+dEVsKc7A8zXneGVNYHPfUhmqnW4sSnXGCIUXMU8Ep
X-Gm-Gg: ASbGncvqWL4Ejh6lR1KwsEidIa9JWSTyTs50hiu1cVrE6C0I80N4lOQE5CqPdq3H8TX
	deQBOpKNYKrgdyyTN4SQQSIClKtpTM/7Uu2Il2hjhUDqFZp+nTtFlsxpgusuYnOKEBB40KagShd
	ni8awilenShTDmSC0Qexjd5QJTuze33YGxSTMwmztPG2/Q28pYhrwrpIswt8xksopTILY4KYnAB
	sEkqPcL9yM1NLCl6hMJOIhXGHEnWPA2YFUH/YpFh3I/Eq/r4XslafTlFtk3uRXl5ClxX8UwDqUK
	5JS7g57pWMWA5Nm5WzQyrqrnlu78aSdbD34Isz8X0fnwaIxw4jABP24HLOGEPaYVIGCuHDSgKov
	2Il1Qi0BHb3BFj8NmScjSn1fzFCeNzx7r+tZi8/s9/cj1PzYzeY8=
X-Received: by 2002:a17:902:c40e:b0:27d:6995:990d with SMTP id d9443c01a7336-29519978855mr6013015ad.19.1761843190260;
        Thu, 30 Oct 2025 09:53:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFS1PSRFIXepbR3PUacQ2bP3alzWBJP4R6wSxqFdhGG+l00bAGA7f8PDipn7+VeN6k3LHmHBQ==
X-Received: by 2002:a17:902:c40e:b0:27d:6995:990d with SMTP id d9443c01a7336-29519978855mr6012685ad.19.1761843189695;
        Thu, 30 Oct 2025 09:53:09 -0700 (PDT)
Received: from [192.168.225.142] ([157.49.207.190])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d40166sm190649375ad.67.2025.10.30.09.53.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 09:53:09 -0700 (PDT)
Message-ID: <993b6232-0e47-d331-2a68-a1a58979685e@oss.qualcomm.com>
Date: Thu, 30 Oct 2025 22:23:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: handle vdev create errors and
 ensure limit checks
Content-Language: en-US
To: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20251026182254.1399650-1-rameshkumar.sundaram@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDEzOSBTYWx0ZWRfXzlerk8U1k1Rn
 lE7fAglwHVO5Flv2NUqIgVwngt7fN4x8qaB+dmRGtAP6ICzTV1HI3ZlTkEAajzRUliDMUhr2wH/
 Gpe+wdpNTTICyjACcaczgBI3xnqY8t9TBTmI8/F2EffxHBhoheb6yRAdfSsR9MH3LpahYEUrnpU
 CirkdlBbILw2i7snnlvfB9Ffdmc+e6/WhPdH5T06Z/ZAFYQbvoEG0fU/ShYmdtTRT9DYsDvSjTN
 WcHIX3JIS8rgbsX6+f4ffVACr2g/V05pc3zMxuGMYZEhqQDp0YF5zO693EwJ22z66wnnZfdWw40
 4f1NKgbTq565ESXc6mFI6+GcjQyRArUC4bllaBGo54N18pwU9iHjlNE9kZ1yHvasyeQxwOxIDyr
 Sn/jZsxBwSQF+FbBzCrCvY0y/XOh5w==
X-Authority-Analysis: v=2.4 cv=TrnrRTXh c=1 sm=1 tr=0 ts=690397f7 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=CMr6UP9dfYAYc02HN5pMZg==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=gvBvQFtS0oAN2tB_OWIA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: a7eLNHbrR4wUgHQ3wVI8jdyIu-nuVcHp
X-Proofpoint-GUID: a7eLNHbrR4wUgHQ3wVI8jdyIu-nuVcHp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_05,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 lowpriorityscore=0 clxscore=1015 impostorscore=0
 bulkscore=0 malwarescore=0 adultscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2510300139
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_095311_490661_BDF1AF25 
X-CRM114-Status: UNSURE (   8.36  )
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



On 10/26/2025 11:52 PM, Rameshkumar Sundaram wrote:
> Centralize the vdev limit check in ath12k_mac_vdev_create() to prevent
> exceeding firmware constraints and triggering asserts. Ensure stale arvif
> is unassigned when scan vdev creation fails during scan and
> remain-on-channel operations. Return accurate error codes to
> improve error handling and cleanup.
> 
> Rameshkumar Sundaram (2):
>    wifi: ath12k: enforce vdev limit in ath12k_mac_vdev_create()
>    wifi: ath12k: unassign arvif on scan vdev create failure
> 
>   drivers/net/wireless/ath/ath12k/mac.c | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

