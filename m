Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6AFE9C43602
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 12:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oBbce1WRUs3G2E0RY0k9esyoB3WwxEZLpDwnuzZhw+E=; b=Fw6sJkVRrXDtMpW6VICO4QqrYv
	nHyg9W7hBT0gr3aSA/V2ilioSWL96/bu8y+DOtR+INhhEsvSsbORYhyrg4wRaj8LWb4FC3Du929QQ
	5d0xc30ssORn9i7GI0VCsCfInpDy+FOTGXpfEhVi4g8umjD4m6uIEo9/gOo33NXmBiJ461nRKzq6q
	ZeseZ4ygNWqoHQMtlu+RaLBv9wcsDTULicQcfmFhDhqJ1unTvAenoV6Uu19jz1sxv9cTz/aJmZpPg
	4Nf9m5RxHkBFIr2TgscOUBs/NhW6ox7AVSWC4RYHGy3mS0PZ4dcrJXymaqRQcViy2+UlBdmyV/39D
	vnJQhFMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXMQ-0000000GxIT-0jYr;
	Tue, 30 Jun 2026 12:14:42 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weXMN-0000000GxHu-1naa
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 12:14:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65U9n0qj1573338
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:14:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oBbce1WRUs3G2E0RY0k9esyoB3WwxEZLpDwnuzZhw+E=; b=Y1Rrhq5yt8TfNDWs
	EgLGPzpahCcr/ZfG0Sl64RZ5vc1iAyxEEkLH1gVw6YQ3d+itWHbU9H9bJAzAcXKR
	2/A+vh1LtOvqK7yf5qXmxGPN5wP6RNqQTW6KCTswuEgDz0nX8TYHu5pfcZpPeHup
	CbHdMu7jpW3GsAnLW8YjKvbzZDJ1rn867EzrtM4f7+vPrirw/3bfTvvPIzPMLQz8
	xSE6O3iF/rkQQq8UazZS2apXhMw9Q8sqNUmdOBUiGf3kKrUUD9ga2qbaEJb86ud1
	c/nDhl2v+J03zcyY/JVJF3+Hl7IPjvXeS0+icmcN1p/XJTSwqj/BuM4vw0fbh1fd
	W+wZiw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f4686242r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 12:14:38 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-92e566bae1bso41432685a.3
        for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 05:14:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782821678; x=1783426478; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oBbce1WRUs3G2E0RY0k9esyoB3WwxEZLpDwnuzZhw+E=;
        b=B9KiEkj9KlNaLyvXHY0JMgeipOSKVqDCJnWnJ9I52RFVFgBR6ae7kYJKJUNFKVxUwp
         hKrd8XJHkn0RMfRLuFf5UjaHI0nZYd27XiMVYd0Wkira836CSajeJRCAvJd2B602c69x
         2v4mOe0XvReQoRgh2eIcyv1Kag/VKd10FMoFQPKu9YS2nwen0h5H+TtQlmutxYNMF+t3
         oQvLG7R4TyurOhq110vvzikjUvPjpY+uiUcQ+puunFA/kQ6N+fEALbf+gnTUa8yKp225
         kBJRwbURLjUbjeUNnAW4xQS1SujKw2Fffe/x4QEsWbLYJ2tgdJT/c+WyFdl64sJwuEAd
         9Zog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782821678; x=1783426478;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oBbce1WRUs3G2E0RY0k9esyoB3WwxEZLpDwnuzZhw+E=;
        b=lOFeJ+AStvQG7NN98v0C8IIxeXevz5UgPfz3q5QrMP6YWWwlaWD+UTZ7Ip5zbLIOSS
         EyEO2pCtRzoJTZVB24biqHNxURL0xRKsZV3S1EYfFw8uA+HvgSxOxrxDyGPJfZ9LFUTh
         KvwR8GnAVrpqIpM4Gr+KnZiaXIeChGRR9oIGmKsMfoGsvGsKggdOSdBc8Tmv6csNHACj
         S+PkUSTPULtysY9/2diHbSZypNUlVzUrj1t+Kv6UCN+QIwRDOyLdVGr1rVFv7/lMjs1u
         t0uklnIxzzb8R3NVWCRae8yVAL0p8cGTNgxgKwhgz9GeAr6MAUJOWNMmUr9KkfPyPBX3
         /j8Q==
X-Forwarded-Encrypted: i=1; AFNElJ9oZoCUXB4qC9+ANsP1KYp+gOCY1RK7noPPSpb+zA920iZf3DMxUXbhz7TgvdUXOWso/42bt88=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx//jovOQvF5X/0dZR6Cd41Shz/wmPLovXY8QeE4kfdy/7e5uZw
	GNJ4PU6yjlrEesDNMnYCwu1dFB2eyhO/fqGDxcuptpZzZ2ng2oU4EXw0+hMzJio/mu+vCJEDaka
	YAW1wYvGAb/LUDV+C8XMkVxSkcbJC6zqcRwOpaOQNtOAjOMuaAak5xaZsZwxSP1Dm
X-Gm-Gg: AfdE7ck4naMNE8wR2Vwcx9+4MUAfgeOUPBvWtPfyCdaB93n3CJiESC0OPyI0RdCQ4CD
	PNsyu7MXaYg/+0nQ4r32NLFvJI07/Q3edvQ9Lb3JPIJefk1UwOlYduv1OJN9fatlThsRjVkpEgQ
	c/5nnOJCf3IRZCeo9ra2lHjjTKN695MXXhkoV9V8Qg9fLoJwMAwWVdIixZHRK+R+0hUOtzRYBRT
	GEPEHGQOwtpQ/UqBaD77x1/IQAviFaQJTsG+D34iZmroUO+qYSDkFFs6/KvcPvwsLvkHfrBc8dq
	KABje5w46R99QnGbfA/z7fQz7aTe6Aek5Hx/60XiS67qCa65GMkx+zDOIyB7b3MDiyJbfUvBC/b
	1hoiEf/axeUH4xU+fmm1hyjh80QE7lajB8lE=
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr355402885a.5.1782821677767;
        Tue, 30 Jun 2026 05:14:37 -0700 (PDT)
X-Received: by 2002:a05:620a:2589:b0:915:7c1a:1388 with SMTP id af79cd13be357-92e627e197cmr355395085a.5.1782821677127;
        Tue, 30 Jun 2026 05:14:37 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1296b1f9cesm21325366b.16.2026.06.30.05.14.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Jun 2026 05:14:36 -0700 (PDT)
Message-ID: <dc7e58d3-4383-4d93-a38e-699888bff903@oss.qualcomm.com>
Date: Tue, 30 Jun 2026 14:14:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 01/14] firmware: qcom: Add a generic PAS service
To: Sumit Garg <sumit.garg@kernel.org>, andersson@kernel.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-media@vger.kernel.org,
        netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
        konradybcio@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
        conor+dt@kernel.org, robin.clark@oss.qualcomm.com, sean@poorly.run,
        akhilpo@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
        jesszhan0024@gmail.com, marijn.suijten@somainline.org,
        airlied@gmail.com, simona@ffwll.ch, vikash.garodia@oss.qualcomm.com,
        bod@kernel.org, mchehab@kernel.org, elder@kernel.org,
        andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
        kuba@kernel.org, pabeni@redhat.com, jjohnson@kernel.org,
        mathieu.poirier@linaro.org, trilokkumar.soni@oss.qualcomm.com,
        mukesh.ojha@oss.qualcomm.com, pavan.kondeti@oss.qualcomm.com,
        jorge.ramirez@oss.qualcomm.com, tonyh@qti.qualcomm.com,
        vignesh.viswanathan@oss.qualcomm.com,
        srinivas.kandagatla@oss.qualcomm.com,
        amirreza.zarrabi@oss.qualcomm.com, jens.wiklander@linaro.org,
        op-tee@lists.trustedfirmware.org, apurupa@qti.qualcomm.com,
        skare@qti.qualcomm.com, linux-kernel@vger.kernel.org,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Harshal Dev <harshal.dev@oss.qualcomm.com>
References: <20260626133440.692849-1-sumit.garg@kernel.org>
 <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260626133440.692849-2-sumit.garg@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: JWujFv614c04P11QWwwySphl6SigIwDm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDExMyBTYWx0ZWRfX6oyDhd8+P0TQ
 EH3tOly9ST6llsvTNECNmnJbokC6tUPI0DXc8VjP64n6zeDdo9STKSzq9Bda9jBmN6lOLk5lTnJ
 A1aRZOM5LHuN+0wpK6UCz1mF5fTsJrBw87Sfd76lJJTsv2qv8DoBq5tjnOAJ8PwIGBCIT6RZ23U
 SsPB2U9eP4rRCAlC+QYOYWxS+xhk/PeH2KrGquNgvyx3GdcIi75ofDozjiPO16zULNxfBw8AJCu
 GJMFeQb/SbsYf6w9ROrGeB4YjGum3U42abzbs0Pu0FhlLZXZ7GnSfeWVJOz7p9a7V5VTXQL43w3
 C6jM1dWDX0FE+Y0y9DwZ/Mkvhi4Zh883+bcuETg1/UxsZ7XrMh9b/sZqzCb9tO6xfxqxl3Ei2F5
 zbRzokXwEWwqjs0InwFSpXzoHeeEdGSz1OiVPfshHCxFPUSlvSDRe9Uo/XJ5r2rkz1LUi288QgD
 ieo759O6GKduAEY6KWA==
X-Proofpoint-GUID: JWujFv614c04P11QWwwySphl6SigIwDm
X-Authority-Analysis: v=2.4 cv=FbcHAp+6 c=1 sm=1 tr=0 ts=6a43b32e cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Ltt3hjjT39zhUWiMmRAA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDExMyBTYWx0ZWRfX2AX1GUubhhuU
 P9bWjvEEUsB2qtpqjMohyq4jfYt/OjmxtXuIT0H/1USct1DzTHy+fTzSPvau13hc41AL44hXT87
 5K5yKhUoBLaOoNrHQIiByCdvPzUfVx8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-30_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 adultscore=0 phishscore=0
 malwarescore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606300113
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260630_051439_585633_7322B3C6 
X-CRM114-Status: GOOD (  10.10  )
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

On 6/26/26 3:34 PM, Sumit Garg wrote:
> From: Sumit Garg <sumit.garg@oss.qualcomm.com>
> 
> Qcom platforms has the legacy of using non-standard SCM calls
> splintered over the various kernel drivers. These SCM calls aren't
> compliant with the standard SMC calling conventions which is a
> prerequisite to enable migration to the FF-A specifications from Arm.

[...]

> +bool qcom_pas_is_available(void)

This is the most important function, for which I would expect
kerneldoc be present. I think it also wouldn't hurt to add a
footnote in every other function's kerneldoc saying that this must
be called first

Konrad

