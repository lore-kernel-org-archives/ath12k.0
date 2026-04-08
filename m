Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3C6FFD5F80
	for <ath12k@archiver.kernel.org>; Wed,  8 Apr 2026 06:06:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=; b=sUBt1A+1SuHi65zWBq6s1XJ7xa
	P1GWgMYem8P+u4UO4S+ozmpYDaOy75WjmVPRPgOH4BVvzXjmjyJX0WfZOVFbi5j/bMbeG5gPEd+Km
	KHYzhNBUWEI3LgBNDjzjKVD5wdkDDdrmjqsv2De0R9Nd+famyfSdiHOfIf9ZXgTcydVFtNgCBi+3u
	KEub8p/5HkF9w/cVfpP8wxBN3AGxYRcKnLTWbRYimtNmkD5RCTRlJeYx3Ujr9CmAXLni7WzIaOpNe
	pWnNVC5AUiRNeLn+UbWMnLgMD60G3nO4pfuVFWjcft24zRHXzhnB2KX1UaU/7ZDobu7OSWALO3dHU
	PUy7zlAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM3I-00000008JhR-1dTq;
	Wed, 08 Apr 2026 06:06:12 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAM3E-00000008Jg9-3e0n
	for ath12k@lists.infradead.org;
	Wed, 08 Apr 2026 06:06:11 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6385N6EL072568
	for <ath12k@lists.infradead.org>; Wed, 8 Apr 2026 06:06:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=; b=SCqbc9dbcvjp9zag
	sXcMrMzInXJcsKcg0+8Xl8KK1RqI6vj4HzVBIQAFpmUQ5sjYObWGhR6ZHQwBqHxn
	XMZnOd8HreqbHjJdpx20WwTwZc9MM6ebnh1NoDdJtxMrLrXFHPpnLFUcmWexMZTY
	Sfg7VeKUk4/zmDJrQNlLPIzE/7mjAqXCzPh6Fy+PIqE089lBV6z9RLtbLHJnlLQU
	dyQ9EhlHAH71NWU3vHo6SUSHnbAdzhtUC5w0yYa11k6haFbcRR9vp729x8WkTsbP
	tPq4apZ0DnGjKtOXpBDUJIw64cmNRMLo2HVpXVudLOIfExcVNRnZaqFlKwhQ2mCz
	pMhoGA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dd7sx9quw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 08 Apr 2026 06:06:06 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-35c1874336aso12804664a91.3
        for <ath12k@lists.infradead.org>; Tue, 07 Apr 2026 23:06:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775628365; x=1776233165; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=Dvfx44r/DtrABgPaCkCMTqj527zGrB3+p2EfYR+u4Faf40L4uGcxqa0ZC24EfnfOTX
         pvNhKenRbSd800qMM5pWdeZp3OgloD7ZtkCwMh5lForilhgbuSgJxBRJwu8LAlC3q46b
         vv1JLy+SnipXwS4xo+cmbIiEyalLVz67NplDZUC12XgVGv5Zop471JR9E6IPQXhXfcPY
         /6DzQBuDvHb7RcE4GF91B8mKgocukS3ZFd8dHJA18G2yrJl8BmgLR+6JnEQKSOW3RKGb
         9mmUMqB5JJMqC9ee2f0WKxwf7Prkequ+uwjhQFkVWXPy79kXKWgy4boNmISSKcaEw3N5
         iSLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775628365; x=1776233165;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v0EWSn6WklXDbV7L1GTeMxyO36jOW5P3v4CqHJu5cpo=;
        b=ly2XUbKJSfuh3JckDdJ9BFS9z0CbXAr91Y/Ychf8LKyxttGVWcxEEYImmQIFf3fgb9
         uwbNyKaqtE9uBM4qbBw2ra4wrC0YSdSfzsuNGtj9K7f3e5k0x9L2o/EU1oM/1E0LZuzk
         NqbKVLfYYJzvyTamhiG2ZwNFnrFeDEpNiB0GxiGVkC+xe40NWmBUo3gGPgtrsiXPvVcW
         5tZtNv7GJUYnmn+Bm3qL114ZeTiXFtK0I6NQyqMsLZM6nwdN1UqpUGfQUG+cTIpAvxdS
         3KDoRFgVWMHgqmeOQigtmV/6qg9OIm88uoWTsll3T3BkiLyGxXzkFu/pI+GZmmElIQMW
         BmxA==
X-Forwarded-Encrypted: i=1; AJvYcCUFY/f3sHo0wnX30tkBwNT6yrhH9KUqjBPIwxzGokAgzf0QElcS5jBvURPwpm6UtE+5BotRA9Q=@lists.infradead.org
X-Gm-Message-State: AOJu0YyU2f0FHcq38h3/Grz1DSR4kCEWDYtsSDpgj9I3TtwFhcQSRZSt
	2ChvA2xeDSBgE212/f8xe67Gp+T/YZ1IS1UlB1krHjcg/admr0nLLAo1cjLKHSIzRAVRedEXKgL
	yY+hO9kQdYX5AlhQ/OAztq165Ly9TQo1zVajdJild/gW7htE5atHFxNqKDBH+HSXk
X-Gm-Gg: AeBDieuRn5I+JeBOHQbi+InSoHvARSw6VqSf3e100jyfBI1V34WL8JNDuH4sNI9iyKl
	oiqbHym4H8uu7BQBepAA/r90ig0ALsjx3bbYyG8xG2pvbfx5nVRq4NoXpHlI1wJ6Zi9RC0SXqOS
	r4W6uVVcBsMZGyl/YbvMrexYgEitT4tjj8C0f6cz3YgAWLovgsDC98ea70mcn9MR7+wEQILAj6V
	/pj0vghcYO8xVwcoDusWHgHNtD5XZValkC1oOEWo7SC8jTM2GGn4b5sCscLHHjENwXxpT6ySQlP
	8ZQAOOgQcsC0g44epsq2acYeU0/4tjsSeO8vysSuXtT/YPvdMHX6IRf/Dw2sXyzXv+Iz737uNXQ
	APCXdr5gsric46Fiy904Jy96iZ2qCoDcHHDVhwzy6fy4df3gGxfL5jbG6X1ug5bF2Grp+N/BAe9
	uMOYNFyhrjzDomuJMBnmU=
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753252a91.28.1775628365491;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
X-Received: by 2002:a17:90a:d005:b0:35d:9d28:e897 with SMTP id 98e67ed59e1d1-35de699f483mr18753218a91.28.1775628365004;
        Tue, 07 Apr 2026 23:06:05 -0700 (PDT)
Received: from [10.133.33.204] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35dd36a1d04sm25128122a91.17.2026.04.07.23.06.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Apr 2026 23:06:04 -0700 (PDT)
Message-ID: <ff11954f-345f-4865-a86e-759aa167768d@oss.qualcomm.com>
Date: Wed, 8 Apr 2026 14:06:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] wifi: ath: Use static calibration variant table for
 devicetree platforms
To: Ernest Van Hoecke <ernestvanhoecke@gmail.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>,
        Johannes Berg
 <johannes@sipsolutions.net>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, linux-wireless@vger.kernel.org,
        linux-kernel@vger.kernel.org, ath10k@lists.infradead.org,
        ath11k@lists.infradead.org, devicetree@vger.kernel.org,
        ath12k@lists.infradead.org,
        Miaoqing Pan <miaoqing.pan@oss.qualcomm.com>
References: <20251114-ath-variant-tbl-v1-0-a9adfc49e3f3@oss.qualcomm.com>
 <2fd84ab2-2e3e-4d05-add5-17930a35fedf@oss.qualcomm.com>
 <jnggqxqv3rjzhyevovnnxzplfhl3t6auhhvmoz7wxmsf6awgdx@dusdgxwsxvts>
 <b8277024-f9d4-4f17-946f-c2c390669067@oss.qualcomm.com>
 <exfmj52dqu3uctwsb2gopcjg7744vq5avlkahtmgfw4opw4mfl@t2svrln72u53>
 <f853d9b2-47f8-47b5-a02d-6aa8f12a4283@oss.qualcomm.com>
 <trr5j57vwk2dhoibdgdxnlkftnmfcmjkwmicsiltmhybxanjaf@tzaeeqcyz56l>
 <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <fasihmiu2szj6m2r3qef5slvzlvdjo2ajhrd6xyqsa5cajrbzq@a5dyulg2dnac>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=etfvCIpX c=1 sm=1 tr=0 ts=69d5f04e cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=eKx4iS3zDsI69C-aG7AA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 96i1MgfJNwBaVGxWAgEFGT7D8xvkLnKf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDA4MDA1MyBTYWx0ZWRfXwqQ6cZZS7Qyk
 +LYekMQtGgkj+sMX3KgkzyMTGSCKzAu7vyd9UlScwADXb3LIDet9MJ4wINoYlcskdRnqYJ3KcNq
 +3g1tEt9ZVlQ2VIQDFIQksL+ZanIYLKoZCdK4CRXJfS0WAiWsiA2/TbrDUjlI+4l24/yaUhGtd/
 6QCIt9UPH1Y5SGrLwHRBo7OW215iP6JDgU+Wr6LZcmRzrQAnsY3qMrmnq7r3eIvenE4hX3WTD9Z
 KO1ya2AIGWl/XYW3yBbLInyGYvNPVKfC1hgOKKMXdEIj2zBQpeBq8G9GDbQj7aSC/8xo5ZjdNRX
 nRO6ngP+s5ahOFRtflMyYD8qs/pE0qQNWPhWwvaIo87gQsx0W+kxALAhySpqcblCTSiyQ2IBrEt
 /GRfOqcEPyf0o+UkmMCOXNupzmCbGZZ668xFToufJBjgD0e8dUBnJ1GL3vMkmBFUtX+Zf74fU0j
 PTyMqo7IxosIyrsIXjw==
X-Proofpoint-GUID: 96i1MgfJNwBaVGxWAgEFGT7D8xvkLnKf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-08_02,2026-04-07_05,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 spamscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604010000
 definitions=main-2604080053
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260407_230609_022928_6F4A3BEB 
X-CRM114-Status: GOOD (  23.40  )
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



On 11/25/2025 5:57 PM, Ernest Van Hoecke wrote:
> On Tue, Nov 18, 2025 at 12:23:20PM +0530, Manivannan Sadhasivam wrote:
>>
>> ath12k doesn't seem to require a calibration variant. But even if the user
>> replaces ath11k chipset with ath10k one, the calibration variant should be the
>> same as it is platform specific except for WSI.
>>
>> - Mani
>>
>> -- 
>> மணிவண்ணன் சதாசிவம்
>>
> 
> Hi all,
> 
> Jumping in on this thread to ask about how we should handle variants.
> 
> We are using the WCN7850 device with the ath12k driver and received three
> board files for this from Silex, signed by Qualcomm. All three support the
> same board (SX-PCEBE), where one is the board file to be used for the
> US/EU/JP and the other two are one for higher emissions in the UK/CA and
> one for lower emissions in the UK/CA.
> 
> Since these are needed for regulatory differences but support the same
> board, we were wondering about your views on how to handle that in
> mainline. I see that there is no support for the board file selection in
> the device tree for ath12k, and that there is some discussion on how to
> handle variants in general. We are using a device tree-based setup and no
> ACPI.

does your machine has different 'model' property for different BDFs ?
does the existing ath11k 'calibration' property based mechanism satisfy your requirement?

> 
> Thanks!
> 
> Kind regards,
> Ernest


