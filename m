Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1CEC5B56A
	for <ath12k@archiver.kernel.org>; Wed, 12 Aug 2026 13:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QA7KzlY9x7gvQ1g1k6P+VytRGMpS/xj6mic75F2DUHA=; b=ST+N/ksUR3XXEsvWbDX/dPjpf3
	QsnUXqXsnASoXQTpcexrSKnbejDEtjpjAQLjY4eRuUuHCSqAABiUGVZ/gL2oc6ww69G13pJCsSK6C
	pE0oSc6FIVzYRWZVJodOiWwQDMX3mlzSQlEEfxmbo/RD5bijBTfez6Y3fFPvBlqr3Aap1NUXynVWj
	YeeUzwQgzfYs48qcCPW7grWKvf0VUmPlbBXrZfbPQ3bUoGeHobJyrrnvwIAU3r/UjX/Rbes6+jeaq
	9VhnlPpgM55TbR3Oi1bCJ57a+N/W+VDbAw+buQ0cRWE40Df+6BULbkXk2JvmEk+ylnl+SuhM1pYUh
	y6Wm14Tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Sq-0000000GKqO-2PVh;
	Wed, 12 Aug 2026 13:57:52 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu9Sm-0000000GKpd-1JdZ
	for ath12k@lists.infradead.org;
	Wed, 12 Aug 2026 13:57:49 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67CDbo743875362
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 13:57:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QA7KzlY9x7gvQ1g1k6P+VytRGMpS/xj6mic75F2DUHA=; b=QWuVHkjEmSDpSYfY
	ffL72E9Y3oaOSHYhk2H3bkSIphzq+wkbUbBNLn1BFL1UpmuT3v5mZZfq512jsYDP
	gZjPBO6b9ExU+iJQWKqOofkRq+cg5MEdNer+oAMuFwsBQvIWt2jYdSrodMUo9r1f
	tH6gNkR4QWLBECtF9cIB0XNyUXiEEa4CKYLfS5JXIqjkTCQ711S1+2yPBifCvYuE
	LR2wImPI+LpOBERLRV/P8iCDbXwQjbtYVQmUDz52eaoNNKCX49DfwixXl08h4Ugx
	IW3AS9h8CDPZR3NHlsmrDgT4fAbswtqMhOeL6w8fgPvogmQWEF853ZyZSpQ+ubgU
	R8GI2A==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g0hj1j5m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 13:57:46 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-7e9e741693bso612012a34.0
        for <ath12k@lists.infradead.org>; Wed, 12 Aug 2026 06:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786543066; x=1787147866; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=QA7KzlY9x7gvQ1g1k6P+VytRGMpS/xj6mic75F2DUHA=;
        b=ZmvbbLvm97JPiVl18QHQ+mapS5Ao/GKopON1RkWdoWVPQX9ZP+fCSvi9RYd04gkl/c
         xzPndqqCTntGKfBDjt2xSC0yZMut/8GMCBz5uca0GfYe4kh3YWgCoYIamZ1l7C9rqOme
         KQgo/MWb9K6gl8/VAL3LmXSSVdPa5O+4YxarGURtajFebd2AIZK81pRmg9JoAAOR4VYt
         3iNkXJOUYNXLTBO+SdvJZuIwqRGmEqxAafAMUq2khyw2aIZjyul0F445Yxp7R0s1e/rv
         s3M7pq4qa535DgPu1JiONmYPkWwhuZ5PnBe2TyDEJoBYmfdCKqtCljbEtQrujbDizkzB
         O0aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786543066; x=1787147866;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QA7KzlY9x7gvQ1g1k6P+VytRGMpS/xj6mic75F2DUHA=;
        b=dPWW8GaO0n2W1GY5mDHbOf1NL5eQLPM437+bW4mLXVjoBvcpytDIpY+Q2u2GKqYREI
         5nzEqwZOQ2QugUlB7K/QkjRm6olwfxd3l43VyZ2u+6H8GbkLEgA/bXYR1tmZ2chZRpeG
         snaXLtty97LIDlMPA3ZpJjxTeu+2RjhBeHroTXx7DGPd57p2jP6CGXoeN4PoGBueFSd6
         3lASIxIOd8DMNa9VfLGFdQdSj63C5u2kqLQTx3IQfu2yzVSyc++OAOZStHKXRGZyC8/f
         oxwjyE1qdlPPAyD6rZLuai9H+tZkz8s/J/wXWHRoovHXYosjsEJOLRfbGCsHT/5WGoRC
         /0sg==
X-Forwarded-Encrypted: i=1; AHgh+RqhXNIXSzswhxqc/JyjlkHxVWEFaGEkxXq34lQNHcFaiJEyyDpeUYUTQc5PPHvgbeqL7hPKM78=@lists.infradead.org
X-Gm-Message-State: AOJu0YxYhRD18aoDKH6X6u19IngEsuyZM1jvdVpMIYT/nfyoqE10HZPO
	kLiUYIteJLKQDV893FqAeS6f+iDKD6i1MbhqtoleXo70cNAW2XwR0WkYb0MXTYnWiEO+Ccz1x8X
	GlotHvdSurR6jCyhdO4CmACHpiinMFj30rzh3TDIHnWJtsivj7d/jdDFkasIKrxGaYbinunAh
X-Gm-Gg: AR+sD13y65BgrzBc2eTYMPtIBe8g5BkZ0K3xeIoBhF+SNywVy/hvS9Vbej0WPVztEOe
	5yac4rjzlxmYpN0BBp+UasyzjpL3BLHGkGXeVjYOl54XJtzBdplLwNkfCcziItZY4jPn4kT5nXp
	65k49gAsEwyvWg96pMSQSAxtZ1MqiNxJlQH/Tz2+Xr1uoxia0jY5ituXp9KS+RJEXWriEdW8e85
	fwCiBwd7X58W/kC1pbkBW4ehvjoy+iUDXirjb43HjWNK9sop5xyGc3nLNe90a02EGdVnguKQxnK
	u20lLb5ikevGHTp0W8zkRK1gs0ldWhnyT1eYa5XDb753qSd21yIBShyQyyzUCqxVQQ7teL2yHru
	I8+bDNfw42A4pOJZiAv7gQdoVUfHrWAhtEPl/IrXy+G+Xa0scMRx8MsUlhTYw
X-Received: by 2002:a05:6830:7103:b0:7e7:8dc0:3951 with SMTP id 46e09a7af769-7f3b77281e8mr5210724a34.8.1786543066275;
        Wed, 12 Aug 2026 06:57:46 -0700 (PDT)
X-Received: by 2002:a05:6830:7103:b0:7e7:8dc0:3951 with SMTP id 46e09a7af769-7f3b77281e8mr5210677a34.8.1786543065920;
        Wed, 12 Aug 2026 06:57:45 -0700 (PDT)
Received: from [10.227.105.111] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7f3b33cd109sm2886716a34.18.2026.08.12.06.57.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Aug 2026 06:57:45 -0700 (PDT)
Message-ID: <4bd5214b-d2fc-4849-93eb-a088cb8849e2@oss.qualcomm.com>
Date: Wed, 12 Aug 2026 06:57:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: add support to load shared
 firmware on multiPD
To: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, jjohnson@kernel.org,
        quic_kiranv@quicinc.com, baochen.qiang@oss.qualcomm.com
References: <20260811054316.518494-1-aaradhana.sahu@oss.qualcomm.com>
 <c66e03b5-4f49-45e6-ad18-96bb8370cead@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <c66e03b5-4f49-45e6-ad18-96bb8370cead@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: -4E9WG4qDGm9OdGUCOWh_68mLyzCPNXP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODEyMDExNCBTYWx0ZWRfX+1I3uFYB1+wF
 G6AMlvHdlP96ZDNoLw5RW3cQ94XX6NYGx1kvVvTSutBgLoW0GgRDKGrgsF64j8/GnD6hsWt/Yrj
 6YeaRvux0ifNuO9zJBdMxQxJ1NEJNsbmNhUngx+5IeXfYsVA95hWZUy7SELaTWgnGtHPRjtH9CA
 mqEAWnI1HC/M2N+fHUh/i9UhdP9jnfkNarE9bn/cuz+pqqEvZneghuATSyZUQXxBOA454Yu1I3p
 hikxK3eUdC4Ab3X7VcZhL9l/VJX98nVrHZcz+ehzn82xR7d9K6n1MEMvchlLUoehkcgUrDPAFSa
 GcvVtv9oa1nCKNhz7yEn7WLg0/U4jB2qcsCtLgEOEg5ke4kyjYUHEusd8/x05fAjC5jze0NU83j
 KW6E6UM7rysEgfRXFTNj3kHvBqK2xo0Q7df8jGVnRbbzSHTq723vlYJJwg5VmbCGyCahf+cQhK5
 YmhLHoG2eZBXc1e6x6Q==
X-Authority-Analysis: v=2.4 cv=K6ES2SWI c=1 sm=1 tr=0 ts=6a7c7bda cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=W8Ni8Xc4stYUzYjHn6wA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
X-Proofpoint-GUID: -4E9WG4qDGm9OdGUCOWh_68mLyzCPNXP
X-Proofpoint-Spam-Info: AW1haW4tMjYwODEyMDExNCBTYWx0ZWRfX77O+YRCS08BC
 VB6XPmHLBNIq6A5eSLrAFDVSkG9ZCrkXhdcWHpfU/rTwmZ3oWl16nQn6DZJJ+8hwOw0W8hJ2Z82
 Ot17HAflTmM9vjdyudvfeZlY7yy6HxQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-12_04,2026-08-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608120114
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_065748_497034_FE70FFC5 
X-CRM114-Status: UNSURE (   9.81  )
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

On 8/11/2026 2:08 AM, Vasanthakumar Thiagarajan wrote:
> On 8/11/2026 11:13 AM, Aaradhana Sahu wrote:
>> +static int ath12k_ahb_load_auth_shared_fw(struct ath12k_base *ab,
>> +					  struct ath12k_ahb_rproc_info *rproc_info,
>> +					  const char *fw_name, u32 pasid)
>> +{
>> +	int ret;
>> +
> 
> nit: move this empty line below after the declaration part.
> 
>> +	const struct firmware *fw __free(firmware) = NULL;

Note the when using __free() the declaration should be contiguous with the
assignment, so the current format is correct. That is one exception to the
rule about having declarations separate from code.

/jeff

