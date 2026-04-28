Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E55E3FF8864
	for <ath12k@archiver.kernel.org>; Tue, 28 Apr 2026 02:53:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BUOg+aWEwcyTOIiXkjXZQ+l8hnQCtNpHYc4x39G8OzI=; b=Hlya1bFtfUU+O3wznzkOfWJ6Ul
	6vca1nqbK4BEVqx5+fEKvWwYtgEM1FsD3zy/h7A+zWjLWnb+hGklCf2JID/nK061gj/ia0cFA/7IV
	P0RYeknbZ8P1cevieOJn7+kJSLzRs/MEBXLfPiUM2ZkydsYVBgTVqGywdxNGrt9o5wSnppKvBG0eI
	1QNspkppq3JamC9uvOt+l6KstQLAaqz5jYqvClDJD93am8RhMvQQrggRKcFGZOlRTWS3OWFAOFLdF
	Z+X26zTNUoB+I8xVjB+MLRSfiQ9ArVng8qAIUsZT9gY5KCrCLsFr3e2TeaPjDaaafzT6Y7dwEdu2k
	M3iCQ/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYZf-00000000TAF-1dKH;
	Tue, 28 Apr 2026 02:53:23 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHYZc-00000000T9v-2OaT
	for ath12k@lists.infradead.org;
	Tue, 28 Apr 2026 02:53:21 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63RIwUbN429180
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:53:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BUOg+aWEwcyTOIiXkjXZQ+l8hnQCtNpHYc4x39G8OzI=; b=kiaujGcwE+rB/mpS
	+7v5WncJIhRYdYOlmnKxYXQCOlh4vobVY7HlA0W7PgcRL2VovHWgCiKLjUV+NcFi
	kvnnEVMZuX/scgUSif2027D30L1s6aQZcz1t0wbBF7Z3otXa2uMLXmDnnsIG2f4N
	Yd9JrfZTzjEC0nf9KCmMCs2lplRFl1NwO4CgxQxM7PCbiX9eWPgdT5iWmrmM6aBG
	yclHL+1P8FNgb4DyDHBAwky1nTDac4jJ74pz0G7kV2aXwO5JbDU+AYuTAd0+833d
	yag0QIvWjUOYMmNLcfpTDHywm0pdBnw+F79VWJcNc3ypfHJct8HOYVSebK6zlrtE
	wKytWQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dt7x32y9v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 28 Apr 2026 02:53:19 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2b2e6ee9444so117526255ad.1
        for <ath12k@lists.infradead.org>; Mon, 27 Apr 2026 19:53:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777344798; x=1777949598; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BUOg+aWEwcyTOIiXkjXZQ+l8hnQCtNpHYc4x39G8OzI=;
        b=DJqTrcbkA58SD+/+6bd4tL+vleA33fGT6Fi/JLXLfM1EdykaBGuqrpZ84rUE8oRmL+
         Hbu8+GW7/eIUpVuHVWEW1wC4NJmedurfggjr0rV0k83NZPUA/kjepIBsRnBpav2QZcuH
         cIzx49go1jEOneDYMBRd3NUWmsm4NFmaM2/vrsbJgw2RqMxNaY/E7D3jbOgwXEGRWaZe
         L+1CL0MYySiZk1CiKWQhK+jVmo6S/lpoo81S78BFzLqgFPefbvE7S2K6FfA6PgVeSMFA
         zJd7DdrJ+pGmGeaf7ItNhX0HPPmfRuXD4MGSHz4ugCcgprVsJl8F+pp8NknCULCUEZP1
         xwnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777344798; x=1777949598;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BUOg+aWEwcyTOIiXkjXZQ+l8hnQCtNpHYc4x39G8OzI=;
        b=n+zdaYGZgvlcnjn4eCDMNsf+IsB8L82rDDWkzr/FG9UgXz/VHC8t3q2qzNmSi+nZFF
         u2BHh9RahhKxPHXGMM6lrJEcegAagIai0Q1gqLm/2vnfcZJEl1UOXecXhLUw+9T7ePWi
         H2hUqKoZisdk89rqM4X/fh/Gl3wV0jqXmU44y4bOiSNr8k1QznX3PcBAdatynDsKaKD/
         88FtIdYv19XZUZx+89LXoZh2QtiJCwmVCT2Ef/Gw70NnMPRELElCq6KqfA4rC9jSAZHf
         riiOZcIaY6h/ubKkCB8PgZ4jjwsoaQ2EVci4Zyrt30VXXuUKldNtc3GMB/H7BothDnFT
         RgGg==
X-Forwarded-Encrypted: i=1; AFNElJ9qxrbNwTedwrxJK7gZuOZ5lar5E85HaD8o1DEg5KWiX8gEQ5Z06hEr57Jhw+UCe7QFcsskNTY=@lists.infradead.org
X-Gm-Message-State: AOJu0YxGv4swvOTSI+WMCVHI80kbwW/YbZ0JW9VkbNQjemcgJ/QVpmjm
	/h85HMh9rM9bNU+A42+acXVoeC7Fy8vxggyH8b7G84Tqm7mAvHztjQeI3/RuOKKh2SPaDSiE4Wm
	5Fu4+D7fQUFV1OzM3QLopDoFl2R1ag4Vq4zvjI/bXgAh56w0AX5FBgiLYUBZXiUbUA+3j3CeyVr
	g=
X-Gm-Gg: AeBDieutgkRKeyzJMvwpihnNPC9hZ5pGg3EXaUihx3G9tG/faSSJeSaSmALEszV99xW
	VzjePjjSntG+upcLuBQW6FlVvLriRYlN5W7+XlUgRvufhrg57xS42O/erb4wCOdXCEhA43oRldH
	FNP9dcRTNLj7jL6fISAGjogVwRZicVJjnnZAELb3FO2GUdENs+YBAAzWo1wgWWrb1adkqE/TRu+
	qyuUnXyyYsoCD8EwzFv8ovV5mCfP0VqinNFhMH2riTD8Kf0OTtTfEci/blGpM9GIPe1kP6dowfn
	28KNC7Pm/Ha3aEqlXSbZmeRil6mM5VYEIBcxhK7dczA3pjDo/x7IPolPlKPbsakQrHuh4GRXwSk
	PEXdcT771iPHvJqzj5/ovAJEdI7kATSVtkCUv+nHUKmRDPJi0NuWShhaFsfbLyiD8LHN9svdSrV
	yOqdQ6tlvVpMXrjviwncpRgVx35FvNNw==
X-Received: by 2002:a17:902:7d8b:b0:2b2:4dc4:18cc with SMTP id d9443c01a7336-2b97bffed78mr7577855ad.12.1777344797697;
        Mon, 27 Apr 2026 19:53:17 -0700 (PDT)
X-Received: by 2002:a17:902:7d8b:b0:2b2:4dc4:18cc with SMTP id d9443c01a7336-2b97bffed78mr7577755ad.12.1777344797224;
        Mon, 27 Apr 2026 19:53:17 -0700 (PDT)
Received: from [10.133.33.153] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b97aca8b38sm8594125ad.76.2026.04.27.19.53.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2026 19:53:16 -0700 (PDT)
Message-ID: <23852895-c459-4340-852c-ee7f40918d58@oss.qualcomm.com>
Date: Tue, 28 Apr 2026 10:53:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath 0/2] fix leaks in some WMI error path
To: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260424144813.1708214-1-nico.escande@gmail.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260424144813.1708214-1-nico.escande@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI4MDAyNSBTYWx0ZWRfXzBrowj5VyxkO
 mql1dt034VZiStvmukzg60QPrALo7xA5r2/HINM2oq0rR/OzR51Wum37KdtqMsFZEy6VtyH3sx8
 U2oLOKA9E/+KENLewShfQ0eJWigeGBEz8dNmrU5gyBuqMefrWuN4ii5oZ4FZR8cisN/S5kyCcH1
 ddqbq8kt4H0MNZxWuVb9p+t+XOtPFN5FlLC2qDHIpqnHEJ6DEUIzmXeJpISpz69KCM0aAFmmJB0
 UyQZSILFSKLQwYmspFKMvG1ONY+DcAZe8QThj11solWwlQgAjciTu6LZB86D/p9xCIJthir+nxb
 UaVVrp0ndUbaXGOJldkFhHNO7zZ3GOvG87lHXBkmMy83i9kzVHf6F8aPLop9wETKbEO1F2caIes
 LRGNxZr8L5S4CkZaxTGKPL+r2qJuF3PWQvGFXJ4sBY5tT3SBdn6DGCfBrhQrr9c+QDLqBRCCpiL
 JeQGPLkQNOVMWLgsY7g==
X-Proofpoint-ORIG-GUID: 3r5we_AYI5nLBItAeKdV0bQIZiMTygGt
X-Authority-Analysis: v=2.4 cv=AJEsYPsu c=1 sm=1 tr=0 ts=69f0211f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=FqyUr2HIOI8AG8dd71AA:9 a=QEXdDO2ut3YA:10
 a=zgiPjhLxNE0A:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: 3r5we_AYI5nLBItAeKdV0bQIZiMTygGt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_04,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 priorityscore=1501 suspectscore=0 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604280025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_195320_753657_DB981754 
X-CRM114-Status: GOOD (  12.14  )
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



On 4/24/2026 10:48 PM, Nicolas Escande wrote:
> So this is similar work to what has been posted here [0] for ath12k.
> 
> When we use the pattern 'return ath11k_wmi_cmd_send(...)' without
> explicitly checking the return value we fail to free the allocated skb.
> 
> This has been split into 2 patches per Jeff's guidance to hopefully
> ease the backporting process.
> 
> [0] https://lore.kernel.org/linux-wireless/20260422163258.3013872-1-nico.escande@gmail.com/
> 
> Nicolas Escande (2):
>   wifi: ath11k: fix leak in error path of some WOW related WMI commands
>   wifi: ath11k: fix error path leaks in some WMI calls

these are ath11k changes and you are sending them to ath12k list.

> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 131 ++++++++++++++++++++++----
>  1 file changed, 112 insertions(+), 19 deletions(-)
> 


