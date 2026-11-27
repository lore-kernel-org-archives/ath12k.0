Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06AC6606A31C
	for <ath12k@archiver.kernel.org>; Fri, 27 Nov 2026 06:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xWKtEFPb;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jWJd4BIF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G/ialoDs
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=; b=xWKtEFPbEfduMb
	7+rzCoGTdpZY5SQSRf+EOzMFT33qO8Qomoo8krjmnFLrIr1wdMa+RXZ9V/b3N1NcE23nTldSQEyo9
	VXAMejpzz6p9L2pKBJojOK2eyC+fnB7EnGWwf6CoB2jxX+6e1EqtDaROj2Hq5GkVnfp4qwpk7OpyX
	0cTOtu6/VulSdkov0JqiPTUJ77PYXr+U7UUz4S1O72KwGwfjoUJz/3YAXXPc95xavkQUGlmEFxwgW
	lL95KIlVCSc1tnGA+U3Tp7RByXM545BeYmObDaG8qQ/JY4vZwQjPmnbX/IwX1AieOz26XWF/bHoVB
	JZsEMUVqAXZ8JT3TzQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpOV-0000000F25C-3GrJ;
	Fri, 27 Nov 2026 06:25:15 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xWpOT-0000000F24q-0ssH
	for ath12k@lists.infradead.org;
	Fri, 27 Nov 2026 06:25:14 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AR6FIoR3339612
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 06:25:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=; b=jWJd4BIFD542LOMY
	LJuxB3vC7aM/CYM1DbYrWPcz2KiimXWoQpji++7n15+vLf+N/htCrgy2DFqRdxhy
	sBrXz70EnX5WmP7TNabFBO4QdhhmYwZbJUpYsy8gCvKToeaaTsCSR6/C1olYcZgZ
	2nQSjbDE8uT4qRq8FNG5pugWwq3m7R96sigYy1D1VZKFylmd7hIUPXrWlzVgOfaL
	r90GufLdy/HuIwjshShzx3HcvcWmpNJW4jWo7DlYzegXL0XzuWQzjgPZJ/jT930+
	lactU2spTxXAvQP3v4JDooLRDlnlB2QSKRPLc13hc/wQkQfiJ1tC55cTI1HHfoVH
	qZMP2g==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqjgy3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 27 Nov 2026 06:25:12 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3b427e5a37dso6266638a91.2
        for <ath12k@lists.infradead.org>; Thu, 26 Nov 2026 22:25:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795760712; x=1796365512; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=;
        b=G/ialoDs0GqToK4ylXJG3jlFobQyL7BxM4/MDAJZrCOzYqJ7/Tqp6CgDf9pjGn92oi
         5zndz3Y+UF3Lp3XS7ppFpUE5Qd40xa7D8thXPESbwUACYf4hAiKzbAGAYCaEEJoXTBPs
         rTUko+LbP+Dt0omdHmEALjzcFcdqnLO0DW7zyMDI1tF1O1L3Z/F1G8BAY3ujh2iX4qFj
         vcVCY7XSP1m4L4F1L3XyBqa42NtVdjUBO+6BSmh6DKrYaQppUCgjgUwdY2OfJd9QvI5D
         UsPzIiDyUJaAxYTEzi/njov4UOJ+Osi1d1UfZEBqrLB2rQlAL658c6+LKvolOPdUwcvn
         8aFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795760712; x=1796365512;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jw473km3IIg3ZQzfWe+GdnDA5eOhHztmzJKSrUaZpuE=;
        b=C6ZDLASp4IBDFgea7skP/vt3pwxXd/Kos2wBOOyNgGlXl4XqFTF6I2rd8WpmmsR9j3
         p9xyeQyZAG0V+P4BAdRee9Daxh9unvpE7BNdMX4+p4jRWN9OdCSA/jOREkqkAo33Ij3L
         VOr3EHlQfui+MGVhkofTnq475p9LzY23b+JnYZ7azp5vgUatxi1JXH6mG4IrSSS6BVof
         PqZYS53ILHJOmqa6ldRtJ6K7Ia5l3pp4sHN04f5FUqe16COSj/4i8lFKoW+9ndXMQQAu
         JqkbImBhFmWoCkQR/U+wDr6HNI9769lttcOYnFYHEecxYRsZk+Jc4gSaSwtrmZRSP1Ey
         GyMg==
X-Forwarded-Encrypted: i=1; AL+hErEbeSN6UMui8t+fBCC8ym0KVJCmzRghIkQIJSDXlQMUisKsiC7gBBoNSaTLmTN/fTMVbS9soyI=@lists.infradead.org
X-Gm-Message-State: APuU4Z8n3l0X/Om22PycMxZU2jzeUMer+kEdQ9k1Rsfv4S+HI1gfvbJX
	r3HBdlVLzODwFOU64onh/yZ8l3fwyYcDp82LMc7V+dWgyvjXQc3JISsPeTUTN2sUanNENEvJr9P
	oeYWkBmxNqaGGe9FHviHvYGxcG7/Ea07knqOYKhv+euOTGBtkqhBld7xybSRzTMAj
X-Gm-Gg: AZFdTZegsVtzAgkwFfemSMRbyp9Si8UXOh8aotVHolzXq1tFbY4/yxO4xEYkkhdjsug
	9qgRmRYz7ABjlZwmGe6YQFcKHdG7QrSY7T0onn2UWHuBu3cm3Zb8R5t0Tvt9bBgEtnXBEi+sG0c
	4PgOzvIPOpd/97qMrYZVJ1qp420PJ4MI976jvxykGGMzjTsGks+6G9Sqzs8FlvoiiGVx30SAZGB
	10tP+VhyHr3ZkM7T6fIeTIOaQVotvyACcP1tl7yLM9az+jRsNsCyvPhWZzLmlbtdlXBUr+OEqbp
	rfJpF+1O+Fh2MZCSf/cGCqlXo9ZOgrI766g0WFjtKSfzQ1BKQKz0bmclHQenbRFUjfbFTDRx5Lk
	OEOvvobL3M08wtVl7CE00pjIotMH+CTi8ciXoglimEeyMlW4ciUCGEszRPmtbf1QFc393CRwFwR
	+88E09ac9cwPipKCc1X0vPYMTZfMMZCkKo0Cm6NDUN3c61Ew==
X-Received: by 2002:a17:90b:5109:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b41c9bc501mr21090148a91.64.1795760711894;
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
X-Received: by 2002:a17:90b:5109:b0:3ac:97bc:4c98 with SMTP id 98e67ed59e1d1-3b41c9bc501mr21090125a91.64.1795760711366;
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
Received: from [10.133.33.180] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b41adcafe0sm39077410a91.16.2026.11.26.22.25.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 22:25:11 -0800 (PST)
Message-ID: <7eae8786-75fb-44ea-8d69-6669470beed8@oss.qualcomm.com>
Date: Fri, 27 Nov 2026 14:25:08 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Use bare functions for
 ath12k_hw_params::wmi_init
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261124-ath12k-wmi_init_param-v1-1-56f9142cc262@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: rcqSwG5u8ih3CCCAdM2_ipgSKM_dZCOw
X-Proofpoint-ORIG-GUID: rcqSwG5u8ih3CCCAdM2_ipgSKM_dZCOw
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b092248 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=IXfxRFBqj_madRA9-PEA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfX4fe0xiLf4lT+
 AY81Ce0BpgKLAXIPThlNAoeYZbuuIJVUHSv76V31fWGl/19D5hp59g0GPhuspt5qDHtbMezH51E
 JbIAq+vYAXz5X0yWmVofRjMtseYMFME=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI3MDAyNSBTYWx0ZWRfX60U1ZqOUgRZ5
 fPVNUa4HGgMAGVZhD3FTsCtOd+rml5ds6+fiK3AWMAJHj1drobMg+F/pGh00l/h2SYQpRem3ClY
 OaE7WSwb/UuAS0j8xzbHfJhfbkCy7itphZ5cTR3xd6LwAr9STxoE+xuXaiwTvgjpQlEKvC7xR8h
 gj+CzV6HrTzncTlZl3krl417jYOrT+u8/dTkxONE3VrrGzAn9+Mw+oIpAgccdSKRhM/oZnmbQW9
 RfnHLozi24j2+db+Vx+vn2ifQLVIudsWN49b8SpJFSoRANQPXYk9yK6Eq1ZdL9caGyeVIg0v2SB
 bw+uQdQ+BaJoDGrb0I8XNE+KzRHV3QlluDglvOM3illWxH7PnwqSeHWVAWOcUa//4U5ct73fmp5
 6V19L/XAFie1FAl1jvCrgocOSM3D08AoGAQge/zRLpOQbEX07xJ2uL6MbqQNc8AcpkvJ5FctUcI
 YOQnDmc+ga3eV07s2WQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_05,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611270025
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261126_222513_259525_33082885 
X-CRM114-Status: GOOD (  15.64  )
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



On 11/25/2026 9:44 AM, Jeff Johnson wrote:
> Currently there is an inconsistency among ath12k_hw_params::wmi_init
> initializers, with some using bare function pointers and some using the &
> operator. Normalize them to use bare function pointer syntax without the &
> operator, consistent with other function pointer assignments in the array.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
> ---
> Issue flagged by Claude Haiku 4.5 during code review, and fixed by the same
> model. Fix reviewed and validated by me.
> ---
>  drivers/net/wireless/ath/ath12k/wifi7/hw.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wifi7/hw.c b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> index 48a2f6da16ef..16896118d2f4 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> +++ b/drivers/net/wireless/ath/ath12k/wifi7/hw.c
> @@ -743,7 +743,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		.num_tcl_banks = 48,
>  		.max_tx_ring = 4,
>  
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> @@ -933,7 +933,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  
>  		.mhi_config = NULL,
>  
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> @@ -1023,7 +1023,7 @@ static const struct ath12k_hw_params ath12k_wifi7_hw_params[] = {
>  		.num_tcl_banks = 48,
>  		.max_tx_ring = 4,
>  		.mhi_config = NULL,
> -		.wmi_init = &ath12k_wifi7_wmi_init_qcn9274,
> +		.wmi_init = ath12k_wifi7_wmi_init_qcn9274,
>  
>  		.qmi_cnss_feature_bitmap = BIT(CNSS_QDSS_CFG_MISS_V01),
>  
> 
> ---
> base-commit: e2d74a4def28e220ad582d17c27e7597690e601e
> change-id: 20261111-ath12k-wmi_init_param-6005e644793f
> 
> 

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


