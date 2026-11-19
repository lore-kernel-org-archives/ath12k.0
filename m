Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEB0606A337
	for <ath12k@archiver.kernel.org>; Thu, 19 Nov 2026 06:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=4yc5I2E2;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Dm9GJkoG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kReKB0n+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=yC3YYZudmkBkNLYDTpo8VU6OCKzGcuC0cPG91wnBsuM=; b=4yc5I2E2OwWzmn
	RoSVLJ9ICbzCu/FfRa82At/P7XGaZBjv87+msSXIpo9NrYYzzaO3ZTJsMSKLfxqchYmDyOg227McO
	UnMASl9as5pKiZgVI6Q4ouYkQ5gooFTJ2SQsV8mz/bVdfUE3bCOxRl7Fo9Xk7JPlqozBRtJRUX+wW
	T0VHhb1ypDO64WcYSWBY07TvA/L6hcDT8fOoOXzt+0K0o4whavOAItM4bVZ3FBGVYzG4xchQYzaVk
	tcURqMGHXIMgeNTW5jI0lJZFTD/VZsOMDpHjEXikQ98L8/CaGMAnxGyRApJSlZh0uzHwRZ0P3En4T
	AFRv5GHTnLMKKBAXpNiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBi-0000000AxJF-0DwE;
	Thu, 19 Nov 2026 06:00:02 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTvBf-0000000AxIT-2rlq
	for ath12k@lists.infradead.org;
	Thu, 19 Nov 2026 06:00:00 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B78W786419
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 05:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yC3YYZudmkBkNLYDTpo8VU6OCKzGcuC0cPG91wnBsuM=; b=Dm9GJkoGYZTHaJND
	kG8fBiJVvQC1Yv+iDuRefsAw8ud35Jh4Rsh6MoKVvAIFsjVyJ5pufGTUD+iYff3S
	yIgMSz3667fKal9HKhuFnub4aM4HcPOfd29GfwTIrnz/sST7BVwo4KabRV9iOaYf
	qBKVe6QhBxi6/9OP4pXi2Gi/npwRwjvjIokszkos4Z6CjxPx0iFRC4qg7mvYDAFc
	iJxJEzuQVO+CVGL9w53GKD4pcD513N5xrGuRpgU4XK+B9G4xMIZ12epERuNuARQv
	8xVKA1Bj+gKINBX4WntcUEMM6dQsEyvoclZIUEqBBDLFY84xoMkK3bQKHUUuxosW
	8qSqpw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1dpcbj6v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 19 Nov 2026 05:59:58 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ee04c49451so24501525ad.2
        for <ath12k@lists.infradead.org>; Wed, 18 Nov 2026 21:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795067998; x=1795672798; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=yC3YYZudmkBkNLYDTpo8VU6OCKzGcuC0cPG91wnBsuM=;
        b=kReKB0n+Cf7EkCRVwOihHlVoIBSXs96Qh3AKTFKcfSiGQ/sIv7vwYG2WgbY87y4cPT
         GqSh+sVZa94HAUJBq8mw7m5p7ls2VFeJtBzhWXpJQywYg3CBZ5b6Dq+99waaUNTlZXWw
         gUAJB94u2QtudaQX4k9mW//ZC1SQI4+S/N74ISziX4RTDlPXxy5Z8qLmhfMjPrXyBEpP
         UdRdutwGrTMReEA1XoiEcwnHLXrsGC6Lf3cU6xZvyLBN83tMtGd0sLIRHo0uIlu6KMjq
         u3AK4kavDlOArPYIVZochTeI1nyjA7IijEWUdmOBOsGu1vNFaMf9frhTHL5SoHh0822V
         jMLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795067998; x=1795672798;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=yC3YYZudmkBkNLYDTpo8VU6OCKzGcuC0cPG91wnBsuM=;
        b=KwLM38/395e5qr3qUfluQpytGAt6odt2mtrlz04IgoyMLHsEwL5AOdlpmdZoz7l8cW
         EeZb7R9RfluuPNFo0K4/IA1ZML6gtCs1YXmZpaugPIBE64NFjVeqFPnHfFEZBGuGF6/N
         yT33RCiFFXd9t/GPiHlv5DwhsmtHPbrjfNJ/t9hnuLhynjo7DMxYcFPADwfKxglCJFbN
         qK4FjeDTdjORvO8P5v1MvFZcYs9q+QPlYFkCXcuPwSbRWRvLqITDCx/y2O0NJhkHAraJ
         jvq4tdHX/8k8ylwKlqMrs9BsbO/chF1oaOQw6enuU9FYWDQA+uzHaenk+RRGqNn3ymOJ
         qzkw==
X-Gm-Message-State: APuU4Z/1bjoO6fQsFITsrzajKvaxgAuaFnUfkdFsWe0CVBDaSgV6h32W
	lkdfgaGNeOFUsp9vhhsTrl3yC2SWnYXr0OFHK2e0UUzZk7oUiFgfArR1qSKrN+SMgwhUjDBzOiq
	QOgV1TZ6mkGGJPgWdqMc+3v+cG6UYf1p6CdWNYr3xNQNU5i6DA58xWtQcDkuJCT1kiapurGwE
X-Gm-Gg: AZFdTZehuUBF/mAjUep91zOgAGaw3jDyCvNppBa0u1BSa91LrwXHQE0l9D2VqtABJyH
	xrlZj4gvBKZkZWTgIGqH6N2Rwl0ojcCEyjQAnfXyaMwXJy1JCEyPbiE81Fn+utXir8MV6p2KWwZ
	s1vFCjWmtvOQn03AAqpKpgNURHzDe0O0cMFEBQr4hQyRNjmjPJvIcuWa6iTMm8thZyy5OMqJ9XA
	Sv2FvtsTa1kb/E0l0DnuVnQQ5VqyIhc2+nZSHhfmQmpxXt0CWiokLv+b9c0AWO3SgWqbSd/jWVu
	9M9OAmRTnk3DD8geN1ComI5R9jXKm/nGxTon3UiOaDiR2Gj7Z/93hfKPSjJkqWt/xocmy5e3r6y
	Vrhc+yxHsIr7AOxdzdbRfQWsOB4arPeIcK82Kc0zAfshOiUPJug2bMoPkz8EsV9fhXp8xnjPk54
	yS/g==
X-Received: by 2002:a17:903:2987:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2eff757a5dfmr48420795ad.55.1795067998142;
        Wed, 18 Nov 2026 21:59:58 -0800 (PST)
X-Received: by 2002:a17:903:2987:b0:2e9:5b4e:b8a1 with SMTP id d9443c01a7336-2eff757a5dfmr48420595ad.55.1795067997636;
        Wed, 18 Nov 2026 21:59:57 -0800 (PST)
Received: from [10.152.204.131] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f0321d391asm611365ad.61.2026.11.18.21.59.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Nov 2026 21:59:57 -0800 (PST)
Message-ID: <30426b8f-1a56-4f1e-8a65-fe1365c297fd@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 11:29:54 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
From: Praneesh P <praneesh.p@oss.qualcomm.com>
To: ath12k@lists.infradead.org,
        Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
 <175298a0-eea6-413a-8f37-2fbaf1c96657@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <175298a0-eea6-413a-8f37-2fbaf1c96657@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=YJ0KWhGx c=1 sm=1 tr=0 ts=6afe905e cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=j4ogTh8yFefVWWEFDRgCtg==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=jLFef5a-zFSVYl7coWYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfX9SeCC4DLv6N0
 b+fDAYgKBEynxHa+BIcDc5ewQYl526BU/35QmG3J/NaxzQn9mwWyBwAD7C/TcndGbm1myRr/zis
 Uq1umfT1Riy/cV4WtHfQAwwacWwepudw46mvcjz96sXDyyGHjqA3v8K8Szlpj00ZpmKxaI1nvCe
 2IojsbAxSw39jw6N2fxnKtG44ckPsMIzt0v3vl/R6zCqIJ/uj9sGfvP1KpEhSABp875E2fYGZX9
 Q03VT3krd3t6FseQVOz13p7wbS5S2OxOC1R6PhIOle6679KfP0C0sancx/0539s2k6YlgNtcAuo
 BJDW38G2eJgNtibtvxYaxbs7vdRK7WNimpLHpPIrWGeEqTqp5HLD1msG/eBXdD1UI/L+ntJVR0J
 1ptBolZu9QBpIOKpARw+oEd1oUk9oI8gaomFhGyqU8zKBBy1r1ZFP9vLbVaxvKCMpAcuORuikZp
 8tiAn4uOzOcsrhRPfAA==
X-Proofpoint-ORIG-GUID: 4HZ33nIsEzODrchswIgRXrZ2cGk_TcHF
X-Proofpoint-GUID: 4HZ33nIsEzODrchswIgRXrZ2cGk_TcHF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMyBTYWx0ZWRfXzzrqQSum1tbB
 mMhEUy/cUKAh86AUFrRLFUBDq8k5NNIsBVoT0nWn+dpXp9IQcU31MJQQGjoz8KIkMeWcox9ig21
 JNaT/OF34d1vVj4Nqfy2ysBcIApDqM4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 malwarescore=0 priorityscore=1501
 lowpriorityscore=0 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190023
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261118_215959_730828_29B7756D 
X-CRM114-Status: UNSURE (   9.89  )
X-CRM114-Notice: Please train this message.
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
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 11/17/2026 11:35 PM, Praneesh P wrote:
>
>> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h 
>> b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
>> index 311fc5b8015c..c99521abdcb3 100644
>> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
>> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
>> @@ -7,7 +7,164 @@
>>   #define ATH12K_WIFI8_HAL_H
>>     #include "../core.h"
>> +#include "../hal.h"
>> +#include "hal_desc.h"
>> +
>> +/* WCSS Relative address */
>> +#define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
>> +    ((hal)->regs->umac_ce0_src_reg_base)
>> +#define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
>> +    ((hal)->regs->umac_ce0_dest_reg_base)
>> +#define HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(hal) \
>> +    ((hal)->regs->umac_ce1_src_reg_base)
>> +#define HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) \
>> +    ((hal)->regs->umac_ce1_dest_reg_base)
>> +
>> +#define HAL_TCL1_RING_BASE_LSB(hal) \
>> +    ((hal)->regs->tcl1_ring_base_lsb)
>> +#define HAL_TCL1_RING_BASE_MSB(hal) \
>> +    ((hal)->regs->tcl1_ring_base_msb)
>> +#define HAL_TCL1_RING_ID(hal) ((hal)->regs->tcl1_ring_id)
>> +#define HAL_TCL1_RING_MISC(hal) \
>> +    ((hal)->regs->tcl1_ring_misc)
>> +#define HAL_TCL1_RING_TP_ADDR_LSB(hal) \
>> +    ((hal)->regs->tcl1_ring_tp_addr_lsb)
>> +#define HAL_TCL1_RING_TP_ADDR_MSB(hal) \
>> +    ((hal)->regs->tcl1_ring_tp_addr_msb)
>> +#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(hal) \
>> +    ((hal)->regs->tcl1_ring_consumer_int_setup_ix0)
>> +#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(hal) \
>> +    ((hal)->regs->tcl1_ring_consumer_int_setup_ix1)
>> +#define HAL_TCL1_RING_MSI1_BASE_LSB(hal) \
>> +    ((hal)->regs->tcl1_ring_msi1_base_lsb)
>> +#define HAL_TCL1_RING_MSI1_BASE_MSB(hal) \
>> +    ((hal)->regs->tcl1_ring_msi1_base_msb)
>> +#define HAL_TCL1_RING_MSI1_DATA(hal) \
>> +    ((hal)->regs->tcl1_ring_msi1_data)
>> +
>> +#define HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET(hal) ({ typeof(hal) _hal 
>> = (hal); \
>> +    (HAL_TCL1_RING_MSI1_BASE_LSB(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_MSI1_BASE_MSB_OFFSET(hal)    ({ typeof(hal) 
>> _hal = (hal); \
>> +    (HAL_TCL1_RING_MSI1_BASE_MSB(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_MSI1_DATA_OFFSET(hal) ({ typeof(hal) _hal = 
>> (hal); \
>> +    (HAL_TCL1_RING_MSI1_DATA(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_BASE_MSB_OFFSET(hal) ({ typeof(hal) _hal = 
>> (hal); \
>> +    (HAL_TCL1_RING_BASE_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_ID_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
>> +    (HAL_TCL1_RING_ID(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_CONSR_INT_SETUP_IX0_OFFSET(hal) ({ typeof(hal) 
>> _hal = (hal); \
>> +    (HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_CONSR_INT_SETUP_IX1_OFFSET(hal) ({ typeof(hal) 
>> _hal = (hal); \
>> +    (HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_TP_ADDR_LSB_OFFSET(hal) ({ typeof(hal) _hal = 
>> (hal); \
>> +    (HAL_TCL1_RING_TP_ADDR_LSB(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_TP_ADDR_MSB_OFFSET(hal) ({ typeof(hal) _hal = 
>> (hal); \
>> +    (HAL_TCL1_RING_TP_ADDR_MSB(_hal) - 
>> HAL_TCL1_RING_BASE_LSB(_hal)); })
>> +#define HAL_TCL1_RING_MISC_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
>> +    (HAL_TCL1_RING_MISC(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> [snipped]
>> +/* REO2SW(x) R0 ring configuration address */
>> +#define HAL_REO1_RING_BASE_LSB(hal) ((hal)->regs->reo1_ring_base_lsb)
>> +#define HAL_REO1_RING_BASE_MSB(hal) ((hal)->regs->reo1_ring_base_msb)
>> +#define HAL_REO1_RING_ID(hal) ((hal)->regs->reo1_ring_id)
>> +#define HAL_REO1_RING_MISC(hal) ((hal)->regs->reo1_ring_misc)
>> +#define HAL_REO1_RING_HP_ADDR_LSB(hal) 
>> ((hal)->regs->reo1_ring_hp_addr_lsb)
>> +#define HAL_REO1_RING_HP_ADDR_MSB(hal) 
>> ((hal)->regs->reo1_ring_hp_addr_msb)
>> +#define HAL_REO1_RING_PRODUCER_INT_SETUP(hal) \
>> +    ((hal)->regs->reo1_ring_producer_int_setup)
>> +#define HAL_REO1_RING_MSI1_BASE_LSB(hal)    \
>> +    ((hal)->regs->reo1_ring_msi1_base_lsb)
>> +#define HAL_REO1_RING_MSI1_BASE_MSB(hal)    \
>> +    ((hal)->regs->reo1_ring_msi1_base_msb)
>> +#define HAL_REO1_RING_MSI1_DATA(hal) ((hal)->regs->reo1_ring_msi1_data)
>> +
> These accessors obtain register addresses from the runtime selected 
> hal->regs table,
> and their definitions are identical to the wifi7 accessors. Please 
> define them once in
> common hal.h, including the identical offset helpers, and reuse those 
> definitions here.
You can ignore this for now. I have a separate patch to address this 
issue and will post it soon.

