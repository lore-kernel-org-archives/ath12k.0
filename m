Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202BF606A31C
	for <ath12k@archiver.kernel.org>; Tue, 17 Nov 2026 18:05:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=KGlZ3wuC;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=icGqP7xt;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZHKY/QcF
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bI34VlW50ZT81lpeJOhA3b0j5wpGyIs3uPYMnrCpzQY=; b=KGlZ3wuC6sJ/MI
	6F6Agg/JYrIt4gXepGP7IEVd47Ad1vPe037hv1CyQdAu5urA3FIsrW2C2l6/xtB6dJvjo+k7fQcjP
	/ixGUX0cyb+/2mn9Ar8J0mTSuNZGHUkSDcMymCOYnOl4b2rHrTy+NMZ1E1G04aU+uIEULaPYfGmxa
	7PZtMcUXH9JLnlNN0QmgrAnEoUH+1QGpJbNLeNRw4xDxSzChhE6mKSWGVm1cHnteY8VJYs5Nbdas2
	YrV09GBGGMu7yCTBlXfc0wzAamPBQMlvTgnXORIGNEA92GTadLMEmCeoQIO2JX7lFnFztdnz5FpWL
	xgBIAoWGVNbTfaamBMLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNYr-00000006ijs-0gmX;
	Tue, 17 Nov 2026 18:05:41 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTNYo-00000006ijU-0nYI
	for ath12k@lists.infradead.org;
	Tue, 17 Nov 2026 18:05:40 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AHGJLRt3327613
	for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:05:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bI34VlW50ZT81lpeJOhA3b0j5wpGyIs3uPYMnrCpzQY=; b=icGqP7xtcQdMiOj2
	le+Q6Ex9jhOsqejCjPKDwEbElu9x8zB9GvKnBG6i2F0t7HRbkUUiSNgSzz+j8Cpc
	cSsu+/sLeL4AzwsPxRPz2ZNGX/1fpWxRwcJWVY5M0wCflBAC0KMsXbrI/Y6VRuG2
	f9qX7QajKaZdfX0pKPDikMbiC4vLIIaYTgZgwSJdLT0TJi2LRsuj0DzhR9Pnzpip
	Q791nGrv2NSS+0EpotObQCMeMnV52OL/AtHComy4JM1lKLhO4xTUmW7Bw+HMseWC
	9iM/NA0scnvcVOxxj7XJlyKsDZJEs7+H52hhkfdRQt0/0GfMHJz5QJ+cuvfew+eN
	pGoFAQ==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0tbarfnn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 18:05:36 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-378722fd4a3so166483eec.0
        for <ath12k@lists.infradead.org>; Tue, 17 Nov 2026 10:05:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794938736; x=1795543536; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bI34VlW50ZT81lpeJOhA3b0j5wpGyIs3uPYMnrCpzQY=;
        b=ZHKY/QcFiino0JE4WptlX7YYLP1P5uPU/Xf+Qd0Ymc6CPgdbGcLSYUK5laJuwiD8ma
         5/VW7aB6WyZqxcnX++tC/hsmtvelkjjYF8y2zz1Cm1eWQ5BkNo5abm9WO/5oLyx2NcfA
         adJr/FGcL9Hjj7f0qyze4rqpmNRwCwhJWAHFM/HmoILwCyZqKkeKNQh0Ew9sNJiJuikC
         Rc6YP007UAse9enbrBAK0NeXD/DHizwtfqRFcqmFHCvVt/BTwnGO6UBT+iqTkr4Xx+se
         KWf75K9vARulL3F1SJgvNhVyQyDeCNlbTZtHJaRSZc6VhKctFA3eexSZBTgsrnHSsVAs
         AYbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794938736; x=1795543536;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bI34VlW50ZT81lpeJOhA3b0j5wpGyIs3uPYMnrCpzQY=;
        b=Sg5q2Aidokkpt8W7GVEWbCfbSVh7GcSk4r5f3lDgqKNzUrdA5r33gr5dl2gIsOYOub
         iU0jE84b+Qdl6J+ElNEvxpddaoMk+HEwdsvD/YBI7h2E0A/6Wl3drBSDuqcoXllDrpki
         E0k2GMofc4bxmYFhkBLhho2cGHkpy4UTECkkhYeCSNxd8CJNhkIjyR5BX5QtOmJvb6Ye
         uDR5oxmNlvyeZDOZhvRMbOdJsYClpxrT5JWaGyYBwa36Hz+Rl/P84Q9fmXOVRa/NPKr6
         RASHjwLDQiLIsod6bW2Kt7h6bWgkZV7mvlC3iz5kOf7gD/IIP/McTvlXNx49qPuX+MrL
         gDig==
X-Gm-Message-State: APuU4Z9s3bmRxJPshE5vCAJGERQOnkCr/Q0bUqMjoH2jUuTQJcEBLy6X
	wBKtJjxqzyDjf1uR+mCieBYEVTewWkWG0m0cGLTJoAy0zhs/+ivStxDPQdt2KwbNhcwo0TubJ4K
	A/f1z/ajiBWqMAgXdPjPVaQ9KnK4urHPG6er1Kj2EsKc0B70q8G+q9voxX9H1Mb27z0aNhsiE
X-Gm-Gg: AZFdTZeCV3ymYJyxcTyuIeapV6b2hztf/+L9pvIGaWcRGEwEeUXMckx7i7jNpysi0HC
	21lr4W81s/pHoiZrQ4o6Pu7ZNboPd5kbSO7GqWymVPXBjW5F4NkUI3gmN73bCBJsygjt/KgGv0R
	YxpC++X4wcdO+4KAgoTo5p0iyxav57FsouJdJHZ1r6CHLN8DucomQGQhEOFfda9d7K836USucEa
	qEFuKGgv3n6frH7lluz61KFnvPmsdl8NYMP06Sfot5NWd8wue1Wb/lGzPN+hars1KuAEljImuCP
	gsurqT8pYQS/hRtgs2EL8gnAxRee5/HoURm/P8LMWLUvA+YnbqFIBctsEzrCs22PqKpxQk53lcx
	/955ZOTfgPw9J3pVd6+uX/KylLKPHtepijqD5qap0P1WeHywp90HujcS8/dyOFuX3N1mxDJhcqg
	==
X-Received: by 2002:a05:7300:fe4b:b0:378:7434:a526 with SMTP id 5a478bee46e88-3828036f384mr211574eec.14.1794938735842;
        Tue, 17 Nov 2026 10:05:35 -0800 (PST)
X-Received: by 2002:a05:7300:fe4b:b0:378:7434:a526 with SMTP id 5a478bee46e88-3828036f384mr211553eec.14.1794938735159;
        Tue, 17 Nov 2026 10:05:35 -0800 (PST)
Received: from [192.168.1.8] ([116.73.161.60])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-381a55555dbsm8297669eec.10.2026.11.17.10.05.33
        for <ath12k@lists.infradead.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 10:05:34 -0800 (PST)
Message-ID: <175298a0-eea6-413a-8f37-2fbaf1c96657@oss.qualcomm.com>
Date: Tue, 17 Nov 2026 23:35:30 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 08/15] wifi: ath12k: add Wi-Fi 8 HAL ops and
 descriptor definitions for QCN9575
To: ath12k@lists.infradead.org
References: <20261112-wifi8_qcn9575_bringup-v1-0-3f30fbc2bb69@oss.qualcomm.com>
 <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
Content-Language: en-US
From: Praneesh P <praneesh.p@oss.qualcomm.com>
In-Reply-To: <20261112-wifi8_qcn9575_bringup-v1-8-3f30fbc2bb69@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfXyLyq1osLrPXD
 PV75ebmYo1o8sL1rvsi2dH5bvMEonzBYili+EjUuxR7InOxvX/rfBkDtmxjMN1f2Ehm/SyYWQcL
 bVL3hr8avarwIHe5eArNwU0BbK/cesyZpiWPyyrL+bh4JeuV2k526ry7rp78Hsc9Sgeq7gwWfSd
 ApX1s6PvZ7NeV6uBwgEzu4kvuUGasmdsMk5icvb1JfjQIO6+JHMOTrS8DEECm9cLqpFofYTwE5+
 plJlW6XwDO7pDeYTqTlA5JQ2AaCZbRnXTaiY/eu30w5xL5HWONlSYSJZIX3vI0AUoEFw2meCOQ1
 gb3tXrwnE4MIpOH4zlTk4eBgHl99pJsq/Ue2eyJU884Xazt9hq8GTR5shDxam56l9LG+Ux/alN6
 MnKpzBMzUWKOn80PG0tSRrVHxpqBqM9rrqgmCJDKMOgZjPIDT9dpQuhQwL5+ELmsZGcocGkVHWy
 s/gEV7Sfnb0oy+jXZEw==
X-Proofpoint-ORIG-GUID: q70nkiGJGiydSdrGVT9xv7YH9Vs8fTXk
X-Authority-Analysis: v=2.4 cv=Vsy2kO2n c=1 sm=1 tr=0 ts=6afc9770 cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=haEn0A6nRzUyr4Ub8w+J2Q==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=z7pBeskzBVOVD4Fj1vUA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: q70nkiGJGiydSdrGVT9xv7YH9Vs8fTXk
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE3MDA3MSBTYWx0ZWRfX0ptlVOKQ3K49
 FhmCvgliCaPOSBM06FmWsghaN4etibdEmCUvFoy0B2f3S86wunQB86HaCeva/FBBzC6sONGNUrz
 2+DO1upaN5f90nnzKwg9Oxsypd16dcQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-17_03,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 spamscore=0 clxscore=1015 adultscore=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611170071
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261117_100538_376215_E8C6CDD1 
X-CRM114-Status: UNSURE (   9.56  )
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


> diff --git a/drivers/net/wireless/ath/ath12k/wifi8/hal.h b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> index 311fc5b8015c..c99521abdcb3 100644
> --- a/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> +++ b/drivers/net/wireless/ath/ath12k/wifi8/hal.h
> @@ -7,7 +7,164 @@
>   #define ATH12K_WIFI8_HAL_H
>   
>   #include "../core.h"
> +#include "../hal.h"
> +#include "hal_desc.h"
> +
> +/* WCSS Relative address */
> +#define HAL_SEQ_WCSS_UMAC_CE0_SRC_REG(hal) \
> +	((hal)->regs->umac_ce0_src_reg_base)
> +#define HAL_SEQ_WCSS_UMAC_CE0_DST_REG(hal) \
> +	((hal)->regs->umac_ce0_dest_reg_base)
> +#define HAL_SEQ_WCSS_UMAC_CE1_SRC_REG(hal) \
> +	((hal)->regs->umac_ce1_src_reg_base)
> +#define HAL_SEQ_WCSS_UMAC_CE1_DST_REG(hal) \
> +	((hal)->regs->umac_ce1_dest_reg_base)
> +
> +#define HAL_TCL1_RING_BASE_LSB(hal) \
> +	((hal)->regs->tcl1_ring_base_lsb)
> +#define HAL_TCL1_RING_BASE_MSB(hal) \
> +	((hal)->regs->tcl1_ring_base_msb)
> +#define HAL_TCL1_RING_ID(hal)		((hal)->regs->tcl1_ring_id)
> +#define HAL_TCL1_RING_MISC(hal) \
> +	((hal)->regs->tcl1_ring_misc)
> +#define HAL_TCL1_RING_TP_ADDR_LSB(hal) \
> +	((hal)->regs->tcl1_ring_tp_addr_lsb)
> +#define HAL_TCL1_RING_TP_ADDR_MSB(hal) \
> +	((hal)->regs->tcl1_ring_tp_addr_msb)
> +#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(hal) \
> +	((hal)->regs->tcl1_ring_consumer_int_setup_ix0)
> +#define HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(hal) \
> +	((hal)->regs->tcl1_ring_consumer_int_setup_ix1)
> +#define HAL_TCL1_RING_MSI1_BASE_LSB(hal) \
> +	((hal)->regs->tcl1_ring_msi1_base_lsb)
> +#define HAL_TCL1_RING_MSI1_BASE_MSB(hal) \
> +	((hal)->regs->tcl1_ring_msi1_base_msb)
> +#define HAL_TCL1_RING_MSI1_DATA(hal) \
> +	((hal)->regs->tcl1_ring_msi1_data)
> +
> +#define HAL_TCL1_RING_MSI1_BASE_LSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_MSI1_BASE_LSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_MSI1_BASE_MSB_OFFSET(hal)	({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_MSI1_BASE_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_MSI1_DATA_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_MSI1_DATA(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_BASE_MSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_BASE_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_ID_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_ID(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_CONSR_INT_SETUP_IX0_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_CONSUMER_INT_SETUP_IX0(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_CONSR_INT_SETUP_IX1_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_CONSUMER_INT_SETUP_IX1(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_TP_ADDR_LSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_TP_ADDR_LSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_TP_ADDR_MSB_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_TP_ADDR_MSB(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
> +#define HAL_TCL1_RING_MISC_OFFSET(hal) ({ typeof(hal) _hal = (hal); \
> +	(HAL_TCL1_RING_MISC(_hal) - HAL_TCL1_RING_BASE_LSB(_hal)); })
[snipped]
> +/* REO2SW(x) R0 ring configuration address */
> +#define HAL_REO1_RING_BASE_LSB(hal)	((hal)->regs->reo1_ring_base_lsb)
> +#define HAL_REO1_RING_BASE_MSB(hal)	((hal)->regs->reo1_ring_base_msb)
> +#define HAL_REO1_RING_ID(hal)		((hal)->regs->reo1_ring_id)
> +#define HAL_REO1_RING_MISC(hal)		((hal)->regs->reo1_ring_misc)
> +#define HAL_REO1_RING_HP_ADDR_LSB(hal)	((hal)->regs->reo1_ring_hp_addr_lsb)
> +#define HAL_REO1_RING_HP_ADDR_MSB(hal)	((hal)->regs->reo1_ring_hp_addr_msb)
> +#define HAL_REO1_RING_PRODUCER_INT_SETUP(hal) \
> +	((hal)->regs->reo1_ring_producer_int_setup)
> +#define HAL_REO1_RING_MSI1_BASE_LSB(hal)	\
> +	((hal)->regs->reo1_ring_msi1_base_lsb)
> +#define HAL_REO1_RING_MSI1_BASE_MSB(hal)	\
> +	((hal)->regs->reo1_ring_msi1_base_msb)
> +#define HAL_REO1_RING_MSI1_DATA(hal)	((hal)->regs->reo1_ring_msi1_data)
> +
These accessors obtain register addresses from the runtime selected 
hal->regs table,
and their definitions are identical to the wifi7 accessors. Please 
define them once in
common hal.h, including the identical offset helpers, and reuse those 
definitions here.

