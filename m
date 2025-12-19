Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 127A1D74956
	for <ath12k@archiver.kernel.org>; Fri, 19 Dec 2025 05:42:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=; b=dxul38We10OhWqkHriyoQ0cH8q
	Wof1tzNqyroXOj6VvTlEwPtnGyvZsyUFBIUxjqeXVqgS226y/USoqzzCePrPeIRbuoAItqK5k4c/R
	BWfoYryoWMvxqmlTNFShOWivuvEV9WO0M7LEmbWw12yxMCKX5qoBSKJXPdSOUp4bdN6U08onkI4W4
	31V6AOnrQxV5ThGqVAWkBcc5vYMtzPK5rhu/sC3dHdgXLpryGCTD2xgH+J2XdcT71Imd5vINoS1CJ
	nSBw352B+PDofdIQZ7tcwFK3mbTux99A9PexiqWiLc8HXDCAFCBSF7+G3EkG6hzKIFxB55OJ2lt85
	dBweTltg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTFw-00000009fJX-3PeD;
	Fri, 19 Dec 2025 05:42:24 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vWTFu-00000009fJ2-3ycO
	for ath12k@lists.infradead.org;
	Fri, 19 Dec 2025 05:42:24 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BJ4c8Od3559086
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 05:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=; b=IOb6IjT2KCeaFFPC
	qbitY9mejvNfAxdKwcHxSJbGLgBr8OIIyVT11AEGgsmrICPi9htrwSU+Bf85Dc8f
	03Sbs23Bx0da+FJIYI0mA/Me5t7IHYnNwMC5Rf0SOnKnNmHAUCwEdfYrAAXguM76
	zuZHnrzzBaSrhrHbpmFbmr/fdiM/g5OI4sobhw5mZ/RPVtxyQpgr6uk4EtUyALuD
	cqa1hChjSuVRnGpciftph0et4RaS0Bw76toj58e/2OIFpb/YUD+UHkMZGSL3VLlU
	M3EZq0WIHG8xcpBWzXTz4zp84djn7TKy5FiJU/vSsRw/0BJcSHqMB5uw3S+bsXk6
	hBVKvw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b4r2c9c9x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 19 Dec 2025 05:42:22 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-b62da7602a0so1581375a12.2
        for <ath12k@lists.infradead.org>; Thu, 18 Dec 2025 21:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1766122941; x=1766727741; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=;
        b=jHXUTuyE+9iZiHb6KXh2dNZOaL4yeh+8rcatHeVg7QuEXhaeoMVAQ+0sCV1KGtt7/x
         oMMnEirioGJ+8Gyxqlg3LiVTJMC0kIHL97efQJ72+1qieVzBXk3pOXf0dxSTjIVM6Jpu
         qS1c70VMHFZ6OVsVWRmR53lERBQWFZk+yKNBE+mbX1Ml/bpkTBmxCJ+WJAaIOV4oDy2e
         bJeojtHr9En1RYhokZA0aXw0BQA9GUHLCtP5Pvf5COK9EBfNNGveYXaNPllRg0k0iFpK
         r5szRgt/rJQl1NwHmtSoOsWZI+FHciYbnd/8LpSsXhAEcUTc62lWc+vg9PgVxqh69V+f
         GEkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766122941; x=1766727741;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=V5m5tAGlkGiYi81yuxiUUxECa/gsyO0V5obb+kA+4XI=;
        b=vqnXmBXKdhge2c6igKvheYRcUmUC8OskvcYTzPhB5HjT1f1rPx91b5hJxhP3U2G41g
         DsDQUyu+s1tlgLb4Yty68plX75GXhefry8bTnh5no8P7RZnxkpX/hEKt8GFGp8/e1bbp
         xbU3vdRVG2JOloaji5eFEL/NLjXMFyo07uo+T162ZjUB+5ZZ7PeUu8vaSicH4LzV+NaU
         4gxnUvAaJwBKGVRYCLJjXjYdl1vlaR2ry6NNSMOyO2eAohgeCEChGpBJNzhySlL/oj35
         MFuKiUVkKRh4t0a9Oro2pHZV7DC05Xx1JRMWZgJhzO4h2AoOkbNiXtzcexAAN9jLt65B
         DEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCXnbldzEh50hvbTI+KfiavLcVmqv+Ua4ZZjIOjTZYPC1OJ9jx7J7nL6Jkrt5wXGIt1fo1ZP7YM=@lists.infradead.org
X-Gm-Message-State: AOJu0YxcFkuLs2U503TqJpFfScfrN6jktr2YCEqxLUJ3gzo3oaygKYHk
	//+jhysQN/IBfOgJq1+ZIktfmOV/Jy1tKYCpkhZ/mKGeu86Z1Fzi3wXXIQgmTIFv+6/YzB4HSoj
	nSJWa07ZE85NrqyOihf2Jv/rbw/99j62SzSBD7wUO91NADeLK98I7lYwtk17o/Jum
X-Gm-Gg: AY/fxX7Pn2KflrLoTgTqkHtGWMKqj9XN/EeLwRPDqg3bcFTsEFYBYBGcNyOTNVe5Q5/
	90bhXuMXwnX6LjUNiq/ARqbsGk8PQHazJmHBqyRB/PLPHMCi723rch0uX9Sl8TFEpTrUECS2Ryz
	wHG4RVRi/Z1cBldhwcXWQ3NFojLYKwzubVCM4cfHN3Yo9pI+4JDwAHSAii8Ac7RIe1bO2W9BjNz
	T/wGf64q2vO7V5n14Hl0BHzxPv/ttjlgZKHEh0y9twV4UI82wkaaWI14VJcaoVqAv0iLGqk60pL
	2k9gp+AWAKD765Rfk231m98RCEoaAFs2RKlIMtMlWZ4fj7pSDIeSLJevk0o+mxpaLTTeMBvuQ7j
	VXFoiFnB3mg+48liACTiNfqHQIXE1VsXSZZRrwYQZPWBBoUKysXMqdjGUzvIsGhEaX5Rb
X-Received: by 2002:a05:7022:f693:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-121722eb259mr2094562c88.33.1766122941351;
        Thu, 18 Dec 2025 21:42:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEhk+4V4h85Zxgq/94CKGljiu1MRE42gFAPuVqCapM99qVbrJgOcmpXpxMamCypOIwWFCgFNw==
X-Received: by 2002:a05:7022:f693:b0:11b:803c:2cf5 with SMTP id a92af1059eb24-121722eb259mr2094530c88.33.1766122940751;
        Thu, 18 Dec 2025 21:42:20 -0800 (PST)
Received: from [10.110.90.237] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121724de25dsm3836422c88.7.2025.12.18.21.42.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 21:42:20 -0800 (PST)
Message-ID: <f113b35e-b84f-40b6-89a7-284018e93853@oss.qualcomm.com>
Date: Fri, 19 Dec 2025 13:42:15 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH next] wifi: ath12k: clean up on error in ath12k_dp_setup()
To: Dan Carpenter <dan.carpenter@linaro.org>,
        Harsh Kumar Bijlani <quic_hbijlani@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, Ripan Deuri
 <quic_rdeuri@quicinc.com>,
        Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
References: <aUOw1J0TU4VgeXj6@stanley.mountain>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <aUOw1J0TU4VgeXj6@stanley.mountain>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=cpSWUl4i c=1 sm=1 tr=0 ts=6944e5be cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S47APn7KmZlrf8u2960A:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE5MDA0NSBTYWx0ZWRfX9OiT5f2bstGE
 PSs/XfICjYIFemQRJGPBhCVKztCuuu0PP8EeZhiI3EklVq1zViQ0lTxdftwDGesYBpLxP3ilQZF
 l3x6XoTFLbPLq4LIBbS36VWnKtFi/HziTPyuzB/tL0Ijeqihb0+iXypiqiKI0HliAiLj6z/1mYa
 THJVMlOpRbotcwEV39pRsTaQEmz3gcJyCKxWhzyqpsdBVyKS61mH0uveDsBwXgRhx41yNHvm5K+
 d7Z8OI2FDCtpL7hAo7vX+gezO73vM6BRN9LJX6PsMVycWjj/QmwnSQafEskYv6H7wohYI+gcPfJ
 9YHeytsPmaIRisbm4n4xZXyYDyVUGzMEk2Iin+tE5DPetr7JfXslgWqVANJ2WCCtxAw7sIZ8DnR
 cPhJ8+/aW1F5ps+VvKv4/bdVF4MB7Z4OzxLq4qUvQTQq4HPmUBkMTAV5Knvx7DdLfOht9jcygmb
 k78+pKq35+/N0F59r2w==
X-Proofpoint-GUID: ZGUht-Z9D_ZwQCDbxWUjUEv02G0pDXI-
X-Proofpoint-ORIG-GUID: ZGUht-Z9D_ZwQCDbxWUjUEv02G0pDXI-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-19_01,2025-12-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 suspectscore=0 bulkscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512190045
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251218_214222_995656_95557F26 
X-CRM114-Status: GOOD (  16.44  )
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



On 12/18/2025 3:44 PM, Dan Carpenter wrote:
> Destroy the rhash_tbl before returning the error code.

Would be better if the actual problem can be described first.

> 
> Fixes: a88cf5f71adf ("wifi: ath12k: Add hash table for ath12k_dp_link_peer")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/net/wireless/ath/ath12k/dp.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/dp.c b/drivers/net/wireless/ath/ath12k/dp.c
> index 9f05eea6695a..ab54c8a84d3e 100644
> --- a/drivers/net/wireless/ath/ath12k/dp.c
> +++ b/drivers/net/wireless/ath/ath12k/dp.c
> @@ -1513,7 +1513,7 @@ static int ath12k_dp_setup(struct ath12k_base *ab)
>  					HAL_WBM_IDLE_LINK, srng, n_link_desc);
>  	if (ret) {
>  		ath12k_warn(ab, "failed to setup link desc: %d\n", ret);
> -		return ret;
> +		goto rhash_destroy;
>  	}
>  
>  	ret = ath12k_dp_cc_init(ab);
However since this is trivial ...

Reviewed-by: Baochen Qiang <baochen.qiang@oss.qualcomm.com>


