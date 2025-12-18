Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24951D6ACE4
	for <ath12k@archiver.kernel.org>; Thu, 18 Dec 2025 10:54:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=; b=eT7qG2oi1YHuv7DXxg4gRwIacv
	QcELaM0/6wnNFfNrtlxLMEyWKHzgWiodjlNWY86r5J9JmwNozU/Pz/eTm7piYhsjijeB+a+ueHQ3n
	8QJqFRKXZ8MzUUs0hqd55Kx9hxVUAAuK0lqJSca8zjlBfzxm0Yn45QfpxyBTRaDfWEVuC7UcIAeIq
	nHOv5o93D/FbmdCK23yAiTnqyLIjOdXTzqntGDIgZ5+aG4MRQQlUOMiO+wWoS30ArtZ9Z8loJjVU+
	oDlCXSEIZdUjWk3L6NGJ/9fvBVyPq3xgWS6nhrQk2Y46OweKPsEeHkGTl1FJ3Qf93evucrD/7YRSg
	5FXKXQcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBeI-00000008H8l-2axt;
	Thu, 18 Dec 2025 10:54:22 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWBeF-00000008H8D-0mFW
	for ath12k@lists.infradead.org;
	Thu, 18 Dec 2025 10:54:20 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BI989XC4058529
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 10:54:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=; b=BaMvMObltxpjlJX2
	hDi1lnh+3LRntbDrAOg4JzxnEtNIasX/GHrqSFO+6PEWprty46vErmrdjMQ+0R+d
	PB6dMSyhsXsOkkIbRyZN5NF2qNh1XM0D9CleCOljN15BesCsdrMWuoPmygi2uKmr
	Ft7+V5RzUDdGWtmok/tlpi00lFdyIc58mdQug/iwF4CS9X0UaOjuIB4sQQ3xWjCb
	Gy+qX89KVMfYKr4/GHEFEhTBP9LlIxbD5MafnUxG5e1BWN4PNk2oKuSPL7hydyiy
	u2DEGsYL8IcAXZC+RoFjU+IH52kpMAsyPMwvvOcppYFYD1UasINp/jkJoSIw90ZB
	1oZrXg==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b3xr5b9yr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 10:54:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8b196719e0fso13184185a.2
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 02:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766055257; x=1766660057; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=;
        b=Fs6zqQHbS32AW4T2HS+LekQRNU4IVzsdTkwn+t+NArSRRyZiRcbBc1PmOBGgL2sGZR
         cXJ2kfFdU2EsAscxITdnwEvlNpUDQ9a8ehYTA+VKw8opwkxVMLuRz8iazls8qwt3RdT2
         oGjyfjpVggljN2Snp44N95BSfxOxTaKgnuXQ7TBjZ/YKUguWIKI7NL+RtqcdGlK6nyjT
         +LvyPtrrxduFCnz5XYcGK2t7GCdWTNEXg48HoV69Zr1UDcl/BJd05oFZiScORIWsK4/o
         Wc5dj81JafOwzeKDJLGbVSxqR3rxXDkc2iXRR3xTvqHobgcB2s5ViKA+th8Mqpa6JUln
         7vzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766055257; x=1766660057;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ULiMr+jjQf2IPNeanbk3DLBorGWRLoXxf7JiGDZ0X0I=;
        b=pq74mFFt0q1BwLLxav+sSA1f9Mb0xUeAgBkNF7Vtc42D2DNtfN9zsBPnQrHqxvQSNy
         n5vi9pORqgVe3KtcidT6f7MSYFEIEK54Qt+X8ILioI5HNJA9xh50T2VGgaA/MxTrYuvG
         5KFKUuxYbUabEYGe6x2sPS7EfaoHxKhYZvXOwMXA2Ef/px5e3l4TbP0jPs++qS27/+1P
         JLud6qqKwfHaN8AgYc4X2+UhWjA9kiP/1ziob+Gsy1RqYAeWOw7uaXPNGHwq9vZ6Ee03
         FJ+BxLsc7sezUQkLqogLzI/K02sp8XD203I22auMfH5FN17+Wc8ZEP84svvynsvPobZx
         WBjg==
X-Forwarded-Encrypted: i=1; AJvYcCXazlB+ERsOKnOvcWRka0ctM2Tr3s+vz1XgcwTp4T1pjmlRisa7J74sxmy/k98rCSJi8s26FJs=@lists.infradead.org
X-Gm-Message-State: AOJu0YzThKqrxEqGmgKGjTTeCeWPn7MsgG07WZrfg3etI/RVVjXofTdL
	F1JwRoZ56xAjGNzworXfj6Fcj7viUx22dHfyBRKZSsjmu35WVuOkwF6brzmhOHUIZyTuijchh5P
	3dr43aaRihgDIm+WHnWisUN/6BpvZNd7fC2TS6yHHXuLQwMVoNuw9x9e6S6NB9DR6
X-Gm-Gg: AY/fxX5GGwBNoArpYHGFziWL5ufNOtMW1J7CgbZMNwyz6O7OhdfnUIL5sO7fsdJC16V
	uZINCJCbgt3IDsKurO7Urhzu6FDVoLHPaaWpXrgLUiTWCw/02YCiqmyOQvuqIuMwUy+FCp+Mija
	B1UYj8YSQaMQfbPq29hJ6+1HCe+WwGh9CWz0aBURNJq60ytPW5peMkFAbS0ggTB2+FgdMPXeRRp
	UXCTf0Fcj+5OVNhbEOtfLrg/Xb83jJnUCCdXAIv6QJuRq/Pl2I26WQQp9OnNqa+smXZXDfgo1YN
	c60K0lWI8UsHQC0A4iWZ0RcEpG+FVmNslunXABq6a/zcq4u5hEzPsFgodbtOVNPaQs8NKJaf9xD
	xAPzAoDIEGEgVzKJfY7v+xpUd7LEe5eFHEkCXq6Ilf0bYYuKlOQD4OcInLOf8soiuhg==
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8bef2b6ad2fmr173838485a.9.1766055257302;
        Thu, 18 Dec 2025 02:54:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFg6rD4FG+ZdEpLvSxXB7VPKfet2cJMu4WCkxjwUL9ypB7KXsrgvhhdJxlHfMC+UTosSE+weA==
X-Received: by 2002:a05:620a:4441:b0:8b2:e177:fb18 with SMTP id af79cd13be357-8bef2b6ad2fmr173836085a.9.1766055256861;
        Thu, 18 Dec 2025 02:54:16 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-64b585b52bbsm2367565a12.6.2025.12.18.02.54.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 02:54:16 -0800 (PST)
Message-ID: <4491e009-0071-4130-9e1a-29145314e349@oss.qualcomm.com>
Date: Thu, 18 Dec 2025 11:54:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/6] arm64: dts: qcom: Add support for Surface Pro 11
To: jerome.debretagne@gmail.com, Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Johannes Berg <johannes@sipsolutions.net>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Hans de Goede <hansg@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-wireless@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, ath12k@lists.infradead.org,
        Dale Whinham <daleyo@gmail.com>
References: <20251218-surface-sp11-for-next-v3-0-875afc7bd3b7@gmail.com>
 <20251218-surface-sp11-for-next-v3-5-875afc7bd3b7@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20251218-surface-sp11-for-next-v3-5-875afc7bd3b7@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: _ZdAIUGHIcG_dUEP3wqRWk1Q1VmDphDi
X-Authority-Analysis: v=2.4 cv=DsBbOW/+ c=1 sm=1 tr=0 ts=6943dd5a cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=T6QFUigfjUT3ERtuJAUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE4MDA4OSBTYWx0ZWRfXytGxIuvRzDhS
 Ive/hds5vp9QtHOOWh64fyKJbWTi8c42eYG/58C9/naI9bQGddzfRzACRaJ7Tq/f3ORYRCPIU1+
 FGCezrHrcdAxcIQOjfUGJnI+s9mx7ITTTXdnyU0E7kXR1UEpDhqcXnkc9bpmITXfC9Zu3jeTdPG
 t+H9zelTP3XsGrMjkflmKvJ1/t0Z7fBdqN2QFr107/EuJY48FBpX1M1Ohi5xEerO9oU1HhLWNry
 I3OREYkdczqVBENgR+eaqD/4hAJN9F3+oiT6YrxEQHJ4Xvd/TUbZcV54kdVmew3iqLjgk0zbAJ9
 q6t1Ug1qHBDFzvKlymRGE90LuzMCA9Qnzn/8lRr+w8GAILXDBvhIVG8wy0C/cqFLLS6yugkFHw3
 jVP8IsMPybw8k37Z879536sGfeeJUQ==
X-Proofpoint-ORIG-GUID: _ZdAIUGHIcG_dUEP3wqRWk1Q1VmDphDi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-18_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 impostorscore=0 spamscore=0 adultscore=0
 clxscore=1011 bulkscore=0 malwarescore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512180089
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_025419_375981_A7211B91 
X-CRM114-Status: GOOD (  14.19  )
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

On 12/18/25 12:56 AM, Jérôme de Bretagne via B4 Relay wrote:
> From: Dale Whinham <daleyo@gmail.com>
> 
> Add device trees for the Qualcomm X1E and X1P-based Microsoft Surface
> Pro 11 machines (codenamed 'Denali').
> 
> This device is very similar to the Surface Laptop 7 ('Romulus').
> 
> Use a similar strategy to x1-asus-zenbook-a14.dtsi so that we can create
> x1e and x1p-specific flavors of the device tree without too much code
> duplication.
> 
> Hardware support is similar to other X1 machines. The most notable
> missing features are:
> 
> - Touchscreen and pen
> - Cameras (and status LEDs)
> 
> Signed-off-by: Dale Whinham <daleyo@gmail.com>
> Tested-by: Dale Whinham <daleyo@gmail.com>
> Signed-off-by: Jérôme de Bretagne <jerome.debretagne@gmail.com>
> ---

[...]

> +&i2c4 {
> +	clock-frequency = <400000>;
> +
> +	status = "disabled";
> +};
> +
> +&i2c5 {
> +	clock-frequency = <400000>;
> +
> +	status = "disabled";
> +};

A little bit odd to leave them explicitly disabled. If they're useful,
enabling them makes sense. If not, removing the reference seems to be the
way to go.

With that taken care of, one way or the other:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad

