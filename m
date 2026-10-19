Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6D7E606A324
	for <ath12k@archiver.kernel.org>; Mon, 19 Oct 2026 16:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=mxOCy0vZ;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nfWXGEn2;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WPgvEkUq
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=; b=mxOCy0vZH7XaXt9bNf9hPprA4Q
	9CyeXZJsA3LlWLwdnSVSHa2rBQrioEB6eUvzFT5p35ti3I4GYVM/Mfv5yEYhN356rzTpkpWpIhHbm
	Ler9C+yJvRRhA36EvdcQXq3j+ZWU82YY+BWR8bEbV5Qu/jAXBEIMCAGL44zzJZ/h7bQ3bQDoZBdGP
	GE6aEuNSMnzEncT+7/jF6SaePRR6TapSKPXhcwJatkSSNDUkrugKA7G9bi8SWuSJWTm4eEemK2ErI
	zFFkH4hBVRIZ6qQLe1kB5rvNbPB1+9LCUZt+BSv18JB6lbZFl4MDfYxtkwO3U3D8Wnx3Lr4LSEQQ2
	+lOrN/jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqVn-000000081OM-3zy4;
	Mon, 19 Oct 2026 16:46:59 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIqVl-000000081Mr-1UOj
	for ath12k@lists.infradead.org;
	Mon, 19 Oct 2026 16:46:58 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69JFPMYi2816666
	for <ath12k@lists.infradead.org>; Mon, 19 Oct 2026 16:46:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=; b=nfWXGEn2NkcNVPpA
	Sapb6Al6dKB6XBK/E7Wc91YrpmFkKXGO6OidMfRTzWW0xmPq3nrdhsKdgyrlEsjt
	8XcTKHuYqy5FHI3vermFeKBj0SCDdpxGyQbasIr7oeeuabDeBVVV7RD/6czWALvA
	kea82WILN2a96XvK3mCrgJye36wgVWic902BlxvJcPZOarHUuvx/CuWWPgEJLo7O
	btWw1tscYss9RtGlfejcDaNkkW7/wKHMh39LBXHtXHK+JVB5mTNBS79sAtAdGuy9
	Lk3Vxq6IqiLAjOPZ/TAyuQ0uS320TXv7b089hyCVGfmYfbkdChj6UqF6gC28olhq
	D4fEEw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hdkmfh1r0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 19 Oct 2026 16:46:55 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-35c902e0da2so4349481eec.1
        for <ath12k@lists.infradead.org>; Mon, 19 Oct 2026 09:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792428414; x=1793033214; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=WPgvEkUqmDf4r4QMH2NjwxEDArUGU5HH8RJ394V9aPdzRQ9Abu0MwxZhJQy/DuflDo
         org9XbktLF4NodVUpe6E1rwH2I/M0Tt8i5yOuOTlPEB9Az6jKAD6aTLMkRdZlHyEDFLU
         UI87uDrPt/BEBpEqxmjU2cIIST9/NQi+h8PrLPQiPOv43UR4y23vE5fs+ixBJYd83Tt1
         yGZ2HLA52yPm6/qEvXxJlk92krQaPvI75SqoT/9e3VZUlJFbG0wLiWWqJgFUTgWzGmbc
         +ZwdSwcQ+m8Pj21Cu7TsoWuwGLPaLZQ05BQhXPg1HtpR5oR/ikoOC1tkEaSvKQhydLaX
         eNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792428414; x=1793033214;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=DrHjVs3K5knpICGJJRURjLir0JgH6n3UDboXHBkcEBg=;
        b=sbVMIPUuZl7b7qqy91khhsmr0yn7qj+XGKZvtRjOKhAXJWMKfs3KPCh2m1GbbLffNS
         qvI7Omvn6Tu67coBrGeoKOvd2aKi+q1fm1Jwl33rUGGqkI4SrcCim0r9NYmd6Z6GJbzY
         uA4ivQTvoDGrnQ4N3Aw812gYfLmJQn82G6DPdXGJnsijV/973WeX1O/CwCw0FKdwEhRY
         RmZpa30ac5T0YeCdjwWt5atQ+alIsytnvwMA2nhwdfFjjLL1mYECZk4HnY2jI94r5GdI
         +WxnrcnpvDzE52rYa2D6SmYLs/HcbNhiCEsIVWDY0/dZMP5ng9i2PxnRy1XGTFzSa8it
         sQrQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGjEhR2Opudd8SQzcOW75YlppHtLLjPhD9/w6eDu5xgV9er1X9V0soitVZTml3qC1tpboIFJg=@lists.infradead.org
X-Gm-Message-State: AFq9FYIAZRb9Fd59odptyS0vrvZGredS+eWxBCdKokMrb6qW08e9nUr4
	+Ngt+3wty8lGkvWHRMFFDZH3ZJrrGG0eJ8DwGdRuJISjrYLaNLwb/y8z2cNicCbjrWvjzsdKqva
	vk15lI0F1PyV+4gUkYa+/J8WJZgWR53JBfUyCRhmmGgKTI1x1J31jJwQeCaUxZrVaHAFUj3T0
X-Gm-Gg: AYBFou1S0iwB1n39af6mgxr+Idh4P/qDm+tNDiJYTPRUESRHlRcqJQh00CcJ6R7+1Zb
	wK17FpgU2YZREghsjuVOqHdmL0YgceT5pMF0JC/+xP3TEezRCIXeoRYKalLuym3ohSoFza0zlde
	p+QPmNWuydiydTfIyYeq1kCe8fffwrP48ZcMAKKw5VyXeqoPOZ3WbdMgtNU5EtMVX1IW4kKe24J
	VXwWAmEbNWmBD9O061/DYKjQEafE9lOGtu4CyMXAmKn88rFXTadSPy2xpGr6wrjyEaJrEbMxULl
	fEdL8YBuV98EUGbDEY1TpO91nzy8PFsC2bBg8lSf+jw6FCxdybfCyNfphZFbaNx53610LolOqiq
	ZT98la/TQU8IX/HJg9ggWyXMRVaB9g8diNMpN+s4SPaURxqkisiUmlo8Skg==
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293195c88.19.1792428414348;
        Mon, 19 Oct 2026 09:46:54 -0700 (PDT)
X-Received: by 2002:a05:701b:220e:b0:159:d448:dd1c with SMTP id a92af1059eb24-1825a67565cmr13293157c88.19.1792428413560;
        Mon, 19 Oct 2026 09:46:53 -0700 (PDT)
Received: from [192.168.1.20] (33.sub-75-218-193.myvzw.com. [75.218.193.33])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75ac0fsm29699093c88.15.2026.10.19.09.46.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Oct 2026 09:46:52 -0700 (PDT)
Message-ID: <e98854af-f5a8-4c8b-98ad-9af673384f57@oss.qualcomm.com>
Date: Mon, 19 Oct 2026 09:46:51 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] wifi: ath11k/ath12k: validate firmware array lengths
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Shashidhar Lakkavalli <slakkavalli@datto.com>,
        kbuild test robot <lkp@intel.com>, Julia Lawall <julia.lawall@lip6.fr>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        linux-kernel@vger.kernel.org, ath12k@lists.infradead.org
References: <20261019100506.1915181-1-yaojiale02@163.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261019100506.1915181-1-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: n4s9iOwu2P2wEsHDLQ3WZHjEsd2Lfeij
X-Authority-Analysis: v=2.4 cv=O+isLx9W c=1 sm=1 tr=0 ts=6ad6497f cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=AnolQpdaNwb4XK4FG+QP+g==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=SGwW7hRdeZfZbUOxcl4A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX9imT1YNb2DEA
 XnVq/yDH4t1+mqIkGK+suL9nGkKv6Lpe+ywyNVVZNWeBmU3OWOEN1CrR90ES2HdYNh+DZ+ciqgy
 BpvHRT4E+KvOUcP9BViZXE3++SlTpsQeRFcP0khOfvV0VxbpU0uP0q0s3BA++qadYPzSY0ksc+V
 kGa6qKbKDC8K88Z8vTGQj3BmJoxcivl2GcSl+O27hnwCB170eqay1AXstlS0SzxY5VtUi7B7t9U
 Rfnuqs1aI4+5J1FFHNI7eV2u8ArLy/hvi5bgd0b/3WXmuQ9wEd72A8bkEDw2QW73m7MUhK6jkGB
 JYk1wM8DrLtp4qf80b5vE27ZwmZw6uE68u9KWVbiSQNli2kAPvyZcPty/kzvHCfFUdvj7WloPgT
 G/fCgMZa0uQmzJjASyN0KZfBE7bHy3GP948yL1PKJDwf4Gw6yULKIc7n92FtVPrLDH8N36+nz0L
 lryt9vKSOjU59OnirUw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE5MDA2NiBTYWx0ZWRfX7biQTlLl0wam
 /3tecNXCKEpAKEYcIRPKEtXf1WeOp71UAuEHmTnOWvLnfsNdDrnYlZVo1FWP1nd2pM3a3j606o7
 NkUK3Mfmq4yWBSCZwlllJ8AiJLOeBGk=
X-Proofpoint-ORIG-GUID: n4s9iOwu2P2wEsHDLQ3WZHjEsd2Lfeij
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-19_05,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 malwarescore=0 lowpriorityscore=0
 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1015 adultscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610190066
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_094657_506775_B3F12358 
X-CRM114-Status: GOOD (  14.77  )
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
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/19/2026 3:05 AM, Jiale Yao wrote:
> ath11k and ath12k consume two firmware-provided arrays without fully
> validating their lengths. The service-ready-ext parser accepts fewer
> extended regulatory capability entries than the separately reported PHY
> count, while the ready-event parser trusts the reported extra MAC address
> count without checking the fixed-structure array length.
> 
> Malformed firmware data can therefore make both drivers read beyond the
> corresponding TLV arrays. Add matching validation to each driver before
> the arrays are indexed.
> 
> The four patches are independent and each addresses one parsing path in
> one driver.
> 
> Jiale Yao (4):
>   wifi: ath11k: validate extended regulatory capability count
>   wifi: ath12k: validate extended regulatory capability count
>   wifi: ath11k: validate ready event MAC address array length
>   wifi: ath12k: validate ready event MAC address array length
> 
>  drivers/net/wireless/ath/ath11k/wmi.c | 10 ++++++++++
>  drivers/net/wireless/ath/ath12k/wmi.c | 10 ++++++++++
>  2 files changed, 20 insertions(+)
> 

(dropping obsolete codeaurora and quicinc addresses)

You seem to have sent two separate series. Which is the correct one to review?

And more importantly, where are the Tested-on: tags which indicate you
actually tested these changes on real hardware? There have been numerous LLM
inspired code changes lately, and some of them have caused regressions, so you
must test your changes on real hardware to be considered.

https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath11k/submittingpatches.html#tested-on-tag
https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag

/jeff

