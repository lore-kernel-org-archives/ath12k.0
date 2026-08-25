Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB121C61DB6
	for <ath12k@archiver.kernel.org>; Tue, 25 Aug 2026 08:16:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u3nGs8Fj6xeNtfD+I61I2OiIR7G0vRvfVqgZ3eN8/iM=; b=0PDSuplZDMDj1qivb/vVXeZnZa
	Udj2doqMLjrEzIYAV868uE/lFXx8nHSQQRi18ak7hUjLMey5NIV0Q2Pg5YnO0gUdFr6h0lDMOdoEL
	qI2FplqLSMZYO6njmxmdbeGQ1inRAqjq+jfvOWYm/uLb8KKgk1yEiOxZWCX/gypYE/+4x3BcKn3RN
	5TC9GqMwOZrvaUpfXvvmzpRsosqEUFdw2C9VLKu1Jmx8Bk2t/4rsbt1ksxsYguHzyJnjCSY9ez9XH
	bSHNiSc1QRWTq3ymHt7WTaZxbDjLOwQhbjZfFylnNbFa+2WYugfdnNro79FvycrW17Fi6bNTcDNvX
	3N5oLNQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymL3-00000000MPA-22ye;
	Tue, 25 Aug 2026 08:16:57 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wymL0-00000000MO8-3fHJ
	for ath12k@lists.infradead.org;
	Tue, 25 Aug 2026 08:16:56 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67P88I8B297205
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 08:16:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u3nGs8Fj6xeNtfD+I61I2OiIR7G0vRvfVqgZ3eN8/iM=; b=L/YAZ3/vcuuYoVKV
	In1ZP3ZkR+Hi/TBke4vSUt9Bri4+W5BTy2bg5ST7WSkOTstmwqtW/lc3BeagVCDt
	kVP+XPJ80Q/rvLMrsWhB4fCXYt0tS7C6YxnljI3c9tB+Me4PQXspCQY5KHYRkm4X
	wsRkgYNMcQ4+E0PwPCrB7veY2q3RnBJOBgEVOIKGDK4k0+XZAk2ZH8pOlPwSkgJU
	N0Mv001/JadF4rD58RmS9eQrdCa3IeloBBfEg4KSxP0vdijGf9Nq6utz7SKq5UCi
	vGPwsV4fJPF0SslmA+wz8+iQiI26M16y9mwOwPhpYQxEwGeXpFn24NFpoXjvHU7Y
	aQI5lQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g93xxru7g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 08:16:54 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-52dcf1bb6e9so5307041cf.1
        for <ath12k@lists.infradead.org>; Tue, 25 Aug 2026 01:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787645813; x=1788250613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=u3nGs8Fj6xeNtfD+I61I2OiIR7G0vRvfVqgZ3eN8/iM=;
        b=MfUq8pHMvUMtiXVh2IULTJM+smd+zs0FdKYNN26+4ZEeszgNGm94fUQ88M59kPFTO3
         eCCgBnhQWOH51lkOTXOmx63p0eD+QiIlT2HcuP2kpDDeumAKHWZ/a75xiNTz9Bg+OSWZ
         rDoYFbnIM9g9ZN+TFHvg4Xe/lJsThpq051ZRqr9MuPLTdM1N10oCvcf4SAJx7T9XYT8x
         2eG+LAxgmpriqrGY9vMKOjTlRUyrXHn1D81Z8htDDmfjzQYHbJNC9f0RQGw4w98i4Zsm
         FggRJ9s9ppxCY6H7zWhtN/AMMzIALtZIdxKkB2Ufy3p2zpIMKmKZjJ9YxfXjfZIDM45x
         LX1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787645813; x=1788250613;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=u3nGs8Fj6xeNtfD+I61I2OiIR7G0vRvfVqgZ3eN8/iM=;
        b=kPZC3DCQkXBCth/26KXObd9mlXlqKZhslGe9zX7oNmkPMC1S0rfo7KdkYpkkZzgpeY
         Iu8Si8N5hxtQHlaYd8RZZjZrS6JOXdz96dFTKwRkifLol1/ky5pKaOeOL5wyxP23f/IL
         8xpQ6S0g5FQucYiozIUCmMHlam3jYr6r1XDQpf4/XyskfLZwgfMtLGWUCH0q1HRSBnUT
         Ta1lp7LrArB0JsSWnfrRctouPPjv0eCE9gVCwjwMYueZS7bEk0GHPnAyGdUeZz1AYpHa
         fMfLnTuyKVYEDooqypmytUZJOO1ExwyKPsiMQOYuF2JCKWEPleyubYLp6yW8e3LjMXW5
         tnkQ==
X-Forwarded-Encrypted: i=1; AHgh+RoiOmm8yunZvNzUKIv5BQCfjHPmjGZ5L8MQ+Mr1qB6MoV49VpRTIPmAN00/duiXqPivi5CpdXc=@lists.infradead.org
X-Gm-Message-State: AFuF++mIU0suSaRfpZQwMJ+h0+Psi85UntTLU5ckxJownhHCk55piRPF
	Yr22LG+cUn/c0ws7Kzwkztk7/ZnmqBTs0RXKvk5qMvnOn4BtcuA5yZN9cac+lt0R+R1Zbo+uzQU
	fmDYXzRa8CNUR6GnWwmcQn4nd+OdCe7JbsS1qeXYxZw8DJlmGDUTvxDpKmo+GFJPd
X-Gm-Gg: AR+sD10e9/o3bRf8CYHmJHPXFSy3KFB6lZxlvQav8Pe5qKHHOfWIjVBunKxEKoqMGDn
	t1pg2Ey/54Z1ip3FqF5EtP1DToBmnjlSgOhTX7rQf55LbsBBAGzYVZezhuVHgtF4ZYCRZVSHTWK
	G+eD5rFF8uV17bLpz9MSGKL0yE3/cDKwyHGy8Sac8nO25nQmw6tU2JKSEXzba7RM4eLh1qLurEa
	WArU62nHnoOpGqW14T8Xwko30hZojtxTHI1dXG8/T8XwM1nVzFlGQs+o+YPXYhqZe1lCRh39D70
	eZZip7en8a23ow+/xr2XwGgmqjeYVldZoBLM9LYIc5zltw20n0awH3nvz9TttDmDiNNiiHbfswb
	cci20tOwps7AeiniDtWCDSYTWVD0x
X-Received: by 2002:ac8:58c4:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52e2eb42ce7mr51489901cf.0.1787645813302;
        Tue, 25 Aug 2026 01:16:53 -0700 (PDT)
X-Received: by 2002:ac8:58c4:0:b0:52d:9cfa:663c with SMTP id d75a77b69052e-52e2eb42ce7mr51489661cf.0.1787645812910;
        Tue, 25 Aug 2026 01:16:52 -0700 (PDT)
Received: from [192.168.1.110] ([178.197.219.214])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c24968abf18sm1777389566b.61.2026.08.25.01.16.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Aug 2026 01:16:52 -0700 (PDT)
Message-ID: <6615be69-6c60-4866-8fa8-73e76e86954b@oss.qualcomm.com>
Date: Tue, 25 Aug 2026 10:16:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] wifi: ath12k: ahb: Revert undocumented ABI and dead code
To: Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260825081313.71351-2-krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfXzIPkutRAqe5t
 aDoMp0s3XiRX4bWrH4sXet2JuyZ28bvbvcc+ruFqyp5pGUFlqErgS3MRXQbQjd5qaH6/ozbBtFR
 QxCzWVLITEEzfv+krto/NY23zzdi8Y4=
X-Authority-Analysis: v=2.4 cv=EOg2FVZC c=1 sm=1 tr=0 ts=6a8d4f76 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=+bKQE0WJfmhK2875HamI0Q==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=EUspDBNiAAAA:8 a=qqqMIIPnSBjTorXjQPsA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: Iv3C4vVjye6E-cpEx5mtAHdAFrObZUB1
X-Proofpoint-ORIG-GUID: Iv3C4vVjye6E-cpEx5mtAHdAFrObZUB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODI1MDA3MCBTYWx0ZWRfX3gRxMtflA/jF
 mvf7xTdPWJj8QKf9EVFPaWtoP0fu6j7eYBmnstg+jUJjdlMACCMwPfcCbG+5L9KjSIXPfumiZmk
 rbbVEK98fFJcfiZAI2CZdsY5eyW4DUg+jVTOopR5ifcJf+TyltE3zMxKHJbaXLNcZsykio+G3mK
 B6u+/T3LemLmqH6WFuI4+iCbYJ2hwkGOc2STea1Lam7UjNRdiCWhp/9Ect6kMkMJ2AOksiIWxpP
 AUnwOoJ8d2Ad/8kzKnuu9RoCB9wTxNDxnduO5fJZfaapiju6RiOSpTsfsN8eyVAL6SjVYr0Utv/
 4z3rCLMxspIAGiJJYJJwHW8tILc1ExE0mtbDIpChs62M3oAuWxeQTI+MhvKGxslBIuk+ASoxbNC
 ENhj5xyhQWRo87e0axI8BKwPeW86eOMkjXeSxuDbrr/dlbOCv5DdGnBHOYlMaam+J7QoRGH5yEV
 8YtqHZfGiSFKsLtbyOQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-25_02,2026-08-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1011 impostorscore=0 bulkscore=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608250070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260825_011654_919857_E2553704 
X-CRM114-Status: GOOD (  11.86  )
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

On 25/08/2026 10:13, Krzysztof Kozlowski wrote:
> Commit 96f46607bbce ("wifi: ath12k: add AHB platform descriptor
> support") added undocumented OF ABI, by relying on a very specific node
> name.  This is not allowed and was never acked by Devicetree
> maintainers.
> 
> Additionally that part of code is not even used, because all devices
> have exactly the same user pd, so this was added "for future".  Adding
> dead code just "for future" is heavily discouareged in kernel coding.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/ahb.c | 51 +--------------------
>  1 file changed, 1 insertion(+), 50 deletions(-)
> 

Unfortunately the offending commit was merged for v7.3-rc1, thus please
take this to current RC as well.

Best regards,
Krzysztof

