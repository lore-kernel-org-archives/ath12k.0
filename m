Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D90DCA5FA1
	for <ath12k@archiver.kernel.org>; Mon, 28 Sep 2026 17:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=; b=tggkklr4i2Fd125UUSn8PGjtSk
	j/idOP4Ps6hNT9/o7/a0vZTyNNa8QmRZGoTLgg3yaVox5FR7sxpQRsqjDXehxX1PkzRfxpFce5ohT
	Oy9adlaxiWYdGglcHy5gSVI0MXzas39R0Ax+9GlN5ARNNDLBncuuRT91nLmHolgKm07cE8ezKpV3y
	P1LJICLGp9YLCja4NvnekdC5AJQA3Igqo7Kf1xnqQbIQ3KfXKKJcffjANEMhWSmoZlGzAcVJhuz5y
	JsP+Yzp7SL9Vq0Alzeoxq+uv0NQDSyv1AKSpPPKRyByetfglSZTOh+tlOrsM+AKiPa6GkfY7RiQ0A
	egxbB7yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFGy-00000001BND-3cDw;
	Mon, 28 Sep 2026 17:36:16 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBFGw-00000001BMm-1Lvv
	for ath12k@lists.infradead.org;
	Mon, 28 Sep 2026 17:36:15 +0000
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68SEe20r1498443
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 17:36:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=; b=KkluvFWEIPBESG76
	Kv7EZDrPtNnfcZwI615XAbkDiRVLfNsM6lFP2XbC77hU7sltW7cHE1EST7qwbemk
	jGVqheA08gsR6JHOnzag1TF/aCYgnXedohqAxpln5vfB0L1aIwme+hag1wwfzr1Z
	QVz5nBlxVfYCGjEoajtHfLwkoR6NXuTgt617EtBoJ/9y/O8x6b+MakqcNsDk68Vn
	JlkGIFPUI6v15X9Wpi6OknTxDbmqbUIn3UIw8+Z7tLT72pE5KXubvnnfRUsbqoyq
	koGY9zjT0dQFnIzl+e6E/Dncbwd2I+0aH5Wx6gMWmp4Vg3PrqOZsAp4uykX8SAw9
	h7GQDQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyk5mtj5j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 17:36:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2db8c152622so21814605ad.2
        for <ath12k@lists.infradead.org>; Mon, 28 Sep 2026 10:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790616972; x=1791221772; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=;
        b=C92mdhZS29Y2Y313Lv5T68s5KfkKqu+hCs0lIVaB/NfYzD/UCHymEK55nDyaSac5hE
         zaMov0x6ScnabWpn7pz9yLEUK84ih0qOU75DojEApVQ+2K25a4YaeCoOFx65yL3xNqdS
         KPVDvLmylXFZlDpyiptiguL/UtpCzVLb1bFqaH/mhldG/wDUQARwRnMzfGkYkO4Vxfx3
         AxrZUcwyx+ztqP96itcFHKzGZzT8zD18ZURg437taf7DTedjbA8/QkA5lRE8/B4VJn2f
         d2ex8Yh36UZPgN3uTngPZw3vGAwEQuvPowoSo1bBWtrdKtyaMwZjkIIEe6QzJDPRGtdz
         O2fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790616972; x=1791221772;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=e56VPJhEQaKHBMKiPEnAJg4gXthfCHuP42m5w3NSG2w=;
        b=LzkrN+/CXQMUeDXC1lIFOSDpUN3T1IhuByRAKJxhwgjqJdQFeW7RdfRa/JQWS9FLrO
         BTrt6lh4EJzaxG3Lnn3v5s86y/Daywe2YayXGsb9f8v5pxspyz2eSWUV4P+wwiwh1fNE
         eZROlpKCAVd7EbXBhcd9wwzHP7HnClX4wJK/8kV2y3rVLpuOiD9jaPZaQzJF2n4hkpaC
         8KkHTRfIpV2keG9hOVak1HEmJJTO93DgkL5IrqG3xJ6RWgAzrTQdW21wS69AwcryrRdJ
         TOzkJ7hFDO4At6R+huS9hgiBBtupT9bpInJPYdqX/yrzsFkQ2unFbzBT0Llvl9ry7OE6
         ef9A==
X-Forwarded-Encrypted: i=1; AKwUvBxqcq6dgJAOR0s7FC3npKzuBg6wfR44xFzoa/JoJ14CyFV8CdBKuSJMlTIyKFWDSIa+YJjgR/k=@lists.infradead.org
X-Gm-Message-State: AFq9FYL00uTkycNr2MJihYRD8L689eWTDIkRqaWk3u9Hb4hH1r35HMeX
	Nhb9oxgaiWL2B5Kim3j5POSaswbEMVfn7cPbRaSgtseqRi5mGlK/0XpjwmMCVbX5EnAYQExjqTz
	fGtV8Ix25zdlNnpUQVO5CBdkgtCjhcj0NUZKQhsgnZZTBzu9aT+5LfJRGEphVaxgl4EcvTZp3
X-Gm-Gg: AYBFou1JajxRPSZ0i+tf7F3dlsOuh2dmvDKdUDw6EV/VvPo7Fln72ibfQVsqq+lxXok
	MBl08oUYiEIxZ0dAynT4guI7JpjactnZ+e8upOC2P7x/5327rgUccHips0EdSHA5LodsxfPzEhc
	DR5U3IWfrLQ/KD4Ecpwj/0sa2i0P2MUAXijWHu9ulraW2vlFtD4nmdLxnyyXnULv8+7yDZMIb1h
	O5wjBEG5SVlcBcOnhDRNKWLiFq2XQFRPNfhfIdjqYoUqNpK55rMjwzIlI1cHqAaJQ1AaJDQXrr4
	88PsPJc2rfBzEy4dNItd4353QAzy8HxtiraR/6GCXVConLhdyzkLNhPQrp2dipIk1OOOovD4wCI
	Zq1QYncpsL+5Pk8IuaIEphTFXRgVgxITne7WNXynd3vQ=
X-Received: by 2002:a17:902:d2c6:b0:2df:aa4f:5b33 with SMTP id d9443c01a7336-2dfaa4f702fmr55502045ad.1.1790616972186;
        Mon, 28 Sep 2026 10:36:12 -0700 (PDT)
X-Received: by 2002:a17:902:d2c6:b0:2df:aa4f:5b33 with SMTP id d9443c01a7336-2dfaa4f702fmr55501765ad.1.1790616971544;
        Mon, 28 Sep 2026 10:36:11 -0700 (PDT)
Received: from [192.168.11.104] ([124.123.80.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df914024c4sm44944475ad.31.2026.09.28.10.36.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:36:11 -0700 (PDT)
Message-ID: <aed5fccf-5a6f-471f-8987-01069d892731@oss.qualcomm.com>
Date: Mon, 28 Sep 2026 23:06:06 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] wifi: ath12k: Reserve space for a string terminator
To: Jiale Yao <yaojiale02@163.com>, Jeff Johnson <jjohnson@kernel.org>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        Dan Carpenter <error27@gmail.com>, linux-wireless@vger.kernel.org,
        ath12k@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260926121250.3258285-1-yaojiale02@163.com>
 <20260926121250.3258285-3-yaojiale02@163.com>
From: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20260926121250.3258285-3-yaojiale02@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: O0R6hTXTVCieP6fNz0nVxEqlP3hTLbJD
X-Proofpoint-GUID: O0R6hTXTVCieP6fNz0nVxEqlP3hTLbJD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfXwphr4QE3OmvY
 RZp1fOlE7ufsHEdpo1HfVEEJNLgFELQi8MiBkH0qBYNN7lPk9m5LZqjMwbCzYP/M+IPk2T/cLzM
 kcTZRTB9VCzPhkZuzrhYXFDx/PM4Z55+ev82hzN2LeTxb9R5h+KVBXaa1lrrqeUKA35goJOmUUW
 mrZ6WSgAJoKUjYVIA5o30QkfGx1sWiMXMl2v4qndC/cQnwkFEpmFB48nOKRI4wIfCz8NQON0alY
 B4Mw3NNm3rYAU54Toj2Z0MQBXb4WSgapnitZZAjZVO3VEZgKcsaIxwLJvFOniszg1SZwKRTUN0I
 O3NB05mWHXnH4pp/kP7wKA4Sn4sMQsWFZBF8c6tH2xga+K3uI8+o9USi3ZefwrKYD/crOyzrjKK
 zzb3WcqYQBkA5w9of6LqWiM01zVR2eNwpMufF5e4u6USlAqrNF5jgENJ0AlVJVhal7MQisEjyzY
 byxHctyBYhv8jkCVF/g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI4MDA3MCBTYWx0ZWRfXz0Obpu71Gjyz
 eTkW3w4Bsd9HqIzSFj4ZezVgYF9qISaNPtPQ1q0L//IKhr17mfv00juLPa6YkxDchve1YcKl66v
 /7cKnz6qSKColhLrxqks4EFKwLs6DJk=
X-Authority-Analysis: v=2.4 cv=asYnmiZV c=1 sm=1 tr=0 ts=6abaa58d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=kllYWVK2JqQtNyhMtAlpJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=Byx-y9mGAAAA:8 a=EUspDBNiAAAA:8 a=yjgl9zxMNnK14O82FrIA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-28_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 clxscore=1015 adultscore=0 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609280070
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260928_103614_503047_EAC07F16 
X-CRM114-Status: GOOD (  16.37  )
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

On 9/26/2026 5:42 PM, Jiale Yao wrote:
> ath12k_write_htt_stats_type() accepts count == size, which fills the
> zero-initialized buffer without a terminating NUL. sscanf() then reads
> beyond the buffer.
> 
> Reject input that leaves no room for the trailing NUL.
> 
> Fixes: 8c7a5031a6b0 ("wifi: ath12k: Fix buffer overflow in debugfs")
> Signed-off-by: Jiale Yao <yaojiale02@163.com>
> ---
>   drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> index b772181a496e..f84f1828275a 100644
> --- a/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> +++ b/drivers/net/wireless/ath/ath12k/debugfs_htt_stats.c
> @@ -6190,7 +6190,7 @@ static ssize_t ath12k_write_htt_stats_type(struct file *file,
>   	const int size = 32;
>   	int num_args;
>   
> -	if (count > size)
> +	if (count >= size)
>   		return -EINVAL;
>   
>   	char *buf __free(kfree) = kzalloc(size, GFP_KERNEL);


Reviewed-by: Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>

