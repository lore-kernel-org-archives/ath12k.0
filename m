Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82550F459F7
	for <ath12k@archiver.kernel.org>; Fri, 10 Apr 2026 17:25:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=00GeDMNx7RKmjuMjFBmecTqNfe6Wa/hevNh9tOoGk0A=; b=AzF0U5zOwB8pMt9n/2mLMvWLsd
	ODnLLWQDY0nAN+jzkpiy9Xld0NtAoPEewqEsjkgZftFsFyluxkrsNKNXnfFAO+KvJIsk8bcr3pbHs
	olpdsvE2eaUeWapwtGV5N6tooOdLvfCTmdMThaAQJ0hf4oZLEaExoPe6MHGz617vtz4QgIONnX9UD
	OmdckLZZTlbiFCfs5QfCDdk8KGSS1CjV7VL0XQgjG1ypsduJoOZXyR22SKkzNNpGhxc9XayGEGy+0
	1oam4r2WYW+QflmzT5pyK/d/goYh5MDloqWFbplPyUTZktiqXrVrymfNjZbtHORV6YOlklW5Hjuhb
	dYkXEoUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFbo-0000000CcSj-1Bz1;
	Fri, 10 Apr 2026 17:25:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wBFbI-0000000CcR4-0VUw
	for ath12k@lists.infradead.org;
	Fri, 10 Apr 2026 17:25:30 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AASt7Q4147849
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 17:24:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	00GeDMNx7RKmjuMjFBmecTqNfe6Wa/hevNh9tOoGk0A=; b=hR0x3ssgyyaoZqTE
	ENBBmU8k4mYN47sGCcoukhdpuye2KaH8s1vSefhWM4J/lQsIsJ3fEjwXoLITBTIc
	9Q2An2d9CS2RiUHrjyebeQpzMvOOG1hHCsCUBv/avSPKGltXzyd4P8wXRwa5ZGz3
	NyJmEW662stH/t2X1idJo7AkNH9ZEm8/Hni8TY2XyjiU7NBa4cvnt9N+tqFv7Duo
	S4uu32lvTm4ErWwy2gfY811JI4b33LtWcUXBST6FClicLXPTZBJYFPn1xOwLwVpV
	lkvmElDuryexpv8ydp+mJr/ldpi3SQyRzt4Yb4V61+tZyREnmrGVjWiwC2T94NRe
	sqm6nw==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4deudgj9m6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 17:24:59 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-126e8ee6227so3233684c88.0
        for <ath12k@lists.infradead.org>; Fri, 10 Apr 2026 10:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775841899; x=1776446699; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=00GeDMNx7RKmjuMjFBmecTqNfe6Wa/hevNh9tOoGk0A=;
        b=FjH/ppA/RJ/2IIjZsd3HDoUQ5gEqZBLmZ5T4VupflTaLyun6H+xyDC0SQywF+9SQ0d
         GfbKrRL5syQxabp/3yKzWyPN1I6BUHzIn4zD1b4kbTtr335MJn69cMdYMlGP7f7dBbGa
         BWEdqbexbiGFVxFe0rVR3zW2UPgwNRV8IY4juzqe0ZpKtu/zi51A3iY4c4aMPGgf5baY
         6DpbrEBHVa8UE70cN7ueJRzFNXCFMSzuDPIHYaxP425BqfmwrtUxueIhh5seZ72hb+HY
         YLHtwgpLGo9e4LNvs2r+TQOH8RB6utmEOiRctYhWBm7QLXy6VMOx1lIopIrhWujnPTcn
         4kIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775841899; x=1776446699;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=00GeDMNx7RKmjuMjFBmecTqNfe6Wa/hevNh9tOoGk0A=;
        b=JI27XkOImDTT8NCBSHnmiOaui1BXpBA/eV5ZcN+ZNsYUY3B1K0GUkpRh8SN/4h1UyU
         1DBCYV1PQfw+H9qIkK4tJIBDXqL+6teSD2N1zvEt2w+MuvFUSSPXEGy2JxiVwqo6Sqzk
         4G7XLt/eG5I0Uoy6wk3SNIhPz1Zuc1MWAAKD4sQhMNVY7vrjadYbPFSb5NeF1EDUzdF9
         FD5puMd72sBCvFhv4gwN8tLbN0phYI26xn6huGc+YaM1z2aG37PkkWso4le51BGzab4C
         ZbqsnjblXGps+GcQzj9QJRILWkZz1q30B338ueTdBUbrFllmY1r/KEqXhu81cP/ul70q
         sjDg==
X-Forwarded-Encrypted: i=1; AJvYcCWnCZAjXeBJYekJbttSBCX3HxbSjK/Ke32iph7/xfDj2kirPtbXs1EYI83mUcvS3lvmHezDBUE=@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9PV2PIFJR1rwsk0pcyuO2Xk2BO2qvjH5R4I1KRaF8x4zykgkW
	wTOixAQ61/AOCfbSbIURbAP7jQXBXDKN4P06Ng9lLy4YCMWSWxwkEfCl5V7Nf9qll31uzQHNln8
	lxpOtXY+TuTLVub3eJNiMI/rVCxZ1kgNyDR9RoZkl4TnU0wclocqrBAksS5Y38LDv
X-Gm-Gg: AeBDiev9Yr+g4HGbAxoXHjd6z9qHn/Nmfbnst4P5ypzj0jLKYvJZeYNL4+loojg1/41
	8H60fOiWXq1+N8giVI3lTjAi+wUuY0XHBQjlwl7mfLNJU6OMPVja/MovaYG4GyOt19zXmStPVW3
	5o35Xl+zN2E42KIy4/SB7p2EHei0tV1vkTgYeNJ4DrL7Jm8F4NXqqTQTL4tiOd/4vWHgMKDLZPs
	jOYbcFRSKuRYD8RSQQ7Na7hD28X7eBU3EooFc89RuK5bckKscCFCCtC+tUIgqIWOpwJqWu6hDYy
	cUPnj4vqcraTn/YSnWs1Ngw3N0n41ZnQMyi/AHeUwEIcDM72qrI4k3CkBBHtaJKZ3EvtLIGvl8n
	1GVwxSl36RXNGZXKRSV305K9FDb/+nAPd6WL7bffTlGqxmkOkboqGeVIjMJtCv2/xQC6KrDUVe/
	HXZ/J4r50wBGnFBA==
X-Received: by 2002:a05:7022:e986:b0:11b:b622:cad9 with SMTP id a92af1059eb24-12c34eddbfemr2201568c88.21.1775841898577;
        Fri, 10 Apr 2026 10:24:58 -0700 (PDT)
X-Received: by 2002:a05:7022:e986:b0:11b:b622:cad9 with SMTP id a92af1059eb24-12c34eddbfemr2201544c88.21.1775841897967;
        Fri, 10 Apr 2026 10:24:57 -0700 (PDT)
Received: from [192.168.1.44] (c-24-130-122-79.hsd1.ca.comcast.net. [24.130.122.79])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c346eb228sm4763760c88.9.2026.04.10.10.24.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Apr 2026 10:24:57 -0700 (PDT)
Message-ID: <bb391f8d-e385-42b6-adec-171c21c67246@oss.qualcomm.com>
Date: Fri, 10 Apr 2026 10:24:56 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 1/5] wifi: ath12k: handle thermal throttle stats
 WMI event
To: Maharaja Kennadyrajan <maharaja.kennadyrajan@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260331142446.2951809-1-maharaja.kennadyrajan@oss.qualcomm.com>
 <20260331142446.2951809-2-maharaja.kennadyrajan@oss.qualcomm.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260331142446.2951809-2-maharaja.kennadyrajan@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: IigqUBWyIHULLDhm9hKxmiwRAgv2UVsU
X-Proofpoint-GUID: IigqUBWyIHULLDhm9hKxmiwRAgv2UVsU
X-Authority-Analysis: v=2.4 cv=H/brBeYi c=1 sm=1 tr=0 ts=69d9326b cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=Tg7Z00WN3eLgNEO9NLUKUQ==:17
 a=IkcTkHD0fZMA:10 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=bC-a23v3AAAA:8 a=pGLkceISAAAA:8 a=Gw0FSAZAoS1PqQJKRVgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDE2MiBTYWx0ZWRfX1S8gzZo0Rd5A
 Y8yxNjrjX0XwW8FqpjQe7MubQVp8wpUfRgpJtwn7IL/4ukzZL38gl3ianaNGjnov0LhAy0DUO4y
 1V2Z9446APunOCEMq5Vi7bK3JFeOW4hoNoXEr1r6BtEYxDP66hdaDUmrmCWnxSCf00MF4/z++a/
 EwBdlLwRxJzGGCbWyUtjGcsWJ1Zhvd36/s/E72tM5M3Jbq9hY0JDv0N863O7I5F+8eJdOYn7JdL
 LAbtXkjoKc72N5ATWilHmCr5Gdwb+hxzw+OLDVbCZ5LTrIVIeF6wgQRhv1QX2IdvT6bxbPwWxGj
 pyR/j+zw5Goqy1Bw6WFRPYfwqZh8qkCEn4jnzYK9U8X6eEwGUMOLO5wDb1S0UkktrFgZohEzyl5
 /qOnHyJtHI/jKkEchPNHTpU2+oHLXtu/DXWilN0aZF8Dkd/t0jG/7X3jpnWcfyINsHGGQoeBN1l
 QzZ+Y61I8BwZV/ABE0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_05,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 spamscore=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100162
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260410_102500_194675_EEA4322C 
X-CRM114-Status: UNSURE (   7.27  )
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

On 3/31/2026 7:24 AM, Maharaja Kennadyrajan wrote:
> +static void ath12k_wmi_thermal_throt_stats_event(struct ath12k_base *ab,
> +						 struct sk_buff *skb)
> +{
> +	const struct wmi_therm_throt_stats_event *ev;
> +	struct ath12k *ar;
> +
> +	const void **tb __free(kfree) = ath12k_wmi_tlv_parse_alloc(ab, skb, GFP_ATOMIC);

please rebase on current ath-main, this interface changed with:
https://msgid.link/20260407095426.3285574-1-nico.escande@gmail.com

/jeff

