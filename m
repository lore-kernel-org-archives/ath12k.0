Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E1FF606A884
	for <ath12k@archiver.kernel.org>; Thu, 12 Nov 2026 16:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3mItfDOG;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YZOoSFz3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=KnN0m9ii
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=; b=3mItfDOGroOVFH
	UAClsAqvTdsScmnvjlFLLp3Xix2kc33PrmGMBqmsWp2mr6Vssfxm7aeb9LWWZL+UZr1+nMaqRBBld
	w3dSHOpB+LpVDzM8JLFjViNXUXgnl3G26IC3FHnYo2wjx80bJMC1LsJiPNCVR8rSMy4EkizU5PlTv
	39Ll6bheUp1gYseO8kk+El6z3iBcrLKqDWNs8/n1v36F9NOW5JZ5pNBMaZwk0yat1V0zEfFUQV2hJ
	VzKCMj8sJtrGTjsifm5VrI1MpLPUZfs+dn8pMT15ApdKQ0XZr8FVPJUVmz8alXQ2Jp5b3swcX1njR
	2mdvEiGcYIeEgEC/P/4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY29-0000000AgXZ-3mbs;
	Thu, 12 Nov 2026 16:52:21 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRY26-0000000AgWc-0rem
	for ath12k@lists.infradead.org;
	Thu, 12 Nov 2026 16:52:20 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ACFZZmh656986
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 16:52:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=; b=YZOoSFz3iXFIfjv6
	YMzHKw1ZGWXkO4GIQ5jM0WQtfaEXpZiPi6ovvwAedgcsFCAWuhGGHli34laGTSGy
	1CInkkgEPmLWKOWgsXTlX3tvYHxxDbWitvoNQUKeI4WDVKRY5znTzxLSoB51gd9K
	9IscIbi10dvaGjK+JRGZ8oWy3r6VEX8dun1kAGh31RxHmw5d/l2N2rxSti0RwlS6
	cqH+G/UaJMSnVf1bAdlu0i717cNahkY2+qTYlgXvXGhDvprTTEFHyP3yjVk6UjPa
	7C5FyCBJlfww1lv/JG5OpWxDRG57x1Bxi4QM1vTsZQuLahWo1XnXbUiby/NXEReE
	i/B+uA==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hw6yujhrw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 16:52:17 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1af203073e0so4976163c88.1
        for <ath12k@lists.infradead.org>; Thu, 12 Nov 2026 08:52:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794502337; x=1795107137; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=KnN0m9iilehSWBqskaw0lnHpk1mpoNjD1knI9v6SidyFyzHQLxmirBAE/z89Qm4gKL
         24Sd0UbSthhcNILIbmopLqIPpQglojtP/YK7HRtcjPpflalexveVK1YTrNR50LiICE52
         k+jLGXFRTdnakHoviNjKl+DG+4O3x4q0Z0cdSXMjgmukKbW5jlza7PasHbVa8UXROy8E
         B8yOrFh9r7FCS5a+m59uhssffNrUhlXFyxo0TM76NeW8GZG43WY9FWLrHi3KDO81jKyi
         9iSNL7hEgdNNJqqMD4hbsiXgAkENYNHdw7R6M4s3gevZMm60Yo/Hm4VaoKn8pGXcGejS
         oXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794502337; x=1795107137;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NBYDPPuMaIjH6YVROllriFwJaZQpLdw6qtYdKTDplEY=;
        b=aq5/+BEz2AR/InR707GJCw1Mg3GQkPyqlhUFrkfzEkQEGS0NPEBsXlnbCI34VQzAZg
         2i8P0uyWD1zPql91gJFnGeWX1wi6gImUoUMBAI17BEY1V9eIRX3+5+XoMxgMPXbkWiEe
         6SRYBy/NKGzowR03lO9OwOHjSb5wMbHb3NDOBkDyS+SC0vql1iNHZnbBBImpNydgXaFb
         cXtDuS8guI1L47YpVDKbO6ywDP6nPx+m6Qthq4vtysSy44IgHUF2UVCtccFU0ej91e0e
         4jmQCAfTbv6jYmfYqdhiZyD6EvBIYtkHYgrmn/MEHJ7+zR+DPR5afowmlcJ4yWW0izt3
         nPmQ==
X-Forwarded-Encrypted: i=1; AL+hErFzRNgUi+tPxxFe7uB+9PYsZZ5OS+9CjMOAADKTTpplxnovE5idd8MAXKl2/ObreCTxTlW3BkQ=@lists.infradead.org
X-Gm-Message-State: APuU4Z/fN0a6CJCRbDyYA8fczBBoLf0i1VEizqWiwBSBgpdw1pG2Pw+A
	Hjzop6hOgMQFJLD0pBGgABbqaW9S8JMn29kfMwxdgeci0+nmucFRDcA4xgg96fMfth7CmbwYRn4
	Vmi1Un5dCjNA1lqSbqydJuHU67Zwt9IHEsqkdkQqOGn0WOUo6BxwE6UzL6wOiYQptwW4iprjQ
X-Gm-Gg: AYBFou17TcHdvw6hPdimd4kyvYOWoTo1U331JuWycnTXkngYwu48inA/POt/fXonRrb
	iW0tKs74EhgynLTrHm2Om/CW/AeqxWNqjG6sl/ZoAG2Zpx3wtGOqqVEycXOUjttlTAg1UmIxgLc
	HIW1L6Y5eO9ifSlcLbZbmNrTcW6RVoAwGtfkDnje76u8g5+Y3l9udMPDD0xx+Is7pEAGLAI8jrB
	0c0si93W6TS58igt+Lg6MFhPwcfy6O0s0Hdj8X0giEINUWsffxpMPigNHx16Mc20iGdq/iJOh4L
	1UEp0r1yeSXynkV02ZYxLIUWqJjRIIdvVHAFeJZLCIK2kPPddxQySLuqwYlsSM/ZTkY6Se+hBtx
	UCcgXEVqB3Zv4v1PzjGDJC3VPX3XMmZPyIaAVQDUcqiWku6Vc8sT6fr9ISpb9atrXSsJxFEKV4E
	d7AmGwDyVCOPlGcTgXoidY8ij+HF8v
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100810c88.28.1794502336695;
        Thu, 12 Nov 2026 08:52:16 -0800 (PST)
X-Received: by 2002:a05:7022:283:20b0:1a4:4194:fc04 with SMTP id a92af1059eb24-1b503121772mr100700c88.28.1794502333270;
        Thu, 12 Nov 2026 08:52:13 -0800 (PST)
Received: from [192.168.1.20] (39.sub-97-215-59.myvzw.com. [97.215.59.39])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b50300e5dcsm315435c88.0.2026.11.12.08.52.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:52:12 -0800 (PST)
Message-ID: <a9f1d17f-afa7-4715-b57a-882b1fe4a41e@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 08:52:11 -0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: add GENERIC_MSI_IRQ dependency
To: Arnd Bergmann <arnd@kernel.org>, Jeff Johnson <jjohnson@kernel.org>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Sowmiya Sree Elavalagan <quic_ssreeela@quicinc.com>
Cc: Arnd Bergmann <arnd@arndb.de>, Eric Biggers <ebiggers@kernel.org>,
        Sumit Garg <sumit.garg@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261112092642.1144415-1-arnd@kernel.org>
 <20261112092642.1144415-2-arnd@kernel.org>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20261112092642.1144415-2-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: G3YUrOGxPbaa1tO3o4GEroaVbo4Omw8q
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfX238P+KGS0gu9
 /d7PipVAZSgQbWiXA6+B02l4X6tiwL4k5KwgKzThhdQt8B6KeyGj7LBvpx+ZmkDxAOPHWh/o67P
 +cckyIGeUEdeFHSHGnBsxG/w/KvpDoQ=
X-Proofpoint-ORIG-GUID: G3YUrOGxPbaa1tO3o4GEroaVbo4Omw8q
X-Authority-Analysis: v=2.4 cv=d49gWhjE c=1 sm=1 tr=0 ts=6af5eec1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=7UwXyAtrHAWG9Tdc5CO1EQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=m_PdI6EMpLEBZp9qn34A:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA2NyBTYWx0ZWRfXyb6SX/4ou6rk
 yMRcbZoXksysTF86EvAsnZZCsiVH/eaZd7qNbbYIFOREsN90MgsuLmdqRqIi4yXTLipL9VuBuHE
 kF9Lbm3oszkgGh7/lfqmHgoYdRGRKmcPOeGl3pofcBRxdkB/XcM+27yh8CRtHlkF3V5uflFV7KS
 YAIdE01StP6cMIIrIuCrwJQng9wEkyNj16woNo2HDeAPB8HgJOiWULqQ1Yt017iPImrhl5Nw3yI
 pu9mGSGjFITvXxfvUdadv/hD+4HzzL0nfLyhSmou1h9aFIQjDIguhXPjz8ThT8Tyf91QOAlvyVr
 uAm92+vrh+GukHgiDEigKa48KUNZxaY9jMfINwLMCWla3dGoaNb7YaZNlVNh+WnLXyKCgILGfPA
 hPni7JtjjwLxMTokPZIKLfgKnO721vSzqTdnNVlxsdi3x4fMPfmQMBsb/JhTAKCba1A3bItC9rW
 uMlxYU/THhJeYtYo3VA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 malwarescore=0 clxscore=1015 suspectscore=0
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120067
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261112_085219_025219_C39BAAE2 
X-CRM114-Status: GOOD (  20.21  )
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
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 11/12/2026 1:26 AM, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The platform_device_msi_init_and_alloc_irqs() interface can be disabled
> based on the configuration, though it is usually enabled. Without it,
> the driver now fails to build:
> 
> drivers/net/wireless/ath/ath12k/pcic.c: In function 'ath12k_pcic_config_irq':
> drivers/net/wireless/ath/ath12k/pcic.c:387:15: error: implicit declaration of function 'platform_device_msi_init_and_alloc_irqs' [-Wimplicit-function-declaration]
>   387 |         ret = platform_device_msi_init_and_alloc_irqs(&pdev->dev,
>       |               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/net/wireless/ath/ath12k/pcic.c:424:9: error: implicit declaration of function 'platform_device_msi_free_irqs_all' [-Wimplicit-function-declaration]
>   424 |         platform_device_msi_free_irqs_all(&pdev->dev);
>       |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> 
> Add a Kconfig dependency for it.
> 
> Fixes: b9bc9ef941bd ("wifi: ath12k: Add platform MSI support for CE")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> Note that this patch applied cleanly on top of another Kconfig
> fix that I sent a while ago that is also still required,
> see
> https://lore.kernel.org/all/20260313094852.3716715-1-arnd@kernel.org/
> ---
>  drivers/net/wireless/ath/ath12k/Kconfig | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/Kconfig b/drivers/net/wireless/ath/ath12k/Kconfig
> index 4e8a301f2081..ed93ff36fbe2 100644
> --- a/drivers/net/wireless/ath/ath12k/Kconfig
> +++ b/drivers/net/wireless/ath/ath12k/Kconfig
> @@ -18,6 +18,7 @@ config ATH12K_AHB
>  	bool "Qualcomm ath12k AHB support"
>  	depends on ATH12K && REMOTEPROC
>  	depends on QCOM_RPROC_COMMON=y || ATH12K=m
> +	depends on GENERIC_MSI_IRQ
>  	select QCOM_MDT_LOADER
>  	select QCOM_PAS
>  	help

Perhaps because I picked up the original of the 1st patch 'b4 ty' didn't thank
for this patch, but it has been picked up in my ath-next branch

/jeff

