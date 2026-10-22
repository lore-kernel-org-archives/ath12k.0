Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 875EA606A322
	for <ath12k@archiver.kernel.org>; Thu, 22 Oct 2026 02:30:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dcj97R95;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=HV6SHU27;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OUMnusRM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=; b=dcj97R95o40rYSo+AqxK0qG5Pv
	B/V9MEWypwZnpdttQzFXnvor3G4JlTYwcjrN5fFqNRGepXcXS4y4nR77+P9S6GHWdvkq/r6YXH7NN
	uhGSCUCFB1ZWcPtfqz5zTscPddyaWKVsQm0ukWXoyy4RRSiy3T1ZdJo3FDvvEKavXpUmVkjcs5rzI
	6XGLIvEsFcrDECYmU3E1YJj1gAcKvUikfK8FNZaxFQgtjCQoAmfK1u8rfJWSHDhSakhDIzi/LXKyC
	7v0U+Z4BAdXQdPVlw2ikKhAMxpxOF1+dSMVtUCF8lgtz/dYn6pPT0egsuNrlqURxoL7L/yTdGgqjH
	V2mOsDMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiZy-0000000DDAG-2ugT;
	Thu, 22 Oct 2026 02:30:54 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJiZw-0000000DD9k-1Lbz
	for ath12k@lists.infradead.org;
	Thu, 22 Oct 2026 02:30:53 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69M1iEpO865677
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 02:30:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=; b=HV6SHU27fDigyi7b
	KHAdGoohXS5xQbTUBCnwvDux5SJ59xM7yBOcFsFjFs/OxhZHKyQqFVLp/n+duK3i
	7V1hcjmj7xgqHk98Gl6YQ+OBM+z8k4Qe3eeuOkENCWAkfnuCIZ28NLLk4WTGJ2oD
	kroBLFPhkabF/YcBUiTwP7LAXqhMrWDLUfqm0EWTWQXz4+0Cd6F+pEc3PA29Y4gn
	v3USmlMommUdx7C/QRlvKGVnpuWQJxaifzi/WthhAmA5lV71hwWyv35Tw416fV2r
	tKfUl3DrHQj9uNBeJP81nA0BA57h3e9VesbvFnylJ3o0ivhoSZk8og/vVoqImXYU
	GoJGng==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hf93agahs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 22 Oct 2026 02:30:51 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2e942b1cc86so13961005ad.1
        for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 19:30:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792636251; x=1793241051; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=;
        b=OUMnusRMErCkhxTM0P2wF51odTQJOws95cr2usQDI0JO/y0fCrs5395qo/AYzmW+13
         Sk14b6PWd/WjPgBdyR+ri9x+XDU8nvKA99lx6ZYIfVGnNC7axyokXOBFJQ2u7u3RaBp1
         9RTUm5xvLN5QgiV8yQGFSj/96MAW6AtyNccHybhALc3qtsp1XqLiTzVQRPZZOBmqOSTA
         xbvsOGVjfPWDjhCA1Laj8QSfguqpwP5szYyl8JsAkHWOUzMO1zg90GYCQhA7F7hbkkrY
         5+UZw4u2kJZaQJ+HRPpl8XPbHJZW9bPFpFjkAp0jMeoIPtLz2cKtpcVniUZoXE3zTw9z
         roeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792636251; x=1793241051;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IgLVMbCOzKB09kz9r2gHIlbpyYX+LS7rt+7dIsfEXEE=;
        b=d8NgJFEn0Ao/V53QhErtB4qR5MKZD7ZvGGYRjTV7iwyGZRrnHAS7rA65ntkq+xq72J
         Gx1jsPHw4yDZwujNajd2hisfBZH0NPRNNMuodqrYbiFFHZUxF9BsUjjEprnd+ruA6b66
         MCz518AMQJ29O1ZqDpuWZsNUSXgp4EMPl0Zi+2JWcndl7tqqsLJa1SVm15OIbJG/lMqW
         3vHiqg6+KzMnV9AEv0XU7Qf01U/qkrLQKTib0qLdsEcLHmxgvqSwlJxIHQhI+Ech+h0f
         Tjx+UTffMonDg4GX5zJDx19cLwYmP2sVmbOKZlv4Rx/8DgcOtnoJwEdOknxrIRiO1pYj
         XLDQ==
X-Gm-Message-State: AFq9FYI7M5Wg8FXwJJtEwOEDgbQDq7ZVBdYR2Hnyay1JwUcsxQrNNvD3
	xrxp4CtMMNQlyjNfVOnexh/QzyfOaKy8YxyRblTXPsRHzSp2OBprKqObeH+QdnX9pkSAyCz1IOu
	UElvgU+Fi3hGW1bj31GSxr6ik5gzksW/ghm0a5Yr4VGNczcf0SWjLd3yGVxhRlzAT
X-Gm-Gg: AYBFou2+98hxPxFMKmgGcWNJEEQyXOHlJEYKsyWB07/qlK0jG7CHA3+VUi0Yih/wfUL
	qxY8kzl1IydwhZP05VZM6TCL8GiBzsnR2OiS/4UuAyBeHMXdSBnKHl9Ax564+F9Yldc29RHAp+y
	/+GD0U+8M9XuhjOifjMUORrFE2AoWCjeJ9/7gzBH3ShuhzlgV7+R93GYE93y4IVPJhXzyCE6I5l
	S3YZQxUP1OKa9HH03wJY9lK7CvbIUCg1BFe+ko6SuQ7M/Z+e01MF5POk8uZLk8Dc1MHN2mIYrBu
	4Nx/vUeCH55WRUSbhZ2SHpT84oQWZBQzL98RfoYqoMPBWjeD/zkm7U64qWmYodLa/Zx1wCpHyWk
	rr1IRVLOQdZaX7fZZSSF8H8fnrBkzrs5Gc/OqJc+UTVvNXaNsoaKGIfQK1DhVoKyLuX8+GAYE
X-Received: by 2002:a17:902:f78f:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ea43c5fedfmr29905455ad.30.1792636250803;
        Wed, 21 Oct 2026 19:30:50 -0700 (PDT)
X-Received: by 2002:a17:902:f78f:b0:2df:9655:fe24 with SMTP id d9443c01a7336-2ea43c5fedfmr29905255ad.30.1792636250228;
        Wed, 21 Oct 2026 19:30:50 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ea3b43b53dsm17649855ad.39.2026.10.21.19.30.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 19:30:49 -0700 (PDT)
Message-ID: <0423c93c-8359-4fd5-9ba0-17e5ed3927dc@oss.qualcomm.com>
Date: Thu, 22 Oct 2026 10:30:45 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: change MAC buffer ring size to
 4096
To: Shawn Guo <shengchao.guo@oss.qualcomm.com>,
        Yingying Tang <yingying.tang@oss.qualcomm.com>,
        linux-arm-msm@vger.kernel.org
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        yintang@qti.qualcomm.com
References: <20260610031358.2043716-1-yingying.tang@oss.qualcomm.com>
 <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <atcr70WFLxp8zreK@QCOM-aGQu4IUr3Y>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfX5TCrz6EdfOA3
 iGCVvggbaJKcIuvwfBg7+ot6U0qAmeqYe68avhKgFS743LoY+/hta5HA4/UAtBAMHfi95buBdj3
 jiFTvj9c/VmDqnFXdFNqmQvr8x1TDOUJ8d5TQ8ifJUcDVr8bhhFBzMesKf9IYwA5t3mTxsr8KoZ
 s4UhtvH18Sz52OaQ9DWKBzXHnIncgWz5tjx8oUVrZloAUTCr40wxvpGeGU8bFqot9qWm1OvpprD
 av2yo75q2F55cKxnVvV2LOuhAu16TurYFEh9LUTZ7T2ygYhG12kqs8kLi5r4JiULNonw97P0oeH
 arg8Tjn3/fXdlYWqsgFCS3TkD2hEIpv2hFgqQcY0JiYwTD+mCVZg24OuYSbz6RAFMfPnkhEe6pg
 rOrJ1fF0md5B3tb+GvRtAdyinkSyuXkQioYV7pm7ewaz6df0qSDg9Bn2BXTi5BXZXeuX0tC1Ci5
 C9sy0gRBDCzOnEWH4Rw==
X-Proofpoint-GUID: ef82ZmcXYk2KCNm3Qb6mkjlbhpp0LjxU
X-Authority-Analysis: v=2.4 cv=feg4WEQF c=1 sm=1 tr=0 ts=6ad9755b cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=wP3v5rCdS2J_7y42CfQA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-ORIG-GUID: ef82ZmcXYk2KCNm3Qb6mkjlbhpp0LjxU
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIyMDAwOSBTYWx0ZWRfX/sw7i8CTJrX8
 IkFJxlx1uehJqinhjCQuDV/0FRlnkFy8eNeIxMAUf8IYH+VQtuhWid8mVQ1/uhxDcAFc8mG+m6R
 TDJA6P0ZadvluS/KgnFT8HBRRWOc9P8=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-22_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 suspectscore=0
 spamscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610220009
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_193052_369079_F85175F3 
X-CRM114-Status: GOOD (  20.25  )
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/20/2026 4:53 PM, Shawn Guo wrote:
> + linux-arm-msm
> 
> On Tue, Jun 09, 2026 at 08:13:58PM -0700, Yingying Tang wrote:
>> For WCN7850, MAC buffer ring size is updated to 2048 in
>> 955df16f2a4c3 ("wifi: ath12k: change MAC buffer ring size to 2048")
>> to increase peak throughput.
>>
>> But during the RX process, a phenomenon can still be observed where
>> the throughput drops by about 30% from its peak value and then recovers,
>> and this behavior repeats during RX.
>>
>> After increasing MAC buffer ring size to 4096, the data rate drop has
>> gone.
>>
>> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.115823.3
>>
>> Signed-off-by: Yingying Tang <yingying.tang@oss.qualcomm.com>
> 
> FYI, in case someone else runs into this: with this change (merged in
> v7.3), WiFi on my Lenovo Yoga Slim 7x (X1E80100, WCN7850 hw2.0) stopped
> working with the older firmware that Debian trixie still ships
> (firmware-atheros 20250410-2):
> 
>   WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Probe and firmware download succeed, but every WMI command times out
> once the interface is brought up:
> 
>   ath12k_wifi7_pci 0004:01:00.0: wmi command 16387 timeout
>   ath12k_wifi7_pci 0004:01:00.0: failed to send WMI_PDEV_SET_PARAM cmd
>   ath12k_wifi7_pci 0004:01:00.0: failed to enable PMF QOS: -11
>   ath12k_wifi7_pci 0004:01:00.0: fail to start mac operations in pdev idx 0 ret -11
> 
> Bisecting ath12k between v7.2 and v7.3 lands on this commit, and
> reverting it on v7.3 brings WiFi back with the old firmware.
> 
> Unmodified v7.3 works fine after updating to the current linux-firmware
> image:
> 
>   WLAN.HMT.1.1.c7-00108-QCAHMTSWPL_V1.0_V2.0_SILICONZ_UPSTREAM-3
> 
> On Debian trixie that one is available from trixie-backports
> (firmware-atheros 20260916-1~bpo13+1).
> 
> So nothing needs fixing on the driver side. I'm just leaving this here
> so that anyone who sees "wmi command ... timeout" on WCN7850 after a
> kernel upgrade knows to update the firmware first.

Hi Shawn, thanks for reporting this. I just had a quick test
WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3 with the latest ath tree
(ath-202610191908), everything looks good, simple connection and ping pass, I don't see
any ath12k warning.

The firmware images I am using comes from the first commit adding WCN7850 firmware:

	fb04a7f4b750 ("ath12k: add new driver and firmware for WCN7850")

and the md5 values are:

linux-firmware/ath12k/WCN7850/hw2.0$ md5sum ./*
d3750b67b1013fe82358d0538fb131b0  ./amss.bin
c79c410d585360000c0490f16fda43e2  ./board-2.bin
73056f1d2aff886ce9bff313f455e963  ./m3.bin
d0ee61498bf1a205147cdbcf645391e7  ./Notice.txt

can you share the md5 values of your images? and have you ever tried the upstream mainline
kernel or the latest ath.git tree?


