Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 397F6606A32E
	for <ath12k@archiver.kernel.org>; Wed,  4 Nov 2026 02:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=DME2oThK;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DR2Zp73I;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VTnyTFRe
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=; b=DME2oThKSt2UZS
	M3qUHIhyYs8kv+IX1X2GIebhg4gDqBOeBTGlJ0oDkLcnu4eeXEnFZw7VQOSFtltvV4Y3eE74rwAPo
	onBfc8tqyV8/R0AlNrAUVEVMry70pchq10WHXXgxYaViOtlWAjImjXp4/FvHe2a6WIbIy/m3nmqoP
	Vf+PR8Lg6YAxvqlobncnDn4uLNnQuOr2jdkPm+L5fx8ZQFEPlZDd8j1cCXJkslR+kB/+FzLfVXSDs
	ChvhpUIDpt7Pa/JJ88+x3WffSZo/gsgpXWKvPsNMm05ahlcezZ+zDnIFS29uYUIwuiwxpKr9C5goc
	qClOV0HqR3eJVK/HWHCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQLg-000000047EJ-43o6;
	Wed, 04 Nov 2026 02:03:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOQLe-000000047DM-2MXH
	for ath12k@lists.infradead.org;
	Wed, 04 Nov 2026 02:03:35 +0000
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A40RGMO3335374
	for <ath12k@lists.infradead.org>; Wed, 4 Nov 2026 02:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=; b=DR2Zp73IPUDPFhle
	R/u908IaGmSHqIcsvhe9LP7WfmfVY/6wruAH8KtbYjByIiAHXp4lrBpd5AVsXjXd
	zJohM6E9JwUTjHjU0a9lqo/gSHzrFgVhVQKVUhsnV4r+pIZcq7lE3oYbC/k1vVBL
	RzA7vWRCutLUkK4HxN0M8fDFcB3wRaCW1ZZakQZTUgeoxtDjFW97yQk8LCxRio7Z
	dfD49Q4WrOao/pvF+G9ef4YWBh3Z/JnOjYYkH9qPQkqYlP4mPfydnVStln52f4lO
	Qx3axDFfdp6+I0McXTVGxQx+0V/1UqOdrQfZvrrRoLWXDPAoRToZFz+wvcB1hAYc
	E3qTDg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqmjbsn28-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Wed, 04 Nov 2026 02:03:33 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3ada8bc8575so480220a91.3
        for <ath12k@lists.infradead.org>; Tue, 03 Nov 2026 18:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793757813; x=1794362613; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=;
        b=VTnyTFReRJwlVq3dDBpMWmGqEVswf12ZZLBStuQAubc3bB/4mlGnw/m4w3k6KCQUtG
         G0N00ZU7JSX8Y0QmCHmvfdvzP+AAo0G5vNG71Q8KO8RF7YPG4TgSo70P92aJkeFJJRYy
         WCLcc/vth27vhiIF5jEtQ5ENYgZt2rDM7D7T9ODKtpTsK6Ln1M+yuCDnL51ujg9uyin8
         w9K9eIdNbxcYiiXncaM7QSrKPyGIiESOHl1bOL+RznW41Wboq2y90tl1dnH6eDe3FgAQ
         P3x+0Ajr8koKJxSPufJtltyUDGE5irmEFOQvdt9x9iI9qmYpm7Dpwfnd1Jh+mihTTYik
         bsUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793757813; x=1794362613;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hwhJsiEzIXGjwpPakaRIHnm9ygQpg1JZVtIO5uyoL+Q=;
        b=Cnn4esSNtbDKcuvpu02hkVSAZ4M8l/pVbeLzBRcwYzk9rZGzCQZn4qh2UurezC3u8D
         J/bjYfV/tOeJ7YkmgQzrEMO6ZFKTlEk7wpJZ0W0nROrxCrzHPKMA6WGyaFT8a9tv8Pip
         hqUpweO6NxIwtvJVDiRij4Bfqlhy/hndQM5uh9L2DD28T1JahZV9j/gCXS7ofngkNhBY
         FNlWYtBaSRvz1NV2Wq4xY2SBuy32YQug+us3wOEXl50ZNH2ONeMsB2bPFXJFmnpCqpc5
         hqjKNRo2tpd2k8x+cp9VT3NOXuXO8AONSsfp0f2fvpYunFJI8gzbIrLP4aErpmp77ShN
         cnRw==
X-Forwarded-Encrypted: i=1; AKwUvBw5nLVVMWAT7gXo4iST/HEpz1XnnCfMAsGfVYVH6BxAh+kJqLqJl43ffa9+VKwp/F7dXRobQQ0=@lists.infradead.org
X-Gm-Message-State: APuU4Z8m9LpXV85DMTy6IKytTIGCoEn75RjDqIE3eG/FodTE1RorsOMt
	2C6nySC4WpnjSral23v9QY3kb1HUWmkaxe+iLQl84UGfRuGNzeQ3mSnNZq1LlMkoIaKy0hUoxvE
	8p/Y5RD4a56LaACstdA7S5HZ0/mTWO9S728InrKQE/78/+O7yWzgR/lyHD1VCMwff
X-Gm-Gg: AYBFou1JoXzRwt8jtOBGYw4u8KmW4lIDm5s89RVkY72ldoCfqPnKtbpoRtHNjDHnWbD
	0fZqED/toJqHXfW3/idpSUEG+s31MKfxZO1gACsI6Y/HtmHnxkstbqxrYEtEhFU3PSbbZWIBTSX
	nsAGUFTZOGQHOxoO1ArbHZUJsI0SV22wG5nTzN1G88wSRHrROB+8idwWXRPzpO/T3CY+9wcB0BL
	bzWOYBbIhp2dCLzMCHxmeHtZ320eNh9RiYv4aFwutDeLz8IGaXAJ//C2UwWBd6qSwLxQFoOY4zf
	J9BFOfq6WSqgmYR6Y+E40s2d97VIEgJNjTdMXX+D/O3l0N/YEeqC2MO3gvme7aHCeKF0L43uJcT
	GHGyil7aXxCoB5L/kN3l8XFN0VupmteohW7NO+Z5TiK6cJNjRnCWVft8fTH8XV5DpUSJGMxM1ks
	uY8pmCc4nyWLH+H/tdSYnuRP1Ir1O3qaQqIAi9aHzX4yM=
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12644642a91.51.1793757812431;
        Tue, 03 Nov 2026 18:03:32 -0800 (PST)
X-Received: by 2002:a17:90b:534d:b0:3ac:ffb8:183b with SMTP id 98e67ed59e1d1-3ae898392e6mr12644616a91.51.1793757811938;
        Tue, 03 Nov 2026 18:03:31 -0800 (PST)
Received: from [10.133.33.51] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b07c7e087csm6716710a91.4.2026.11.03.18.03.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 03 Nov 2026 18:03:31 -0800 (PST)
Message-ID: <df59854a-b10f-4997-86d8-134f62b73799@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 10:03:28 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 0/2] wifi: ath12k: refactor m3/aux_uc firmware
 memory handling
To: Madhavan Ganesan <madhavan.ganesan@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org
References: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261103-m3_and_aux_ucode-v1-0-e14f13fdfa41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6efkx-hWV8Pui1uvtK6AaAxhDW_IWVL-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXz2L6CtrMa2mK
 3z4froExS27/NH0inXfpKLnx9eo3d+jef6/1GRW7/L34lYrqJDOzpEQVFk/1DUorzrtnIUWueM5
 LLK3vo9P2mb2Ir2ddCN/QLnH6cX4ASZhhGhCoW8qDjGI0Lb/7uEXKTmy6WSgVmkIZM0zA41Vou8
 9RY2NgMVUynnzwjFW/NOycEXabJzz8CQay0eKBeH4THtmptNTFthcif7hONbjc/hc3YKQzD1S8w
 YkZ4Z18KtJahDl4FkzHnx876fhUi2aFASYkO2WVYW8cTEf2l2HRi+SWrlQqbOYnp5Ns3t+/iNWM
 XBrP2W/MezSVRn5RWJbcrj0b/DJlUxF9/YaD5ZY8bLbof6Ql4XU9FzkAmB2FBxCHWthCtUplI3A
 lf4ivSyAYL0CGms5iqArVAwuJW1c9tgqx3Uf5oEkl9yLDC0MJjrn9ArJlcaBfby4hMDJJyUHdK3
 jHXBCiR77s27dhVQklw==
X-Proofpoint-ORIG-GUID: 6efkx-hWV8Pui1uvtK6AaAxhDW_IWVL-
X-Authority-Analysis: v=2.4 cv=NMhAaE6g c=1 sm=1 tr=0 ts=6aea9275 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=WH3b8gmyxz3kVt_5t98A:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDAwNyBTYWx0ZWRfXyZTkrQe/Qx2+
 1IIG1lRtVvGNfLitFsx+anC3TahZ8A5f06JNSLwUPxNHk6X8y6mxeZPg8c8K70x6BBkGMBkZamQ
 nO72LLULCxeTaaWUZGpamenG0kcY8yI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_01,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040007
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_180334_722315_71D9EDFC 
X-CRM114-Status: GOOD (  13.01  )
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



On 11/4/2026 1:25 AM, Madhavan Ganesan wrote:
> ath12k_qmi_m3_free()/ath12k_qmi_m3_load() and
> ath12k_qmi_aux_uc_free()/ath12k_qmi_aux_uc_load() carry near-identical
> logic for freeing a DMA-coherent firmware memory region and loading
> firmware into it. Factor the shared logic into common helpers.
> 
> Patch 1 is a preparatory, no-functional-change rename of
> struct m3_mem_region to struct ath12k_fw_mem_region, since the type
> is also used for the aux_uc region and the old name no longer
> reflects its purpose.
> 
> Patch 2 refactors the shared free/load logic into
> ath12k_qmi_free_mem_region() and ath12k_qmi_fw_mem_load(), and
> rewires the m3 and aux_uc wrappers to use them.
> 
> ---
> Madhavan Ganesan (2):
>       wifi: ath12k: rename m3_mem_region to ath12k_fw_mem_region
>       wifi: ath12k: refactor m3 and aux_uc firmware memory handling
>  
>  drivers/net/wireless/ath/ath12k/qmi.c | 163 +++++++++++-----------------------
>  drivers/net/wireless/ath/ath12k/qmi.h |   6 +-
>  2 files changed, 57 insertions(+), 112 deletions(-)
> ---
> base-commit: a2da7677eb9a12e7860814b70a1f6f5b0e347d7d
> change-id: 20261103-m3_and_aux_ucode-8337b881155c
> 
> 

with commit message nit in patch 2/2 fixed:

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>




