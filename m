Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23A5BC55173
	for <ath12k@archiver.kernel.org>; Fri, 31 Jul 2026 22:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0mWUyHqc0EQqqbAM64vWyRe88nhS5dv2sTdNNCjQmg=; b=JkAQqNjy2pBvpQ40SdNzdXNgqD
	g1GLzVmhhgj0RXR82ZkWqg3KGTgPmtAodQ4KvLVK2NL4Z5lwJ8i6I3oB4iLQdNU64AybShuvrrnuM
	M04zsxElwida6o4iXSOrwcuPF5+0vtwOUkboXZAI2Ot4yCiBxUcdXkE7EMZcV5QEPRtD6WimAY7L2
	DC/PeMovP/BjBYhUjStmIhExDeIMXDK8zjMz7JWfVjTccJ2QDu08PZIFXTVhGOWevlRNCAsv8q1Av
	hdgQUHo3Bh0/rO4eBFinD7V3qmKXwp2wixkqmvli+pmc999Hbzv1FVycKuUdheGZxH0RcuxeggtZm
	L1Px8HgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvI7-0000000DeZT-3Pha;
	Fri, 31 Jul 2026 22:01:19 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvI5-0000000DeZ6-0MQz
	for ath12k@lists.infradead.org;
	Fri, 31 Jul 2026 22:01:18 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VM0X8n573662
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 22:01:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	p0mWUyHqc0EQqqbAM64vWyRe88nhS5dv2sTdNNCjQmg=; b=IlCe+LmiEFlk+px6
	JKvC4TadJ0Ti5WA9fBQpGmXIYOhHvkb7H1AV5/thLYGv2OlDl9rnkKRmN/N0EHKC
	BiiOTQvBjlbeGxd2rVvvPu/Erd74EDc/+I3UhOXwhZW7nE6fBuTmTJDVZVdGJi9b
	L/hGFVCDG5dfWl9iGFI/qD002mve7vEbxyXa3QAkRlMAhwiW26xLKjIsYHUnWaMT
	912J9MsogF9pL6gdtgZED2ySUSyujGZWGcRCbxbpjD3hjhtUkw6mGU93sJAiprKe
	BxI8p255EZZwGQBrwt6+fUwCLqGruu2k/XDop3svFEqszyx8TOG6WVdcGumi0NiC
	RkDqQg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y2jjj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 22:01:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2cf1c86963bso21149215ad.0
        for <ath12k@lists.infradead.org>; Fri, 31 Jul 2026 15:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785535275; x=1786140075; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0mWUyHqc0EQqqbAM64vWyRe88nhS5dv2sTdNNCjQmg=;
        b=YtfGL/q/ruuJDF5BBV+8ybTxy8gdkFaX00BvQAJr2O5vWhjfpnEZ1cxMRqMTABgubt
         wbjk/KVkGYbQorf1tMXraGeNF/9gLl+OQWI6ZZMOxf8yfdqTSQYZAJ6KokX5uVf1ZhSr
         OWnjdKkAcEpCpI7/+J/G6vyw6qDgohAssY4H98lLdMCecIrd6VmQ1M/3F0H0gaPZOC0x
         EbbBntSWvJuPcf754jWBa1nj4dlINTwhKtAaK/xM0yuomeAfAr0OZ5ptDPjtLC0l96zb
         Q3M/U5+BgSpfZT5/ACbGTuJ+aAT6i3f9fZmcoGVydfoAmfVsXYoAJUJ77zraeNLKQeM+
         F3Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785535275; x=1786140075;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p0mWUyHqc0EQqqbAM64vWyRe88nhS5dv2sTdNNCjQmg=;
        b=Gj5GYA+KmS07G0c/Us3zif/SfHNBC9IaYuT4ngTy/x0CqjFMLZgIDzCa5z69h0woAX
         ZKED65Z5ZqUrFtCB0XPnMzSuD03clUQvvpwf/sC5J2BAl/JWHsaayxlaYV0RXPjHs0ra
         5BopB+H88Vy2ei/YFlKDMv6bgJAQ62V4IJUvTKCmD6kxMobeuoL81NylYh3IqYGVq6hZ
         dp48Sdm/jBGn8v5liCn+Ga7jMQgWvFIesrWJ7mqiIut66K7cFno478EINaqiIngvJ5ne
         uwIHPa+fOxvlpD8hgvzq4kZFI8u13AaZ+6islSjohB319mDT/EgCOBq2/oqAxDM3idTp
         pilw==
X-Forwarded-Encrypted: i=1; AHgh+Rq257FMIZ4ON5MpWZDYyX//0CrvI7OWXYYFxdWFpspbjH7pJeuI/hUgYCoypEwFzY5il7t687U=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw0u+saw6rZr0RlEUflbIEvn6ieLcDeIQ/bOkh2jGY6VowN9ZML
	/NpbNYQe34DmCsuXVGz4khit0Zq3goNLZ7D1rIcIOvSe9a3ZjziM+MTHVbdF9S39CdFhZpf3Z4j
	tkigF0XfuH8ma/9xmZBtRuGldJws2dE0VE1M1tqtfJeDWTxceTWpBnip3NjBuKMje
X-Gm-Gg: AR+sD13ZzTXAjQwuIuTm3YBlnFDYdL9NWBjZ9gerDYIrYzzGuSAW5bw38JzXY77snGj
	PIH1DaqlRfPQv9javAg7FdgtHzHyKXr327Zde5bmisbyfnEp5SF8p4SM0sGGm3r+IC28hvkwwC5
	HcY31ln7hFrpakTC4RUoKbJFzlde9bwWn48CoINwTQYCmIormg/FClncRjOg1gdkpI8aPlctsrF
	sQvlpbQm+AA68jrWaMJEj4zlDWl4HSpZyE91DP38JiiZ8qrrIbgG5CCKc5Eqa3ZzHuIXDrj1tt6
	CsOzlUX0dUBBxtoGergk1Qu+fkkbqT1tSMwasUjxs2UKd5LxuUhQCx/DSV/0i3nDwaSQuJOotOu
	ssn7F3z6VGl36RRWcn2jGGCDzllc3zoMZVJEKFn01sPp/D2PyWpEGgCSc60E=
X-Received: by 2002:a17:90b:1c04:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-38fb263edeamr3599105a91.19.1785535275267;
        Fri, 31 Jul 2026 15:01:15 -0700 (PDT)
X-Received: by 2002:a17:90b:1c04:b0:38f:a81:15b1 with SMTP id 98e67ed59e1d1-38fb263edeamr3599054a91.19.1785535274638;
        Fri, 31 Jul 2026 15:01:14 -0700 (PDT)
Received: from [192.168.1.9] (103.sub-97-215-187.myvzw.com. [97.215.187.103])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm9049012c88.12.2026.07.31.15.01.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jul 2026 15:01:13 -0700 (PDT)
Message-ID: <04460a2c-bac7-4d93-b230-9db6fb55761d@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 15:01:11 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: advertise AP_VLAN interface mode for
 IPQ5332
To: Kamil Bienkiewicz <perceivalpercy@gmail.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20260728193105.1064227-1-perceivalpercy@gmail.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260728193105.1064227-1-perceivalpercy@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfX/W/2dLPI6Ouz
 YAnpRfFh7v0VWaOWXxw5SUg6cJDEmf0mcraqkI4Rrryp2neZugNEXeX/AC3ICeNApO03LDW0MfE
 H93C5PVoJzo5mhU/2HNUEKyxrjYpkIc=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6d1b2c cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=UaEkX0D7FlC0tWE/LoNF7Q==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=pGLkceISAAAA:8 a=sYObSRI1YwdLi3bfAOMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE2NiBTYWx0ZWRfX6XqP00kBz63V
 L2MKyd8ni7lwZ0OSV6ki1T8e8q6BEs/irHNAXR7aqv2Orw9+YedCRzu37h80MyILKhJqGmFp4Nq
 12Jo2UZ78ByiOVcx9xSIo7L/zHjnwIDU9ESAs9BsN2B7HTFy4aCmswhXMAVQjX9B6xs2r+O3vi8
 0cCtfDyanlIi5SyB4DvAkGCmgwVWFO4yH4WublMHFt43TpJazPFKDzAKdRyNUUWZeezH4Kw9YBq
 VIEK663uHI3lTqgNnC2h+zvqZRa+8zr1Rpy1XIGQcuP4K4Cm+lC9jn0lwYlggnLGXT91GbngCLh
 r6xfUnIg/JgATaBS408dM+ZvKMyoEQyd8yylHxnuCNPyryDXZXszC5rHbsZyP/uzEFWo5oBcYuB
 ybdcMXwtq87XqQ2K/UyyoD9zC26LQuZUpoQ3tCIUN4iZ6ZXHxzCZgQS8wmMZC19tkEqqp7k6Esu
 5rae0s8fsaFs7ecpdBQ==
X-Proofpoint-ORIG-GUID: 1SjnHHdL89BUfb9FlXv16XCM3R8gHpHL
X-Proofpoint-GUID: 1SjnHHdL89BUfb9FlXv16XCM3R8gHpHL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310166
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_150117_157076_DC71A18C 
X-CRM114-Status: GOOD (  19.03  )
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

On 7/28/2026 12:31 PM, Kamil Bienkiewicz wrote:
> Only the two QCN9274 hw_params advertise NL80211_IFTYPE_AP_VLAN; the
> IPQ5332 entry does not. As ath12k sets SW_CRYPTO_CONTROL, mac80211 does
> not add the mode on the driver's behalf, so AP/VLAN is absent from the
> wiphy and hostapd cannot create WDS station interfaces:
> 
>   nl80211: Failed to create interface <name>: -95 (Operation not supported)
> 
> The 4-address datapath itself (sta_set_4addr, per-station TCL metadata,
> WMI_PEER_USE_4ADDR/WMI_VDEV_PARAM_WDS, 4-address frame and NULL/EAPOL
> handling) is shared Wi-Fi 7 code with no per-chip or per-bus gating, so
> IPQ5332 can already deliver it. AP_VLAN is a software interface type, so
> no interface combination changes are needed.
> 
> On a mixed-bus single-wiphy group the effect is wider still, since
> ath12k_mac_get_ifmodes() intersects interface_modes across all radios:
> one IPQ5332 masks AP_VLAN for the QCN9274 radios too.
> 
> Advertise AP_VLAN on IPQ5332 as QCN9274 does. Tested with 4-address WDS
> stations on IPQ5332 + 2x QCN9274; RADIUS dynamic VLAN was not tested.
> 
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.6-01270-QCAHKSWPL_SILICONZ-1
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.6-01243-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Kamil Bienkiewicz <perceivalpercy@gmail.com>
> ---
> IPQ5424 (and possibly QCC2072/WCN7850) appear to need the same change,
> but I have no such hardware, so I have limited this to IPQ5332 which I
> could test.
> 
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -655,7 +655,8 @@
>  
>  		.interface_modes = BIT(NL80211_IFTYPE_STATION) |
>  				   BIT(NL80211_IFTYPE_AP) |
> -				   BIT(NL80211_IFTYPE_MESH_POINT),
> +				   BIT(NL80211_IFTYPE_MESH_POINT) |
> +				   BIT(NL80211_IFTYPE_AP_VLAN),
>  		.supports_monitor = true,
>  
>  		.idle_ps = false,

I can't even run my review agent on this since this patch does not apply to
the current ath/main branch:

Applying: wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332
Patch failed at 0001 wifi: ath12k: advertise AP_VLAN interface mode for IPQ5332

Please rebase.

/jeff

