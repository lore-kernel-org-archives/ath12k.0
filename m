Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFBADC43327
	for <ath12k@archiver.kernel.org>; Tue, 30 Jun 2026 00:36:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JyXYxEG0ESVSIdsejQ3j2+rn1bSmGd9TW2F2ZPs62q4=; b=Qz5hrYLBI03LnRUG0jXI/lNBmM
	4ZcFEkQWpZOkjT7RVCEjZIsZPhc1lqCQLdC36lh6k0KiEhrn8CJSi69IxyksniuVxYReiQyyP1rFs
	9ZkfFAAuHDC/lCQcWf/P0S4PQAO/2ThpWQiMLBEYXAuyjESV52gnulLXSIyHLygaEqdTuxVFFygJm
	NFILQ79n2g/7RFzy+mHKwQlWmcg4vO6g/uZEqvWaTFf1LxRybQwyKWSHwkbjWx2GIrZgwd0juCWy5
	4jtdSV+nmmhUK1b/GtNXtFkleFB/JnhTvSWg09SSQQU4dnHTIZ6pcuIiIVmpcxdaoBYv69oaOY1X2
	tgc9sUrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMSk-0000000FcAD-0Z90;
	Tue, 30 Jun 2026 00:36:30 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weMSi-0000000Fc9t-0PU8
	for ath12k@lists.infradead.org;
	Tue, 30 Jun 2026 00:36:29 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TKfLNB4042757
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 00:36:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JyXYxEG0ESVSIdsejQ3j2+rn1bSmGd9TW2F2ZPs62q4=; b=T9bKJsMu5LvJPBAW
	aQYCPIe5ij2B1zMvWDh/Ng6hV/ONpfzOZIIGqf/KmMnwfEckvxBR1I7Licdfct/M
	DbeVh7m9woBsIqR14IhYVPUGc7vLdJ275vkWQLW9gx/P82MJ0Iqjtc+u8nbhRH4H
	VltQS7zKIZ8rzMtwFLGPZohTQAx07d4lUdgA9Wpa6hLntUhD6JZfm0wfK68ja1X6
	GzLIRDqRvoW26RwZBJwGtcwlZdwqX8gN9tsWIwM/Uon+ZgCQj/a/BDTZWdzHV8MQ
	Owkwfy2xPomr1Pd8yOBnsGFZY6EQqkzxTaEESRxevmDqtN8BThukTOhXAArX7nea
	xwcYMQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3n5s3t7s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 30 Jun 2026 00:36:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30ca81e05bfso3960140eec.1
        for <ath12k@lists.infradead.org>; Mon, 29 Jun 2026 17:36:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782779787; x=1783384587; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JyXYxEG0ESVSIdsejQ3j2+rn1bSmGd9TW2F2ZPs62q4=;
        b=T0KDmhDBjfsKaRZhrFJ4b/BqzZPOS6AcuwGDANvB9GYhjNqT7pSSYwge5foAHUYCfJ
         WJ08cYKZeVj1aPcFT351vB9q9j4Z/iwAme94CR8wdG8s8JhK+/pIh3Ao9PmubFPWC/pP
         MginGpbCdsbVNfi99wz9Z+XL47Te0zU3WReUHYR4vdNw3T6SCOS//lpqAEudG5ZciDWq
         DaO6rsLcTRKO9E4+bmXlWPJatD4nRcg3FMOjdLj9rcj4T6C65iacRCet3ZtqphtmF9yi
         Z3b168yPYHHZSR7w7xNfFqE2uJVR+VqMYD/IEb02v5pg5cgbtk7BJTW5jDbYwiEoE35u
         hdDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782779787; x=1783384587;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JyXYxEG0ESVSIdsejQ3j2+rn1bSmGd9TW2F2ZPs62q4=;
        b=oeI+OuoXPoYFpJzHsQdEbvY/lDW4UxvHOEoMfPuJhi0ZqS1iriq6fsw4P/pWH74qQi
         uB6mkNScShdgB3vpu/0c3xG1PmelDGWJ+GJGTQM8a7mbSsgqu/1qczdENueszk1jFbeh
         OkLeO13gCSqNkTpAan46H1Lh+DNyvAlxDGJwztx8otEyXJSOXxRYtWDcbOLElYtRaac3
         ul98BeDwMAznvY6x2gq35DL2Dcc7YIxJylYimOohZVW/07fRm4GYEBYG5GwqegcGoJ4c
         swuf53DTl4izlTvppbEc8c9UqISdnen6xBaueyJ1OAcO9PU9pzf8Qlc7wFpsFmmHTHna
         8ugg==
X-Forwarded-Encrypted: i=1; AHgh+RoheQd/0ahePFRMpgWVoa19oyMqf2bdL94NiLCntr6vLdN+lP0ke7A9hXb2XHwXqVzodIiLWtw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzSBe8ma0/8mpfJwgc7cy8otW6O7LqDqmVZswYvhkVRubAu4PDf
	Gt8eHxXQdSGusBA5hvtZQhb8G2liF//FRW6gmp0c73Q2/Lmdr9tvjuLc6suRuT0pybJGfM6nPbZ
	3rZWfdwa3laXvTf8kb3+qHBnm++at0v3cf7yY6bQ48qKt+EKKIUZRMf1s2r81LNwE
X-Gm-Gg: AfdE7ck/xjNHxh7DZ8stht6RbSYKnFXYyb90F4C3l7INGMjgy8hXbUkhGLW9w6dzDC8
	aQ48JUQfWmU8QVMGk8ftgZ4O80iZVoxRhwma2ByMl2wbBeXaj7Sdb0ApX1LQEAjqT7AV7er7DCN
	0weHCCW/mBSj4d5wxh7xZipG42SnwdL15rBHG+LOzUWjDnUGMvdve3f7VzozsRG82Ib8Ultn2Fk
	vC0LnAm7YlWcU2bhQKga/OgLDJ7UZ6FUHSKE3nH8viHzJ2ZMGg9WAiobdnaObeS53Yg6j7TuQMo
	NvXabGF7F72l0ya8e3eJpeuBB7x7LLRTAyWsFxAaQMiCjCBkqWIDD+pdAVplGd2r3PeiaGObHGJ
	gVUPC814u3yPFSjnG1LWgnma39m+oKf77CGpGygR6QhcgEKav80Cv8U1eKlMXGW2/0zx6
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1055477eec.33.1782779786666;
        Mon, 29 Jun 2026 17:36:26 -0700 (PDT)
X-Received: by 2002:a05:7300:d0f:b0:30c:f84c:b2af with SMTP id 5a478bee46e88-30ee1489960mr1055457eec.33.1782779786077;
        Mon, 29 Jun 2026 17:36:26 -0700 (PDT)
Received: from [192.168.1.11] (222.sub-97-215-84.myvzw.com. [97.215.84.222])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30ee300e4a7sm1842892eec.13.2026.06.29.17.36.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 17:36:25 -0700 (PDT)
Message-ID: <2d776c69-51d0-429f-b716-b5302d657047@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 17:36:24 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next 3/3] wifi: ath12k: allocate HOST_DDR and BDF
 regions after Q6 RO region
To: Aaradhana Sahu <aaradhana.sahu@oss.qualcomm.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20260611033314.2330-1-aaradhana.sahu@oss.qualcomm.com>
 <20260611033314.2330-4-aaradhana.sahu@oss.qualcomm.com>
Content-Language: en-US
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
In-Reply-To: <20260611033314.2330-4-aaradhana.sahu@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjMwMDAwMyBTYWx0ZWRfX8MqgTP3DUv/f
 56t4slOrrS47N8anArfstxb4L5+Z+AysvHXmess1hReQfjE4igKaNLx+pchxBzZeQl8d11ERBNx
 waDaO3mgzAZVwg2bKwni5qUCkFcliN8=
X-Proofpoint-ORIG-GUID: 4dNzB1Djljh0YG6zfQ9OA6mHxws7fC9U
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjMwMDAwMyBTYWx0ZWRfX7BupLB3OHmac
 wvG0pck8voDunVFdUzS8iXbyK/iW4q2O+gdlErr/nA8vxI2JYZ69jAGBHwMj1YjEdsygXMiTx7s
 8jnIi9eIdhI7is0hqgui/ruCN3bfuxEmZ5JnL4/+u9Js5uo2Dc31i+FjowdwDuVJTON8mFKfxa3
 Y/CI2u4L6ZtOBMd2jr98FBUHSP/8xKx7VZZdvd+spAnxONlM7vwM5a1EenlTp50Dvd83Ayf96Nv
 qvDUQdCzoPUciHVKSkys6tVKNZgVNiRFi7+oBM6F/nxHsET0EHQfy9TSMo8nHTrEOCVE1UanhYn
 9lrLlkZ2V0tycl32TyYb7hLQn4teZWdAVHZffR+imUV7czf8Mi7S2JRwE1rrLKcn7VDYSfBD3rD
 lpuV3fHcKN8pfviyXmeuyQsp3dm9jhN2tVRcdnheEzfD7dnEUs+Sh2dEJQFjHx1hG8R2TY7FgWj
 volQV1Dcvouk+vNq4Og==
X-Authority-Analysis: v=2.4 cv=NZzWEWD4 c=1 sm=1 tr=0 ts=6a430f8b cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=i4k25I72rCCN9bAAQd7+Jg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=4hV1t40Bmhtoe2JT2JwA:9 a=QEXdDO2ut3YA:10 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 4dNzB1Djljh0YG6zfQ9OA6mHxws7fC9U
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_05,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 spamscore=0 adultscore=0 suspectscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2606300003
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260629_173628_148201_CB6EAD80 
X-CRM114-Status: UNSURE (   9.83  )
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

On 6/10/2026 8:33 PM, Aaradhana Sahu wrote:
> @@ -2781,9 +2781,12 @@ static int ath12k_qmi_assign_target_mem_chunk(struct ath12k_base *ab)
>  			goto out;
>  
>  		avail_rmem_size = resource_size(&res);
> -		if (chunk->type == BDF_MEM_REGION_TYPE) {
> +		if (chunk->type == BDF_MEM_REGION_TYPE ||
> +		    chunk->type == HOST_DDR_REGION_TYPE) {
>  			avail_rmem_size -= ab->hw_params->bdf_addr_offset;
> -			res.start += ab->hw_params->bdf_addr_offset;
> +			avail_rmem_size -= offset;
> +			res.start += ab->hw_params->bdf_addr_offset + offset;
> +			offset += chunk->size;

avail_rmem_size is size_t (unsigned).
If bdf_addr_offset + offset >= resource_size(&res) (e.g., DT
misconfiguration), the subtraction silently wraps to a huge value, the
avail_rmem_size < chunk->size guard passes incorrectly, and ioremap proceeds
out-of-bounds.

So seems there should be a test to sanitize the DT values.

>  		}
>  
>  		if (avail_rmem_size < chunk->size) {


