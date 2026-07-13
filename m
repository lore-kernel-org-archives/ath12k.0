Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B47EBC43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 02:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XWJCEmyg6DWuWW7UHemBUpTITGGMRo7lHibMGuTIfg=; b=kWiwhPuAEt7xKt+k2TSBZ+sC1C
	ursLRB/fyfWHuxbOsMg5/wl+8Sz8sLhzlawWSHkJwdZfPUwPXJP6f5jD9IyMETcZCe/IJh48Omn4O
	rHqWw0/jynmbS4g2QVGWKE3hG6OWJQdRX4MEaRY824kTBbDCtg7RSIq5eYWN8k3pKJZFTAZumNsyC
	betA70VUTzhbo1dZc97+S5vFUjzfmGGX80TMyqF5YG8VJlD97Nx/xU3Ut2Hqu7BFHhUQCjbgCajSf
	yb1yA8+vohnIsOQQ7XnzDW3ku6ecLp7j+EJyQMiYb1uKcc+NlEiKKdgHugABGqR2PKrAQHGml51rF
	MBXKi3NA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj67k-00000007xBP-1r9z;
	Mon, 13 Jul 2026 02:10:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wj67i-00000007xB4-0fX5
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 02:10:23 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66D29jxv4141082
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 02:10:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9XWJCEmyg6DWuWW7UHemBUpTITGGMRo7lHibMGuTIfg=; b=hHFIh3rOSrct0PJr
	F+W0yKaCvkkxicIF1Y3ljLgUnYNdTzlK2lKLI1dTtwI1vYL0Y7XUs6lDplN5EbtK
	dZh6/7ynWREaeY9rmRTyfylLPxkXDvRxCBCdwmA2jantwRPOGPFIB8mYojlQfT+y
	Zho0Dem3uck2i8WGncjmwEdFI1n7DU+CDoCZgqFyOcJuV1nQ5bDVlGWDWuDCmtvF
	y2C+FkJQeeL9A6Pkdvdgcyqcd6bnsRVyTnzdYJAroP23NUCl0C9AIzxViOJqafVr
	5c0JfeEDfLYT60mWqFkmNJD/eT9Ck9F/lTI3H/vNshVZpNyE0XPDOvl2TKDG/LVN
	NYQUWQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fbekckx47-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 13 Jul 2026 02:10:21 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-3811279d51aso3230057a91.1
        for <ath12k@lists.infradead.org>; Sun, 12 Jul 2026 19:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783908621; x=1784513421; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=9XWJCEmyg6DWuWW7UHemBUpTITGGMRo7lHibMGuTIfg=;
        b=FwFLkjn8QOPZQxUdCyYWrV2MMkv8QekSPzQy9HUO+TU1yfa7akAZWtfz5g6k4RY3Vn
         w1hsYh+bsBqLtLg15Y/DNfcRgcCbTMpmRjcxXil/1sgn5metQ5XP8rYMqnBcvreWUVlr
         Vyz8eNfX9M+0fWwshJo4TAsnMHfattAWd1QW0uKvoQBzQT1Vk4ewJppslCMB/r/mXCw1
         995RHdOUKGFU/U1oJjPU0x95kgT2NdAGY05HsssinpEqUHt1+f3jbbxnqV7i9EEY/gcb
         F4O/haU1wY3849ngO8JwmTZ7F8x9B8GXqcV3TXAyaxZsHK+53RmxZT8Ki/Eux2UFU5nP
         jbfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783908621; x=1784513421;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9XWJCEmyg6DWuWW7UHemBUpTITGGMRo7lHibMGuTIfg=;
        b=TMkRs1C+qh9Petxvv+lsYuben/dkPHnXr+mhZpMpFr1Yg5QYcxafZ4rg5MxXR6VgF2
         kGwM7dstY/QBm6Di+ou2pJANLGIf3Z5h5vC3ByNnu8tRBpbd116YABqGWyzXU0fVakYo
         nlZICe/BH9hP0wBFbrzjBHr3jKdt+ngYSkHTxo/oJ4E/QCx1qH2+wYztDBTy8Rv6DYp2
         G1PQQgfUo0hJGxk88kHFIw1Ih3Ovcq+hGcV/JMLvyACz0RcUE6iziFGzo2JYvSNESHbr
         bIjHE97QHMXFol5bp10q4QYQvI3zjqcU2VuF0wFa0luhk+DDCoEP04LSBJeIVabFRzy+
         /gmg==
X-Forwarded-Encrypted: i=1; AHgh+RrpPGoY9RmbY7ZTsqCR5c47ZBBq3AkMXqO02uOa6k5o+h6H2crFjv+KbqhZlHvCzdatiHyR79M=@lists.infradead.org
X-Gm-Message-State: AOJu0YzMgCqTgV+5HIN6Q1e1uwkxOKh49pH/yh2FM5K51vII+/PD+av/
	z28RNTU3ZIBTGWrp+HikryWUlnenbtZ4cuAw6kpJiNLN99+Xcn341M/lviMCqfxAvM85na2Vuge
	Ot6cvTVm119wg+vknWTMMzWPYLyH1kL3HwrUgjkbGvUCUSPtIFbtEKjpoyPKgKyVI
X-Gm-Gg: AfdE7cn+JzoNK2WgCBC0AvV/FVGv+xndo2Qv/VNjBiIgrjLoG2o+UuphdsxtTeoRn8D
	8OvJkhHNbLft8WF9OuylCOyxr8ZeUB9SVZzMehQpsWKtfe0cgUzcHjj5s9IWTrGiFdW89vFUGKk
	ZscCMLd6u4WhNmQG2FvgNa/CgR6uthkrGHlVFCJ0xINtU0AJnvgm6nT3PYktAW180Hg0Tx8Pa0u
	IKY2c3wvnlsRl5yJ0jJpN6Mn7o6D22exDfirCTBztRmr8jhTQD0AyvtFT0lBMzoG86ryTeJSaFU
	88zPbUx36xC4PPfR/eyiaIuV8y2cEOSvp7jXsgsBW8vAlXNILnInaHtIVt0AFl2Sc2K0TmM9jVg
	i/D2cw3nNHd9Ka85Mx5S/akXvF7tz4Ic6LHeSPz9+qilTa00w7v+IU2xEIGOy+f98526lkzjb+Y
	xeFBt1QTA=
X-Received: by 2002:a17:90b:590c:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-38dc73bdd28mr7221917a91.8.1783908620766;
        Sun, 12 Jul 2026 19:10:20 -0700 (PDT)
X-Received: by 2002:a17:90b:590c:b0:37e:1bc4:b6ae with SMTP id 98e67ed59e1d1-38dc73bdd28mr7221901a91.8.1783908620341;
        Sun, 12 Jul 2026 19:10:20 -0700 (PDT)
Received: from [10.133.33.33] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38deea72fc3sm591084a91.2.2026.07.12.19.10.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Jul 2026 19:10:20 -0700 (PDT)
Message-ID: <fc273a69-d7a9-4c8c-b348-ef8755699c49@oss.qualcomm.com>
Date: Mon, 13 Jul 2026 10:10:17 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next] wifi: ath12k: Fix ath12k_wifi7_mac_op_tx() style
 issues
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260711-ath12k_wifi7_mac_op_tx-line-length-v1-1-10e4899b98ef@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzEzMDAxOSBTYWx0ZWRfXy6Jqmq43gifX
 0GqPmf5uoEr3WiyIPAf29pIdkxPGcgyyeAGV+yZKn1enl60a1StsmUaXNA/N6VlYdq/gJ+6X0MU
 vWZod2O6FbNSHsSa3Ko+QcVv3+YR+rW/BChHm/T0w6gM5zGfwiCDdDaeCaK+UhfuQU8OPTONHq3
 ioESVfe9m66GgyVVOeLTLuyqPANSNYMdQGTMRgSeFMkhGnq1PrMz5kyi1vyaVGXXeeiJ5N4t5NT
 SFpHaYHMTJtQtFptQwoecEESz5AUBlbVwmI4Wk6Ot7Tf8whlzJ8BlYl6x4a8WTy9oVPxZ9LDCnC
 Ug2IWHOKvdGwlA+qHZ5Cv89cmRV60pXkexemKs4doaTk71/BvQoPcEsqpuHuD53zLDuQRkli7NM
 abk+zsjW/m2p7kiG0f6VMbW/p2RL8giXZT8km8ZciNMGRtMkjpCLwX3HAR+omFAg9dDBL/NJXV2
 z+kynxZWFv/5cRh0r0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzEzMDAxOSBTYWx0ZWRfXwsznTq7izA8A
 fp3pvJfBz6ktZMFXvimZ14xTPtJLY+UUg/gg2AjX3/749WSS4FEGSHLztS1ktcJTYPWZMXNz3EP
 J7LUUes/tSVMEcJZphXQu6E0tUCDBmU=
X-Proofpoint-GUID: CZp-X-vJVFspuPN5UxBzvEbJZaN7SOzn
X-Authority-Analysis: v=2.4 cv=XNsAjwhE c=1 sm=1 tr=0 ts=6a54490d cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=jQJT05vtNkZUjgOhBCAA:9 a=QEXdDO2ut3YA:10
 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-ORIG-GUID: CZp-X-vJVFspuPN5UxBzvEbJZaN7SOzn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-12_08,2026-07-10_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 suspectscore=0 phishscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607130019
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260712_191022_233207_7F90BA03 
X-CRM114-Status: UNSURE (   7.39  )
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



On 7/11/2026 11:31 PM, Jeff Johnson wrote:
> Commit e47d6c9bb416 ("wifi: ath12k: Advertise multicast Ethernet
> encapsulation offload support") introduced a few style issues.
> 
> ath12k-check reports:
> drivers/net/wireless/ath/ath12k/wifi7/hw.c:1042: line length of 92 exceeds 90 columns
> 
> And automated review did not like one if/else that did not use braces
> for a single statement that also included a block comment.
> 
> Fix these issues.
> 
> Signed-off-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>

