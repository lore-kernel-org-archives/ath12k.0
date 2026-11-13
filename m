Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67130606A334
	for <ath12k@archiver.kernel.org>; Fri, 13 Nov 2026 18:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=yfHgpc2z;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=C+cBIRvS;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ey+1Il4T
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=yfHgpc2zwTU9ig
	U6tBIuKczoZaWXlgVcKkIZvM4RJomzNIqMKrh2PzYCXqll6hTu3AaFTBmYlKMkwDCgX0uEI2/Ii67
	w8fGq3pmQ5VABk6WDZ3X0SpQxZSsWs6iB4C7IRnOhIGM1Zm3nK9zHZ4hFdwDGW4ihetW9EK8AySQx
	9jjr/KNGy/AzRKW57ddLJDYP1lxwapSfAABYRJbBV7jwmhKBNwjYffskYOdi7Zfve/TD0RpVPCVn0
	JyVJ4RwXK4owQCPXoPYDG/rHaQ/SjMLLzJynSfJlE81yq6jeaT0Ybaklng0iXkw8fV6t++aTOY1sr
	9euxvPTvkcBEy8fI6SJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQw-0000000E2bQ-0SCt;
	Fri, 13 Nov 2026 18:55:34 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xRwQm-0000000E2Xk-1Koo
	for ath12k@lists.infradead.org;
	Fri, 13 Nov 2026 18:55:32 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ADGXQiP2808851
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:55:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=; b=C+cBIRvSaqDUF3L4
	ReZv7t9bjfGKXoNLE7GVOKof3PhMZfKpDZeV5rcihTts1ZwGaWvLCUHIzGZOEmFs
	b18YgMlyzdJ7pCrMscmqer9313Kg1RozSqdaLJ4Qj0e7BmyJ+TZSBWh/TORi/YFI
	UjtGakuvm4GWxp7aUBMZIWroIb2atPMmpAIzyWbN2P769tGzfUZSKaF1i+pnLsLl
	IQmt79HNWULC4yGXZB4eWSupvNBufWY4DmmvhwpLdeYV4kkDPodUwEbbhiNGZdp/
	9Lr8SWUm1Uxe8MntKszFWGjiuLv0NdiaEdhFjz4Ugr02lDL3KxEhHJNTBxIVSgfQ
	VFpGTA==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hx662rgp4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 18:55:22 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-341eff9e381so1941604eec.1
        for <ath12k@lists.infradead.org>; Fri, 13 Nov 2026 10:55:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794596122; x=1795200922; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=Ey+1Il4TVM0ClhEXwPvqoSz70SMeWHN3mpnxaCUTmKHrX5t+zl74rJEoOU0L1eiv9C
         LWagOMBKClw517KZUI7P1ZD8u0fZuZ6CuOYRsZo2QWzXEHTgJ5DCqKrF9TJkAmbB+V8L
         ShwMAu2yrpXspUUPRjJ/J42p7BEOj+l1WFBfDmwVg3TQN9qWqBJ585E6IbFmnTOE7eK0
         8ohiMmUKNVdkk6utkhGT3bRdhGcdRtjlTm43oIbT6aMahK62eGuwRheT8SI4gGiGSWzp
         t8NdHC2qYTPtcivm8ta6/Fi2MNK9MFygZtKFWhlDXKG1cXm+ASOozautm8YVAyyvuEGX
         vOgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794596122; x=1795200922;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bdPwvW1k6EwZBKyeXaX5G0pPP/JDCE9kBeczaNyCHcs=;
        b=ofUvCsecCNKUvq57HJSFlt0+OZLw6N6Q3eKuNOPcWVxBQ1m3QLwOWaa1TuWL0GXkDQ
         Rr92ty3k7UhnQpG5qpYM91pWegkLqRfglRbyOrz5CsfUQvvqJAt41Htn3gkqHaqmQ2gI
         /9ufambNTw38A5yIs/whEINnJ/b/HIDcBbfwNCD2/Z1/xSUDzMDlrOXooFmsGHrrPzOV
         Uvhxenm1hySdsEfTIvLi1OvvrT5mENuHDR3sBSuZw3CJKa56b0j5rc/Co0DZqDGvyOjS
         2uOVNiQumOgI0UdCgaAkRu+LwpJtuO4kLmhUu6bHzokOVz9LtWq0GaxavTkpCjTKTc4L
         YjKQ==
X-Forwarded-Encrypted: i=1; AL+hErGmd73Ljt+m6jEisjbSLnTstaDU2O3JXBF1bwptv65jZuFjrNAX9a35QNX7Y34hMo188+X+Rqo=@lists.infradead.org
X-Gm-Message-State: APuU4Z8MX2x1wRq/mcIKT1gxJVConSVX96LQJB3hGHGDKwIrw+ijNVzn
	37pBbUMsEQMvDMOy+uECTLGfBu/Gnmiv7jpFqHCZ17uqoURVpi8vYmZMxx7Ry+laqk1owskiJdZ
	FNP4SrAvPUPfbo2FXJI4uMN1U09GR1sVoenbrJytTM1pM26BbhWXCizJR9xjGPYg2
X-Gm-Gg: AYBFou2OUJMzpgf0It7CK7EXBaqt/LdeahFPsEq25d2JEv/tlV1SWCqwWkzqQC1O6/7
	KVjGnExpf4dx+jfttj88IGi9qgiTvxnTQHqqTri3kNoCtf+pLOVZDMjbKwdNOeBYutWzPoZDWGU
	tJ9oWbZupMuGcTp7ujGLFYAz4QJVh653UMkaE08JDBYqhE4d1oCnCrgk7mQ1Mmi04f63L/GFWqe
	dJGbg6t6k43w+UlUDfvKwh5qYlFU0waUlGreVA1DWlnNpO0bATLKefZV/fHsjFucrzfEmtVo1+C
	WOKLAxXerwNRQnluLqRxG0Sbf4YueHc5misdtwV962svaakOqZNzVWSrHDLYu/K3LvEZLEoWk4Q
	2ufcB5LGIUMPXh0H10LWEY4X/0nS0ZIwkoFfDsP9dNIUISadxMgmvAmbK6iKOh4qUH71fqx7lWN
	hIFXP6+fru/bQ9yJVO
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191968eec.25.1794596121581;
        Fri, 13 Nov 2026 10:55:21 -0800 (PST)
X-Received: by 2002:a05:693c:83c3:20b0:377:678:231b with SMTP id 5a478bee46e88-37966a591dfmr3191946eec.25.1794596120993;
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Received: from [192.168.11.102] ([124.123.81.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563df84fsm17585787eec.20.2026.11.13.10.55.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 10:55:20 -0800 (PST)
Message-ID: <03e7af46-7fcd-445e-9210-395bbb8b5410@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 00:25:16 +0530
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] wifi: ath: simplify copying a peer's PPE
 thresholds
To: christophergriffin05@gmail.com, Jeff Johnson <jjohnson@kernel.org>
Cc: Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org,
        Jeff Johnson <jeff.johnson@oss.qualcomm.com>
References: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261110-ath-peer-ppe-thres-loop-v2-0-fced87507920@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 2dBPXrY3-oFEwSkvGBnc5l4PcvITCUPS
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfX/wTjW4/JMxBA
 w05aJ21mv+9Zkku7y05yEcomOB/knTuEMuUJGQC57AQ7cOvPYAqVdVCBUl+gpRV3OlTouavOMlB
 B3we4Oh02R/n6All4MF4hLAdanmOdruAMAnmP0B1/05GXNPDWkRD+8hkvGOPgPKZeBkE7Vs9kPQ
 +SmR7ygyux5Iqh+HTVzRFz9MGKlXf/akVm+L1xU92LVheLtNHKbNI5nJlUMqq88PxAWX9qhveOM
 DYxiIwPRTS8OWMTI3jspNo8GM0ekSzkaGWaoiWqoQXANHSH+DN4UI7wVG571REvkDuH+ZH9tTZZ
 GoSVoSas+AgkC/yIM+fMsmPj8MTF518AOsm/ij7Q6Hy1vh+5eJJUbsAwjIhSLFgUX/98u5FA7h+
 3j/UOrxpLBnkNzpNEvq9tQOOzRHgIsgrCEtA+Kx7poV6HNmAcL+wK/D5f7fyIMKohZGKJBF4mWm
 /6Xs+Ut8GOW21kZUE2g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA3NSBTYWx0ZWRfXyIMGGRRc4jps
 R2bDqkprY8pEWosx9bw4EYoBnFkodjgMic2JgtatoA7bA6nAXHEu05CNdQBY/SWJvZDmK6zjat4
 1ZwQMmHlIjp9k7h4KufrZU7uBbHz+GA=
X-Proofpoint-GUID: 2dBPXrY3-oFEwSkvGBnc5l4PcvITCUPS
X-Authority-Analysis: v=2.4 cv=M/nYuCws c=1 sm=1 tr=0 ts=6af75d1a cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=WcLwt0pvHDAIUQ3iVSLIEw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8
 a=_siAQXIdv8hbVOeHdhMA:9 a=QEXdDO2ut3YA:10 a=bBxd6f-gb0O0v-kibOvt:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_05,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130075
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261113_105524_496331_E95BDBFB 
X-CRM114-Status: GOOD (  16.60  )
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

On 11/10/2026 8:07 PM, Christopher Griffin via B4 Relay wrote:
> Rameshkumar suggested this while reviewing the PPE threshold bit-order
> fix [1]: the loop that copies a peer's PPE thresholds into the WMI
> layout shifts each bit in from the top, where it can put it in place.
> ath11k and ath12k carry the same loop, so one patch each. No functional
> change; the patches don't depend on the bit-order series.
> 
> Compile tested only (W=1, both drivers). A userspace copy of the old
> and the new loop gives the same output for every 6-bit value in every
> RU slot.
> 
> The patches, this letter and that test were written with Claude, an AI
> coding assistant.
> 
> [1] https://lore.kernel.org/all/b60c4c56-483b-406e-92ab-643b0fdf2dc8@oss.qualcomm.com/
> 
> ---
> Changes in v2:
> - Dropped the paragraph about the equivalence test from both changelogs
>    (Rameshkumar).
> - Kept the one-line note on AI use in the changelogs:
>    Documentation/process/generated-content.rst asks for it in changelogs
>    and cover letters.
> - Rebased on ath-next.
> - Link to v1: https://patch.msgid.link/20261106-ath-peer-ppe-thres-loop-v1-0-f6bb5fe9ffb3@gmail.com
> 
> ---
> Christopher Griffin (2):
>        wifi: ath11k: simplify copying a peer's PPE thresholds
>        wifi: ath12k: simplify copying a peer's PPE thresholds
> 
>   drivers/net/wireless/ath/ath11k/mac.c | 3 +--
>   drivers/net/wireless/ath/ath12k/mac.c | 3 +--
>   2 files changed, 2 insertions(+), 4 deletions(-)
> ---
> base-commit: d0fbb39d65dc9dcb4175fa6b23e473dec3670f4d
> change-id: 20261106-ath-peer-ppe-thres-loop-ce5c2b2e68e1
> 
Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

