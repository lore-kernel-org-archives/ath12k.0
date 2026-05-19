Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52726CD4F3C
	for <ath12k@archiver.kernel.org>; Tue, 19 May 2026 14:21:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=Blvqfsl1Kis9kcOMiMFYhAv921
	h7ctN5oVQk7mzhVX2ahho0EXM7BhMQ09lCmTo8B4/r24nXU4JFONyG0lg+k3xWiG86s9o4JY4EC9x
	0gSCfWixIevg4p9nRbmcYh0iz91ag7o/d4xqzvMmbBcDxJJ8TQlh3Rh6HXWlzXTLOI/yWw777ABVF
	JXp2+xVtKaZq10McbeYNtg8iQnTIU47pFC0WYpe7LOXd9XWkzmCHZjOICb8MavXbo0s6TP8CjnifJ
	dzmjdbXVR2+HXDFZ4BC4H7MHqfwj2j4xxWIH6ZLt2HInTtJcn9N/mXiscgpxVuXkhOkbAgnzMjhWX
	JvGHsEVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJy-00000001nvm-0CNt;
	Tue, 19 May 2026 14:21:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPLJv-00000001nuV-1JpD
	for ath12k@lists.infradead.org;
	Tue, 19 May 2026 14:21:20 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64J9vAh71054909
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=; b=Mw0ywfGpQCxFnMzB
	Lgb2Pyf5qoETlLQj8H0qchevDZ6GmrMFT3eH+zU2iyMjd0OOky8j3YJZH0mo2x16
	1d6kAi2HdtVIs78TMi/4WtQV9qUd/AZqpyNxz1BG268WIlHVxQ5meJVkptNtcaMg
	Rm1hiY0gwCfd8i3AlWq7xXJYBcS7ToMAxgwXS7AyKAs5f7dT0mW5h/8BvEvYX1o+
	U97j6Intj/8g4KC3IxsV4BxzdwXF65zGi71xcF8lPSVi1hOBRCAlKekbXmpU7DyR
	nt0qeWDYtnzGDw2Dgy4m0jRvrjRh/xo/MjroXB1JBgHNpkb+03sJCdsyDZpnDfdt
	aKMkuA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e8npas1du-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 19 May 2026 14:21:17 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-2fe1cf409a1so6903409eec.1
        for <ath12k@lists.infradead.org>; Tue, 19 May 2026 07:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1779200477; x=1779805277; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=FpQoRlONd5OgIOw6yaSU2htW2mrdYEkJRd8U5wjhyczPddvBG5dj1+6eSbM+2ifMVt
         K0MzbxKR1uYll+liTq2ShdjhyL0vaPKXLb9C2X2fFbn+W5xOgwqo6eO4RbCUCgwrKRwK
         U1E7J7KsZdlqTWBY6NXbu8NCSDzw5DJW5yu8Boae9q5WYxxdETbXzH6M87toP/sePOAw
         YudpzFnWSU+8C+exiTb1Xf9NhrSy4xLgKpuKQBXNLC+F2oLQw5yP7EHUaX7KgcuoCdKy
         FUeIjtfol526vGMxCRX4uJ8LpGlbNHJbUX29e38XKXty7iIYftX3fyg/6O4n3gSBUiy9
         nx0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779200477; x=1779805277;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yLCy6IjwNHKRdHvEh3dMPg3Yp+4phzm9ObBjZk3Z9yI=;
        b=Q5bZ5kalsmb7PfOtIgEjemseWk8B7cOjHbezyJKRyL6ySO0WblSm56M/g9MpjGV80h
         sVG23m3drlGTRCE1bPajZiimep0XfckUImU1c6M9QU9UPwtwVRw4/89G+w0My4pkqfYF
         8nAct20tO4QzwSNzKwUQxTn9xflsJxRB/7vc8BFn+pPmXAi5tTOgZhs1G7Z7ljBkwIVN
         zenPLF3Ey9qrMgyMBItFOoPpc3SIVo4TF6RoCerjw80VgfZ4UfwrcN5mzH7PTV054S3X
         6XagFsMlK6Y5i7ROm4MoNf/Qn85HUHOndW5pb5vMLUDEWF6bHW0CNo2UvHP3MQOxTe9W
         WO1A==
X-Forwarded-Encrypted: i=1; AFNElJ/sOvcTfaUTLa+uavZUt2qbgdOn0Hg5E4+7Q4KAL+KNJivoRijdLoP2B6oPD+dYKdZmT/skecc=@lists.infradead.org
X-Gm-Message-State: AOJu0YxAdLDwdGzcNjINVxRk4cu1m+K+uIC/+KyWuzzS2KXkvrLFOCC7
	0RSnpcS1xYeC6gNlQkG6/SMxzWax0IWdRNwPtXW8TWCuP3Tfpv8T4vNFQT067vz5vVZtSZ5xB/Y
	qJhmISeTCr6gFjjn7MBh/Iek5JmPmQYb+fD5IzZ1vK27833fPw/JeIxclJSVOwpR2
X-Gm-Gg: Acq92OEMgXZCpya0msO4+TdQjQjDkim1OXwjQoIMht50lLTeEFbm1vr7fJW6FG/eYNy
	IZopKM5PsN+guUKnzmkG52VJBS3O6jKfieeaF5Tw6ZFaS9COtGpPy0Yu6mOgIb2/zwIw5VXdFUr
	9px4ktSdYbGnAflVeXZVHE4q7l0nCRUDkQiyhKGqUSFW6t1VTB6ft3iE7OP5EFCPW6QGkyrbQB4
	1iWcIZ+ogDRDCMjCj7JbWt0/xjLtABN2BMfvCyPcFJdKiNj/2AbskjI8+SKG0XVn36Y/RpsWmhK
	qiSsEeDUXlzUiRJDmWIzDxSEzPWvj/5HKe7KddZLe0a50qrrADDQUTjleapnHp9G5Q6IsYJiWhd
	NRsp7a7zVVvEkWrdBeg8dTwEsMRLuWirDNSkC3+XSwUPcFbzBhM6BwgMm+VcmW1KyDzl4Zt+Oma
	B/EGF2i37pdjRZno4+TVn+w2pb
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792894c88.4.1779200476608;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
X-Received: by 2002:a05:7022:eacd:b0:12a:8ea4:252 with SMTP id a92af1059eb24-1350430f730mr8792864c88.4.1779200476006;
        Tue, 19 May 2026 07:21:16 -0700 (PDT)
Received: from [192.168.1.38] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cc3490bcsm19895516c88.15.2026.05.19.07.21.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 19 May 2026 07:21:15 -0700 (PDT)
Message-ID: <d88a1d9b-853b-476c-8f01-22fe24590892@oss.qualcomm.com>
Date: Tue, 19 May 2026 07:21:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: pull-request: ath-current-20260512
To: linux-wireless@vger.kernel.org, Johannes Berg <johannes@sipsolutions.net>
Cc: ath10k@lists.infradead.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, jjohnson@kernel.org
References: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <8756e3ff-52bc-4003-99ed-cda3170f118c@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTE5MDE0MiBTYWx0ZWRfX/zD/4IQOajI2
 OzKZfu96XiTC9gPm0fTU1VftlS68XOJvjUSxOS7sa6GD5e/Cvpby/lSM/8L4B19B5pFB9EDvCe3
 XzhZ2l+ON7wCO91Eu2x9MJ+lYmcNsH1egn/OzTvqzfaXzLo2Mh66G2aT+KqXey3MpkyUIa/H8Dy
 Sf0AmynCPikwAm5jm1cSbX0m4KR9wY1OAUWErJT5ZEE3+aE9EarJCDk6uNjqqH7ec7AzRCcU8rD
 ShaPorGYZwnkzC8nFOaRZJJuK0tdRdqMmML5bz+UcHo+G2ZPg7u1A4ilin0TPmktZKHuEWQWtDu
 pNBZZPikiD5/HchDq+vsikdTwDst5Bg1aTtw1WjUf3V/gUlmNjPqNIJZXpuIoRMEHyhQSqpb4z+
 adc34sAGz1QG7ZGd1x7Ffj9NOOL9oz0fcECj4t7DDF6ByBHC2MQGhYXv6gWyevYuIZVE3LPTS7R
 OlxTLvvp0xwEvqmUo0Q==
X-Authority-Analysis: v=2.4 cv=NrjhtcdJ c=1 sm=1 tr=0 ts=6a0c71dd cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=NGcC8JguVDcA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=qdzAxcUfUuEVABHHB2UA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: QeARKnYFoW_8TlaHuEKh7Y8diNmQIsxQ
X-Proofpoint-ORIG-GUID: QeARKnYFoW_8TlaHuEKh7Y8diNmQIsxQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-19_03,2026-05-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 clxscore=1015 impostorscore=0
 adultscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2605130000 definitions=main-2605190142
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_072119_466027_C314C107 
X-CRM114-Status: GOOD (  14.47  )
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

On 5/12/2026 7:28 AM, Jeff Johnson wrote:
> The following changes since commit 7666dbb1bacc4ba522b96740cba7283d243d16e1:
> 
>   wifi: cfg80211: advance loop vars in cfg80211_merge_profile() (2026-05-08 09:20:03 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/ath.git tags/ath-current-20260512
> 
> for you to fetch changes up to 54a5b38e4396530e5b2f12b54d3844e860ab6784:
> 
>   wifi: ath10k: skip WMI and beacon transmission when device is wedged (2026-05-12 07:00:00 -0700)
> 
> ----------------------------------------------------------------
> ath.git update for v7.1-rc5
> 
> In ath10k, avoid sending any commands to firmware when it is wedged.
> In ath11k, fix WMI buffer leaks on error conditions.
> 
> ----------------------------------------------------------------
> Kang Yang (1):
>       wifi: ath10k: skip WMI and beacon transmission when device is wedged
> 
> Nicolas Escande (3):
>       wifi: ath11k: fix error path leaks in some WMI WOW calls
>       wifi: ath11k: fix error path leaks in some WMI calls
>       wifi: ath11k: fix error path leak in ath11k_tm_cmd_wmi_ftm()
> 
>  drivers/net/wireless/ath/ath10k/wmi.c      |  15 ++--
>  drivers/net/wireless/ath/ath11k/testmode.c |   1 +
>  drivers/net/wireless/ath/ath11k/wmi.c      | 131 ++++++++++++++++++++++++-----
>  3 files changed, 120 insertions(+), 27 deletions(-)

Johannes, since this hasn't been processed, please drop it.
I have some additional patches in ath-current and I'll send an updated PR.

/jeff

