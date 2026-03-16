Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BE67D58B09
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 03:48:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fT5rQ+5gT8sJC6asjov0bMTamVqtx7ocsFfxmTjg43Y=; b=i1QfEwzxIKLwciqSz6xCbHN7I+
	z2hk3cONpxA195u7nhArwWXTRrEHFJlR8Emqws5Iv5YZ28Fq6fIdSsoD53nO1lIwUEP0Uap6CtidU
	Y5G4kCQ/r7WM3qo3FqD2z+aO5gIe5F0GEMCQwQRmsPPjiOj8vKy8tHumN5DtSfjyWf6oY5pqLGadJ
	5MnWE1M0skKoAwmz67mQb+4GcREI2m45Ce2n9F4rCARqF5lxeduFM3BD1zpoGUkr7V1VI6HpdC0ek
	rj8Lj0UTwtax6vLdzZCJU0fN1xZoyRqRBlDJYu81swhFY43McQB5/YqDBEFWJHlveNyfoHHirVDQH
	y8jX/M3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ywE-00000003H94-2OvY;
	Mon, 16 Mar 2026 03:48:18 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1ywB-00000003H8c-2lNf
	for ath12k@lists.infradead.org;
	Mon, 16 Mar 2026 03:48:17 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62FB7geo2514619
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 03:48:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fT5rQ+5gT8sJC6asjov0bMTamVqtx7ocsFfxmTjg43Y=; b=ET8V6mjH1+Mc1EeX
	sERmDtgXzeuhRsI/+wxgy57MikUsvrH/J+JI7YQbDDHmLbZu6gNoZzctgjSf2LJG
	DN+2S4GDMYn44muztN23AtyRMIZAbNyo97OEN24tqctvXCfF9M0EkDgENNurun2G
	M2TSIQ5y0WY6b2xeu66Ix1LzE8u5O8SatWVIhpMT8IVBPALTmFabook3n4cQSFHQ
	RpFOUIK0p3njICVGyM4cESyPzTUwwxC0juG434iuOgE6O0gx+BGWqc/c17BHSM1f
	VO/dMoPnJSrWDRk6t09bb+qiK/XtsQtGnOGU98mVohM7vusn8CZitF5nr4HfGkh4
	JFAsyw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cw043m032-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 16 Mar 2026 03:48:13 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-829b8bb5211so14934638b3a.2
        for <ath12k@lists.infradead.org>; Sun, 15 Mar 2026 20:48:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773632893; x=1774237693; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fT5rQ+5gT8sJC6asjov0bMTamVqtx7ocsFfxmTjg43Y=;
        b=jAZHGNM9qKUAKQynNW5IcFP9JyL5g7HI9Js4S9l2h16gYWfWQM3NYPrN1lSEM3rWxP
         bf2J2STT5oflai3oJMe2M9ZzlnsumPScUZ53GEIKbqQMcveCNo12NQ5hdomdLycSVYP8
         /xsjynVxB/Bnt2R+ux3AzxKzxe0lFN9QCVvO+fd+vZi8cjDx2MJuB5yiEDCyS/Fzg+9k
         i5ncxUwLn2EAIlQo9gZwpK+y3qnjt48g5dGrqZGE5rOGZavNjBuoTC6qIGEhZmPmqcCN
         uuypcT+oDLwGVABBFUj5ZaZalVE4N4oGFQEaornHfBxb3r4K4WycNArfKa9xA/MSkc1W
         molA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773632893; x=1774237693;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fT5rQ+5gT8sJC6asjov0bMTamVqtx7ocsFfxmTjg43Y=;
        b=aBnIt0W0cIR/xlhKmyzKWTabci0ik9yNTQxVVCVJsJCVQKvp1VH40/9I7AyOzgVik2
         tHQhXh5pUVpTnrWqA5WXM8ywQK7hs1aE8DbSlDcW6kDLTZ4iUU8ttUvrozi6Oj9vbxRT
         xqG/0D1i9QXXyNkQ+HgPfCuFQ2wj3BIYKl5kUvSml0g7N5PDrlOv47OGHcgHrT1ia1eB
         f8gCX+VS6qXEdiY8OykvKKpMsEOSjWwyOy8LShlZ/EF9Mo8CFw3zrKuEDM1r1mimc6mQ
         0iBUCDVTUYRBGTTaEGHdnoa3Q5qxza1s/3d/vr7RXxPOh/BPu/0cKmpPylI8f+NoDhLN
         BWmA==
X-Forwarded-Encrypted: i=1; AJvYcCWPu4MHWBhScwEqUUUWT3LBWksBg9hrRBJqrzRe4xh6dRR1ukb+3p2qvSfCyGD+UQvDf4xo79k=@lists.infradead.org
X-Gm-Message-State: AOJu0Yy/yydsqC679mhsbCIAxlhfBfs4F5A1HZARX35I3NB01f8Qs4E5
	45/jvMahXI4+xGW0t7vVd+lrCkuTk8khGM+jmTPioZspat5ui58FVDnqNKEmmPFLwUVLVQINxA+
	0I+fKKnSouzDzGWRTtvi56uIyWSEqx10eRVbCyxK5bSGvEtr07SV9AMuve4IlzGE8
X-Gm-Gg: ATEYQzzT+krip6fdBbPy9sL20jFqNPAGu+v51NWttNDhLNoLRPoA8OY3RgzJ1bxkdL7
	HgU72nbSDHRkhxSlK6gnUgcb1+cljIOn+aS2qtF5J1rj8HoU6JAfsEpeOfnwJkE7bOxC6iEN0+M
	tItURp7e/QGSXXLKVpQ1qYrFGt0bcwyXW+kUd2tmdadNBl4CxdHWxmyvpCapIIjxB5zSfjEirF+
	Vrz767vxMf/2W73F/pzPcNVVhjijaFN53yw3WLemWkbjx1RtyO21uzm0qKzS8rKbPXc8M4UPe3o
	hrVmgLNF+tReGs/cjNP+s52giKwREtCzpMLJ7nu7QyXu2Xp+D/IFyGAP21EabRk1dj+GKRzsoww
	gS8tVICvHb454DlHMXItStjyqYYyi6S7aJihHO/V4xN2zvM0f+Tww17XdM2vry12iAw==
X-Received: by 2002:a05:6a00:908d:b0:81f:3957:2772 with SMTP id d2e1a72fcca58-82a196f6403mr10117846b3a.3.1773632892549;
        Sun, 15 Mar 2026 20:48:12 -0700 (PDT)
X-Received: by 2002:a05:6a00:908d:b0:81f:3957:2772 with SMTP id d2e1a72fcca58-82a196f6403mr10117829b3a.3.1773632892030;
        Sun, 15 Mar 2026 20:48:12 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.81.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a13a2f112sm11418137b3a.12.2026.03.15.20.48.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 20:48:11 -0700 (PDT)
Message-ID: <80ed7081-b17a-4251-affa-68a17c21e884@oss.qualcomm.com>
Date: Mon, 16 Mar 2026 09:18:07 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: Clean up the WMI Unit Test
 functionality
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
Content-Language: en-US
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
In-Reply-To: <20260310-ath12k-unit-test-cleanup-v1-0-03e3df56f903@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE2MDAyNSBTYWx0ZWRfX1RueUX7RItiv
 1pB9S2umDEUZJ9srZMyQGmTFL31DGh5VQS0gS8xyMic2L+6Hbgx2TCZdrci/mau9ZcDeVke0Akg
 3ZPhHYgEKAJYC1ZedikApzpiM1WGpzSt/ADAYMeSbnqSWQK4UZ0tIQuPiGp4QBn2IfDJ+3XmIbb
 zcjHJEf5IYbFYRBLMg8NihnPc3RnAzCMsPG0M2twLF7UzYnxARzjpF2OizecV0bV9NBMUMIR8LW
 AH/+YgpKsgOmXnwzdUldV9gRkehonOJCCfaFIa9FHZiG9gEwXhyHDPXq8ADMfXcgdba3TfrPlk+
 lCCxoMSapc098ynwBRIrKssEkKoQvf66WiekIvQJ4ANwfKnWT6ypp5NGzyOOWfGpIZJOKFPH9em
 T5ZsY0+6xH78dwb+EuuNZPlc6UYP65jHYnvC0aoxEdVrxVqUA3O4whWoU12V23KTB5pcuUtoHlH
 jNFMEzMhQ7fL4bu+OlQ==
X-Proofpoint-GUID: zZ63-XohVcrzbQbw0BrYjFC9IwgMZJfl
X-Authority-Analysis: v=2.4 cv=fLs0HJae c=1 sm=1 tr=0 ts=69b77d7d cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=R7zuFBDiW8lgADV909h7jA==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=YydTf4iuvZLm8uLOWi4A:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: zZ63-XohVcrzbQbw0BrYjFC9IwgMZJfl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-16_02,2026-03-13_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 suspectscore=0 impostorscore=0 clxscore=1015 adultscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2603160025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260315_204815_878347_1C4D1DB0 
X-CRM114-Status: UNSURE (   8.91  )
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



On 3/10/2026 8:46 PM, Jeff Johnson wrote:
> Patch 1 updates the core Unit Test functionality to address multiple
> existing issues, and patch 2 removes unused DFS Unit Test definitions.
> 
> ---
> Jeff Johnson (2):
>        wifi: ath12k: Clean up the WMI Unit Test command interface
>        wifi: ath12k: Remove unused DFS Unit Test definitions
> 
>   drivers/net/wireless/ath/ath12k/wmi.c | 58 ++++++++++++++++-------------------
>   drivers/net/wireless/ath/ath12k/wmi.h | 14 ++++++---
>   2 files changed, 36 insertions(+), 36 deletions(-)
> ---
> base-commit: 9942b3f80f4ebe6852663e0d35ecaf6b7a97c8da
> change-id: 20260305-ath12k-unit-test-cleanup-07622698c994
> 

Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

> 


