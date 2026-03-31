Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3742109B489
	for <ath12k@archiver.kernel.org>; Tue, 31 Mar 2026 15:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=; b=T8UKW63GMXOCMUVVFkvJc5mppj
	aHVHpjYPDFGjs6nRQ9KCq1GR5ghwK6MRaGqRF4uZuc2G5lg5aWqUPA3u2alJr+ESFk7b6VPmT/ViZ
	TLOFgWdgQBSH0ZjXIH8IpjkMEhSkXnGrc1ut9t+VI+QEtSbJprdAric33Fsu2AQnjRbCl2K7r1slH
	Zcon/+c5k9G8lMzln5tNkYMb+gOe/zDwR/KxPq8y6nHhR6qvcOPDKjrp1qBXV1+vahSyeIVFrnwyM
	HEJ1tY0A5hG250woVh5oUzD0SD2XxrBLZI9QYIvqnVrRfRzTF9/YAu+YjLe0qW+vKakR2MKjVn27v
	XBcBQ8kA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bH4-0000000DCaJ-2khm;
	Tue, 31 Mar 2026 15:45:02 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7bH1-0000000DCZb-3sfU
	for ath12k@lists.infradead.org;
	Tue, 31 Mar 2026 15:45:01 +0000
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62VBkpOW1841960
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 15:44:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=; b=HbOlMG+gxXt03AxM
	91Qu+18NcxLUuEcu9ukfrA+u2WB9DYL0OMTvFNtpSmifhbzE74vJSvrXXEw86ZS6
	8UMwDfeJ6QrtnnPESSKWQc494tNO+99j3hR9tFDHH2MeVM8r+Xhunj4DTgQqptpX
	CLSA/zMNHZ7VAySZPVbR9HwSwX5V+MyUvxMP19FbjRT7tS2Mdze8jpbws2TyyEib
	Nk6OqqUYNXqJfDYwmqznrhSUfie+zrxpTMGkaNnUXYCAQzdipAF+MolKocQ5897a
	xYn8ZwYW8rTqk0+AIiALYV330oCLxuaUNYfRHBWk61dzFAX8jZ9nlGVHYyFkOoB3
	NTDMaw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d80rsky00-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 15:44:58 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-2c18175fc54so19376372eec.1
        for <ath12k@lists.infradead.org>; Tue, 31 Mar 2026 08:44:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1774971898; x=1775576698; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=;
        b=Lx3jaL4ux7ZQoOhAUUrt60uUtV9FNY5Cf34fRVTOK7gF1/1WVx8cdy90tJWLWtRxHb
         2KHVFoYy8hRthHCaTirxylxUvj62xCyK/z1AEOBWqlESZZ6Q2QhRolpRGJRA2/zDI9Ub
         Mqr4MgDK07tCHe64wKhWDK/p5j4UEqvsPIVuw7cOjJJolUUAPxIYKrAu0Ok4XcgTMUXd
         GR4+c3jVBOo3n6PJrGdEnR8L82PL9opGzoipxYFeBq0VXcq+0J8Sh/IBoDTUYRV7ZMH7
         HUwTPM4lX7qsrrf5FH/UPGMudeKj1bIYCeiCfajFMFMJ7wDMWKxIzD+6ZgrNHH4Gg7ps
         uEOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774971898; x=1775576698;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hMxnpJ2ojtNB4SMJzye1+MLh767fll1nF+AZ7c5dMu0=;
        b=GGJejvOlzjURzLukIBQf4nU+trdZGpnqoyyhh57YpXyMDXk+nNZIQR287zTacJzbko
         bQ/HUW/z2QQEyXbiMInfbBM6SWr0ysyPg3DQyesli/6k8FAyOwqvQDYEDevZ5Dh2dKgb
         39i63wwgRP6/ySpCbt3+X2UX47xsRHdR2jpK8awJMvgZqezkiZ0fS2IUReVRqvBjSJoi
         q/UR1lE8oG//qhUxJUCuw4AS/C33fE4Bm3P3JUBmtMXajFXFfy+Y6lsRWoiRvzAkwd0i
         FXiX6Z/fLJ9St3+jdn1ciXEZIG8+QtgLAvV5vCLAE+hFVh4zX6yCiVLePxoMrbGDbrAF
         f8vQ==
X-Forwarded-Encrypted: i=1; AJvYcCX6f5Ym/9CFV1UamuBIwaiJpCgTNwbatTGtVK8pePGWtEeHxdR/LNPoKlrjuDAu74kbLyZhs4c=@lists.infradead.org
X-Gm-Message-State: AOJu0YxjtTDzu9K2zrfgx2e/KuI8O/pGhUowXVD1ayfoNEcIuwzna0Yc
	ZQSbQ/Z5n6Nt5M0RgLcN6u+n3z0OK8hxeGqgD0QID1soRlJelUshDNdHqrx9wUHTIQ33k3w6JtU
	1C0hlONj2deIXuljpge7+wYYvOp9q1W+MMe+0wZTRTra8eHb6VE9RNN4bQmRH2JHY
X-Gm-Gg: ATEYQzz5+rFmQXFNrqDNtc9HY30TU2RHj2klOI/D3XPUU/bEYzJck5iDSHQ2dtKExLk
	WmPrpUz5uEkjxiSzY5yhUxAp3F5M+KJGLjXFILSZQgVbLD+QhKpGoFA9hImQmJx7Bl+tphk7xnq
	lL+C3Ojv5AKX3yL3gpy3U46U0U9oMrTWCaJS1hBbG5WwhOhmu/swU4Q1QHYAzXDebqtbWYFSCWU
	QhjMYsgaScPtV4VhC6L5XQI6797cznptaS5al3L16FBT3wxf7zBkPbd1xwLDAtALxHg+XyQW+8t
	jQaT1VX+lO/+BEQ51nSezzTS+jYdPGf/pRIxOyOu5SdXUwyAvyyr3wzLhN4xbaILZ4jjGzyMCWq
	bjxU2W24VFftYCgYhuRwcGjPUyT+KyrkCs8uuJ9TyGs1mYgaBz2bXZESvodFpASG6tYS9KeDKEd
	JO86o1Ng==
X-Received: by 2002:a05:7300:ef82:b0:2c5:ed1b:cb3 with SMTP id 5a478bee46e88-2c5ed1b10d5mr4986331eec.6.1774971897669;
        Tue, 31 Mar 2026 08:44:57 -0700 (PDT)
X-Received: by 2002:a05:7300:ef82:b0:2c5:ed1b:cb3 with SMTP id 5a478bee46e88-2c5ed1b10d5mr4986280eec.6.1774971896516;
        Tue, 31 Mar 2026 08:44:56 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c6e9bd48sm9935249eec.20.2026.03.31.08.44.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Mar 2026 08:44:55 -0700 (PDT)
Message-ID: <cf1d8b38-a5d0-46c6-8016-b366637d6c72@oss.qualcomm.com>
Date: Tue, 31 Mar 2026 08:44:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next v3 1/6] dt-bindings: net: wireless: add ath12k
 wifi device IPQ5424
To: Krzysztof Kozlowski <krzk@kernel.org>,
        Raj Kumar Bhagat <raj.bhagat@oss.qualcomm.com>
Cc: Johannes Berg <johannes@sipsolutions.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ath12k@lists.infradead.org
References: <20260331-ath12k-ipq5424-v3-0-1455b9cae29c@oss.qualcomm.com>
 <20260331-ath12k-ipq5424-v3-1-1455b9cae29c@oss.qualcomm.com>
 <20260331-fanatic-elegant-wallaby-913e35@quoll>
 <b1194bdb-75fa-4f2e-b4a3-9565b11bb3e9@oss.qualcomm.com>
 <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <0de0574a-04ce-45d0-946d-5fdc1a7b8181@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: AAG0RGxvrTnJ31MrcVIFQqwjANOAyrcF
X-Authority-Analysis: v=2.4 cv=VInQXtPX c=1 sm=1 tr=0 ts=69cbebfa cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=gEfo2CItAAAA:8 a=I2QDpBo2NW-_l7N_WEoA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=sptkURWiP4Gy88Gu7hUp:22
X-Proofpoint-ORIG-GUID: AAG0RGxvrTnJ31MrcVIFQqwjANOAyrcF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzMxMDE1MSBTYWx0ZWRfX5vZL7qdsXvPK
 qqtMVyI+ZnVLthS0b66ywbL8FEWRcEa180yH+CgL1fGpuPHIogBQ2UAvtVJ12wjfgL55/7yUIt3
 d550pohJDw/H4v53aTlphPfm+PsTHHlWc9vTkHxex8LJUbkKukOTIoNBl8z8TElJd/3AN47IzvD
 XK4wPU/84JESt6JV8nIEuRsfvKrNggI6CttfZlWmvqHiiwLM+msO1Q9cIalFHCqKX8ldhzHoxey
 MCrJgYtEMJsw0fl2Sc8YEfGQ9hnXMPffMnxu2v/VaA5lmwefGMiP1xzI9HXIKut3qJlmVSzxxkH
 pV+fz0AJqvT/gPGlr+qefbmaNlrh8scJNwlSIUDP4hFkLkjLmQWc71hvB6XhT2TZZtPcJ6FE7Mv
 4nezcfgq7l9HYCXsj7eCuo5h1ZloLUHmTO4xVl/19OS/6UOI9Ps/AzDcqkIpBYTYd/nlrlsY6Mk
 LDU9S+pPXpv8EVZsq8w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-31_03,2026-03-31_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 impostorscore=0 lowpriorityscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603310151
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_084500_096331_5801B94C 
X-CRM114-Status: GOOD (  17.93  )
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

On 3/31/2026 7:42 AM, Krzysztof Kozlowski wrote:
> On 31/03/2026 16:23, Jeff Johnson wrote:
>> On 3/31/2026 12:24 AM, Krzysztof Kozlowski wrote:
>>> On Tue, Mar 31, 2026 at 02:09:06AM +0530, Raj Kumar Bhagat wrote:
>>>>  $id: http://devicetree.org/schemas/net/wireless/qcom,ipq5332-wifi.yaml#
>>>> @@ -17,6 +17,7 @@ properties:
>>>>    compatible:
>>>>      enum:
>>>>        - qcom,ipq5332-wifi
>>>> +      - qcom,ipq5424-wifi
>>>
>>> No, use previous patch.
>>>
>>> I am annoyed that you keep making changes even for such trivialities and
>>> require re-review from the community.  Previous patch was correct. This
>>> one doing whatever you want to do in copyrights is too much. You don't
>>> change copyrights just because you wrote one device model.
>>
>> Krzysztof,
>>
>> FYI here is the guidance I received from Qualcomm legal (links to internal
>> documentation, removed -- I've forwarded the entire e-mail to your Qualcomm
>> mailbox):
> 
> As I explained already more than once, legal can engage in open source
> discussions directly. I am not going to discuss with them via proxies.
> 
>>
>> ... Repos under copyleft license [...] QTI copyright must be added when we
>> make significant changes.
>>
>> ... Repos under friendly license (BSD, Apache, MIT, ...) [...] QTI copyright
>> must be added for any changes, not just significant ones.
>>
>> ... under the regular QUIC to QTI open-source copyright transitioning [...]
>> all QUIC Copyright instances should be replaced with year-less QTI OSS Copyright.
>>
>> I'll follow up with them on this case where there is a dual-license file.
> 
> You nicely removed the quote where they ask to follow what the upstream
> maintainer asks for. So as one of the maintainers I ask not to change
> it, because it is churn and pointless waste of my time.

Although I feel the latest patch correctly represents Qualcomm legal guidance,
I'm not going to insist upon the copyright change.

/jeff

