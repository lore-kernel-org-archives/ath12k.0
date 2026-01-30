Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B67E6BF17
	for <ath12k@archiver.kernel.org>; Fri, 30 Jan 2026 14:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OjDbAyCVvGi0HknofnhmpEQkSu+LOt1xeGohpiGNUqI=; b=b975by+KJ9v97RLy+GWTivdaE1
	kr+107XJQAvxp/sHUSwT0Xol4u7kvxEbSbxxjvhUuVewd6vKiYu2MwK2Y67pFlBH7EQ8gpQ9S4jmE
	DRf/PP1gV/RIe8bh8WMSGCnImu/bQDhyJKnCkH7jWaxFI8iUrtKR6tUsz8EUKV+pcP5tzjEoD/cof
	rYGD7LONDuxsWESrle0lUWy50CDp0kyFBQ7Vw6A+r0Ai/WjxTPGYUphpQf8DJJy+XCSMOXQae+7J4
	ITjRVg3hUtnmmXsC7q3EgEOQmPoOnBcj7PREXSWZOY48ySu5FQjdCPu64AfmIkcx+JQj1sxfFkxuF
	ikjaTtng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpTE-00000001aUr-1oeq;
	Fri, 30 Jan 2026 14:27:36 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlpTC-00000001aUY-1ll8
	for ath12k@lists.infradead.org;
	Fri, 30 Jan 2026 14:27:35 +0000
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 60UAad5x485889
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 14:27:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OjDbAyCVvGi0HknofnhmpEQkSu+LOt1xeGohpiGNUqI=; b=mMdX0HHUNPof+6oB
	Qr49xdZvNQz2AXJNRJS7z4t4phEt8yLnn+YIGAfP+FRUmZL5np1514pI9GhVRcXB
	agvElzqj7NcgUzLD70yKOqBAnZv2wl2xIByvO7dabj5+FslvrJ+GE20t5ihKbiSb
	5uLaSMv1CB+SozFGge6AcOf4Ss6b0SVjtoddX0DMHOph/Xi8BTz4FFxDj3oQwbo8
	lTGL2BzoIMzR7ESgWJoy9lroHb1sqxM2qInytfR7Sc4Uic7sEBdzi6/HhZ6VHvaD
	O6VRDP8YCGLH0DyS0DxKCCOrW0VFS+Zm37PZWSgl60dtBXc70A/FDx0/3sJ6Ys82
	EZ1e3g==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c0gtnjecw-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 14:27:33 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-124a95b6f61so16247548c88.0
        for <ath12k@lists.infradead.org>; Fri, 30 Jan 2026 06:27:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1769783252; x=1770388052; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OjDbAyCVvGi0HknofnhmpEQkSu+LOt1xeGohpiGNUqI=;
        b=H0VbIhw/8BpHUQJpp5bTNGu2CmXwPDrcuOTtfkeG3Fcm8PPWmO57IWxEXLMdhqPmZE
         PoZINU2enDgoHnfKQ/+nwQ0FRcdgFop905Wmf+wVJfS8S9RI10JHiNn88yge+P19QXCR
         LfBXtrYvtAz6CcqMn9Hv4NpS4lQVJUelueuHmcs+pGuUtwQs0lagQbjC6aJyT7w7wpcS
         Xl4eDbiAEz39CcQS+jPxfBi9YeFPoGnrSh07XrhPdT6+Y9OV3I/mcwcbO10AAy/2h/AJ
         hNPg3Q6cxU5zQ5i9CeeFhgzo+tzre33Gg+f7niO59tVtvOFawr4ZldB9NY+oXwzhPcx0
         Pmsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769783252; x=1770388052;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OjDbAyCVvGi0HknofnhmpEQkSu+LOt1xeGohpiGNUqI=;
        b=a+NwkErsqJE+flPQWHrl0vGbgqkdFbN7VxHmEByooctzMId/rqVF7GFs/wZ27pNmv2
         vgKAJmf8mC9M+JWuecb4Tix/Ua2qeaboiWcwCrsR6U+xenQiefBmZZkU9pipFXM6xCSL
         O9bBJGxcxpBTcihbAlym4gfnTag818IV7ZRHQP4uiLNmCanUk+jSMnkFQoyQIYCS8lu2
         rQxKVkTjsb+4u3BSnsEegHqYImo/a5lv98XuIxkeQze+wjALanNELdAcz/e087+cIsyW
         1jnukZFw6iHYEGJYnVp8+BBRh0XhOLUEJXj4t6fAGJ4GRYjyIgCJVQPnD1Wl78S79law
         BHWg==
X-Gm-Message-State: AOJu0YxSI3lZTqhyJStu5NeBQ2a1lzqlXyET8WEFg93hT+LKe/JgRLO1
	iITWIiadKQy7R8m28wIRsnio65RW3jPeiJgPT2guFifC649VLG4QgECXqBrs7klsszEtSFXV1v1
	/XPS7JsiUM4YeJEjs8550u15dJ2ePX+6F80e7sZd9pGmXg5G+AiqK3PD5yKIXcO5HNNTWXIET
X-Gm-Gg: AZuq6aK/bXUY4B9+i3wG0C7NxA1W5TTg5My3UR3RfWFCUIJtW0eRvOCfdBwrPUO32wT
	D7lqW01fPhULaQAJHpnmhJjDgOKJMpFeqnlBwFBUKY6OnY8Ei9/G0Wpoqi7ZRG/FarnQ9a3JGZk
	jao32WXGqFHC0S6Z32/74phRYEQq1Wv2Kg2Z5mT8vj+xGcBAqpTF8sLWhhgv57NNeN/Jdj8hlai
	v8SbeC4LYEhfoWOJyLjgMMCjh5ep8f2SnYDFtbc3W99nZ/dgAKlh9D5mjR+1c6gMb0WNXTBDiLT
	JERdynrSHPpZuVyvxs7infBlLjO15YYy30Ft0Zx+bXmuEiiapy3KJwrd/r/YOX5zFNqdmDfV/Ea
	ZFZ68KHW7QLt6hzl7NN79bp2NfedJ0z357zMRsmZyhXRHRef9SnkdJn8KMDZXh6CzPr5jVg==
X-Received: by 2002:a05:7022:2381:b0:119:e56b:c75b with SMTP id a92af1059eb24-125c0ff91b2mr1588418c88.32.1769783251717;
        Fri, 30 Jan 2026 06:27:31 -0800 (PST)
X-Received: by 2002:a05:7022:2381:b0:119:e56b:c75b with SMTP id a92af1059eb24-125c0ff91b2mr1588395c88.32.1769783251044;
        Fri, 30 Jan 2026 06:27:31 -0800 (PST)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124abb2c514sm9466147c88.12.2026.01.30.06.27.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Jan 2026 06:27:30 -0800 (PST)
Message-ID: <b96b9fb2-3313-4c3d-b20f-ea477f72bd62@oss.qualcomm.com>
Date: Fri, 30 Jan 2026 06:27:28 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] wifi: ath12k: Fix firmware stats leak when pdev
 list is empty
To: Saikiran B <bjsaikiran@gmail.com>,
        Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
        kvalo@kernel.org
References: <20260126095244.113301-1-bjsaikiran@gmail.com>
 <20260126095244.113301-3-bjsaikiran@gmail.com>
 <9ca7ceac-2799-4993-844c-8427508c7d9b@oss.qualcomm.com>
 <CAAFDt1sxWMb1xPaWGWGE1XVFxRKwjOuQPZ__fNTH2+ujXJ6d5A@mail.gmail.com>
 <CAAFDt1s8HPQWJpSiDDk8PmUAKqkQHELcJj_F0faZ1C9RfiYu6g@mail.gmail.com>
 <7fb6b431-58ea-47bc-b251-5144575db17d@oss.qualcomm.com>
 <CAAFDt1s_NtY1vXa5STRW7oQn9yDJBC0g7CPSZXn0tFhd+CSHrQ@mail.gmail.com>
 <fbcbeb0f-c073-4da5-9dbe-2518a1d31f20@oss.qualcomm.com>
 <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAAFDt1uSQce_9AG2488yaeeEjCwQwQubW51K51VHiJF8Rp6xRQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: DngcoimOsMdxMqif7CJkgcIO0WVOxV_h
X-Authority-Analysis: v=2.4 cv=FPcWBuos c=1 sm=1 tr=0 ts=697cbfd5 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=pGLkceISAAAA:8 a=8ltgOPgcfqXs1Gl5X78A:9
 a=QEXdDO2ut3YA:10 a=6jIDAdUXVGMA:10 a=zZCYzV9kfG8A:10
 a=Fk4IpSoW4aLDllm1B1p-:22
X-Proofpoint-ORIG-GUID: DngcoimOsMdxMqif7CJkgcIO0WVOxV_h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTMwMDExOCBTYWx0ZWRfX95N9vPipkKUA
 9G74Bcvp0QqFu2qeIreVtR2v3pN4aLb1YVCxjyoGp5M8CSWkatM18Gjiw6VGbhLHDEESwZCH5JI
 jvtKCivP9/yXDqKST479wAp7mLd8p2awTubHlrVubd1AlBkdELQ4mCtqtzQ+1feJwzEGa2k27+4
 VU8l+XKgPdPqwVt5CV9xB489QHNY4fQNN9qWvS9w7ob2X+6KvvHGD6qoSBfUFXesvHkHRPl6Wao
 F68UGqevCwZRzliN+X+nJoto5ljpMZQ6G+uSAYYkfnsZIF5UsHoN7dHAdnZJRJ1R4Icrqnbiz09
 KDqDc54Rww37IliPe77kxhthwVwIbcondrA4lmCkmaRUMXbrJ4nbhL5h9eNm+caMz3k+hrIwn/G
 kP91YGP06/D0X3FfJ9hG4ywPag6U7yol4Vh+iOCWsMRyLs6r54GBG9NGhmBbc7oCctnPWHc62Aj
 2gRqo11L+2Ih/1O+PAw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-01-30_02,2026-01-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 clxscore=1015 phishscore=0 bulkscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601300118
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_062734_599273_3EF35C6E 
X-CRM114-Status: UNSURE (   8.53  )
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

On 1/29/2026 11:32 PM, Saikiran B wrote:
> I have merged the tag, applied your patches and I can confirm that the
> leak has been fixed.

When I apply the patches would you like me to add the following?

Tested-by: Saikiran B <bjsaikiran@gmail.com>

